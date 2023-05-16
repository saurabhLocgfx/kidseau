import 'package:shared_preferences/shared_preferences.dart';

class UserPrefs {
  static const String cookies = "cookies";
  static const String showReminder = 'show_reminder';
  static const String selectedDate = 'selected_date';
  static const String noti1 = 'post';
  static const String noti2 = 'act';
  static const String noti3 = 'msg';
  static const Ezarabic = 'Ezarabic';
  static const isFirst = 'isFirst';
  static const ismother = 'ismother';
  static const isfather = 'isfather';
  static const enteredVal = 'enteredVal';
  static const Teacher = 'Teacher';
  static const FirebaseToken = 'FirebaseToken';
  static const SetLang = 'SetLang';
  static const ShowOnBoarding = 'ShowOnBoarding';
  static const ParentShowOnBoarding = 'ParentShowOnBoarding';
  static SharedPreferences? prefs;
  static Future init() async {
    prefs = await SharedPreferences.getInstance();
  }

  static Future showOnBoarding(bool val) async {
    return await prefs?.setBool(ShowOnBoarding, val);
  }

  static bool? getShowOnBoarding() {
    return prefs?.getBool(ShowOnBoarding);
  }

  static Future showParentOnBoarding(bool val) async {
    return await prefs?.setBool(ParentShowOnBoarding, val);
  }

  static bool? getShowParentOnBoarding() {
    return prefs?.getBool(ParentShowOnBoarding);
  }

  static Future clearData(String key) async {
    prefs?.remove(key);
  }

  static Future setDate(String val) async {
    return await prefs?.setString(selectedDate, val);
  }

  static String? getDate() {
    return prefs?.getString(selectedDate);
  }

  static Future setShowReminder(bool val) async {
    return await prefs?.setBool(showReminder, val);
  }

  static bool? getShowReminder() {
    return prefs?.getBool(showReminder);
  }

  static Future setNoti1(bool val) async {
    return await prefs?.setBool(noti1, val);
  }

  static bool? getNoti1() {
    return prefs?.getBool(noti1);
  }

  static Future setNoti2(bool val) async {
    return await prefs?.setBool(noti2, val);
  }

  static bool? getNoti2() {
    return prefs?.getBool(noti2);
  }

  static Future setNoti3(bool val) async {
    return await prefs?.setBool(noti3, val);
  }

  static bool? getNoti3() {
    return prefs?.getBool(noti3);
  }

  static Future setLang(String val) async {
    return await prefs?.setString(SetLang, val);
  }

  static String? getLang() {
    return prefs?.getString(SetLang);
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

  static Future setFCM(String fcm) async {
    return await prefs?.setString(FirebaseToken, fcm);
  }

  static String? getFCM() {
    return prefs?.getString(FirebaseToken);
  }
}
