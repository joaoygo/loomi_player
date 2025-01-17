import 'package:loomi_player/domain/repositories/firestore_user_repository.dart';

class DeleteUserFirestoreUseCase {
  final FirestoreUserRepository _userRepository;

  DeleteUserFirestoreUseCase(this._userRepository);

  Future<void> call(String uid) {
    return _userRepository.deleteUserFromFirestore(uid);
  }
}
