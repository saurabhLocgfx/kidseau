import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kidseau/ParentsPanel/KidsDashboard/KidsOverview.dart';
import 'package:kidseau/ParentsPanel/KidsDashboard/Kidsgallery.dart';
import 'package:kidseau/Theme.dart';

class PKidsDashboard extends StatefulWidget {
  const PKidsDashboard({Key? key}) : super(key: key);

  @override
  State<PKidsDashboard> createState() => _PKidsDashboardState();
}

class _PKidsDashboardState extends State<PKidsDashboard> {
  List<String> imageicon = [
    "assets/images/iconprofile.png",
    "assets/images/galleryicon.png",
  ];

  List<String> _items = [
    "Overview",
    "Gallery",
  ];
  // final List screen = [Messagebody(),];
  //int selectedIndex = 0;

  final controller = PageController(initialPage: 1);

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  /* final PageController _pageController = PageController(
    initialPage: 0,
  );
*/
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xff8267AC).withOpacity(.06),
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
            statusBarColor: ThemeColor.lightpurple.withOpacity(0.06),
          ),
          backgroundColor: Color(0xff8267AC).withOpacity(0.06),
          centerTitle: false,
          leading: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Image.asset(
                    "assets/images/backarrow.png",
                    height: 24,
                    width: 24,
                  ),
                ),
              ),
            ],
          ),
          title: GestureDetector(
            onTap: () {},
            child: Text(
              "Kid’s Profile".tr(),
              style: FontConstant.k18w5008471Text,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                //height: 414.h,
                //width: 414.w,
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
                        opacity: 0.2,
                        image: AssetImage("assets/images/postsbackground.png"),
                        fit: BoxFit.fill)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: [
                      SizedBox(height: 110),
                      Row(
                        children: [
                          Container(
                            height: 128.h,
                            width: 96.w,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        "assets/images/profileperson.png"))),
                          ),
                          SizedBox(width: 24),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Nobita ",
                                style: FontConstant2.k32w500331Ftext,
                              ),
                              Text(
                                "S/O -  Akbar",
                                style: FontConstant.k16w5008471Text,
                              ),
                              Text("xyz@gmail.com",
                                  style: FontConstant.k16w5008471Text),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 40),
                      Pageviewtabprofile(),
                      SizedBox(height: 20),
                      pageIndex == 0 ? PKidsOverview() : PKidsGallery()
                      /* SizedBox(
                      height: 1350.h,
                      child: PageView(
                        controller: _pageController,
                        onPageChanged: (page) {
                          setState(
                            () {
                              pageIndex = page;
                            },
                          );
                        },
                        children: [],
                      ),
                    ),*/
                    ],
                  ),
                ),
              ),
            ],
          ),
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
              setState(() {
                pageIndex = 0;
              });
            },
            child: Container(
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        // selectedIndex = pageIndex = 0;
                        /* _pageController.animateToPage(
                          pageIndex,
                          duration: Duration(milliseconds: 100),
                          curve: Curves.linear,
                        );*/
                        pageIndex = 0;
                      });
                    },
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(93),
                          color: pageIndex == 0
                              ? Color(0xffEBE6F2)
                              : Colors.white),
                      child: Center(
                        child: Image.asset(
                            pageIndex == 0
                                ? "assets/images/profileiconfill.png"
                                : "assets/images/profileicon.png",
                            height: 24),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 4.0),
                    child: Text("Overview".tr(),
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
              setState(() {
                //selectedIndex = pageIndex = 1;
                /* _pageController.animateToPage(
                  pageIndex,
                  duration: Duration(milliseconds: 100),
                  curve: Curves.linear,
                );*/
                pageIndex = 1;
              });
            },
            child: Row(
              children: [
                Text("Gallery".tr(),
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
                              ? "assets/images/Galleryfill.png"
                              : "assets/images/galleryicon.png",
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
