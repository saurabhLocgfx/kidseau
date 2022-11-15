import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:kidseau/Theme.dart';
import 'package:kidseau/Widgets/Calender/calendermodel.dart';

class TAttendanceScreen extends StatefulWidget {
  const TAttendanceScreen({Key? key}) : super(key: key);

  @override
  State<TAttendanceScreen> createState() => _TAttendanceScreenState();
}

class _TAttendanceScreenState extends State<TAttendanceScreen> {
  bool isSwitched = false;
  bool val2 = false;

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
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: EdgeInsets.symmetric(horizontal: 16),
                        hintText: "Search student",
                        hintStyle: FontConstant.k16w400B7A4Text, // Tex
                        suffixIconConstraints: BoxConstraints(
                          maxWidth: 60,
                          maxHeight: 25,
                        ), // tStyle
                        suffixIcon: Padding(
                          padding: const EdgeInsets.only(right: 16),
                          child: Image.asset(
                            "assets/images/searhcicon.png",
                          ),
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
                width: 1.sw,
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    image: DecorationImage(
                        image: AssetImage('assets/images/acard.png'))),
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 32),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (_) => CalendarPage2());
                          },
                          child: Text("Today’s attendance",
                              style: FontConstant2.k24w5008267text),
                        ),
                        Row(
                          children: [
                            Text(
                              "Sunday 17 Oct - 2022",
                              style: FontConstant.k16w500B7A4Text,
                            ),
                            SizedBox(width: 8),
                            Image.asset(
                              "assets/images/calendericon.png",
                              height: 24,
                            )
                          ],
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SizedBox(
                            width: 48.w,
                            height: 32.w,
                            child: FlutterSwitch(
                                toggleSize: 25,
                                inactiveColor: ThemeColor.b7A4B2,
                                activeColor: ThemeColor.primarycolor,
                                value: val2,
                                onToggle: (v) {
                                  setState(() {
                                    val2 = v;
                                  });
                                })),
                        SizedBox(height: 4),
                        Text(
                          "All Present",
                          style: FontConstant.k16w400B7A4Text,
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("74 students",
                            style: FontConstant.k16w4008471Text),
                        Text("Present", style: FontConstant.k16w4008471Text),
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
                                SizedBox(
                                    width: 48.w,
                                    height: 24.w,
                                    child: FlutterSwitch(
                                        toggleSize: 20,
                                        inactiveColor: ThemeColor.b7A4B2,
                                        activeColor: ThemeColor.primarycolor,
                                        value: val2,
                                        onToggle: (v) {
                                          setState(() {
                                            val2 = v;
                                          });
                                        })),
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
