import 'package:firebase_auth/firebase_auth.dart';
import 'package:loomi_player/domain/repositories/auth_repository.dart';

class LoginWithEmailPasswordUseCase {
  final AuthRepository _authRepository;

  LoginWithEmailPasswordUseCase(this._authRepository);

  Future<User?> call(String email, String password) =>
      _authRepository.signInWithEmailPassword(email, password);
}
