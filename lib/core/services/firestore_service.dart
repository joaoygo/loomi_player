import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:logger/logger.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  var logger = Logger();
  CollectionReference get usersCollection => _firestore.collection('users');
  CollectionReference get commentsVideoCollection =>
      _firestore.collection('commentsVideo');

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

  Future<bool> addCommentToVideo(
      String videoId, String userName, String comment, String photoUrl) async {
    try {
      final commentData = {
        'userName': userName,
        'comment': comment,
        'timestamp': DateTime.now().toUtc().toIso8601String(),
        'photoUrl': photoUrl
      };

      await commentsVideoCollection.doc(videoId).set({
        'comments': FieldValue.arrayUnion([commentData]),
      }, SetOptions(merge: true));

      logger.i("Comment added successfully to video: $videoId");
      return true;
    } catch (e) {
      logger.f("Error adding comment to video: $e");
      return false;
    }
  }

  Future<List<Map<String, dynamic>>> getCommentsForVideo(String videoId) async {
    try {
      final docSnapshot = await commentsVideoCollection.doc(videoId).get();

      if (docSnapshot.exists) {
        final data = docSnapshot.data() as Map<String, dynamic>;

        if (data['comments'] != null) {
          final comments = List<Map<String, dynamic>>.from(data['comments']);
          logger.i("Successfully retrieved comments for video: $videoId");
          return comments;
        }
      }

      logger.w("No comments found for video: $videoId");
      return [];
    } catch (e) {
      logger.e("Error retrieving comments for video: $e");
      return [];
    }
  }

  Future<bool> deleteComment(String videoId, String commentId) async {
    try {
      logger.f("Deleting comment: $commentId from video: $videoId");
      await commentsVideoCollection.doc(videoId).update({
        'comments': FieldValue.arrayRemove([commentId]),
      });
      logger.f("Comment deleted successfully from video: $videoId");
      return true;
    } catch (e) {
      logger.e("Error deleting comment from video: $e");
      return false;
    }
  }
}
