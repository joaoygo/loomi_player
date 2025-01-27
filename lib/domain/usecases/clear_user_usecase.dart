import 'package:loomi_player/domain/repositories/shared_preferences_repository.dart';

class ClearUserIdSharedPreferencesUseCase {
  final SharedPreferencesRepository _sharedPreferencesRepository;

  ClearUserIdSharedPreferencesUseCase(this._sharedPreferencesRepository);

  Future<bool> call() async {
    return await _sharedPreferencesRepository.clearUserIdSharedPreferences();
  }
}
