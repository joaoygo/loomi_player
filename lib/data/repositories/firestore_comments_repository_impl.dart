import 'package:loomi_player/core/services/firestore_service.dart';
import 'package:loomi_player/domain/repositories/firestore_comments_repository.dart';

class FirestoreCommentsRepositoryImpl implements FirestoreCommentsRepository {
  final FirestoreService _firestoreService;

  FirestoreCommentsRepositoryImpl(this._firestoreService);

  @override
  Future<bool> addCommentToVideo(
      String videoId, String userName, String comment, String photoUrl) {
    return _firestoreService.addCommentToVideo(
        videoId, userName, comment, photoUrl);
  }

  @override
  Future<List<Map<String, dynamic>>> getCommentsForVideo(String videoId) {
    return _firestoreService.getCommentsForVideo(videoId);
  }

  @override
  Future<bool> deleteComment(String videoId, String commentId) {
    return _firestoreService.deleteComment(videoId, commentId);
  }
}
