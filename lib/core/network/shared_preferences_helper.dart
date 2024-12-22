import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static SharedPreferences? _prefs;

  /// Initialize the SharedPreferences instance
  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  /// Get the value of a specific key
  static dynamic get(String key) {
    if (_prefs == null) {
      throw Exception("SharedPreferencesHelper is not initialized. Call init() first.");
    }
    return _prefs!.get(key);
  }

  /// Set the value for a specific key
  static Future<void> set(String key, dynamic value) async {
    if (_prefs == null) {
      throw Exception("SharedPreferencesHelper is not initialized. Call init() first.");
    }

    if (value is String) {
      await _prefs!.setString(key, value);
    } else if (value is int) {
      await _prefs!.setInt(key, value);
    } else if (value is double) {
      await _prefs!.setDouble(key, value);
    } else if (value is bool) {
      await _prefs!.setBool(key, value);
    } else if (value is List<String>) {
      await _prefs!.setStringList(key, value);
    } else {
      throw Exception("Unsupported value type");
    }
  }

  /// Remove a specific key
  static Future<void> delete(String key) async {
    if (_prefs == null) {
      throw Exception("SharedPreferencesHelper is not initialized. Call init() first.");
    }
    await _prefs!.remove(key);
  }

  /// Clear all preferences
  static Future<void> clear() async {
    if (_prefs == null) {
      throw Exception("SharedPreferencesHelper is not initialized. Call init() first.");
    }
    await _prefs!.clear();
  }
}
