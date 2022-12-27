import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kidseau/ParentsPanel/PProfileScreens/PParentProfile.dart';
import 'package:kidseau/ParentsPanel/PProfileScreens/PSchoolProfile.dart';
import 'package:kidseau/ParentsPanel/PProfileScreens/PSettings/PSettings.dart';
import 'package:kidseau/ParentsPanel/PProfileScreens/PSyllabus.dart';
import 'package:kidseau/Theme.dart';

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

  PageController _pageController = PageController(
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
          title: Padding(
              padding: const EdgeInsets.only(top: 0.0),
              child: GestureDetector(
                  onTap: () {
                    // Navigator.of(context).push(MaterialPageRoute(
                    //     builder: (context) => NotificationScreen()));
                  },
                  child: Text("Profile".tr(),
                      style: FontConstant2.k32w5008267text
                          .copyWith(fontSize: 28)))),
          actions: [Pprofilepopup()],
        ),
        body: SizedBox(
          width: 1.sw,
          height: 1.sh,
          child: Stack(children: [
            Container(
              child: Image.asset(
                "assets/images/postsbackground.png",
                height: 414.h,
                width: 1.sw,
                fit: BoxFit.fitWidth,
              ),
            ),
            Positioned(
              top: 100,
              left: 0,
              right: 0,
              bottom: 0,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    //SizedBox(height: 100.h),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [SizedBox(height: 40), Pageviewtabprofile()],
                    ),
                    SizedBox(height: 24.h),
                    SizedBox(
                      height: 1.sh,
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
                        children: <Widget>[PParentsProfile(), PSchoolProfile()],
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
                    child: Text("Parents".tr(),
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
                Text("School".tr(),
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
              child: Container(
                height: 210,
                width: 135,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
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
                      SizedBox(height: 20),
                      GestureDetector(
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
                      SizedBox(height: 20),
                      GestureDetector(
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
                    ],
                  ),
                ),
              ),
            ),
          ];
        });
  }
}
