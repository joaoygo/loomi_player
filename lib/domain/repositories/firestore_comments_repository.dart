abstract class FirestoreCommentsRepository {
  Future<bool> addCommentToVideo(
      String videoId, String userName, String comment, String photoUrl);

  Future<List<Map<String, dynamic>>> getCommentsForVideo(String videoId);

  Future<bool> deleteComment(String videoId, String commentId);
}
