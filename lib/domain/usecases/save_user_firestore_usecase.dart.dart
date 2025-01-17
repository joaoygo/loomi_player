import 'package:loomi_player/domain/repositories/firestore_user_repository.dart';

class SaveUserFirestoreUseCase {
  final FirestoreUserRepository _userRepository;

  SaveUserFirestoreUseCase(this._userRepository);

  Future<void> call(String uid, Map<String, dynamic> userData) {
    return _userRepository.saveUserToFirestore(uid, userData);
  }
}
