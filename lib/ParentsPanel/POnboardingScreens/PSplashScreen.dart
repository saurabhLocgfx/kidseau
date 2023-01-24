import 'dart:async';

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
