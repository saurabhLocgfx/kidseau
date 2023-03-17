import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kidseau/ParentsPanel/POnboardingScreens/PStartScreen.dart';
import 'package:kidseau/ParentsPanel/PProfileScreens/PParentProfile.dart';
import 'package:kidseau/ParentsPanel/PProfileScreens/PSettings/PSettings.dart';
import 'package:kidseau/ParentsPanel/PProfileScreens/PSyllabus.dart';
import 'package:kidseau/ParentsPanel/PProfileScreens/p_parent_nursery_widget.dart';
import 'package:kidseau/Theme.dart';
import 'package:kidseau/Widgets/custom_snack_bar.dart';
import 'package:kidseau/api/logout_api/logout_api.dart';
import 'package:kidseau/shard_prefs/shared_prefs.dart';

import 'PFees.dart';

class PProfileDashBoard extends StatefulWidget {
  const PProfileDashBoard({Key? key}) : super(key: key);

  @override
  State<PProfileDashBoard> createState() => _PProfileDashBoardState();
}

class _PProfileDashBoardState extends State<PProfileDashBoard> {
  final controller = PageController(initialPage: 1);

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  final PageController _pageController = PageController(
    initialPage: 0,
  );
  int pageIndex = 0;
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 896.h,
      //width: 414.w,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Color(0xffFFFFFF),
          Color(0xff8267AC).withOpacity(0.6),
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
      ),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          toolbarHeight: 70.0,
          flexibleSpace: ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                color: Colors.transparent,
              ),
            ),
          ),
          automaticallyImplyLeading: false,
          elevation: 0,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: ThemeColor.lightpurple.withOpacity(0.16),
          ),
          backgroundColor: Color(0xff8267AC).withOpacity(0.16),
          centerTitle: false,
          title: GestureDetector(
              onTap: () {
                // Navigator.of(context).push(MaterialPageRoute(
                //     builder: (context) => NotificationScreen()));
              },
              child: Text("Profile".tr(),
                  style:
                      FontConstant2.k32w5008267text.copyWith(fontSize: 32.sp))),
          actions: [Pprofilepopup()],
        ),
        body: SizedBox(
          width: 1.sw,
          height: 1.sh,
          child: Stack(children: [
            Image.asset(
              "assets/images/postsbackground.png",
              height: 414.h,
              width: 1.sw,
              fit: BoxFit.fitWidth,
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: 0,
              child: SizedBox(
                height: 1.sh,
                child: Column(
                  children: [
                    //SizedBox(height: 100.h),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [SizedBox(height: 112), Pageviewtabprofile()],
                    ),
                    SizedBox(height: 24.h),
                    Expanded(
                      child: PageView(
                        physics: PageScrollPhysics(),
                        controller: _pageController,
                        onPageChanged: (page) {
                          setState(
                            () {
                              pageIndex = page;
                            },
                          );
                        },
                        children: <Widget>[
                          PParentsProfile(),
                          PParentNurseryWidget()
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }

  Container Pageviewtabprofile() {
    return Container(
      height: 56,
      width: 250,
      padding: EdgeInsets.symmetric(horizontal: 2),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(76),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              selectedIndex = pageIndex = 0;
              _pageController.animateToPage(
                pageIndex,
                duration: Duration(milliseconds: 100),
                curve: Curves.linear,
              );
              pageIndex = 0;
              setState(() {});
            },
            child: Container(
              child: Row(
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(93),
                        color:
                            pageIndex == 0 ? Color(0xffEBE6F2) : Colors.white),
                    child: Center(
                      child: Image.asset(
                          pageIndex == 0
                              ? "assets/images/person2iconfill.png"
                              : "assets/images/person2icon.png",
                          height: 24),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 4.0),
                    child: Text("Parent".tr(),
                        style: FontConstant.k14w500B7A4Text.copyWith(
                            color: pageIndex == 0
                                ? Color(0xff8267AC)
                                : Color(0xffB7A4B2))),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: 10),
          GestureDetector(
            onTap: () {
              selectedIndex = pageIndex = 1;
              _pageController.animateToPage(
                pageIndex,
                duration: Duration(milliseconds: 100),
                curve: Curves.linear,
              );
              pageIndex = 1;
              setState(() {});
            },
            child: Row(
              children: [
                Text("Nursery".tr(),
                    style: FontConstant.k14w500B7A4Text.copyWith(
                        color: pageIndex == 1
                            ? Color(0xff8267AC)
                            : Color(0xffB7A4B2))),
                Padding(
                  padding: const EdgeInsets.only(left: 4.0),
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(93),
                        color:
                            pageIndex == 1 ? Color(0xffEBE6F2) : Colors.white),
                    child: Center(
                      child: Image.asset(
                          pageIndex == 1
                              ? "assets/images/schooliconfill.png"
                              : "assets/images/schoolicon.png",
                          height: 24),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class Pprofilepopup extends StatelessWidget {
  const Pprofilepopup({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        iconSize: 48,
        icon: ImageIcon(
          AssetImage(
            "assets/images/optionicon.png",
          ),
          color: ThemeColor.primarycolor,
        ),
        itemBuilder: (context) {
          return [
            PopupMenuItem(
              enabled: false,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => PSyllabus(),
                    ),
                  );
                },
                child: Row(
                  children: [
                    Image.asset(
                      "assets/images/syllabusicon.png",
                      height: 24,
                    ),
                    SizedBox(width: 15),
                    Text(
                      "Syllabus".tr(),
                      style: FontConstant.k18w5008471Text,
                    )
                  ],
                ),
              ),
            ),
            PopupMenuItem(
              enabled: false,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => PFees(),
                    ),
                  );
                },
                child: Row(
                  children: [
                    Image.asset(
                      "assets/images/feesicon.png",
                      height: 24,
                    ),
                    SizedBox(width: 15),
                    Text(
                      "Fees".tr(),
                      style: FontConstant.k18w5008471Text,
                    )
                  ],
                ),
              ),
            ),
            PopupMenuItem(
              enabled: false,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => PSettings(),
                    ),
                  );
                },
                child: Row(
                  children: [
                    Image.asset(
                      "assets/images/gearicon.png",
                      height: 24,
                    ),
                    SizedBox(width: 15),
                    Text(
                      "Settings".tr(),
                      style: FontConstant.k18w5008471Text,
                    )
                  ],
                ),
              ),
            ),
            PopupMenuItem(
              enabled: false,
              child: GestureDetector(
                onTap: () {
                  final resp = LogoutApi().get();
                  resp.then((value) {
                    if (value['status'] == 1) {
                      UserPrefs.clearData(UserPrefs.cookies);
                      UserPrefs.clearData(UserPrefs.Teacher);
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(builder: (ctx) => PStartScreen()),
                          (route) => false);
                      CustomSnackBar.customSnackBar(
                          context, 'Logged out successfully.');
                    } else {}
                  });
                },
                child: Row(
                  children: [
                    /*Image.asset(
                      "assets/images/gearicon.png",
                      height: 24,
                    )*/
                    Icon(
                      Icons.logout,
                      color: Color(0xff331F2D),
                    ),
                    SizedBox(width: 15),
                    Text(
                      "Logout".tr(),
                      style: FontConstant.k18w5008471Text,
                    )
                  ],
                ),
              ),
            ),
          ];
        });
  }
}
