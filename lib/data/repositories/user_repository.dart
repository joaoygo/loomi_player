import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/user_model.dart';

class UserRepository {
  final SharedPreferences _sharedPreferences;

  UserRepository(this._sharedPreferences);

  static const String _userKey = 'user';

  Future<void> saveUser(UserModel user) async {
    final userJson = jsonEncode(user.toJson());
    await _sharedPreferences.setString(_userKey, userJson);
  }

  UserModel? getUser() {
    final userJson = _sharedPreferences.getString(_userKey);
    if (userJson == null) return null;

    return UserModel.fromJson(jsonDecode(userJson));
  }

  Future<void> clearUser() async {
    await _sharedPreferences.remove(_userKey);
  }
}
