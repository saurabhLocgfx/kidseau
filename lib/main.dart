import 'package:easy_localization/easy_localization.dart' as local;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mentions/flutter_mentions.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kidseau/ParentsPanel/POnboardingScreens/PSplashScreen.dart';
import 'package:kidseau/Theme.dart';
import 'package:kidseau/restartappwidget/restartwidgets.dart';
import 'package:kidseau/shard_prefs/shared_prefs.dart';
import 'dart:ui' as ui;

import 'TeachersPanel/TDashboard.dart';

GlobalKey<MyAppState> globalKey = GlobalKey<MyAppState>();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await local.EasyLocalization.ensureInitialized();
  await UserPrefs.init();
  runApp(local.EasyLocalization(
    supportedLocales: [
      Locale('en', 'US'),
      Locale('ar', 'AR'),
      Locale('fr', 'FR'),
    ],
    path: 'assets/lang',
    fallbackLocale: Locale('en', 'US'),
    child: RestartWidget(child: MyApp()),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  /* static void setLocale(BuildContext context, Locale newLocale) async {
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    var prefs = await SharedPreferences.getInstance();
    prefs.setString('languageCode', newLocale.languageCode);
    prefs.setString('countryCode', "");

    state?.setState(() {
      state._locale = newLocale;
    });
  }
*/
  @override
  State<MyApp> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  /*Locale _locale = Locale('en', 'us');

  @override
  void initState() {
    super.initState();
    this._fetchLocale().then((locale) {
      setState(() {
        this._locale = locale;
      });
    });
  }*/

  /* Future<Locale> _fetchLocale() async {
    var prefs = await SharedPreferences.getInstance();

    String languageCode = prefs.getString('languageCode') ?? 'ar';
    String countryCode = prefs.getString('countryCode') ?? 'ps';

    return Locale(languageCode, countryCode);
  }*/

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return ScreenUtilInit(
        designSize: const Size(414, 896),
        //designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return Portal(
            child: GetMaterialApp(
              textDirection: TextDirection.ltr,
              theme: ThemeData().copyWith(
                colorScheme: ThemeData().colorScheme.copyWith(
                      primary: ThemeColor.primarycolor,
                    ),
              ),
              supportedLocales: context.supportedLocales,
              /*supportedLocales: [
                Locale('en', 'US'),
                Locale('ar', 'AR'),
                Locale('fr', 'FR'),
              ],*/
              /* locale: _locale,*/
              locale: context.locale,
              localizationsDelegates: context.localizationDelegates,
              /* localizationsDelegates: [
                AppLoaclizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                const FallbackCupertinoLocalisationsDelegate(),
              ],*/
              /*localeResolutionCallback: (locale, supportedLocales) {
                for (var supportedLocales in supportedLocales) {
                  if (supportedLocales.languageCode == locale?.languageCode &&
                      supportedLocales.countryCode == locale?.countryCode) {
                    return supportedLocales;
                  }
                }
              },*/
              debugShowCheckedModeBanner: false,
              home: /*TPersonalDetails(
                isEmail: false,
              ),*/
                  // Parentinfodashboard()
                  // KidsDetails(),
                  // ParentInfo()
                  // TWaitingScreen()
                  // PSignupCode()
                  //    TDashboard(),
                  // PDashboard(),
                  PSplashScreen(),
            ),
          );
        });
  }
}

/*
class FallbackCupertinoLocalisationsDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalisationsDelegate();

  @override
  bool isSupported(Locale locale) => true;

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      DefaultCupertinoLocalizations.load(locale);

  @override
  bool shouldReload(FallbackCupertinoLocalisationsDelegate old) => false;
}
*/
