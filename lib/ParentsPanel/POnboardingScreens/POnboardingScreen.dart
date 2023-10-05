import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kidseau/ParentsPanel/PLoginScreen/PLoginScreen.dart';
import 'package:kidseau/ParentsPanel/POnboardingScreens/POnboardingmodel.dart';
import 'package:kidseau/Theme.dart';
import 'package:kidseau/shard_prefs/shared_prefs.dart';

class POnboardingScreen extends StatefulWidget {
  const POnboardingScreen({Key? key}) : super(key: key);

  @override
  State<POnboardingScreen> createState() => _POnboardingScreenState();
}

class _POnboardingScreenState extends State<POnboardingScreen> {
  int currentIndex = 0;
  final controller = PageController(initialPage: 0);

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    ezarabic2 = UserPrefs.getArbBool() ?? false;

    log(UserPrefs.getCookies().toString());
    log(UserPrefs.getIsTeacher().toString());
    super.initState();
  }

  bool ezarabic2 = false;

  PageController _pageController = PageController(
    initialPage: 0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColor.primarycolor,
      body: SizedBox(
        width: 1.sw,
        height: 1.sh,
        child: Stack(
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 1.sh,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  //color: ThemeColor.primarycolor,
                  ),
              child: Image.asset(
                "assets/images/onbbg.png",
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: 1.sh / 4,
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                //width: Get.size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24.0),
                    topRight: Radius.circular(24.0),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      //color: Colors.orange,
                      height: 510.h,
                      child: PageView.builder(
                        controller: controller,
                        itemCount: Pcontents.length,
                        onPageChanged: (int index) {
                          setState(() {
                            currentIndex = index;
                          });
                        },
                        itemBuilder: (_, i) {
                          return SingleChildScrollView(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 30),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        height: 300.h,
                                        width: 350.w,
                                        child: Image.asset(
                                          Pcontents[i].image,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Spacer(),
                                  Text(Pcontents[i].title.tr(),
                                      style: FontConstant2.k26w500331FtextLine),
                                  SizedBox(
                                    width: 1.sw,
                                    child: Text(Pcontents[i].discription.tr(),
                                        maxLines: 2,
                                        style: FontConstant.k16w4008471Text),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    /*!ezarabic2
                        ? Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: 90,
                                height: 130.h,
                                child: InkWell(
                                  onTap: () {
                                    if (currentIndex == Pcontents.length - 1) {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (_) => PLoginScreen(),
                                        ),
                                      );
                                    }
                                    controller.nextPage(
                                      duration: Duration(milliseconds: 300),
                                      curve: Curves.fastOutSlowIn,
                                    );
                                  },
                                  child: Image.asset(
                                    "assets/images/onbarrow.png",
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 16, top: 10, bottom: 80),
                                child: Row(
                                  children: List.generate(
                                    Pcontents.length,
                                    (index) => buildDot(index, context),
                                  ),
                                ),
                              ),

                              */ /*Stack(
                          children: [

                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 80.0, left: 28),
                              child: MaterialButton(
                                minWidth: 25,
                                onPressed: () {
                                  if (currentIndex ==
                                      contents.length - 1) {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) =>
                                            TLoginScreen(),
                                      ),
                                    );
                                  }
                                  controller.nextPage(
                                    duration:
                                    Duration(milliseconds: 300),
                                    curve: Curves.fastOutSlowIn,
                                  );
                                },
                                child: Icon(
                                  Icons.arrow_forward,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),*/
                    /*
                            ],
                          )
                        : */
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 16, top: 10, bottom: 80),
                          child: Row(
                            children: List.generate(
                              Pcontents.length,
                              (index) => buildDot(index, context),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 90,
                          height: 130.h,
                          child: InkWell(
                            onTap: () {
                              if (currentIndex == Pcontents.length - 1) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => PLoginScreen(),
                                  ),
                                );
                              }
                              controller.nextPage(
                                duration: Duration(milliseconds: 300),
                                curve: Curves.fastOutSlowIn,
                              );
                            },
                            child: Image.asset(
                              "assets/images/onbarrow.png",
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),

                        /*Stack(
                          children: [

                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 80.0, left: 28),
                              child: MaterialButton(
                                minWidth: 25,
                                onPressed: () {
                                  if (currentIndex ==
                                      contents.length - 1) {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) =>
                                            TLoginScreen(),
                                      ),
                                    );
                                  }
                                  controller.nextPage(
                                    duration:
                                    Duration(milliseconds: 300),
                                    curve: Curves.fastOutSlowIn,
                                  );
                                },
                                child: Icon(
                                  Icons.arrow_forward,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),*/
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 4,
      width: currentIndex == index ? 20 : 9,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: currentIndex == index
              ? Color(0xffF0AD56)
              : Color(0xffF0AD56).withOpacity(.40)),
    );
  }
}
