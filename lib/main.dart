import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:easy_localization/easy_localization.dart' as local;
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_mentions/flutter_mentions.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kidseau/Theme.dart';
import 'package:kidseau/reminder_notifications_class.dart';
import 'package:kidseau/restartappwidget/restartwidgets.dart';
import 'package:kidseau/shard_prefs/shared_prefs.dart';

import 'ParentsPanel/POnboardingScreens/PSplashScreen.dart';

GlobalKey<MyAppState> globalKey = GlobalKey<MyAppState>();
AndroidNotificationChannel androidChannel = AndroidNotificationChannel(
  'basic_channel',
  'basic_channel',
  description: 'Description',
  //groupId: 'basic_channel_group',
  importance: Importance.high,
  showBadge: true,
  playSound: true,
);

FlutterLocalNotificationsPlugin flutterPlugin =
    FlutterLocalNotificationsPlugin();

fn(RemoteMessage message) async {
  //log(message.data['content']['payload']['type'].toString());
  //AwesomeNotifications().createdStream.listen((event) {});
  //AwesomeNotifications().displayedStream.listen((event) {});
  //AwesomeNotifications().dismissedStream.listen((event) {});
  //AwesomeNotifications().setGlobalBadgeCounter(0);
  log(message.data.toString());
  //String t = message.data['other_data'];
  //Map a = jsonDecode(t);
  // http.Response response = await http.get(Uri.parse(a['bigPicture']));
  // final bytes = response.bodyBytes;
  AndroidNotificationDetails androidPlatformChannelSpecifics =
      AndroidNotificationDetails('basic_channel', 'basic_channel',
          channelDescription: 'your channel description',
          importance: Importance.max,
          priority: Priority.high,
          // styleInformation: BigPictureStyleInformation(
          //     ByteArrayAndroidBitmap.fromBase64String(base64Encode(bytes))),
          ticker: 'ticker');
  NotificationDetails platformChannelSpecifics =
      NotificationDetails(android: androidPlatformChannelSpecifics);
  //log(event.data['content']['id'].toString());
  // log(a['id'].toString());
  // flutterPlugin.show(
  //   a['id'],
  //   a['title'],
  //   a['body'],
  //   platformChannelSpecifics,
  //   payload: a['payload'].toString(),
  // );
  /*if (message.data['content']['payload']['type'].toString() == 'story') {
    Navigator.push(
        _navigatorKey.currentState!.context,
        MaterialPageRoute(
            builder: (ctx) => DetailsScreen(
                userName: message.data['content']['payload']['channel_name'],
                storyType: message.data['content']['payload']['story_type'],
                siteUrl: message.data['content']['payload']['href'])));
    */
  /*_navigatorKey.currentState?.push(MaterialPageRoute(
        builder: (ctx) =>
            DetailsScreen(
                userName: message.data['content']['payload']['channel_name'],
                storyType: message.data['content']['payload']['story_type'],
                siteUrl: message.data['content']['payload']['href'])));*/ /*
  } else */ /*if (message.data['content']['payload']['type'] == 'system')*/ /* {
    Navigator.push(
        _navigatorKey.currentState!.context,
        MaterialPageRoute(
            builder: (ctx) => TabsScreen(
                  tabIndex: 3,
                )));
  }*/
  /*AwesomeNotifications().actionStream.listen((event) {
    log(message.data.toString());
    log(message.data['content']['payload']['type'].toString());
    */ /* else {}*/ /*
  });*/
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await local.EasyLocalization.ensureInitialized();
  await UserPrefs.init();
  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('@mipmap/ic_launcher');
  final IOSInitializationSettings initializationSettingsIOS =
      IOSInitializationSettings(
          onDidReceiveLocalNotification: onDidReceiveLocalNotification);
  final InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
    iOS: initializationSettingsIOS,
  );
  await flutterPlugin.initialize(initializationSettings,
      onSelectNotification: selectNotification);
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await FlutterLocalNotificationsPlugin()
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(androidChannel);
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      alert: true, badge: true, sound: true);
  Platform.isAndroid
      ? flutterPlugin
          .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>()!
          .requestPermission()
      : await flutterPlugin
          .resolvePlatformSpecificImplementation<
              IOSFlutterLocalNotificationsPlugin>()
          ?.requestPermissions(
            alert: true,
            badge: true,
            sound: true,
          );
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

void onDidReceiveLocalNotification(
    int? id, String? title, String? body, String? payload) async {
  // display a dialog with the notification details, tap ok to go to another page
  //fn(message)
}
void selectNotification(var payload) async {}

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  fn(message);
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

  Future<void> setupInteractedMessage() async {
    // Get any messages which caused the application to open from
    // a terminated state.
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();

    // If the message also contains a data property with a "type" of "chat",
    // navigate to a chat screen
    if (initialMessage != null) {
      fn(initialMessage);
    }

    // Also handle any interaction when the app is in the background via a
    // Stream listener
    //FirebaseMessaging.onMessageOpenedApp.listen(_handleMessage);
  }

  NotificationServices notificationServices = NotificationServices();
  @override
  void initState() {
    FirebaseMessaging.onMessage.listen(
      (event) async {
        /*  AwesomeNotifications().createNotificationFromJsonData(event.data);
        AwesomeNotifications().actionStream.listen((event1) {
          fn(event);
        });*/
        RemoteNotification? notification = event.notification;
        AndroidNotification? android = event.notification?.android;
        if (notification != null && android != null) {
          flutterPlugin.show(
              notification.hashCode,
              notification.title,
              notification.body,
              NotificationDetails(
                android: AndroidNotificationDetails(
                  androidChannel.id,
                  androidChannel.name,
                  channelDescription: androidChannel.description,
                  color: Colors.blue,
                  playSound: true,
                  icon: '@mipmap/ic_launcher',
                ),
              ));
        }
        fn(event);
        //log(event.data['content']['payload']['type'].toString());
        /*if (event.data['content']['payload']['type'] == 'story') {
          _navigatorKey.currentState?.push(MaterialPageRoute(
              builder: (ctx) => DetailsScreen(
                  userName: event.data['content']['payload']['channel_name'],
                  storyType: event.data['content']['payload']['story_type'],
                  siteUrl: event.data['content']['payload']['href'])));
        } else if (event.data['content']['payload']['type'] == 'system') {
          _navigatorKey.currentState!.push(
            MaterialPageRoute(
              builder: (_) => TabsScreen(
                tabIndex: 3,
              ),
            ),
          );
        } else {
          log('else');
        }*/
        //log('onmessage' + event.data.toString());
      },
    );
    FirebaseMessaging.onMessageOpenedApp.listen(
      (event) async {
        /* AwesomeNotifications().createNotificationFromJsonData(event.data);
        AwesomeNotifications().actionStream.listen((event1) {
          fn(event);
        });*/

        RemoteNotification? notification = event.notification;
        AndroidNotification? android = event.notification?.android;
        if (notification != null && android != null) {
          flutterPlugin.show(
              notification.hashCode,
              notification.title,
              notification.body,
              NotificationDetails(
                android: AndroidNotificationDetails(
                  androidChannel.id,
                  androidChannel.name,
                  channelDescription: androidChannel.description,
                  color: Colors.blue,
                  playSound: true,
                  icon: '@mipmap/ic_launcher',
                ),
              ));
        }
        fn(event);
        /*if (event.data['content']['payload']['type'] == 'story') {
        _navigatorKey.currentState?.push(MaterialPageRoute(
            builder: (ctx) => DetailsScreen(
                userName: event.data['content']['payload']['channel_name'],
                storyType: event.data['content']['payload']['story_type'],
                siteUrl: event.data['content']['payload']['href'])));
      } else if (event.data['content']['payload']['type'] == 'system') {
        _navigatorKey.currentState!.push(
          MaterialPageRoute(
            builder: (_) => TabsScreen(
              tabIndex: 3,
            ),
          ),
        );
      } else {
        log('else');
      }*/
        //log('onMessageOpened' + event.data.toString());
      },
    );
    notificationServices.initializeNotification();

    super.initState();
  }

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
                    // TDashboard(),
                    // PDashboard(),
                    //PSplashScreen(),
                    //PProfileDashBoard()),
                    //PKidsDashboard()),

                    PSplashScreen()),
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
