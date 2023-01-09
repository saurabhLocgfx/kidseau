import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:kidseau/Theme.dart';
import 'package:kidseau/Widgets/Calender/calendermodel.dart';

import '../../Widgets/buttons.dart';

class TAttendanceScreen extends StatefulWidget {
  const TAttendanceScreen({Key? key}) : super(key: key);

  @override
  State<TAttendanceScreen> createState() => _TAttendanceScreenState();
}

class _TAttendanceScreenState extends State<TAttendanceScreen> {
  bool isSwitched = false;
  bool val2 = false;
  bool val1 = false;
  List<bool> _values = [];

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
    "S/O -",
    "S/O -",
    "S/O - ",
    "S/O -",
  ];
  var desc1 = [
    "Azhar",
    "Azhar",
    "Azhar",
    "Azhar",
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
  void initState() {
    // TODO: implement initState
    for (var v in image) {
      _values.add(false);
    }
    super.initState();
  }

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
              child: Text("Attendance".tr(),
                  /* AppLoaclizations.of(context)!
                      .translate("Attendance")
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
        child: Column(
          children: [
            SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextFormField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: EdgeInsets.symmetric(horizontal: 16),
                  hintText: "Search student".tr(),
                  /*AppLoaclizations.of(context)!
                      .translate("Search student")
                      .toString(),*/
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
            SizedBox(
              height: 16,
            ),
            Container(
              width: 1.sw,
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  image: DecorationImage(
                      image: AssetImage('assets/images/attendancebg.png'),
                      fit: BoxFit.fitWidth)),
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 32),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (_) => CalendarPage2());
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Today’s attendance".tr(),
                            /* AppLoaclizations.of(context)!
                                .translate("Today’s attendance")
                                .toString(),*/
                            style: FontConstant2.k24w5008267text),
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
                              fit: BoxFit.fitWidth,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(
                          width: 56.w,
                          height: 32.w,
                          child: FlutterSwitch(
                              // toggleSize: 25,
                              inactiveColor: ThemeColor.b7A4B2,
                              activeColor: ThemeColor.primarycolor,
                              value: val1,
                              onToggle: (v) {
                                setState(() {
                                  val1 = v;
                                 // _values.clear();
                                  for(int i = 0; i<= _values.length-1; i++){
                                    if(v == true){
                                      _values[i] = true;
                                    }else{
                                      _values[i] = false;
                                    }
                                    //_values[i] = !_values[i];
                                  }
                                });
                              })),
                      SizedBox(height: 4),
                      Text(
                        "All Present".tr(),
                        style: FontConstant.k16w400B7A4Text,
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  //SizedBox(height: 16,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                          "74 ${"students".tr()}",
                          style: FontConstant.k16w4008471Text),
                      Text("Present1".tr(),
                          style: FontConstant.k16w4008471Text),
                    ],
                  ),
                  SizedBox(height: 10),
                  ListView.separated(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: image.length,
                      separatorBuilder: (ctx, ind) => SizedBox(
                            height: 16.h,
                          ),
                      itemBuilder: (BuildContext context, int index) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: 67,
                                  width: 50,
                                  decoration: BoxDecoration(
                                      /*image: DecorationImage(
                                          image: AssetImage(image[index],),
                                          fit: BoxFit.cover)*/),
                                  child: Image.network(image[index], errorBuilder: (q,w,e)=> Text('Image not loaded'),fit: BoxFit.cover),
                                ),
                                SizedBox(width: 16),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      name[index],
                                      style: FontConstant.k18w500331FText,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "S/O ",
                                          style: FontConstant.k14w4008471Text,
                                        ),
                                        Text(
                                          desc1[index],
                                          style: FontConstant.k14w4008471Text,
                                        ),
                                      ],
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
                                    value: _values[index],
                                    onToggle: (v) {
                                      setState(() {
                                        _values[index] = v;
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
                        );
                      }),
                ],
              ),
            ),
            SizedBox(
              height: 30.h,
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 52.h,
        width: 1.sw,
        margin: EdgeInsets.only(bottom: 10,left: 16,right: 16),
        child: MainButton(
            onTap: () {

            },
            title: "Submit".tr(),
            /*AppLoaclizations.of(context)!
                        .translate("View all students")
                        .toString(),*/
            textStyleColor: Colors.white,
            backgroundColor: ThemeColor.primarycolor),
      ),
    );
  }
}

class AttendanceModel {
  String image, name;
  bool isSelected;
  AttendanceModel(this.image, this.name, this.isSelected);
}
