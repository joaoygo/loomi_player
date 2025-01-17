import '../../data/repositories/user_repository.dart';

class ClearUserIdSharedPreferencesUseCase {
  final UserRepository _userRepository;

  ClearUserIdSharedPreferencesUseCase(this._userRepository);

  Future<void> call() async {
    await _userRepository.clearUser();
  }
}
