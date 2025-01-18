import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  final SharedPreferences _prefs;
  SharedPreferencesService(this._prefs);

  // Salvar dados
  Future<bool> saveData(String key, String value) async {
    return await _prefs.setString(key, value);
  }

  // Buscar dados
  String? getData(String key) {
    return _prefs.getString(key);
  }

  // Deletar dados
  Future<bool> deleteData(String key) async {
    return await _prefs.remove(key);
  }
}
