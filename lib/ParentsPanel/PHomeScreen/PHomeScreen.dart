import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
import 'package:kidseau/ParentsPanel/KidsDashboard/KidsDashboard.dart';
import 'package:kidseau/ParentsPanel/PHomeScreen/PHomebody.dart';
import 'package:kidseau/ParentsPanel/PReminderScreen/PReminderScreen.dart';
import 'package:kidseau/Theme.dart';
import 'package:kidseau/shard_prefs/shared_prefs.dart';

import '../../restartappwidget/restartwidgets.dart';

class PHomeScreen extends StatefulWidget {
  PHomeScreen({Key? key}) : super(key: key);

  @override
  State<PHomeScreen> createState() => _PHomeScreenState();
}

class _PHomeScreenState extends State<PHomeScreen> {
  bool colorChange = false;
  bool Ezarabic = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xff8267AC).withOpacity(.06),
      ),
      child: Scaffold(
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
          backgroundColor: Color(0x2a8267ac),
          automaticallyImplyLeading: false,
          elevation: 0,
          title: Row(
            children: [
              GestureDetector(
                onTap: () {},
                child: Text("Good Morning".tr(),
                    style: FontConstant2.k32w5008267text),
              ),
            ],
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Row(
                children: [
                  Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: PopupMenuButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16)),
                          itemBuilder: (context) {
                            return [
                              PopupMenuItem(
                                enabled: true,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        UserPrefs.setEArbBool(false);
                                        context.locale = Locale('en', 'US');
                                        RestartWidget.restartApp(context);
                                        setState(() {
                                          colorChange;
                                        });
                                      },
                                      child: Row(
                                        children: [
                                          Text(
                                            ("English".tr()),
                                            style: colorChange
                                                ? FontConstant.k16w5008267Text
                                                : FontConstant.k18w5008471Text,
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 20),
                                    GestureDetector(
                                      onTap: () {
                                        UserPrefs.setEArbBool(false);
                                        context.locale = Locale('fr', 'FR');
                                        RestartWidget.restartApp(context);
                                        setState(() {
                                          colorChange;
                                        });
                                      },
                                      child: Row(
                                        children: [
                                          Text(
                                            ("French".tr()),
                                            style: colorChange
                                                ? FontConstant.k16w5008267Text
                                                : FontConstant.k18w5008471Text,
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 20),
                                    GestureDetector(
                                      onTap: () {
                                        UserPrefs.setEArbBool(true);
                                        context.locale = Locale('ar', 'AR');
                                        RestartWidget.restartApp(context);
                                        setState(() {
                                          colorChange;
                                        });
                                      },
                                      child: Row(
                                        children: [
                                          Text(
                                            ("Arabic".tr()),
                                            style: colorChange
                                                ? FontConstant.k16w5008267Text
                                                : FontConstant.k18w5008471Text,
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ];
                          },
                          child: Image.asset(
                            "assets/images/Languageicon.png",
                            height: 24,
                          ))),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => PReminderScreen(),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Image.asset(
                        "assets/images/clockicon.png",
                        height: 24,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 30),
              Column(
                children: [
                  Row(
                    //mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PKidsDashboard()),
                          );
                        },
                        child: Container(
                          height: 132,
                          width: MediaQuery.of(context).size.width * 0.98,
                          padding: EdgeInsets.only(left: 16),
                          child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(right: 15.0),
                                  child: Studentcard(),
                                );
                              },
                              itemCount: 3),
                        ),
                      ),
                      SizedBox(width: 5),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 15.h,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 16.0),
                        child: Text(
                          "Activity".tr(),
                          style: FontConstant2.baloothampifont,
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Activity(),
                      SizedBox(height: 10),
                      Center(
                        child: Text("See more".tr(),
                            style: FontConstant.k16w500purpleText.copyWith(
                              fontSize: 18,
                            )),
                      ),
                      SizedBox(height: 20.h),
                      Padding(
                        padding: EdgeInsets.only(left: 16.0),
                        child: Text(
                          "Tutorials".tr(),
                          style: FontConstant2.baloothampifont,
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                    ],
                  )
                ],
              ),
              Row(
                children: [
                  Expanded(child: Tutorials()),
                ],
              ),
              //Tutorials card
              SizedBox(
                height: 100.h,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Studentcard extends StatelessWidget {
  const Studentcard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 260.w,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
          image: AssetImage("assets/images/Student Card.png"),
          fit: BoxFit.fitWidth,
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
      child: Row(
        children: [
          Container(
            height: 96,
            width: 72,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/Rectangle 2715.png"))),
          ),
          SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 8,
              ),
              Text(
                "Nobite ",
                style: FontConstant.k16w500White,
              ),
              Text(
                "Nursery sec A",
                style: FontConstant.k14w400White,
              ),
              Text(
                "08:00 am to 01:00 pm",
                style: FontConstant.k12w400White,
              ),
              Text(
                "2nd rank".tr(),
                style: FontConstant.k12w400White,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
//
