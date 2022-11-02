import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kidseau/Design/Screens/HomeScreen/homesubpages/Kidsection/kidsgallery.dart';
import 'package:kidseau/Design/Screens/HomeScreen/homesubpages/Kidsection/kidsprofileoverview.dart';
import 'package:kidseau/Theme.dart';

class Kidsoverviewandgallery extends StatefulWidget {
  const Kidsoverviewandgallery({Key? key}) : super(key: key);

  @override
  State<Kidsoverviewandgallery> createState() => _KidsoverviewandgalleryState();
}

class _KidsoverviewandgalleryState extends State<Kidsoverviewandgallery> {
  List<String> imageicon = [
    "assets/images/iconprofile.png",
    "assets/images/galleryicon.png",
  ];

  List<String> items = [
    "Overview",
    "Gallery",
  ];
  // final List screen = [Messagebody(),];
  int current = 0;

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
    return Container(
      decoration: BoxDecoration(
        color: Color(0xff8267AC).withOpacity(.06),
      ),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
            automaticallyImplyLeading: false,
            elevation: 0,
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: ThemeColor.lightpurple.withOpacity(0.06),
            ),
            backgroundColor: Color(0xff8267AC).withOpacity(0.06),
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
            title: Padding(
                padding: const EdgeInsets.only(top: 0.0),
                child: GestureDetector(
                    onTap: () {},
                    child: Text("Kid’s Profile",
                        style: FontConstant.k18w5008471Text)))),
        body: Stack(
          children: [
            Container(
              height: 414.h,
              width: 414.w,
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
                      image: AssetImage("assets/images/postsbackground.png"))),
            ),
            Padding(
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
                            "Nobita",
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
                  Expanded(
                    child: PageView(
                      controller: _pageController,
                      onPageChanged: (page) {
                        setState(
                          () {
                            pageIndex = page;
                          },
                        );
                      },
                      children: [KidsProfileOverview(), KidsGallery()],
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
                              ? "assets/images/profileiconfill.png"
                              : "assets/images/profileicon.png",
                          height: 24),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 4.0),
                    child: Text("Message",
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
