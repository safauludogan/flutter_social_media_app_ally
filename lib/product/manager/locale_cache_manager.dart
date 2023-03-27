import 'package:shared_preferences/shared_preferences.dart';

class LocaleCacheManager {
  static final LocaleCacheManager _instance = LocaleCacheManager._();
  static LocaleCacheManager get instance => _instance;
  LocaleCacheManager._();

  Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  SharedPreferences? _preferences;

  Future<void> clearAll() async {
    await _preferences!.clear();
  }

  String? getString(CachePrefKey key) =>
      _preferences!.getString(key.name.toString());

  Future<bool> setString(CachePrefKey key, String value) =>
      _preferences!.setString(key.name.toString(), value);
}

enum CachePrefKey { token }
