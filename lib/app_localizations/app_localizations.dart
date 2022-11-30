import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppLoaclizations {
  late final Locale locale;
  AppLoaclizations(this.locale);

  static AppLoaclizations? of(BuildContext context) {
    return Localizations.of<AppLoaclizations>(context, AppLoaclizations);
  }

  static LocalizationsDelegate<AppLoaclizations> delegate =
      _AppLocalizationDelegate();

  Map<String, String> _localizedStrings = {};

  Future<bool> load() async {
    String jsonString =
        await rootBundle.loadString('lang/${locale.languageCode}.json');
    Map<String, dynamic> jsonMap = json.decode(jsonString);

    _localizedStrings = jsonMap.map((key, value) {
      return MapEntry(key, value.toString());
    });
    return true;
  }

  String? translate(String key) {
    return _localizedStrings[key];
  }
}

class _AppLocalizationDelegate extends LocalizationsDelegate<AppLoaclizations> {
  @override
  bool isSupported(Locale locale) {
    // TODO: implement isSupported
    return ['en', 'ar', 'fr'].contains(locale.languageCode);
  }

  @override
  Future<AppLoaclizations> load(Locale locale) async {
    // TODO: implement load
    AppLoaclizations loaclizations = new AppLoaclizations(locale);
    await loaclizations.load();
    return loaclizations;
  }

  @override
  bool shouldReload(_AppLocalizationDelegate old) => false;
}
