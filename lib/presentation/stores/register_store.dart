import 'package:loomi_player/data/models/user_model.dart';
import 'package:loomi_player/domain/usecases/get_user_firestore_usecase.dart';
import 'package:loomi_player/domain/usecases/login_with_google_usecase.dart';
import 'package:loomi_player/domain/usecases/register_with_username_password_usecase.dart';
import 'package:loomi_player/domain/usecases/save_user_id_shared_preferences_usecase.dart';
import 'package:mobx/mobx.dart';
import 'package:get_it/get_it.dart';

part 'register_store.g.dart';

class RegisterStore = RegisterStoreBase with _$RegisterStore;

abstract class RegisterStoreBase with Store {
  final GetUserFirestoreUseCase _getUserFirestoreUseCase =
      GetIt.I<GetUserFirestoreUseCase>();
  final LoginWithGoogleUseCase _loginWithGoogleUseCase =
      GetIt.I<LoginWithGoogleUseCase>();
  final RegisterWithUsernamePasswordUseCase
      _registerWithUsernamePasswordUseCase =
      GetIt.I<RegisterWithUsernamePasswordUseCase>();
  final SaveUserIdSharedPreferencesUseCase _saveUserIdSharedPreferencesUseCase =
      GetIt.I<SaveUserIdSharedPreferencesUseCase>();
  @observable
  bool isLoading = false;

  @observable
  String? errorMessage;

  @action
  Future<UserModel?> registerWithGoogle() async {
    isLoading = true;
    errorMessage = null;

    try {
      final newUser = await _loginWithGoogleUseCase();
      final userModel = UserModel(
        uid: newUser!.uid,
        email: newUser.email ?? '',
        name: newUser.displayName ?? '',
        photoUrl: newUser.photoURL ?? '',
      );

      final isUserActive = await _getUserFirestoreUseCase(newUser.email ?? '');

      if (isUserActive != null) {
        errorMessage = 'User already registered';
        return null;
      }
      await _saveUserIdSharedPreferencesUseCase(userModel);
      return userModel;
    } catch (e) {
      errorMessage = e.toString();
    } finally {
      isLoading = false;
    }
    return null;
  }

  @action
  Future<UserModel?> register(String email, String password) async {
    isLoading = true;
    errorMessage = null;

    try {
      final isUserActive = await _getUserFirestoreUseCase(email);

      if (isUserActive != null) {
        errorMessage = 'User already registered';
        return null;
      }

      final newUser =
          await _registerWithUsernamePasswordUseCase(email, password);
      final userModel = UserModel(
        uid: newUser!.uid,
        email: newUser.email ?? '',
        name: newUser.displayName ?? '',
        photoUrl: newUser.photoURL ?? '',
      );
      return userModel;
    } catch (e) {
      errorMessage = e.toString();
    } finally {
      isLoading = false;
    }
    return null;
  }
}
