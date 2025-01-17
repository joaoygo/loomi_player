abstract class FirestoreUserRepository {
  Future<void> saveUserToFirestore(String uid, Map<String, dynamic> userData);

  Future<Map<String, dynamic>?> getUserFromFirestore(String uid);

  Future<void> deleteUserFromFirestore(String uid);
}
