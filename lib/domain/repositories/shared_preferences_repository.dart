abstract class SharedPreferencesRepository {
  Future<void> saveUserIdSharedPreferences(String userId);
  Future<String?> getUserIdSharedPreferences();
  Future<bool> clearUserIdSharedPreferences();
}
