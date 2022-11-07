import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kidseau/TeachersPanel/TNotificationScreen/TNotificationScreen.dart';
import 'package:kidseau/TeachersPanel/TPostsScreen/TPostsScreen.dart';
import 'package:kidseau/Theme.dart';

class TPostsDashBoard extends StatefulWidget {
  const TPostsDashBoard({Key? key}) : super(key: key);

  @override
  State<TPostsDashBoard> createState() => _TPostsDashBoardState();
}

class _TPostsDashBoardState extends State<TPostsDashBoard> {
  int selectedIndex = 0;

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
          padding: const EdgeInsets.only(top: 15.0),
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => TNotificationScreen()));
            },
            child: Text("Post",
                style: FontConstant.k32w5008267Text.copyWith(fontSize: 25)),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0, top: 15),
            child: Container(
              width: 124,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(
                    "assets/images/appbaricon1.png",
                    height: 48,
                  ),
                  Image.asset(
                    "assets/images/appbarclock.png",
                    height: 24,
                    width: 24,
                  ),
                  SizedBox(width: 2),
                  Image.asset(
                    "assets/images/iconbell.png",
                    height: 24,
                    width: 24,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Stack(children: [
            Container(
              height: 375,
              width: 414,
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
            Padding(
              padding: const EdgeInsets.only(top: 144.0),
              child: PostsTab(),
            ),
            PageView(
              controller: _pageController,
              onPageChanged: (page) {
                setState(
                  () {
                    pageIndex = page;
                  },
                );
              },
              children: <Widget>[
                TPostsScreen(),
                TPostsScreen(),
              ],
            ),
          ]),
        ],
      ),
    );
  }

  Container PostsTab() {
    return Container(
      height: 56.h,
      width: 372.w,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(76),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: () {
              selectedIndex = pageIndex;
              _pageController.animateToPage(
                pageIndex,
                duration: Duration(milliseconds: 100),
                curve: Curves.linear,
              );
              pageIndex = 0;
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
                              ? "assets/images/messageiconfill.png"
                              : "assets/images/messageicon.png",
                          height: 24),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 4.0),
                    child: Text("Message",
                        style: FontConstant.k14w500B7A4Text.copyWith(
                            color: pageIndex == 1
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
              setState(() {
                selectedIndex = pageIndex;
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
                Text("Teacher",
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
                              ? "assets/images/postsiconfill.png"
                              : "assets/images/Postsicon.png",
                          height: 24),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 10),
          GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = pageIndex;
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
                Text("Teacher",
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
                              ? "assets/images/Teachericonfill.png"
                              : "assets/images/Teachericon.png",
                          height: 24),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
