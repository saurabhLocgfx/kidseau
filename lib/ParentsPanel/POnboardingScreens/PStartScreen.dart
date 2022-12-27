import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
      body: SizedBox(
        width: 1.sw,
        height: 1.sh,
        child: Stack(
          children: [
            Container(
              height: 1.sh,
              width: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                color: Colors.transparent,
              ),
              child: Image.asset(
                "assets/images/onbbg.png",
                fit: BoxFit.cover,
              ),
            ),
            /*Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  color: Colors.white,
                  width: 1.sw,
                  height: 200.h,
                )),*/
            Positioned(
              top: 1.sh / 4,
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                height: 1.sh / 4,
                child: Container(
                  //width: 414.w,
                  //height: 1.sh,
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
                          height: 59.h,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 120, right: 120),
                          child: mainlogo(),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.05,
                        ),
                        Row(
                          children: [
                            Expanded(
                              // width: 382,
                              child: SizedBox(
                                height: 56,
                                child: MainButton(
                                    onTap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  TOnboardingScreen()));
                                    },
                                    title: "i'm a Teacher".tr(),
                                    textStyleColor: Colors.white,
                                    backgroundColor: ThemeColor.primaryorange),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: SizedBox(
                                height: 56,
                                //width: 382,
                                child: MainButton(
                                    onTap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  POnboardingScreen()));
                                    },
                                    title: "i'm a Parent".tr(),
                                    textStyleColor: Colors.white,
                                    backgroundColor: ThemeColor.primarycolor),
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                        /*SizedBox(
                          height: 150,
                        ),*/
                        /*SizedBox(
                          height: Get.size.height * 0.18,
                        ),*/
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
            ),
          ],
        ),
      ),
    );
  }
}
