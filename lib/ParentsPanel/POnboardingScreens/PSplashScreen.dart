import 'dart:async';
import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kidseau/ParentsPanel/POnboardingScreens/PStartScreen.dart';
import 'package:kidseau/Widgets/widgets.dart';
import 'package:kidseau/api/user_login.dart';
import 'package:kidseau/choose_language_screen.dart';
import 'package:kidseau/shard_prefs/shared_prefs.dart';

import '../../TeachersPanel/TDashboard.dart';
import '../../Widgets/THomeScreenWidgets/no_internet.dart';
import '../../restartappwidget/restartwidgets.dart';
import '../PDashBoard.dart';

class PSplashScreen extends StatefulWidget {
  @override
  _PSplashScreenState createState() => _PSplashScreenState();
}

class _PSplashScreenState extends State<PSplashScreen> {
  String _fcmToken = '';
  ConnectivityResult _connectionStatus = ConnectivityResult.none;
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  Future<void> initConnectivity() async {
    late ConnectivityResult result;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      log('Couldn\'t check connectivity status', error: e);
      return;
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) {
      return Future.value(null);
    }

    return _updateConnectionStatus(result);
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    if (mounted) {
      setState(() {
        _connectionStatus = result;
      });
    }
  }

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
    //TODO: Call notifications API
  }

  getRoute() {
    print(_connectionStatus);
    if ((_connectionStatus != ConnectivityResult.none)) {
      if (UserPrefs.getIsFirst() == null) {
        log('cookie null 1');
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => ChooseLanguageScreen()));
        //return ChooseLanguageScreen();
        //
      } else {
        log('cookie not null');
        if (UserPrefs.getIsTeacher() == null) {
          log('teacher null');
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => PStartScreen()));
          //return PStartScreen();
        } else if (UserPrefs.getIsTeacher() == true) {
          log('teacher true');
          final resp = UserLogin().get();
          resp.then((value) {
            if (value['status'] == 1) {
              UserPrefs.setCookies(value['key']);
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => TDashboard()));
            } else {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => PStartScreen()));
            }
          });
        } else if (UserPrefs.getIsTeacher() == false) {
          log('teacher false');
          final resp = UserLogin().get();
          resp.then((value) {
            log("parent login $value");
            if (value['status'] == 1) {
              UserPrefs.setCookies(value['key']);
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => PDashboard()));
            } else {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => PStartScreen()));
            }
          });
        } else {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => PStartScreen()));
        }
      }
    } else {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => NoInternet(
                    onRetryTap: () {
                      Connectivity().checkConnectivity();
                      RestartWidget.restartApp(context);
                    },
                  )));
      // return NoInternet(
      //   onRetryTap: () {
      //     Connectivity().checkConnectivity();
      //     RestartWidget.restartApp(context);
      //   },
      // );
    }
    /*return NoInternet(
      onRetryTap: () {
        Connectivity().checkConnectivity();
      },
    );*/
  }

  @override
  void initState() {
    super.initState();
    initConnectivity();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
    Timer(Duration(seconds: 4), () => getRoute());
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
