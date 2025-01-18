import 'package:firebase_auth/firebase_auth.dart';
import 'package:loomi_player/domain/repositories/auth_repository.dart';

class LoginWithGoogleUseCase {
  final AuthRepository _authRepository;

  LoginWithGoogleUseCase(this._authRepository);

  Future<User?> call() => _authRepository.signInWithGoogle();
}
