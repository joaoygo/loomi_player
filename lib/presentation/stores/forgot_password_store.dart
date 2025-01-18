import 'package:loomi_player/domain/usecases/reset_password_usecase.dart';
import 'package:mobx/mobx.dart';
import 'package:get_it/get_it.dart';

part 'forgot_password_store.g.dart';

class ForgotPasswordStore = _ForgotPasswordStoreBase with _$ForgotPasswordStore;

abstract class _ForgotPasswordStoreBase with Store {
  final ResetPasswordUsecase _resetPasswordUsecase =
      GetIt.I<ResetPasswordUsecase>();

  @observable
  bool isLoading = false;

  @observable
  String? errorMessage;

  @action
  Future<void> sendPasswordResetEmail(String email) async {
    isLoading = true;
    errorMessage = null;
    try {
      await _resetPasswordUsecase(email);
    } catch (e) {
      errorMessage = "Failed to send reset email. Please try again.";
    } finally {
      isLoading = false;
    }
  }
}
