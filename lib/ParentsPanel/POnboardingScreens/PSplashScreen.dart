import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kidseau/ParentsPanel/POnboardingScreens/PStartScreen.dart';
import 'package:kidseau/Widgets/widgets.dart';
import 'package:kidseau/choose_language_screen.dart';
import 'package:kidseau/shard_prefs/shared_prefs.dart';

class PSplashScreen extends StatefulWidget {
  @override
  _PSplashScreenState createState() => _PSplashScreenState();
}

class _PSplashScreenState extends State<PSplashScreen> {
  String _fcmToken = '';
  Future<void> initializeFirebaseService() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    String firebaseAppToken = await messaging.getToken(
          vapidKey:
              "BNS6eMFlYikBmzbB_Wy2O97R7aU4gL55FJpBQMXLIdmJv4ZN-i25wz8RvgQg4e34dLdpgM9fFbF7SWxJVhTMJ0E",
        ) ??
        '';

    /*if (AwesomeStringUtils.isNullOrEmpty(firebaseAppToken,
        considerWhiteSpaceAsEmpty: true)) return;*/

    if (!mounted) {
      _fcmToken = firebaseAppToken;
    } else {
      setState(() {
        _fcmToken = firebaseAppToken;
      });
    }

    print('Firebase token: $firebaseAppToken');
    /*var _prefs = await SharedPreferences.getInstance();
      _prefs.setString('fcmToken', firebaseAppToken);*/
    // UserPrefs.setFcm(_fcmToken);
    /*FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      if (!AwesomeStringUtils.isNullOrEmpty(message.notification?.title,
              considerWhiteSpaceAsEmpty: true) ||
          !AwesomeStringUtils.isNullOrEmpty(message.notification?.body,
              considerWhiteSpaceAsEmpty: true)) {
        print('Message also contained a notification: ${message.notification}');

        late String imageUrl;
        imageUrl = message.notification!.android!.imageUrl!;
        imageUrl = message.notification!.apple!.imageUrl!;

        Map<String, dynamic> notificationAdapter = {
          NOTIFICATION_CONTENT: {
            NOTIFICATION_ID: Random().nextInt(2147483647),
            NOTIFICATION_CHANNEL_KEY: 'basic_channel',
            NOTIFICATION_TITLE: message.notification!.title,
            NOTIFICATION_BODY: message.notification!.body,
          }
        };

        AwesomeNotifications()
            .createNotificationFromJsonData(notificationAdapter);
      } else {
        AwesomeNotifications().createNotificationFromJsonData(message.data);
      }
    });*/
    // NotificationAPI.get(uniqueId: _fcmToken.toString(), isLoggedIn: false);

    //TODO: Call notifications API
  }

  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => UserPrefs.getIsFirst() == null
                    ? ChooseLanguageScreen()
                    : PStartScreen())));
    initializeFirebaseService();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarBrightness: Brightness.light,
        ),
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        height: 1.sh,
        width: 1.sw,
        decoration: BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
                image: AssetImage("assets/images/splashbg.png"),
                fit: BoxFit.cover)),
        child: mainlogo(),
      ),
    );
  }
}
