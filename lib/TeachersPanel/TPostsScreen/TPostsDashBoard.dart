import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kidseau/TeachersPanel/TPostsScreen/TMyPosts.dart';
import 'package:kidseau/TeachersPanel/TPostsScreen/TPostsScreen.dart';
import 'package:kidseau/TeachersPanel/TReminder/TReminderScreen.dart';
import 'package:kidseau/Theme.dart';
import 'package:kidseau/shard_prefs/shared_prefs.dart';

import '../../ParentsPanel/PNotificationScreen/PNotificationScreen.dart';
import '../../restartappwidget/restartwidgets.dart';
import 'TAddPostsScreen.dart';

class TPostsDashBoard extends StatefulWidget {
  final int? postIndex;
  const TPostsDashBoard({Key? key, this.postIndex = 0}) : super(key: key);

  @override
  State<TPostsDashBoard> createState() => _TPostsDashBoardState();
}

class _TPostsDashBoardState extends State<TPostsDashBoard> {
  int selectedIndex = 0;

  PageController controller = PageController(initialPage: 1);
  bool colorChange = false;
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    if (widget.postIndex != null) {
      _pageController = PageController(initialPage: widget.postIndex!);
      pageIndex = widget.postIndex!;
    } else {}
    super.initState();
  }

  PageController _pageController = PageController(
    initialPage: 0,
  );
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70.0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark,
        ),
        flexibleSpace: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              color: Colors.transparent,
            ),
          ),
        ),
        backgroundColor: Color(0xff8267AC).withAlpha(16),
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Row(
          children: [
            GestureDetector(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Text("Posts".tr(),
                    style:
                        FontConstant2.k32w5008267text.copyWith(fontSize: 25)),
              ),
            ),
          ],
        ),
        actions: [
          Container(
            width: 164,
            child: Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: PopupMenuButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16)),
                          itemBuilder: (context) {
                            return [
                              PopupMenuItem(
                                enabled: false,
                                child: GestureDetector(
                                  onTap: () {
                                    UserPrefs.setEArbBool(false);
                                    UserPrefs.setLang('English');
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
                              ),
                              PopupMenuItem(
                                enabled: false,
                                child: GestureDetector(
                                  onTap: () {
                                    UserPrefs.setEArbBool(false);
                                    UserPrefs.setLang('French');
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
                              ),
                              PopupMenuItem(
                                enabled: false,
                                child: GestureDetector(
                                  onTap: () {
                                    UserPrefs.setEArbBool(true);
                                    UserPrefs.setLang('Arabic');
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
                          builder: (_) => TReminderScreen(),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Image.asset(
                        "assets/images/clockicon.png",
                        height: 24,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PNotificationScreen()),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Image.asset(
                        "assets/images/iconbell.png",
                        height: 24,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      body: SizedBox(
        width: 1.sw,
        height: 1.sh,
        child: Stack(
          children: [
            Container(
              height: 375,
              width: 1.sw,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xffD9D9D9).withOpacity(.100),
                    Color(0xffD9D9D9).withOpacity(.0),
                  ],
                ),
                image: DecorationImage(
                    image: AssetImage(
                      "assets/images/postsbackground.png",
                    ),
                    fit: BoxFit.cover),
              ),
            ),
            Positioned(
              top: 20,
              left: 0,
              right: 0,
              bottom: 0,
              child: ListView(
                physics: NeverScrollableScrollPhysics(),
                children: [
                  Center(child: PostsTab()),
                  SizedBox(
                    height: 640,
                    child: PageView(
                      controller: _pageController,
                      onPageChanged: (page) {
                        setState(() {
                          pageIndex = page;
                        });
                      },
                      children: <Widget>[
                        TAddPostsScreen(
                          onPop: (val) {
                            setState(() {
                              pageIndex = val;
                              _pageController.jumpToPage(val);
                            });
                          },
                        ),
                        TPostsScreen(),
                        TMyPosts(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget PostsTab() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        height: 56,
        //width: 180.w,
        //margin: EdgeInsets.symmetric(horizontal: 20),
        padding: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(76),
        ),
        child: Row(
          children: [
            GestureDetector(
              onTap: () {
                selectedIndex = 0;
                pageIndex = 0;
                _pageController.jumpToPage(
                  pageIndex,
                );
              },
              child: Container(
                color: Colors.transparent,
                //width: 60.w,
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(93),
                          color: pageIndex == 0
                              ? Color(0xffEBE6F2)
                              : Colors.white),
                      child: Center(
                        child: Image.asset(
                            pageIndex == 0
                                ? "assets/images/addFil.png"
                                : "assets/images/gallery-add.png",
                            height: pageIndex == 0 ? 24 : 25),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 4.0),
                      child: SizedBox(
                        //width: 60.w,
                        child: Text("Add".tr(),
                            /* AppLoaclizations.of(context)!
                                .translate("Add")
                                .toString(),*/
                            overflow: TextOverflow.ellipsis,
                            style: FontConstant.k14w500B7A4Text.copyWith(
                                color: pageIndex == 0
                                    ? Color(0xff8267AC)
                                    : Color(0xffB7A4B2))),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(width: 16),
            GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = 1;
                  pageIndex = 1;
                  _pageController.jumpToPage(
                    pageIndex,
                  );
                });
              },
              child: Container(
                color: Colors.transparent,
                //width: 60.w,
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 4.0),
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(93),
                            color: pageIndex == 1
                                ? Color(0xffEBE6F2)
                                : Colors.white),
                        child: Center(
                          child: Image.asset(
                              pageIndex == 1
                                  ? "assets/images/postsiconfill.png"
                                  : "assets/images/Postsicon.png",
                              height: 24),
                        ),
                      ),
                    ),
                    SizedBox(width: 8),
                    SizedBox(
                      //width: 60.w,
                      child: Text("Posts".tr(),
                          /* AppLoaclizations.of(context)!
                              .translate("Posts")
                              .toString(),*/
                          overflow: TextOverflow.ellipsis,
                          style: FontConstant.k14w500B7A4Text.copyWith(
                              color: pageIndex == 1
                                  ? Color(0xff8267AC)
                                  : Color(0xffB7A4B2))),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(width: 16),
            GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = 2;
                  pageIndex = 2;
                  _pageController.jumpToPage(
                    pageIndex,
                  );
                });
              },
              child: Container(
                color: Colors.transparent,
                //width: 60.w,
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 4.0),
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(93),
                            color: pageIndex == 2
                                ? Color(0xffEBE6F2)
                                : Colors.white),
                        child: Center(
                          child: Image.asset(
                              pageIndex == 2
                                  ? "assets/images/galFil.png"
                                  : "assets/images/gal.png",
                              height: pageIndex == 2 ? 24 : 40),
                        ),
                      ),
                    ),
                    SizedBox(width: 8),
                    Text("My Posts".tr(),
                        /* AppLoaclizations.of(context)!
                            .translate("My Posts")
                            .toString(),*/
                        style: FontConstant.k14w500B7A4Text.copyWith(
                            color: pageIndex == 2
                                ? Color(0xff8267AC)
                                : Color(0xffB7A4B2))),
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
