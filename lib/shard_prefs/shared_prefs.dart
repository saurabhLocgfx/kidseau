import 'package:shared_preferences/shared_preferences.dart';

class UserPrefs {
  static const String cookies = "cookies";
  static SharedPreferences? prefs;
  static Future init() async {
    prefs = await SharedPreferences.getInstance();
  }

  static Future setCookies(String value) async {
    return await prefs?.setString(cookies, value);
  }

  static String? getCookies() {
    return prefs?.getString(cookies);
  }
}
