import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kidseau/ParentsPanel/PHomeScreen/PHomebody.dart';
import 'package:kidseau/TeachersPanel/THomeScreen/TGroupScreen.dart';
import 'package:kidseau/TeachersPanel/TNotificationScreen/TNotificationScreen.dart';
import 'package:kidseau/Theme.dart';
import 'package:kidseau/Widgets/THomeScreenWidgets/t_activity.dart';

import '../TReminder/TReminderScreen.dart';
import 'TAttendanceScreen.dart';
import 'TScheduleScreen.dart';

class THomeScreen extends StatefulWidget {
  const THomeScreen({Key? key}) : super(key: key);

  @override
  State<THomeScreen> createState() => _THomeScreenState();
}

class _THomeScreenState extends State<THomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Text("Good Morning",
                  style:
                      FontConstant2.k32w5008267text.copyWith(fontSize: 25)),
            ),
          ],
        ),
        actions: [
          SizedBox(
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
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => TReminderScreen(),
                        ),
                      );
                    },
                    child: Image.asset(
                      "assets/images/clockicon.png",
                      height: 24,
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
          width: 1.sw,
          decoration: BoxDecoration(
            color: Color(0xff8267AC).withOpacity(.06),
          ),
          child: Column(
            children: [
              SizedBox(
                height: 150.h,
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
              Padding(child: TActivity(), padding: EdgeInsets.symmetric(horizontal: 16),),
              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ScheduleScreen(),
                      ),
                    );
                  },
                  child: Container(
                    color: Colors.transparent,
                    padding: EdgeInsets.all(5),
                    child: Text("See more",
                        style: FontConstant.k16w500purpleText.copyWith(
                          fontSize: 18,
                        )),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, bottom: 10),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Attendance",
                    style: FontConstant2.baloothampifont,
                  ),
                ),
              ),
              SizedBox(
                height: 120.h,
                child: ListView.separated(
                  shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index)=> GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TAttendanceScreen()),
                    );
                  },
                  child: Attendancecard(
                    image: "assets/images/groupcard2.png",
                  ),
                ), separatorBuilder: (ctx, ind) => SizedBox(width: 10.w,), itemCount: 3),
              ),

              SizedBox(height: 80.h)
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
      width: 283,
      margin: EdgeInsets.only(top: 16, bottom: 16, left: 16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.transparent,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 0),
            color: ThemeColor.primarycolor.withOpacity(0.4),
            spreadRadius: 0,
            blurRadius: 16,
          ),
        ],
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
          image: AssetImage(
            "assets/images/gc.png",
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
            ),
            clipBehavior: Clip.hardEdge,
            width: 72,
            height: 96,
            child: Image.asset(
              "assets/images/groupimage1.png",
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Group A",
                style: FontConstant.k18w500whiteText,
              ),
              Text(
                "Nursery",
                style: FontConstant.k18w500whiteText.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
              Text(
                "24 Students",
                style: FontConstant.k18w500whiteText.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SchoolCard extends StatelessWidget {
  const SchoolCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 128,
      width: 1.sw,
      margin: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/scard.png'),
          fit: BoxFit.fill,
        ),
        color: Colors.transparent,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 0),
            color: ThemeColor.primarycolor.withOpacity(0.4),
            spreadRadius: 0,
            blurRadius: 16,
          ),
        ],
        borderRadius: BorderRadius.circular(16),
      ),
      padding: EdgeInsets.only(left: 16.0, right: 16, top: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 96,
            width: 72,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/groupimage.png"))),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "ABC School",
                  style: FontConstant2.k18w500Black,
                ),
                Row(
                  children: [
                    SizedBox(
                        width: 20,
                        child: Image.asset(
                          'assets/images/clockicon.png',
                          color: Color(0xFFB7A4B2),
                        )),
                    SizedBox(width: 8),
                    Text(
                      "08:00 am to 02:00 pm",
                      style: FontConstant.k18w500whiteText.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFFB7A4B2),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                        width: 20,
                        child: Image.asset(
                          'assets/images/call.png',
                          color: Color(0xFFB7A4B2),
                        )),
                    SizedBox(width: 8),
                    Text(
                      "9876543210",
                      style: FontConstant.k18w500whiteText.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFFB7A4B2),
                      ),
                    ),
                  ],
                ),
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
      width: 350.w,
      margin: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/ac.png'),
          fit: BoxFit.fill,
        ),
        color: Colors.transparent,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 0),
            color: ThemeColor.primarycolor.withOpacity(0.4),
            spreadRadius: 0,
            blurRadius: 16,
          ),
        ],
        borderRadius: BorderRadius.circular(16),
      ),
      padding: EdgeInsets.only(left: 16.0, right: 16, top: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 96,
            width: 72,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/groupimage.png"))),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Group A",
                  style: FontConstant.k18w500whiteText,
                ),
                Text(
                  "Nursery",
                  style: FontConstant.k18w500whiteText.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
                /*Text("08:00 am to 01:00 pm",
                    style: FontConstant.k18w500whiteText.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.white.withOpacity(0.5))),*/
                Text(
                  "24 Students",
                  style: FontConstant.k18w500whiteText.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Text('51 ', style: FontConstant2.k24w500WhiteText),
              Text('present', style: FontConstant.k16w400whiteText),
            ],
          ),
        ],
      ),
    );
  }
}
