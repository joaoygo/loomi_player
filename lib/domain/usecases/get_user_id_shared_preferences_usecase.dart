import '../../data/repositories/user_repository.dart';

class GetUserIdSharedPreferencesUseCase {
  final UserRepository _userRepository;

  GetUserIdSharedPreferencesUseCase(this._userRepository);

  Future<String?> call() {
    return _userRepository.getUser();
  }
}
