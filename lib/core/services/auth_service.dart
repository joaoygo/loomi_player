import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:logger/logger.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  var logger = Logger();

  AuthService() {
    _auth.setLanguageCode('pt-BR');
  }

  Future<User?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) return null;

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final userCredential = await _auth.signInWithCredential(credential);
      return userCredential.user;
    } catch (e) {
      logger.d("Error logging in with Google: $e");
      return null;
    }
  }

  Future<User?> signInWithEmailPassword(String email, String password) async {
    try {
      final userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return userCredential.user;
    } catch (e) {
      logger.d("Error logging in with email/password: $e");
      return null;
    }
  }

  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      logger.d("Error sending reset email: $e");
      rethrow;
    }
  }

  Future<User?> createUser(String email, String password) async {
    try {
      final newUser = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      return newUser.user;
    } catch (e) {
      throw Exception("Error creating user: $e");
    }
  }

  Future<bool> updatePassword(
      String email, String currentPassword, String newPassword) async {
    try {
      final user = _auth.currentUser;

      if (user != null) {
        final providers =
            user.providerData.map((info) => info.providerId).toList();

        if (providers.contains('google.com')) {
          logger.e(
              "User authenticated with Google cannot change password directly.");
          throw FirebaseAuthException(
            code: 'google-account',
            message: 'Users authenticated with Google do not have a password.'
                'Reset password by linking an account via email.',
          );
        }

        final credential = EmailAuthProvider.credential(
          email: email,
          password: currentPassword,
        );
        await user.reauthenticateWithCredential(credential);

        await user.updatePassword(newPassword);
        logger.d("Password changed successfully.");
        return true;
      }

      logger.e("No authenticated user to perform the change.");
      return false;
    } catch (e) {
      if (e is FirebaseAuthException) {
        if (e.code == 'google-account') {
          logger.e(e.message);
          return false;
        } else if (e.code == 'requires-recent-login') {
          logger.e("The user needs to authenticate again.");
        } else {
          logger.e("Error changing password: $e");
        }
      }
      return false;
    }
  }

  Future<bool> typeAccount() async {
    final user = _auth.currentUser;
    if (user != null) {
      final providers =
          user.providerData.map((info) => info.providerId).toList();
      return !providers.contains('google.com') ? true : false;
    }
    return false;
  }

  Future<bool> deleteUser(String email, String password) async {
    try {
      final user = _auth.currentUser;

      if (user != null) {
        final credential = EmailAuthProvider.credential(
          email: email,
          password: password,
        );
        await user.reauthenticateWithCredential(credential);

        await user.delete();
        logger.d("User deleted successfully.");
        return true;
      } else {
        logger.e("No authenticated user to delete.");
        return false;
      }
    } catch (e) {
      if (e is FirebaseAuthException) {
        if (e.code == 'requires-recent-login') {
          logger.e(
              "The user needs to authenticate again to perform this action.");
        } else {
          logger.e("Error deleting user: $e");
        }
      } else {
        logger.e("Unexpected error: $e");
      }
      return false;
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
    await _googleSignIn.signOut();
  }
}
