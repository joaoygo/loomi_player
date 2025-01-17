import 'package:loomi_player/core/services/firestore_service.dart';
import 'package:loomi_player/domain/repositories/firestore_user_repository.dart';

class FirestoreUserRepositoryImpl implements FirestoreUserRepository {
  final FirestoreService _firestoreService;

  FirestoreUserRepositoryImpl(this._firestoreService);

  @override
  Future<void> saveUserToFirestore(String uid, Map<String, dynamic> userData) {
    return _firestoreService.saveUser(uid, userData);
  }

  @override
  Future<Map<String, dynamic>?> getUserFromFirestore(String uid) {
    return _firestoreService.getUser(uid);
  }

  @override
  Future<void> deleteUserFromFirestore(String uid) {
    return _firestoreService.usersCollection.doc(uid).delete();
  }
}
