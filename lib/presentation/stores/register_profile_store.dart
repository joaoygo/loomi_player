import 'package:get_it/get_it.dart';
import 'package:loomi_player/data/models/user_model.dart';
import 'package:loomi_player/domain/usecases/clear_user_usecase.dart';
import 'package:loomi_player/domain/usecases/save_user_usecase.dart';
import 'package:mobx/mobx.dart';

part 'register_profile_store.g.dart';

class RegisterProfileStore = _RegisterProfileStore with _$RegisterProfileStore;

abstract class _RegisterProfileStore with Store {
  final SaveUserUseCase _saveUserUseCase = GetIt.I<SaveUserUseCase>();
  final ClearUserUseCase _clearUserUseCase = GetIt.I<ClearUserUseCase>();

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
  Future<void> saveUser(String uid, String email) async {
    final userModel = UserModel(
      uid: uid,
      email: email,
      name: userName,
      photoUrl: profileImage,
    );
    await _saveUserUseCase(userModel);
  }

  @action
  Future<void> clearUser(String uid) async {
    _clearUserUseCase(uid);
  }
}
