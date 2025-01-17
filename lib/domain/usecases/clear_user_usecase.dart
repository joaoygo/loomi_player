import '../../data/repositories/user_repository.dart';

class ClearUserUseCase {
  final UserRepository _userRepository;

  ClearUserUseCase(this._userRepository);

  Future<void> call() async {
    await _userRepository.clearUser();
  }
}
