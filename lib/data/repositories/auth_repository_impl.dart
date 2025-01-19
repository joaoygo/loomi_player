import 'package:firebase_auth/firebase_auth.dart';
import 'package:loomi_player/core/services/auth_service.dart';
import 'package:loomi_player/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthService _authService;

  AuthRepositoryImpl(this._authService);

  @override
  Future<User?> createUser(String email, String password) {
    return _authService.createUser(email, password);
  }

  @override
  Future<void> sendPasswordResetEmail(String email) {
    return _authService.sendPasswordResetEmail(email);
  }

  @override
  Future<User?> signInWithEmailPassword(String email, String password) {
    return _authService.signInWithEmailPassword(email, password);
  }

  @override
  Future<User?> signInWithGoogle() {
    return _authService.signInWithGoogle();
  }

  @override
  Future<void> signOut() {
    return _authService.signOut();
  }

  @override
  Future<bool> updatePassword(
      String email, String currentPassword, String newPassword) {
    return _authService.updatePassword(email, currentPassword, newPassword);
  }

  @override
  Future<bool> typeAccount() {
    return _authService.typeAccount();
  }
}
