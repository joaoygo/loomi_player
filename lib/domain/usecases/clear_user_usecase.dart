import 'package:loomi_player/domain/repositories/shared_preferences_repository.dart';

class ClearUserIdSharedPreferencesUseCase {
  final SharedPreferencesRepository _sharedPreferencesRepository;

  ClearUserIdSharedPreferencesUseCase(this._sharedPreferencesRepository);

  Future<void> call() async {
    await _sharedPreferencesRepository.clearUserIdSharedPreferences();
  }
}
