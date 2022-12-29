import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kidseau/ParentsPanel/PReminderScreen/PReminderScreen.dart';
import 'package:kidseau/Theme.dart';
import 'package:kidseau/restartappwidget/restartwidgets.dart';
import 'package:kidseau/shard_prefs/shared_prefs.dart';

class PPostScreen extends StatefulWidget {
  const PPostScreen({Key? key}) : super(key: key);

  @override
  State<PPostScreen> createState() => _PPostScreenState();
}

class _PPostScreenState extends State<PPostScreen> {
  bool colorChange = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        title: Padding(
          padding: const EdgeInsets.only(top: 0.0),
          child: GestureDetector(
            onTap: () {
              // Navigator.of(context).push(MaterialPageRoute(
              //     builder: (context) => NotificationScreen()));
            },
            child: Text("Posts".tr(),
                style: FontConstant.k32w5008267Text.copyWith(fontSize: 25)),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Row(
              children: [
                Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: PopupMenuButton(
                        child: Image.asset(
                          "assets/images/Languageicon.png",
                          height: 24,
                        ),
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
                                          ("English"),
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
                                      // Navigator.of(context).push(
                                      //   MaterialPageRoute(
                                      //     builder: (context) => Fees(),
                                      //   ),
                                      // );
                                    },
                                    child: Row(
                                      children: [
                                        Text(
                                          ("French"),
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
                                      /* Navigator.pop(context);
                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  TSettings(),
                                            ),
                                          );*/
                                    },
                                    child: Row(
                                      children: [
                                        Text(
                                          ("Arabic"),
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
                        })),
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
                /*GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => PReminderScreen(),
                        ),
                      );
                    },
                    child: Image.asset(
                      "assets/images/appbarclock.png",
                      height: 24,
                      width: 24,
                    ),
                  ),*/
              ],
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              // height: 375,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xffF8F6FA).withOpacity(.100),
                    Color(0xffF8F6FA).withOpacity(.0),
                  ],
                ),
                // image: DecorationImage(
                //     image: AssetImage(
                //       "assets/images/postsbackground.png",
                //     ),
                //     fit: BoxFit.cover),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 144,
                  ),
                  Image.asset(
                    "assets/images/School.png",
                    height: 40,
                    width: 40,
                  ),
                  SizedBox(height: 13),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/arrleft.png",
                        height: 24,
                        width: 24,
                      ),
                      SizedBox(width: 18),
                      Text(
                        "Abc School",
                        style: FontConstant2.k24w5008267text,
                      ),
                      SizedBox(width: 18),
                      Image.asset(
                        "assets/images/arrright.png",
                        height: 24,
                        width: 24,
                      ),
                    ],
                  ),
                  SizedBox(height: 38),
                  Container(
                    height: 5,
                    width: 1.sw,
                    color: Colors.white,
                  ),
                  Container(
                    width: 1.sw,
                    color: Colors.white.withOpacity(0.0),
                    child: MediaQuery.removePadding(
                      removeTop: true,
                      context: context,
                      child: ListView.builder(
                          itemCount: 3,
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, i) {
                            return Column(
                              children: [
                                Container(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 16,
                                        right: 16,
                                        top: 5,
                                        bottom: 15),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Image.asset(
                                                  "assets/images/person2.png",
                                                  height: 40,
                                                  width: 40,
                                                ),
                                                SizedBox(
                                                  width: 08,
                                                ),
                                                Text(
                                                  "Mohammad Umar",
                                                  style: FontConstant2
                                                      .k16w5008267text,
                                                ),
                                              ],
                                            ),
                                            Image.asset(
                                              "assets/images/dots.png",
                                              height: 40,
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 08),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Text(
                                                "Today we had small music activity with all kids and teachers. ",
                                                style: FontConstant
                                                    .k16w4008471Text,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Expanded(
                                                child: Image.asset(
                                                    "assets/images/childrenposts.png")),
                                            /* Container(
                          height: 213.h,
                          width: 379.w,
                          decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              "assets/images/childrenposts.png"))),
                        ),*/
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 8.0, right: 8),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  Image.asset(
                                                    "assets/images/heart2.png",
                                                    height: 24,
                                                  ),
                                                  SizedBox(width: 10),
                                                  Text(
                                                    "likes".tr(),
                                                    /*AppLoaclizations.of(context)!
                                            .translate("likes")
                                            .toString(),*/
                                                    style: FontConstant
                                                        .k16w4008471Text,
                                                  ),
                                                ],
                                              ),
                                              Text("2 min ago",
                                                  style: FontConstant
                                                      .k16w4008471Text
                                                      .copyWith(fontSize: 14))
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 5,
                                  width: 1.sw,
                                  color: Colors.white,
                                ),
                              ],
                            );
                          }),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            /*Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16),
              child: Column(
                children: [
                  */ /* SizedBox(
                    height: 144,
                  ),
                  Image.asset(
                    "assets/images/School.png",
                    height: 40,
                    width: 40,
                  ),
                  SizedBox(height: 13),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/arrleft.png",
                        height: 24,
                        width: 24,
                      ),
                      SizedBox(width: 18),
                      Text(
                        "Abc School",
                        style: FontConstant2.k24w5008267text,
                      ),
                      SizedBox(width: 18),
                      Image.asset(
                        "assets/images/arrright.png",
                        height: 24,
                        width: 24,
                      ),
                    ],
                  ),*/ /*
                  SizedBox(height: 38),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            "assets/images/person2.png",
                            height: 40,
                            width: 40,
                          ),
                          SizedBox(
                            width: 08,
                          ),
                          Text(
                            "Mohammad Umar",
                            style: FontConstant2.k16w5008267text,
                          ),
                        ],
                      ),
                      Image.asset(
                        "assets/images/dots.png",
                        height: 40,
                      ),
                    ],
                  ),
                  SizedBox(height: 08),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          "Today we had small music activity with all kids and teachers. ",
                          style: FontConstant.k16w4008471Text,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                          child:
                              Image.asset("assets/images/childrenposts.png")),
                      */ /* Container(
                          height: 213.h,
                          width: 379.w,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      "assets/images/childrenposts.png"))),
                        ),*/ /*
                    ],
                  ),
                  SizedBox(
                    height: 16.5,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              "assets/images/heart2.png",
                              height: 24,
                            ),
                            SizedBox(width: 10),
                            Text(
                              "likes".tr(),
                              */ /*AppLoaclizations.of(context)!
                                    .translate("likes")
                                    .toString(),*/ /*
                              style: FontConstant.k16w4008471Text,
                            ),
                          ],
                        ),
                        Text("2 min ago",
                            style: FontConstant.k16w4008471Text
                                .copyWith(fontSize: 14))
                      ],
                    ),
                  )
                ],
              ),
            ),*/
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
