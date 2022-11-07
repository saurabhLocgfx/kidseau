import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kidseau/ParentsPanel/POnboardingScreens/POnboardingScreen.dart';
import 'package:kidseau/Theme.dart';
import 'package:kidseau/Widgets/buttons.dart';
import 'package:kidseau/Widgets/widgets.dart';

import '../../TeachersPanel/OnboardingScreens/TOnboardingScreen.dart';

class PStartScreen extends StatelessWidget {
  const PStartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff8267ac),
      body: Column(
        children: [
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
          Expanded(
            child: Container(
              width: 414,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(24.0),
                  topRight: const Radius.circular(24.0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Column(
                  children: [
                    SizedBox(
                      height: 59,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 120, right: 120),
                      child: mainlogo(),
                    ),
                    SizedBox(
                      height: Get.size.height * 0.05,
                    ),
                    SizedBox(
                      height: 56,
                      width: 382,
                      child: MainButton(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => TOnboardingScreen()));
                          },
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
                                builder: (context) => POnboardingScreen()));
                          },
                          title: "i'm a Parent",
                          textStyleColor: Colors.white,
                          backgroundColor: ThemeColor.primarycolor),
                    ),
                    SizedBox(
                      height: Get.size.height * 0.18,
                    ),
                    //Image.asset("assets/images/Made with ❤️ Locgfx.png"),
                    Text(
                      'Made with ❤️ by Locgfx',
                      style: FontConstant.k16w400greyText,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
