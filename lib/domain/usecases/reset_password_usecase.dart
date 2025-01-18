import 'package:loomi_player/domain/repositories/auth_repository.dart';

class ResetPasswordUsecase {
  final AuthRepository _authRepository;

  ResetPasswordUsecase(this._authRepository);

  Future<void> call(String email) =>
      _authRepository.sendPasswordResetEmail(email);
}
