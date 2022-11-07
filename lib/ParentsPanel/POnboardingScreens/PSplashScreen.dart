import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kidseau/ParentsPanel/POnboardingScreens/PStartScreen.dart';
import 'package:kidseau/Widgets/widgets.dart';

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
            context, MaterialPageRoute(builder: (context) => PStartScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 896.h,
      width: 414.w,
      decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
              image: AssetImage("assets/images/splashbackground.png"))),
      child: mainlogo(),
    );
  }
}
