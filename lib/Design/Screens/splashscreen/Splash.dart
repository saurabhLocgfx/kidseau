import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kidseau/Design/Screens/StartScreen/startscreen.dart';
import 'package:kidseau/Widgets/widgets.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => StartScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.white, child: mainlogo());
  }
}
