import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kidseau/OnboardingScreens/onboardingscreen1.dart';
import 'package:kidseau/Theme.dart';
import 'package:kidseau/widgets.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff8267ac),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Image.asset("images/Artboard 1 1.png"),
            Container(
              height: Get.size.height * 0.30,
              width: Get.size.width,
              decoration: BoxDecoration(
                color: Colors.transparent,
              ),
              child: Image.asset(
                "assets/images/Artboard 1 1.png",
                fit: BoxFit.cover,
              ),
            ),
            Container(
              height: Get.size.height * 0.70,
              width: Get.size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: new BorderRadius.only(
                  topLeft: const Radius.circular(40.0),
                  topRight: const Radius.circular(40.0),
                ),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: Get.size.height * 0.10,
                  ),
                  Image.asset(
                    "assets/images/logo.png",
                    height: 130,
                    width: 120,
                  ),
                  SizedBox(
                    height: Get.size.height * 0.05,
                  ),
                  materialButton(context, () {}, "i'm a Teacher",
                      ThemeColor.primaryorange),
                  SizedBox(
                    height: Get.size.height * 0.02,
                  ),
                  materialButton(context, () {
                    Get.to(() => Onboarding1Screen());
                  }, "i'm a Parent", ThemeColor.primarycolor),
                  SizedBox(
                    height: Get.size.height * 0.18,
                  ),
                  //Image.asset("assets/images/Made with ❤️ Locgfx.png"),
                  Text(
                    'Made with ❤️ by Locgfx',
                    style: FontConstant.k16_400666666,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
