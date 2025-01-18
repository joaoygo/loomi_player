import 'package:loomi_player/core/services/shared_preferences_services.dart';
import 'package:loomi_player/domain/repositories/shared_preferences_repository.dart';

class SharedPreferencesRepositoryImpl implements SharedPreferencesRepository {
  final SharedPreferencesService _sharedPreferencesService;
  final String key = 'userId';
  SharedPreferencesRepositoryImpl(this._sharedPreferencesService);

  @override
  Future<bool> clearUserIdSharedPreferences() async {
    return await _sharedPreferencesService.deleteData(key);
  }

  @override
  Future<String?> getUserIdSharedPreferences() async {
    return _sharedPreferencesService.getData(key);
  }

  @override
  Future<bool> saveUserIdSharedPreferences(String userId) async {
    return await _sharedPreferencesService.saveData(key, userId);
  }
}
