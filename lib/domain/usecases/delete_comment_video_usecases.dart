import 'package:loomi_player/domain/repositories/firestore_comments_repository.dart';

class DeleteCommentVideoUsecases {
  final FirestoreCommentsRepository _commentsRepository;

  DeleteCommentVideoUsecases(this._commentsRepository);
  Future<bool> call(String videoId, String commentId) {
    return _commentsRepository.deleteComment(videoId, commentId);
  }
}
