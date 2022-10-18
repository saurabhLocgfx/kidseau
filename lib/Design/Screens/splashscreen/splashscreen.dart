import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'splashscreenController.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GetBuilder(
      builder: (_) => Scaffold(
          body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
              child: Image.asset(
            "assets/images/logo.png",
            height: 173,
            width: 174,
          )),
        ],
      )),
      init: SplashController(),
    );
  }
}
