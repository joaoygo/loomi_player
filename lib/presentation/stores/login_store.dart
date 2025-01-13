import 'package:loomi_player/data/models/user_model.dart';
import 'package:loomi_player/domain/usecases/save_user_usecase.dart';
import 'package:mobx/mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../core/services/auth_service.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStoreBase with _$LoginStore;

abstract class _LoginStoreBase with Store {
  final AuthService _authService = GetIt.I<AuthService>();
  final SaveUserUseCase _saveUserUseCase = GetIt.I<SaveUserUseCase>();

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
      user = await _authService.signInWithGoogle();
      errorMessage = null;

      if (user != null && user!.displayName == null) {
        isProfileSetupRequired = true;
      }

      if (user != null) {
        final userModel = UserModel(
          uid: user!.uid,
          email: user!.email ?? '',
          name: user!.displayName ?? '',
          photoUrl: user!.photoURL,
        );

        await _saveUserUseCase(userModel);
      }
    } catch (e) {
      print("Erro ao fazer login: $e");
      errorMessage = 'Erro ao fazer login com Google';
    } finally {
      isLoading = false;
    }
  }

  @action
  Future<void> loginWithEmailPassword(String email, String password) async {
    isLoading = true;
    try {
      user = await _authService.signInWithEmailPassword(email, password);
      errorMessage = null;

      if (user != null && user!.displayName == null) {
        isProfileSetupRequired = true;
      }
    } catch (e) {
      print("Erro ao fazer login com email/senha: $e");
      errorMessage = 'Email ou senha incorretos';
    } finally {
      isLoading = false;
    }
  }

  @action
  Future<void> logout() async {
    await _authService.signOut();
    user = null;
    errorMessage = null;
  }
}
