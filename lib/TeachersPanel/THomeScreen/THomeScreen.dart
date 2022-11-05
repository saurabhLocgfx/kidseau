import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kidseau/ParentsPanel/PHomeScreen/PHomebody.dart';
import 'package:kidseau/TeachersPanel/THomeScreen/TGroupScreen.dart';
import 'package:kidseau/TeachersPanel/TNotificationScreen/TNotificationScreen.dart';
import 'package:kidseau/Theme.dart';

class THomeScreen extends StatefulWidget {
  const THomeScreen({Key? key}) : super(key: key);

  @override
  State<THomeScreen> createState() => _THomeScreenState();
}

class _THomeScreenState extends State<THomeScreen> {
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
        backgroundColor: Color(0xff8267AC).withAlpha(16),
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Row(
          children: [
            GestureDetector(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Text("Good Morning",
                    style:
                        FontConstant2.k32w5008267text.copyWith(fontSize: 25)),
              ),
            ),
          ],
        ),
        actions: [
          Container(
            width: 144,
            child: Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(
                    "assets/images/Languageicon.png",
                    height: 24,
                  ),
                  Image.asset(
                    "assets/images/clockicon.png",
                    height: 24,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TNotificationScreen()),
                      );
                    },
                    child: Image.asset(
                      "assets/images/iconbell.png",
                      height: 24,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          width: 414,
          decoration: BoxDecoration(
            color: Color(0xff8267AC).withOpacity(.06),
          ),
          child: Column(
            children: [
              SizedBox(height: 100.h),
              Container(
                height: 128,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TGroupScreen()),
                          );
                        },
                        child: Groupcard());
                  },
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Schedule",
                    style: FontConstant2.baloothampifont,
                  ),
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              Activity(),
              Center(
                child: Text("see more",
                    style: FontConstant.k16w500purpleText.copyWith(
                      fontSize: 18,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Attendance",
                    style: FontConstant2.baloothampifont,
                  ),
                ),
              ),
              Attendancecard(
                image: "assets/images/groupcard2.png",
              ),
              SizedBox(height: 70.h)
            ],
          ),
        ),
      ),
    );
  }
}

class Groupcard extends StatelessWidget {
  const Groupcard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      width: 283,
      decoration: BoxDecoration(
          color: Colors.transparent,
          boxShadow: [
            BoxShadow(
                offset: Offset(-1, -1),
                color: ThemeColor.primarycolor.withOpacity(0.09),
                spreadRadius: 1,
                blurRadius: 10)
          ],
          borderRadius: BorderRadius.circular(16),
          image: DecorationImage(
              image: AssetImage(
                "assets/images/groupcard1.png",
              ),
              fit: BoxFit.cover)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 96,
            width: 72,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/groupimage1.png"))),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Nobite",
                  style: FontConstant.k18w500whiteText,
                ),
                Text("Nursary sec A",
                    style: FontConstant.k18w500whiteText.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.white.withOpacity(0.5))),
                Text("08:00 am to 01:00 pm",
                    style: FontConstant.k18w500whiteText.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.white.withOpacity(0.5))),
                Text("2nd rank",
                    style: FontConstant.k18w500whiteText.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.white.withOpacity(0.5))),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Attendancecard extends StatelessWidget {
  final String image;
  const Attendancecard({
    Key? key,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 128,
      width: 382,
      decoration: BoxDecoration(
          color: Colors.transparent,
          boxShadow: [
            BoxShadow(
                offset: Offset(1, 1),
                color: ThemeColor.primarycolor.withOpacity(0.09),
                spreadRadius: 1,
                blurRadius: 40)
          ],
          borderRadius: BorderRadius.circular(16),
          image: DecorationImage(
              image: AssetImage(
                image,
              ),
              fit: BoxFit.cover)),
      child: Padding(
        padding: const EdgeInsets.only(left: 30.0),
        child: Row(
          children: [
            Container(
              height: 76,
              width: 72,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/groupimage.png"))),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Nobite",
                    style: FontConstant.k18w500whiteText,
                  ),
                  Text("Nursary sec A",
                      style: FontConstant.k18w500whiteText.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.white.withOpacity(0.5))),
                  Text("08:00 am to 01:00 pm",
                      style: FontConstant.k18w500whiteText.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.white.withOpacity(0.5))),
                  Text("2nd rank",
                      style: FontConstant.k18w500whiteText.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.white.withOpacity(0.5))),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
