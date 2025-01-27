import 'package:loomi_player/domain/repositories/firestore_comments_repository.dart';

class GetCommentVideoUsecases {
  final FirestoreCommentsRepository _commentsRepository;

  GetCommentVideoUsecases(this._commentsRepository);

  Future<List<Map<String, dynamic>>> call(String videoId) =>
      _commentsRepository.getCommentsForVideo(videoId);
}
