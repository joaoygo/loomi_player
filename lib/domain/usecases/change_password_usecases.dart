import 'package:loomi_player/domain/repositories/auth_repository.dart';

class ChangePasswordUsecases {
  final AuthRepository _authRepository;

  ChangePasswordUsecases(this._authRepository);

  Future<bool> call(String email, String currentPassword, String newPassword) =>
      _authRepository.updatePassword(email, currentPassword, newPassword);
}
