import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kidseau/Theme.dart';

class TWeeklyAttendanceScreen extends StatefulWidget {
  const TWeeklyAttendanceScreen({Key? key}) : super(key: key);

  @override
  State<TWeeklyAttendanceScreen> createState() =>
      _TWeeklyAttendanceScreenState();
}

class _TWeeklyAttendanceScreenState extends State<TWeeklyAttendanceScreen> {
  bool isSwitched = false;

  var image = [
    "assets/images/kidsimage.png",
    "assets/images/kidsimage.png",
    "assets/images/kidsimage.png",
    "assets/images/kidsimage.png"
  ];
  var name = [
    "Mohammad Umar",
    "Mohammad Umar",
    "Mohammad Umar",
    "Mohammad Umar",
  ];
  var desc = [
    "S/O - Azhar",
    "S/O - Azhar",
    "S/O - Azhar",
    "S/O - Azhar",
  ];

  List<AttendanceModel> contacts = [
    AttendanceModel("assets/images/kidsimage.png", "0778979454", false),
    AttendanceModel("assets/images/kidsimage.png", "0766223795", false),
    AttendanceModel("assets/images/kidsimage.png", "0749112016", false),
    AttendanceModel("assets/images/kidsimage.png", "0775286570", false),
    AttendanceModel("assets/images/kidsimage.png", "0744795640", false),
    AttendanceModel("assets/images/kidsimage.png", "0707404370", false),
    AttendanceModel("assets/images/kidsimage.png", "0772680138", false),
  ];

  List<AttendanceModel> selectedAttendance = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        toolbarHeight: 70.0,
        flexibleSpace: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              color: Colors.transparent,
            ),
          ),
        ),
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
              child: Text("Attendance",
                  style: FontConstant.k14w400lightpurpleText.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff84717F))),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: SizedBox(
                  height: 56,
                  width: 382,
                  child: Center(
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "Search student",
                        hintStyle: FontConstant.k16w400B7A4Text, // TextStyle
                        suffixIcon: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/images/searhcicon.png",
                              height: 30,
                            ),
                          ],
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(67.0),
                          borderSide: BorderSide(
                            width: 2.0,
                            color: ThemeColor.primarycolor.withOpacity(0.16),
                          ), // BorderSide
                        ), // OutlineInputBorder
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(67.0),
                          borderSide: BorderSide(
                            width: 2.0,
                            color: ThemeColor.primarycolor.withOpacity(0.16),
                          ), // BorderSide
                        ), // OutlineInputBorder
                      ), // InputDecoration
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                height: 139,
                width: 414,
                decoration: BoxDecoration(),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Center(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Wednesday’s attendance".tr(),
                                /* AppLoaclizations.of(context)!
                                    .translate("Wednesday’s attendance")
                                    .toString(),*/
                                style: FontConstant2.k24w5008267text),
                            Row(
                              children: [
                                Text(
                                  "Sunday 17 Oct - 2022",
                                  style: FontConstant.k16w500B7A4Text,
                                ),
                                Image.asset(
                                  "assets/images/calendericon.png",
                                  height: 24,
                                )
                              ],
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15.0),
                          child: Column(
                            children: [
                              Text(
                                "All Present",
                                style: FontConstant.k16w400B7A4Text,
                              )
                            ],
                          ),
                        ),
                        Divider(
                          height: 50,
                          thickness: 1,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                            "74 ${"students".tr() /*AppLoaclizations.of(context)!.translate("students")*/}",
                            style: FontConstant.k16w4008471Text),
                        Text("Present1".tr(),
                            /*AppLoaclizations.of(context)!
                                .translate("Present1")
                                .toString(),*/
                            style: FontConstant.k16w4008471Text),
                      ],
                    ),
                    SizedBox(height: 10),
                    ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: image.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            height: 82,
                            width: 382,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      height: 67,
                                      width: 50,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(image[index]),
                                              fit: BoxFit.cover)),
                                    ),
                                    SizedBox(width: 16),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          name[index],
                                          style: FontConstant.k18w500331FText,
                                        ),
                                        Text(
                                          desc[index],
                                          style: FontConstant.k14w4008471Text,
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                                Container(
                                  height: 24.h,
                                  width: 48.w,
                                  child: CupertinoSwitch(
                                      activeColor: ThemeColor.primarycolor,
                                      value: isSwitched,
                                      onChanged: (value) {
                                        setState(
                                          () {
                                            isSwitched = value;
                                          },
                                        );
                                      }),
                                ),
                                // Container(
                                //   height: 24.h,
                                //   width: 48.w,
                                //   child: CupertinoSwitch(
                                //     activeColor: ThemeColor.primarycolor,
                                //     value: value,
                                //     onChanged: (value) {
                                //       value = value;
                                //       setState(() {});
                                //     },
                                //   ),
                                // ),
                              ],
                            ),
                          );
                        })
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AttendanceModel {
  String image, name;
  bool isSelected;
  AttendanceModel(this.image, this.name, this.isSelected);
}
