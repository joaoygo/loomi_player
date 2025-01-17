import 'package:get_it/get_it.dart';
import 'package:loomi_player/data/models/user_model.dart';
import 'package:loomi_player/domain/usecases/clear_user_usecase.dart';
import 'package:loomi_player/domain/usecases/get_user_id_shared_preferences_usecase.dart';
import 'package:loomi_player/domain/usecases/save_user_firestore_usecase.dart.dart';
import 'package:mobx/mobx.dart';

part 'register_profile_store.g.dart';

class RegisterProfileStore = _RegisterProfileStore with _$RegisterProfileStore;

abstract class _RegisterProfileStore with Store {
  final GetUserIdSharedPreferencesUseCase _getUserIdSharedPreferencesUseCase =
      GetIt.I<GetUserIdSharedPreferencesUseCase>();
  final ClearUserIdSharedPreferencesUseCase
      _clearUserIdSharedPreferencesUseCase =
      GetIt.I<ClearUserIdSharedPreferencesUseCase>();
  final SaveUserFirestoreUseCase _saveUserFirestoreUseCase =
      GetIt.I<SaveUserFirestoreUseCase>();

  @observable
  String userName = '';

  @observable
  String profileImage = '';

  @action
  void setUserName(String name) {
    userName = name;
  }

  @action
  void setProfileImage(String imagePath) {
    profileImage = imagePath;
  }

  @action
  Future<String> getUser() async {
    final user = await _getUserIdSharedPreferencesUseCase.call();
    return user ?? '';
  }

  @action
  Future<void> saveUser(String uid, String email) async {
    final userModel = UserModel(
      uid: uid,
      email: email,
      name: userName,
      photoUrl: profileImage,
    );
    await _saveUserFirestoreUseCase(uid, userModel.toJson());
  }

  @action
  Future<void> clearUser() async {
    _clearUserIdSharedPreferencesUseCase();
  }
}
