import '../../data/models/user_model.dart';
import '../../data/repositories/user_repository.dart';

class GetUserUseCase {
  final UserRepository _userRepository;

  GetUserUseCase(this._userRepository);

  UserModel? call() {
    return _userRepository.getUser();
  }
}
