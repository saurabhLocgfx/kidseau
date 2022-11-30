import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kidseau/ParentsPanel/POnboardingScreens/PSplashScreen.dart';
import 'package:kidseau/Theme.dart';

import 'app_localizations/app_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return GetMaterialApp(
            theme: ThemeData().copyWith(
              colorScheme: ThemeData().colorScheme.copyWith(
                    primary: ThemeColor.primarycolor,
                  ),
            ),
            supportedLocales: [
              Locale('en', 'US'),
              Locale('ar', 'AR'),
              Locale('fr', 'FR'),
            ],
            localizationsDelegates: [
              AppLoaclizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            localeResolutionCallback: (locale, supportedLocales) {
              for (var supportedLocales in supportedLocales) {
                if (supportedLocales.languageCode == locale?.languageCode &&
                    supportedLocales.countryCode == locale?.countryCode) {
                  return supportedLocales;
                }
              }
            },
            debugShowCheckedModeBanner: false,
            home: PSplashScreen(),
          );
        });
  }
}
