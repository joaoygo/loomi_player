import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:loomi_player/core/constants/app_colors.dart';
import 'package:loomi_player/core/constants/assets_constants.dart';
import 'package:loomi_player/presentation/stores/register_profile_store.dart';
import 'package:loomi_player/presentation/widgets/header_credentials.dart';
import 'package:loomi_player/presentation/widgets/primary_button.dart';
import 'package:loomi_player/presentation/widgets/primary_input_text.dart';
import 'package:loomi_player/presentation/widgets/profile_image_picker.dart';
import 'package:loomi_player/presentation/widgets/secondary_button.dart';

class RegisterProfilePage extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final RegisterProfileStore _registerProfileStore = RegisterProfileStore();

  RegisterProfilePage({super.key});

  void onImagePicked(File imageFile) {
    final imagePath = imageFile.path;
    _registerProfileStore.setProfileImage(imagePath);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Observer(builder: (_) {
        return SafeArea(
            child: Center(
                child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              HeaderCredentials(
                  title: 'Tell us more!',
                  subtitle: 'Complete your profile',
                  logoPath: AssetsConstants.logoMini,
                  spaceBetweenLogo: 57,
                  spaceBetweenText: 11),
              SizedBox(height: 64),
              ProfileImagePicker(onImagePicked: onImagePicked),
              SizedBox(height: 64),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: PrimaryInputText(
                  controller: nameController,
                  hintText: 'Your name',
                ),
              ),
              SizedBox(height: 64),
              PrimaryButton(
                ontap: () {},
                text: 'Continue',
                width: 207,
              ),
              SizedBox(height: 9),
              SecondaryButton(
                ontap: () {},
                text: 'back',
                width: 207,
              )
            ],
          ),
        )));
      }),
    );
  }
}
