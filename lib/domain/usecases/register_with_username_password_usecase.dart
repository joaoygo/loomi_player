import 'package:firebase_auth/firebase_auth.dart';
import 'package:loomi_player/domain/repositories/auth_repository.dart';

class RegisterWithUsernamePasswordUseCase {
  final AuthRepository _authRepository;

  RegisterWithUsernamePasswordUseCase(this._authRepository);

  Future<User?> call(String email, String password) =>
      _authRepository.createUser(email, password);
}
