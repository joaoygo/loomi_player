import 'package:loomi_player/data/models/user_model.dart';
import 'package:loomi_player/domain/usecases/get_user_firestore_usecase.dart';
import 'package:loomi_player/domain/usecases/login_with_email_password_usecase.dart';
import 'package:loomi_player/domain/usecases/login_with_google_usecase.dart';
import 'package:loomi_player/domain/usecases/logout_usecase.dart';
import 'package:loomi_player/domain/usecases/save_user_firestore_usecase.dart.dart';
import 'package:loomi_player/domain/usecases/save_user_id_shared_preferences_usecase.dart';
import 'package:mobx/mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'login_store.g.dart';

class LoginStore = LoginStoreBase with _$LoginStore;

abstract class LoginStoreBase with Store {
  final SaveUserIdSharedPreferencesUseCase _saveUserIdSharedPreferencesUseCase =
      GetIt.I<SaveUserIdSharedPreferencesUseCase>();
  final SaveUserFirestoreUseCase _saveUserFirestoreUseCase =
      GetIt.I<SaveUserFirestoreUseCase>();
  final GetUserFirestoreUseCase _getUserFirestoreUseCase =
      GetIt.I<GetUserFirestoreUseCase>();
  final LoginWithGoogleUseCase _loginWithGoogleUseCase =
      GetIt.I<LoginWithGoogleUseCase>();
  final LoginWithEmailPasswordUseCase _loginWithEmailPasswordUseCase =
      GetIt.I<LoginWithEmailPasswordUseCase>();
  final LogoutUseCase _logoutUseCase = GetIt.I<LogoutUseCase>();

  @observable
  User? user;

  @observable
  bool isLoading = false;

  @observable
  String? errorMessage;

  @observable
  bool isProfileSetupRequired = false;

  @action
  Future<void> loginWithGoogle() async {
    isLoading = true;
    try {
      user = await _loginWithGoogleUseCase();
      errorMessage = null;

      if (user != null) {
        final userModel = UserModel(
          uid: user!.uid,
          email: user!.email ?? '',
          name: user!.displayName ?? '',
          photoUrl: user!.photoURL,
        );

        final activeAccount = await _getUserFirestoreUseCase(userModel.email);

        if (activeAccount == null) {
          await _saveUserFirestoreUseCase(userModel.email, userModel.toJson());
        }

        await _saveUserIdSharedPreferencesUseCase(userModel);
      }
    } catch (e) {
      errorMessage = 'Error logging in with Google';
    } finally {
      isLoading = false;
    }
  }

  @action
  Future<void> loginWithEmailPassword(String email, String password) async {
    isLoading = true;
    try {
      user = await _loginWithEmailPasswordUseCase(email, password);
      errorMessage = null;

      if (user != null) {
        final userModel = UserModel(
          uid: user!.uid,
          email: user!.email ?? '',
          name: user!.displayName ?? '',
          photoUrl: user!.photoURL ?? '',
        );

        final activeAccount = await _getUserFirestoreUseCase(userModel.email);

        if (activeAccount?['name'] == '') {
          isProfileSetupRequired = true;
        }

        if (activeAccount == null) {
          isProfileSetupRequired = true;
          await _saveUserFirestoreUseCase(userModel.email, userModel.toJson());
        }
        await _saveUserIdSharedPreferencesUseCase(userModel);
      }
    } catch (e) {
      errorMessage = 'Incorrect email or password';
    } finally {
      isLoading = false;
    }
  }

  @action
  Future<void> logout() async {
    await _logoutUseCase();
    user = null;
    errorMessage = null;
  }
}
