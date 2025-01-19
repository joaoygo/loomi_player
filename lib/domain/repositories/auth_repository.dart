import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepository {
  Future<User?> signInWithGoogle();
  Future<User?> signInWithEmailPassword(String email, String password);
  Future<void> sendPasswordResetEmail(String email);
  Future<User?> createUser(String email, String password);
  Future<bool> updatePassword(
      String email, String currentPassword, String newPassword);
  Future<bool> typeAccount();
  Future<void> signOut();
}
