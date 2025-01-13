import '../../data/models/user_model.dart';
import '../../data/repositories/user_repository.dart';

class SaveUserUseCase {
  final UserRepository _userRepository;

  SaveUserUseCase(this._userRepository);

  Future<void> call(UserModel user) async {
    await _userRepository.saveUser(user);
  }
}
