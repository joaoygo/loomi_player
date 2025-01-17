import 'package:shared_preferences/shared_preferences.dart';
import '../models/user_model.dart';

class UserRepository {
  final SharedPreferences _sharedPreferences;

  UserRepository(this._sharedPreferences);

  static const String _userKey = 'user-uid';

  Future<void> saveUser(UserModel user) async {
    await _sharedPreferences.setString(_userKey, user.uid);
  }

  Future<String?> getUser() async {
    final user = _sharedPreferences.getString(_userKey);
    if (user == null) return null;

    return user;
  }

  Future<void> clearUser() async {
    await _sharedPreferences.remove(_userKey);
  }
}
