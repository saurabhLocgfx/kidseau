import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kidseau/Design/Screens/OnboardingScreens/onboardingscreen1.dart';
import 'package:kidseau/Theme.dart';
import 'package:kidseau/Widgets/buttons.dart';
import 'package:kidseau/Widgets/widgets.dart';

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
              height: 229,
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
              height: 667,
              width: 414,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: new BorderRadius.only(
                  topLeft: const Radius.circular(24.0),
                  topRight: const Radius.circular(24.0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 59,
                    ),
                    mainlogo(),
                    SizedBox(
                      height: Get.size.height * 0.05,
                    ),
                    SizedBox(
                      height: 56,
                      width: 382,
                      child: MainButton(
                          onTap: () {},
                          title: "i'm a Teacher",
                          textStyleColor: Colors.white,
                          backgroundColor: ThemeColor.primaryorange),
                    ),
                    SizedBox(
                      height: Get.size.height * 0.02,
                    ),
                    SizedBox(
                      height: 56,
                      width: 382,
                      child: MainButton(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Onboarding1Screen()));
                          },
                          title: "i'm a Parent",
                          textStyleColor: Colors.white,
                          backgroundColor: ThemeColor.primarycolor),
                    ),
                    SizedBox(
                      height: Get.size.height * 0.18,
                    ),
                    Image.asset("assets/images/Made with ❤️ Locgfx.png")
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
