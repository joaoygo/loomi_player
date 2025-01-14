import '../../data/repositories/user_repository.dart';

class ClearUserUseCase {
  final UserRepository _userRepository;

  ClearUserUseCase(this._userRepository);

  Future<void> call(String uid) async {
    await _userRepository.clearUser(uid);
  }
}
