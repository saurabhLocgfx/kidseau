import 'package:shared_preferences/shared_preferences.dart';

class UserPrefs {
  static const String cookies = "cookies";
  static const Ezarabic = 'Ezarabic';
  static const isFirst = 'isFirst';
  static const ismother = 'ismother';
  static const isfather = 'isfather';
  static const enteredVal = 'enteredVal';
  static const Teacher = 'Teacher';
  static SharedPreferences? prefs;
  static Future init() async {
    prefs = await SharedPreferences.getInstance();
  }

  static Future clearData(String key) async {
    prefs?.remove(key);
  }

  static Future setIsTeacher(bool isTeacher) async {
    return await prefs?.setBool(Teacher, isTeacher);
  }

  static bool? getIsTeacher() {
    return prefs?.getBool(Teacher);
  }

  static Future setIsMother(bool isMother) async {
    return await prefs?.setBool(ismother, isMother);
  }

  static bool? getIsMother() {
    return prefs?.getBool(ismother);
  }

  static Future setIsFather(bool isFather) async {
    return await prefs?.setBool(isfather, isFather);
  }

  static bool? getIsFather() {
    return prefs?.getBool(isfather);
  }

  static Future setEnteredVal(String val) async {
    return await prefs?.setString(enteredVal, val);
  }

  static String? getEnteredVal() {
    return prefs?.getString(enteredVal);
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
