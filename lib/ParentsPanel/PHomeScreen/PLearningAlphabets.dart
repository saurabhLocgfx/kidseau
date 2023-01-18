import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kidseau/Theme.dart';
import 'package:kidseau/Widgets/buttons.dart';
import 'package:kidseau/api/models/teacher_profile_details_model/teacher_school_profile_detail_model.dart';

import '../../TeachersPanel/TMessages/TChats.dart';

class PLearningAplphabets extends StatefulWidget {
  const PLearningAplphabets({Key? key}) : super(key: key);

  @override
  State<PLearningAplphabets> createState() => _PLearningAplphabetsState();
}

class _PLearningAplphabetsState extends State<PLearningAplphabets> {
  // bool _flag = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: 1.sw,
      height: 1.sh,
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
                    style: FontConstant.k14w400lightpurpleText.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff84717F))),
              ),
            ],
          ),
        ),
        /*appBar: PreferredSize(
          preferredSize: Size.fromHeight(104.0), // here the desired height
          child: SingleChildScrollView(
            child: Column(
              children: [
                AppBar(
                  backgroundColor: Color(0x2a8267ac),
                  automaticallyImplyLeading: false,
                  elevation: 0,
                  title: Row(
                    children: [
                      GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: Image.asset(
                            "assets/images/arrow-left.png",
                            height: 24,
                            width: 24,
                          )),
                      Padding(
                        padding: const EdgeInsets.only(left: 17.93),
                        child: Text("Good Morning",
                            style: FontConstant.k14w400lightpurpleText.copyWith(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff84717F))),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),*/
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                SizedBox(height: 20.h),
                Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    "Learning Alphabets",
                    style: FontConstant.k16w500brownText.copyWith(fontSize: 32),
                  ),
                ),
                Column(
                  children: [
                    Container(
                      height: 286,
                      width: 1.sw,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          image: DecorationImage(
                              image: AssetImage(
                                  "assets/images/Rectangle for la.png"),
                              fit: BoxFit.fitWidth)),
                    ),
                    SizedBox(height: 16),
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
                    style: FontConstant.k14w4008471Text
                        .copyWith(fontWeight: FontWeight.w400, fontSize: 18)),
                SizedBox(height: 30),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Who is taking this class",
                      style: FontConstant2.baloothampifont,
                    )),
                SizedBox(height: 24),
                TeacherCard(
                  model: TeacherSchoolProfileDetailsModel(),
                ),
                SizedBox(
                  height: 32,
                ),
                materialButton(context, () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => TChats(),
                    ),
                  );
                }, "Ask Question".tr(), ThemeColor.primarycolor, 52.0),
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
  final TeacherSchoolProfileDetailsModel model;
  TeacherCard({Key? key, required this.model}) : super(key: key);

  List<String> bird = [
    "assets/images/small bird2.png",
    "assets/images/bird2.png",
    "assets/images/birdpink.png",
    "assets/images/birdorange.png",
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 150.h,
      //margin: EdgeInsets.symmetric(horizontal: 16),
      // clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          //color: Colors.blue,
          image: DecorationImage(
              image: AssetImage("assets/images/purplecard.png"),
              fit: BoxFit.fill)),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Stack(
        children: [
          Positioned(
            right: 0,
            bottom: 2,
            child: SizedBox(
              width: 60,
              height: 60,
              child: Image.asset(
                bird[0],
                fit: BoxFit.fill,
              ),
            ),
          ),
          Row(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 80,
                width: 60,
                clipBehavior: Clip.hardEdge,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(8)),
                child: Image.network(
                  model.directorImage.toString(),
                  errorBuilder: (q, w, e) => Text('Image not loaded'),
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(
                width: 12.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(model.directorName.toString(),
                      style: FontConstant.k18w5008471Text.copyWith(
                        color: Colors.white,
                      )),
                  Text('Director',
                      style: FontConstant.k14w4008471Text
                          .copyWith(color: Colors.white.withOpacity(0.74))),
                  Text(model.directorPhone.toString(),
                      style: FontConstant.k16w4008471Text
                          .copyWith(color: Colors.white.withOpacity(0.80))),
                ],
              ),
              /* Padding(
                          padding: const EdgeInsets.only(top: 30, bottom: 10),
                          child: Align(
                              alignment: Alignment.centerRight,
                              child: Image.asset(
                                bird[index],
                                fit: BoxFit.fill,
                              )),
                        ),*/
            ],
          ),
        ],
      ),
    );
  }
}
