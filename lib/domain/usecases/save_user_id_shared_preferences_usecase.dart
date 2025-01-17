import '../../data/models/user_model.dart';
import '../../data/repositories/user_repository.dart';

class SaveUserIdSharedPreferencesUseCase {
  final UserRepository _userRepository;

  SaveUserIdSharedPreferencesUseCase(this._userRepository);

  Future<void> call(UserModel user) async {
    await _userRepository.saveUser(user);
  }
}
