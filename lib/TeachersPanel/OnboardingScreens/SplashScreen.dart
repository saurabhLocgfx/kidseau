import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kidseau/TeachersPanel/OnboardingScreens/TStartScreen.dart';
import 'package:kidseau/Widgets/widgets.dart';

class TSplashScreen extends StatefulWidget {
  @override
  _TSplashScreenState createState() => _TSplashScreenState();
}

class _TSplashScreenState extends State<TSplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => TStartScreen())));
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
