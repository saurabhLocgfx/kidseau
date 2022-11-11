import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kidseau/ParentsPanel/KidsDashboard/KidsDashboard.dart';
import 'package:kidseau/ParentsPanel/PHomeScreen/PAddkidScreen.dart';
import 'package:kidseau/ParentsPanel/PHomeScreen/PHomebody.dart';
import 'package:kidseau/ParentsPanel/PReminderScreen/PReminderScreen.dart';
import 'package:kidseau/Theme.dart';

class PHomeScreen extends StatefulWidget {
  PHomeScreen({Key? key}) : super(key: key);

  @override
  State<PHomeScreen> createState() => _PHomeScreenState();
}

class _PHomeScreenState extends State<PHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1110,
      width: 414,
      decoration: BoxDecoration(
        color: Color(0xff8267AC).withOpacity(.06),
      ),
      child: Scaffold(
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
          backgroundColor: Color(0x2a8267ac),
          automaticallyImplyLeading: false,
          elevation: 0,
          title: Row(
            children: [
              GestureDetector(
                onTap: () {
                  // Get.to(() => Posts());
                },
                child:
                    Text("Good Morning", style: FontConstant2.k32w5008267text),
              ),
            ],
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Row(
                children: [
                  Image.asset(
                    "assets/images/appbaricon1.png",
                    height: 48,
                    width: 48,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => PReminderScreen(),
                        ),
                      );
                    },
                    child: Image.asset(
                      "assets/images/appbarclock.png",
                      height: 24,
                      width: 24,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 30.h),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PKidsDashboard()),
                            );
                          },
                          child: SizedBox(
                              height: 128, width: 250.w, child: Studentcard())),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PAddkidScreen()),
                          );
                        },
                        child: Container(
                          height: 128,
                          width: 83,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              image: DecorationImage(
                                  image: AssetImage(
                                      "assets/images/Rectangle 2716.png"))),
                          child: Column(
                            children: [
                              SizedBox(
                                height: Get.size.height * 0.05,
                              ),
                              Icon(
                                Icons.add,
                                size: 25,
                                color: Colors.white,
                              ),
                              Text("Add",
                                  style: FontConstant.k18w500whiteText
                                      .copyWith(fontSize: 16)),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: Get.size.height * 0.01),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 15.h,
                        ),
                        Text(
                          "Activity",
                          style: FontConstant2.baloothampifont,
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Activity(),
                        SizedBox(height: 10),
                        Center(
                          child: Text("See more",
                              style: FontConstant.k16w500purpleText.copyWith(
                                fontSize: 18,
                              )),
                        ),
                        SizedBox(height: 20.h),
                        Text(
                          "Tutorials",
                          style: FontConstant2.baloothampifont,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Tutorials(),
              //Tutorials card

              SizedBox(
                height: 100.h,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Studentcard extends StatelessWidget {
  const Studentcard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        boxShadow: [
          BoxShadow(
            color: Color(0xffAD9CC9),
            spreadRadius: 1,
            blurRadius: 8,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
          image: AssetImage("assets/images/sc.png"),
          fit: BoxFit.fitHeight,
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16),
      child: Row(
        children: [
          Container(
            height: 96,
            width: 72,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/Rectangle 2715.png"))),
          ),
          SizedBox(width: 16.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Nobite",
                style: FontConstant.k16w500White,
              ),
              Text(
                "Nursery sec A",
                style: FontConstant.k14w400White,
              ),
              Text(
                "08:00 am to 01:00 pm",
                style: FontConstant.k12w400White,
              ),
              Text(
                "2nd rank",
                style: FontConstant.k12w400White,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
//
