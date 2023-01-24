import 'package:shared_preferences/shared_preferences.dart';

class UserPrefs {
  static const String cookies = "cookies";
  static const Ezarabic = 'Ezarabic';
  static const isFirst = 'isFirst';
  static SharedPreferences? prefs;
  static Future init() async {
    prefs = await SharedPreferences.getInstance();
  }

  static Future setEArbBool(bool isArb) async {
    return await prefs?.setBool(Ezarabic, isArb);
  }

  static bool? getArbBool() {
    return prefs?.getBool(Ezarabic);
  }

  static Future setIsFirst(bool first) async {
    return await prefs?.setBool(isFirst, first);
  }

  static bool? getIsFirst() {
    return prefs?.getBool(isFirst);
  }

  static Future setCookies(String value) async {
    return await prefs?.setString(cookies, value);
  }

  static String? getCookies() {
    return prefs?.getString(cookies);
  }
}
