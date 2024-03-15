import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceHelper {
  static late SharedPreferences _preferences;

  static Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static Future<void> setAuthenticated(bool value) async {
    await _preferences.setBool('authenticated', value);
  }

  static bool isAuthenticated() {
    return _preferences.getBool('authenticated') ?? false;
  }
}
