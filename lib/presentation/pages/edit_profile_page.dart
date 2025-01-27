import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:loomi_player/core/constants/app_colors.dart';
import 'package:loomi_player/core/constants/assets_constants.dart';
import 'package:loomi_player/presentation/pages/profile_page.dart';
import 'package:loomi_player/presentation/stores/edit_profile_store.dart';
import 'package:loomi_player/presentation/widgets/primary_button.dart';
import 'package:loomi_player/presentation/widgets/primary_input_text.dart';
import 'package:loomi_player/presentation/widgets/profile_image_picker.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final EditProfileStore _editProfileStore = GetIt.I<EditProfileStore>();

  final TextEditingController _nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _editProfileStore.getUser();
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: const EdgeInsets.only(left: 15, top: 15),
          child: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: AppColors.primaryColor),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
      body: Observer(builder: (_) {
        if (_editProfileStore.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        return SafeArea(
            child: Center(
          child: SingleChildScrollView(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 25),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Edit Profile',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.w700,
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 38, left: 25, bottom: 38),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Stack(
                      alignment: Alignment.bottomLeft,
                      children: [
                        ProfileImagePicker(
                          onImagePicked: (imageFile) =>
                              _editProfileStore.onImagePicked(imageFile),
                          radius: 50,
                          initialImage: _editProfileStore.profileImageFile,
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: AppColors.backgroundColorIconPhoto,
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: SvgPicture.asset(
                                AssetsConstants.cameraIcon,
                                width: 20,
                                height: 20,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Choose Image',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                            )),
                        SizedBox(height: 5),
                        SizedBox(
                            width: 91,
                            child: Text(
                              'A square .jpg, .gif, or .png image 200x200 or larger',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400),
                            )),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: PrimaryInputText(
                    controller: _nameController,
                    hintText: _editProfileStore.userName),
              ),
              SizedBox(height: 280),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: PrimaryButton(
                    ontap: () async {
                      _editProfileStore.setUserName(_nameController.text.isEmpty
                          ? _editProfileStore.userName
                          : _nameController.text);
                      final success = await _editProfileStore.updateProfile();
                      if (success && context.mounted) {
                        const snackBar = SnackBar(
                          content: Text('Profile updated successfully!'),
                          backgroundColor: Colors.green,
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ProfilePage()),
                        );
                      }

                      if (!success && context.mounted) {
                        const snackBar = SnackBar(
                          content: Text('Error updating profile!'),
                          backgroundColor: Colors.red,
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    },
                    text: 'Update profile'),
              ),
              SizedBox(height: 60),
            ],
          )),
        ));
      }),
    );
  }
}
