import 'package:loomi_player/domain/repositories/shared_preferences_repository.dart';

import '../../data/models/user_model.dart';

class SaveUserIdSharedPreferencesUseCase {
  final SharedPreferencesRepository _sharedPreferencesRepository;

  SaveUserIdSharedPreferencesUseCase(this._sharedPreferencesRepository);

  Future<void> call(UserModel user) async {
    await _sharedPreferencesRepository.saveUserIdSharedPreferences(user.email);
  }
}
