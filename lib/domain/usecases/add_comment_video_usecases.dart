import 'package:loomi_player/domain/repositories/firestore_comments_repository.dart';

class AddCommentVideoUsecases {
  final FirestoreCommentsRepository _userRepository;

  AddCommentVideoUsecases(this._userRepository);

  Future<bool> call(
      String videoId, String userName, String comment, String profileUrl) {
    return _userRepository.addCommentToVideo(
        videoId, userName, comment, profileUrl);
  }
}
