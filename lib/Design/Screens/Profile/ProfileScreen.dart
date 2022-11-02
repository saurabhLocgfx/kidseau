import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kidseau/Design/Screens/Profile/ParentsProfile.dart';
import 'package:kidseau/Design/Screens/Profile/profilebody.dart';
import 'package:kidseau/Design/Screens/Profile/school.dart';
import 'package:kidseau/Theme.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
      height: 1006.h,
      width: 414.w,
      child: Scaffold(
        backgroundColor: Color(0xff8267AC).withOpacity(.06),
        extendBodyBehindAppBar: true,
        appBar: AppBar(
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
                  child: Text("Profile",
                      style: FontConstant2.k32w5008267text
                          .copyWith(fontSize: 28)))),
          actions: [profilepopup()],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(children: [
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
                          image:
                              AssetImage("assets/images/postsbackground.png"))),
                ),
                Column(
                  children: [
                    PageView(
                      controller: _pageController,
                      onPageChanged: (page) {
                        setState(
                          () {
                            pageIndex = page;
                          },
                        );
                      },
                      children: <Widget>[ParentsProfile(), School()],
                    ),
                  ],
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }

  Container PageviewTabProfile(
      imageone1, imageone2, text1, text2, imagetwo1, imagetwo2) {
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
                      child: Image.asset(pageIndex == 0 ? imageone1 : imageone2,
                          height: 24),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 4.0),
                    child: Text(text1,
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
                Text(text2,
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
                      child: Image.asset(pageIndex == 1 ? imagetwo1 : imagetwo2,
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
