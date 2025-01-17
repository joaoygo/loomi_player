import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:loomi_player/core/constants/app_colors.dart';
import 'package:loomi_player/core/constants/assets_constants.dart';
import 'package:loomi_player/data/models/user_model.dart';
import 'package:loomi_player/domain/usecases/save_user_firestore_usecase.dart.dart';
import 'package:loomi_player/presentation/stores/register_profile_store.dart';
import 'package:loomi_player/presentation/widgets/header_credentials.dart';
import 'package:loomi_player/presentation/widgets/primary_button.dart';
import 'package:loomi_player/presentation/widgets/primary_input_text.dart';
import 'package:loomi_player/presentation/widgets/profile_image_picker.dart';
import 'package:loomi_player/presentation/widgets/secondary_button.dart';

class RegisterProfilePage extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final RegisterProfileStore _registerProfileStore = RegisterProfileStore();
  final SaveUserFirestoreUseCase _saveUserFirestoreUseCase =
      GetIt.I<SaveUserFirestoreUseCase>();

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
            children: <Widget>[
              HeaderCredentials(
                  title: 'Tell us more!',
                  subtitle: 'Complete your profile',
                  logoPath: AssetsConstants.logoMini,
                  spaceBetweenLogo: 57,
                  spaceBetweenText: 11),
              SizedBox(height: 64),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ProfileImagePicker(onImagePicked: onImagePicked),
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
                ontap: () async {
                  final String uid = await _registerProfileStore.getUser();
                  _registerProfileStore.saveUser(
                    uid,
                    nameController.text,
                  );

                  final UserModel userModel = UserModel(
                    uid: uid,
                    email: uid,
                    name: nameController.text,
                    photoUrl: _registerProfileStore.profileImage,
                  );

                  await _saveUserFirestoreUseCase(
                      userModel.email, userModel.toJson());

                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    Navigator.popAndPushNamed(context, '/');
                  });
                },
                text: 'Continue',
                width: 207,
              ),
              SizedBox(height: 9),
              SecondaryButton(
                ontap: () {
                  _registerProfileStore.clearUser();
                  Navigator.popAndPushNamed(context, '/login');
                },
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
