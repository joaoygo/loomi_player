import 'package:mobx/mobx.dart';
import 'package:get_it/get_it.dart';
import '../../core/services/auth_service.dart';

part 'forgot_password_store.g.dart';

class ForgotPasswordStore = _ForgotPasswordStoreBase with _$ForgotPasswordStore;

abstract class _ForgotPasswordStoreBase with Store {
  final AuthService _authService = GetIt.I<AuthService>();

  @observable
  bool isLoading = false;

  @observable
  String? errorMessage;

  @action
  Future<void> sendPasswordResetEmail(String email) async {
    isLoading = true;
    errorMessage = null;
    try {
      await _authService.sendPasswordResetEmail(email);
    } catch (e) {
      errorMessage = "Failed to send reset email. Please try again.";
    } finally {
      isLoading = false;
    }
  }
}
