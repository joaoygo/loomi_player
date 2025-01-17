import 'package:loomi_player/domain/repositories/firestore_user_repository.dart';

class GetUserFirestoreUseCase {
  final FirestoreUserRepository _userRepository;

  GetUserFirestoreUseCase(this._userRepository);

  Future<Map<String, dynamic>?> call(String uid) {
    return _userRepository.getUserFromFirestore(uid);
  }
}
