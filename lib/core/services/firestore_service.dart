import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:logger/logger.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  var logger = Logger();
  CollectionReference get usersCollection => _firestore.collection('users');

  Future<void> saveUser(String uid, Map<String, dynamic> userData) async {
    try {
      logger.d("Salvando dados do usuário no Firestore: $uid $userData");
      await usersCollection.doc(uid).set(userData, SetOptions(merge: true));
    } catch (e) {
      logger.w("Erro ao salvar usuário no Firestore: $e");
      throw Exception("Erro ao salvar dados no Firestore");
    }
  }

  Future<Map<String, dynamic>?> getUser(String uid) async {
    try {
      final snapshot = await usersCollection.doc(uid).get();
      return snapshot.exists ? snapshot.data() as Map<String, dynamic>? : null;
    } catch (e) {
      logger.d("Erro ao buscar usuário no Firestore: $e");
      throw Exception("Erro ao buscar dados do Firestore");
    }
  }

  Future<void> deleteUser(String uid) async {
    try {
      await usersCollection.doc(uid).delete();
    } catch (e) {
      logger.d("Erro ao deletar usuário no Firestore: $e");
      throw Exception("Erro ao deletar dados do Firestore");
    }
  }
}
