import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static SharedPreferences? _prefs;

  /// Initialize SharedPreferences
  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static Future<bool> setData<T>(String key, T value) async {
    if(_prefs == null)await init();
    if (value is String) {
      return  await _prefs!.setString(key, value);
    } else if (value is int) {
      return  await _prefs!.setInt(key, value);
    } else if (value is bool) {
      return await _prefs!.setBool(key, value);
    } else if (value is double) {
      return  await _prefs!.setDouble(key, value);
    } else if (value is List<String>) {
    return  await _prefs!.setStringList(key, value);
    } else {
      throw Exception('Unsupported type: ${value.runtimeType}');
    }
  }

  ///  Get values
  static T? getData<T>(String key) {
    if(_prefs == null)return null;
    if (T == String) {
      return _prefs!.getString(key) as T?;
    } else if (T == int) {
      return _prefs!.getInt(key) as T?;
    } else if (T == bool) {
      return _prefs!.getBool(key) as T?;
    } else if (T == double) {
      return _prefs!.getDouble(key) as T?;
    } else if (T == List<String>) {
      return _prefs!.getStringList(key) as T?;
    } else {
      throw Exception('Unsupported type: $T');
    }
  }

  /// Remove a value
  static Future<bool> remove(String key) async {
    if(_prefs == null)await init();
   return await _prefs!.remove(key);
  }


}
