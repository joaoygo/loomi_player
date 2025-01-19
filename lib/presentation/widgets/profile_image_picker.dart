import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:loomi_player/core/constants/app_colors.dart';
import 'package:loomi_player/core/constants/assets_constants.dart';
import 'package:path_provider/path_provider.dart';

class ProfileImagePicker extends StatefulWidget {
  final Function(File) onImagePicked;
  final double? radius;
  final File? initialImage;

  const ProfileImagePicker({
    super.key,
    required this.onImagePicked,
    this.radius,
    this.initialImage,
  });

  @override
  _ProfileImagePickerState createState() => _ProfileImagePickerState();
}

class _ProfileImagePickerState extends State<ProfileImagePicker> {
  File? _image;

  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    _image = widget.initialImage;
  }

  Future<void> _pickImage(ImageSource source) async {
    final XFile? pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      File compressedImage = await _compressImage(File(pickedFile.path));
      setState(() {
        _image = compressedImage;
      });
      widget.onImagePicked(compressedImage);
    }
  }

  Future<File> _compressImage(File image) async {
    final dir = await getApplicationDocumentsDirectory();
    final targetPath =
        '${dir.path}/${DateTime.now().millisecondsSinceEpoch}.jpg';
    final result = await FlutterImageCompress.compressWithFile(
      image.path,
      minWidth: 500,
      minHeight: 500,
      quality: 80,
      rotate: 180,
      format: CompressFormat.jpeg,
    );

    return File(targetPath)..writeAsBytesSync(result!);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          backgroundColor: Color.fromRGBO(19, 20, 24, 1),
          builder: (_) => Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              height: 200,
              child: Column(
                children: [
                  Text(
                    'Choose Image',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                  SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          _pickImage(ImageSource.camera);
                          Navigator.of(context).pop();
                        },
                        child: Container(
                          width: 135,
                          height: 140,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(188, 76, 241, 0.2),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: Color.fromRGBO(170, 115, 240, 1),
                            ),
                            image: _image != null
                                ? DecorationImage(
                                    image: FileImage(_image!),
                                    fit: BoxFit.cover,
                                  )
                                : null,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                AssetsConstants.cameraIcon,
                                width: 24,
                                height: 24,
                              ),
                              SizedBox(height: 8),
                              Text(
                                'Take a photo',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.primaryColorTextOpacity,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 20),
                      GestureDetector(
                        onTap: () {
                          _pickImage(ImageSource.gallery);
                          Navigator.of(context).pop();
                        },
                        child: Container(
                          width: 135,
                          height: 140,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(187, 187, 187, 0.1),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: Color.fromRGBO(215, 215, 215, 0.6),
                            ),
                            image: _image != null
                                ? DecorationImage(
                                    image: FileImage(_image!),
                                    fit: BoxFit.cover,
                                  )
                                : null,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.photo_outlined,
                                size: 24,
                                color: Colors.white,
                              ),
                              SizedBox(height: 8),
                              SizedBox(
                                width: 95,
                                child: Text(
                                  'Choose from gallery',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.primaryColorTextOpacity,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          color: Color.fromRGBO(188, 76, 241, 0.2),
          borderRadius: BorderRadius.circular(widget.radius ?? 20),
          image: _image != null
              ? DecorationImage(
                  image: FileImage(_image!),
                  fit: BoxFit.cover,
                )
              : null,
        ),
        child: _image == null
            ? Center(
                child: SvgPicture.asset(
                  AssetsConstants.cameraIcon,
                  width: 24,
                  height: 24,
                ),
              )
            : null,
      ),
    );
  }
}
