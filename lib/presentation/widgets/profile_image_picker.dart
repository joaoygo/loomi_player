import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';

class ProfileImagePicker extends StatefulWidget {
  final Function(File) onImagePicked;

  const ProfileImagePicker({
    super.key,
    required this.onImagePicked,
  });

  @override
  _ProfileImagePickerState createState() => _ProfileImagePickerState();
}

class _ProfileImagePickerState extends State<ProfileImagePicker> {
  File? _image;

  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage(ImageSource source) async {
    final XFile? pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      File compressedImage = await _compressImage(File(pickedFile.path));
      setState(() {
        _image = compressedImage;
      });

      // Passar a imagem para o callback
      widget.onImagePicked(compressedImage);
    }
  }

  Future<File> _compressImage(File image) async {
    final result = await FlutterImageCompress.compressWithFile(
      image.path,
      minWidth: 500,
      minHeight: 500,
      quality: 80,
    );
    return File(image.path)..writeAsBytesSync(result!);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Exibir o bottom sheet ao clicar na imagem
        showModalBottomSheet(
          context: context,
          builder: (_) => Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  leading: Icon(Icons.camera_alt),
                  title: Text("Tirar foto"),
                  onTap: () {
                    _pickImage(ImageSource.camera);
                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                  leading: Icon(Icons.photo),
                  title: Text("Escolher da galeria"),
                  onTap: () {
                    _pickImage(ImageSource.gallery);
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        );
      },
      child: CircleAvatar(
        radius: 50,
        backgroundColor: Colors.grey[200],
        backgroundImage: _image != null ? FileImage(_image!) : null,
        child: _image == null
            ? Icon(Icons.camera_alt, size: 50, color: Colors.grey[700])
            : null,
      ),
    );
  }
}
