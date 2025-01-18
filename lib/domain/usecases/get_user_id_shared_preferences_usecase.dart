import 'package:loomi_player/domain/repositories/shared_preferences_repository.dart';

class GetUserIdSharedPreferencesUseCase {
  final SharedPreferencesRepository _sharedPreferencesRepository;
  GetUserIdSharedPreferencesUseCase(this._sharedPreferencesRepository);

  Future<String?> call() async {
    return await _sharedPreferencesRepository.getUserIdSharedPreferences();
  }
}
