import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kidseau/ParentsPanel/PHomeScreen/PHomeScreen.dart';
import 'package:kidseau/TeachersPanel/THomeScreen/TAttendanceScreen.dart';
import 'package:kidseau/Theme.dart';

class TActivityScreen extends StatefulWidget {
  const TActivityScreen({Key? key}) : super(key: key);

  @override
  State<TActivityScreen> createState() => _TActivityScreenState();
}

class _TActivityScreenState extends State<TActivityScreen> {
  // bool _flag = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Scaffold(
        backgroundColor: ThemeColor.lightpurple.withOpacity(0.06),
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
          backgroundColor: ThemeColor.lightpurple.withOpacity(0.16),
          title: Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Image.asset(
                  "assets/images/arrow-left.png",
                  height: 24,
                  width: 24,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 17.93),
                child: Text("Activity".tr(),
                    /*AppLoaclizations.of(context)!
                        .translate("Activity")
                        .toString(),*/
                    style: FontConstant.k14w400lightpurpleText.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff84717F))),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                SizedBox(height: 20.h),
                Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    "Learning Alphabets".tr(),
                    /* AppLoaclizations.of(context)!
                        .translate("Learning Alphabets")
                        .toString(),*/
                    style: FontConstant.k16w500brownText.copyWith(fontSize: 32),
                  ),
                ),
                Column(
                  children: [
                    Container(
                      height: 286,
                      width: 382,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          image: DecorationImage(
                              image: AssetImage(
                                  "assets/images/Rectangle for la.png"))),
                    ),
                    Row(
                      children: [
                        Image.asset(
                          "assets/images/clock.png",
                          height: 20,
                          width: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 06.0),
                          child: Text("09:00am to 11:00am",
                              style: FontConstant.k14w400lightpurpleText
                                  .copyWith(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500)),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 24),
                Text(
                    "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit. Exercitation veniam consequat sunt nostrud amet. Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit. Exercitation veniam consequat sunt nostrud.",
                    style: FontConstant.k14w400lightpurpleText
                        .copyWith(fontWeight: FontWeight.w400, fontSize: 18)),
                SizedBox(height: 30),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Weak students".tr(),
                      /*AppLoaclizations.of(context)!
                          .translate("Weak students")
                          .toString(),*/
                      style: FontConstant2.baloothampifont,
                    )),
                SizedBox(height: 10),
                ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 5,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TAttendanceScreen(attendanceId: '',)),
                            );
                          },
                          child: SizedBox(
                              height: 128, width: 382, child: Studentcard()),
                        ),
                      );
                    }),
                SizedBox(height: 40.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TeacherCard extends StatelessWidget {
  const TeacherCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 128,
      width: 382,
      decoration: BoxDecoration(
          image: DecorationImage(
              image:
                  AssetImage("assets/images/Teacher card leaarning ap.png"))),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Container(
              height: 96,
              width: 72,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                image: DecorationImage(
                    image: AssetImage("assets/images/leaning alp person.png")),
              ),
            ),
            SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Mohammad Umar",
                  style: FontConstant.k18w500whiteText,
                ),
                Text("Class teacher",
                    style: FontConstant.k18w500whiteText.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.white.withOpacity(0.6),
                    )),
                Text("Class teacher",
                    style: FontConstant.k18w500whiteText.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.white.withOpacity(0.74),
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
