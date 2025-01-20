import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:logger/logger.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  var logger = Logger();
  CollectionReference get usersCollection => _firestore.collection('users');

  Future<void> saveUser(String uid, Map<String, dynamic> userData) async {
    try {
      await usersCollection.doc(uid).set(userData, SetOptions(merge: true));
    } catch (e) {
      logger.w("Error saving user in Firestore: $e");
      throw Exception("Error saving user in Firestore");
    }
  }

  Future<Map<String, dynamic>?> getUserFirestore(String uid) async {
    try {
      final snapshot = await usersCollection.doc(uid).get();
      return snapshot.exists ? snapshot.data() as Map<String, dynamic>? : null;
    } catch (e) {
      logger.d("Error searching for user in Firestore: $e");
      throw Exception("Error searching for user in Firestore");
    }
  }

  Future<void> deleteUser(String uid) async {
    try {
      await usersCollection.doc(uid).delete();
    } catch (e) {
      logger.d("Error deleting user in Firestore: $e");
      throw Exception("Error deleting user in Firestore");
    }
  }
}
