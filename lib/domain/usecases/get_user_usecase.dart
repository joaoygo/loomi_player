import '../../data/repositories/user_repository.dart';

class GetUserUseCase {
  final UserRepository _userRepository;

  GetUserUseCase(this._userRepository);

  Future<String?> call() {
    return _userRepository.getUser();
  }
}
