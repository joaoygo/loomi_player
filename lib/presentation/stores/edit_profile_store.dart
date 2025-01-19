import 'dart:io';

import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:loomi_player/data/models/user_model.dart';
import 'package:loomi_player/domain/usecases/get_user_firestore_usecase.dart';
import 'package:loomi_player/domain/usecases/get_user_id_shared_preferences_usecase.dart';
import 'package:loomi_player/domain/usecases/save_user_firestore_usecase.dart.dart';
import 'package:mobx/mobx.dart';
part 'edit_profile_store.g.dart';

class EditProfileStore = EditProfileStoreBase with _$EditProfileStore;

abstract class EditProfileStoreBase with Store {
  final GetUserIdSharedPreferencesUseCase _getUserIdSharedPreferencesUseCase =
      GetIt.I<GetUserIdSharedPreferencesUseCase>();
  final SaveUserFirestoreUseCase _saveUserFirestoreUseCase =
      GetIt.I<SaveUserFirestoreUseCase>();
  final GetUserFirestoreUseCase _getUserFirestoreUseCase =
      GetIt.I<GetUserFirestoreUseCase>();
  var logger = Logger();

  @observable
  String userName = '';

  @observable
  String profileImage = '';

  @observable
  bool isLoading = false;

  @observable
  File? profileImageFile;

  @action
  void setUserName(String name) {
    userName = name;
  }

  @action
  void onImagePicked(File imageFile) {
    final imagePath = imageFile.path;
    profileImage = imagePath;
  }

  @action
  Future<void> getUser() async {
    try {
      isLoading = true;
      final userId = await _getUserIdSharedPreferencesUseCase();
      if (userId == null) return;
      final userData = await _getUserFirestoreUseCase(userId);

      if (userData != null) {
        userName = userData['name'];
        profileImageFile = File(userData['photoUrl']);
        logger.d("Profile image path: $userName");
      }
    } catch (e) {
      logger.d("Error getting user: $e");
    } finally {
      isLoading = false;
    }
  }

  @action
  Future<void> saveUser(String uid) async {
    isLoading = true;
    final userModel = UserModel(
      uid: uid,
      email: uid,
      name: userName,
      photoUrl: profileImage,
    );
    await _saveUserFirestoreUseCase(uid, userModel.toJson());
    isLoading = false;
  }

  @action
  Future<bool> updateProfile() async {
    try {
      isLoading = true;
      final uid = await _getUserIdSharedPreferencesUseCase();
      if (uid == null) return false;
      await saveUser(uid);
      return true;
    } catch (e) {
      return false;
    } finally {
      isLoading = false;
    }
  }
}
