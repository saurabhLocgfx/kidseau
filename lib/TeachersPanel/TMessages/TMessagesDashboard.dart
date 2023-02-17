import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kidseau/TeachersPanel/TMessages/TMessages.dart';
import 'package:kidseau/TeachersPanel/TMessages/TParents.dart';
import 'package:kidseau/TeachersPanel/TNotificationScreen/TNotificationScreen.dart';
import 'package:kidseau/Theme.dart';
import 'package:kidseau/shard_prefs/shared_prefs.dart';

import '../../Constants/colors.dart';
import '../../ParentsPanel/PMessageScreen/PMessages.dart';
import '../../restartappwidget/restartwidgets.dart';
import '../TReminder/TReminderScreen.dart';

class TMessageDashboard extends StatefulWidget {
  const TMessageDashboard({Key? key}) : super(key: key);

  @override
  State<TMessageDashboard> createState() => _TMessageDashboardState();
}

class _TMessageDashboardState extends State<TMessageDashboard> {
  int selectedIndex = 0;
  bool colorChange = false;
  final controller = PageController(initialPage: 1);

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  final PageController _pageController = PageController(
    initialPage: 0,
  );
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 896.h,
      width: 414.w,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Color(0xffFFFFFF),
          Color(0xff8267AC).withOpacity(0.6),
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
      ),
      child: Scaffold(
        //backgroundColor: AppColors().bgColor,
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
          backgroundColor: Color(0xff8267AC).withAlpha(16),
          automaticallyImplyLeading: false,
          elevation: 0,
          title: Row(
            children: [
              GestureDetector(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Text("Messages".tr(),
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
                            child: Image.asset(
                              "assets/images/Languageicon.png",
                              height: 24,
                            ),
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
                            })),
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
                              builder: (context) => TNotificationScreen()),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
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
        body: SingleChildScrollView(
          //clipBehavior: Clip.none,
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [SizedBox(height: 40), PageviewTab()],
              ),
              SizedBox(height: 24.h),
              SizedBox(
                height: 1.sh,
                child: PageView(
                  controller: _pageController,
                  onPageChanged: (page) {
                    setState(
                      () {
                        pageIndex = page;
                      },
                    );
                  },
                  children: <Widget>[
                    TMessages(),
                    TParents(),
                  ],
                ),
              ),
              SizedBox(
                height: 100.h,
              )
            ],
          ),
        ),
      ),
    );
  }

  Container PageviewTab() {
    return Container(
      height: 56.h,
      width: 248.w,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(76),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
            },
            child: Row(
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(93),
                      color: pageIndex == 0 ? Color(0xffEBE6F2) : Colors.white),
                  child: Center(
                    child: Image.asset(
                        pageIndex == 0
                            ? "assets/images/messageiconfill.png"
                            : "assets/images/messageicon.png",
                        height: 24),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 4.0),
                  child: Text("Message".tr(),
                      style: FontConstant.k14w500B7A4Text.copyWith(
                          color: pageIndex == 0
                              ? Color(0xff8267AC)
                              : Color(0xffB7A4B2))),
                ),
              ],
            ),
          ),
          SizedBox(width: 10),
          GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = pageIndex = 1;
                _pageController.animateToPage(
                  pageIndex,
                  duration: Duration(milliseconds: 100),
                  curve: Curves.linear,
                );
                pageIndex = 1;
              });
            },
            child: Row(
              children: [
                Text("Parent".tr(),
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
                              ? "assets/images/pFilled.png"
                              : "assets/images/p.png",
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
// Container(
//   height: 56,
//   width: 248,
//   decoration: BoxDecoration(
//       color: Colors.white,
//       borderRadius: BorderRadius.circular(76)),
//   child: Container(
//     child: ListView.builder(
//         itemCount: items.length,
//         scrollDirection: Axis.horizontal,
//         itemBuilder: (ctx, index) {
//           return Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: GestureDetector(
//               onTap: () {
//                 setState(() {
//                   current = index;
//                 });
//               },
//               child: Container(
//                 height: 56,
//                 width: 108,
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     Row(
//                       children: [
//                         Stack(children: [
//                           Visibility(
//                             visible: current == index,
//                             child: Container(
//                               width: 40,
//                               height: 40,
//                               decoration: const BoxDecoration(
//                                   color: Color(0xffEBE6F2),
//                                   shape: BoxShape.circle),
//                             ),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Image.asset(
//                               imageicon[index],
//                               height: 24,
//                               width: 24,
//                               color: current == index
//                                   ? Color(0xff8267AC)
//                                   : Color(0xffB7A4B2),
//                             ),
//                           ),
//                         ]),
//                         SizedBox(width: 8),
//                         Text(
//                           items[index],
//                           style: TextStyle(
//                             fontWeight: FontWeight.w500,
//                             fontSize: 14,
//                             color: current == index
//                                 ? Color(0xff8267AC)
//                                 : Color(0xffB7A4B2),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           );
//         }),
//   ),
// ),
