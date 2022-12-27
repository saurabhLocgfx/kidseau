import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kidseau/TeachersPanel/THomeScreen/TGroupScreen.dart';
import 'package:kidseau/TeachersPanel/TNotificationScreen/TNotificationScreen.dart';
import 'package:kidseau/Theme.dart';
import 'package:kidseau/api/Teacherpanelapi/Tmodel/THomemodel.dart';
import 'package:kidseau/api/Teacherpanelapi/Tmodel/TScheduleModel.dart';
import 'package:kidseau/api/Teacherpanelapi/Tschedule_api/schedule_api.dart';
import 'package:kidseau/api/Teacherpanelapi/teacher_home_api/THomeApi.dart';

import '../../restartappwidget/restartwidgets.dart';
import '../TReminder/TReminderScreen.dart';
import 'TAttendanceScreen.dart';
import 'TLearningAlphabets.dart';
import 'TScheduleScreen.dart';

class THomeScreen extends StatefulWidget {
  THomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<THomeScreen> createState() => _THomeScreenState();
}

class _THomeScreenState extends State<THomeScreen> {
  bool colorChange = false;
  /*Locale localelang =Locale('fr','FR');
  Locale englocale = Locale('en', 'US');
  Locale franchlocal = Locale('fr', 'FR');
  Locale aribiclocal = Locale('ar', 'AR');*/
  bool loadingData = false;
  bool loadingsch = false;
  @override
  void initState() {
    getData();
    super.initState();
  }

  getData() {
    loadingData = true;
    final rsp = THomeApi().get();
    rsp.then((value) {
      try {
        setState(() {
          loadingData = false;
        });
        _name = value as THomeModel;
      } catch (e) {
        setState(() {
          loadingData = false;
        });
      }
      print(_name.hello);
      print(_name.group);
      //print(_name.group!.length);
    });
  }

  getSchedule() {
    loadingsch = true;
    final rsp = TScheduleApi().get();
    rsp.then((value) {
      try {
        _schedule = value;
        setState(() {
          loadingsch = false;
        });
      } catch (e) {
        setState(() {
          loadingsch = false;
        });
      }
      print(_schedule.schedule);
    });
  }

  TScheduleModel _schedule = TScheduleModel();
  THomeModel _name = THomeModel();
  // THomeModel _attend = THomeModel();

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
              child: Text(_name.hello.toString(),
                  /*"Good Morning".tr()*/
                  /*AppLoaclizations.of(context)!
                      .translate("Good Morning")
                      .toString(),*/
                  style: FontConstant2.k32w5008267text.copyWith(fontSize: 25)),
            ),
          ],
        ),
        actions: [
          SizedBox(
            width: 164,
            child: Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: PopupMenuButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16)),
                          itemBuilder: (context) {
                            return [
                              PopupMenuItem(
                                enabled: true,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 15.0, top: 15, bottom: 15),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          context.locale = Locale('en', 'US');
                                          RestartWidget.restartApp(context);

                                          setState(() {
                                            colorChange;
                                          });
                                        },
                                        child: Row(
                                          children: [
                                            Text(
                                              ("English"),
                                              style: colorChange
                                                  ? FontConstant.k16w5008267Text
                                                  : FontConstant
                                                      .k18w5008471Text,
                                            )
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 20),
                                      GestureDetector(
                                        onTap: () {
                                          context.locale = Locale('fr', 'FR');
                                          RestartWidget.restartApp(context);

                                          setState(() {
                                            colorChange;
                                          });
                                          // Navigator.of(context).push(
                                          //   MaterialPageRoute(
                                          //     builder: (context) => Fees(),
                                          //   ),
                                          // );
                                        },
                                        child: Row(
                                          children: [
                                            Text(
                                              ("French"),
                                              style: colorChange
                                                  ? FontConstant.k16w5008267Text
                                                  : FontConstant
                                                      .k18w5008471Text,
                                            )
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 20),
                                      GestureDetector(
                                        onTap: () {
                                          context.locale = Locale('ar', 'AR');
                                          RestartWidget.restartApp(context);

                                          setState(() {
                                            colorChange;
                                          });
                                          /* Navigator.pop(context);
                                            Navigator.of(context).push(
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    TSettings(),
                                              ),
                                            );*/
                                        },
                                        child: Row(
                                          children: [
                                            Text(
                                              ("Arabic"),
                                              style: colorChange
                                                  ? FontConstant.k16w5008267Text
                                                  : FontConstant
                                                      .k18w5008471Text,
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ];
                          },
                          child: Image.asset(
                            "assets/images/Languageicon.png",
                            height: 24,
                          ))),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => TReminderScreen(),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Image.asset(
                        "assets/images/clockicon.png",
                        height: 24,
                      ),
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
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Image.asset(
                        "assets/images/iconbell.png",
                        height: 24,
                      ),
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
                height: 40,
              ),
              loadingData
                  ? CircularProgressIndicator()
                  : SizedBox(
                      height: 128,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: _name.group!.length,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => TGroupScreen()),
                                );
                              },
                              child: loadingData
                                  ? CircularProgressIndicator()
                                  : Groupcard(
                                      nameData: _name,
                                      index: index,
                                    ));
                        },
                      ),
                    ),
              SizedBox(
                height: 15.h,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: SizedBox(
                    width: 1.sw,
                    child: Text(
                      "Schedule".tr(),
                      /*  AppLoaclizations.of(context)!
                          .translate(
                            "Schedule",
                          )
                          .toString(),*/
                      style: FontConstant2.baloothampifont,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: loadingData
                    ? CircularProgressIndicator()
                    : SizedBox(
                        // height: 300.h,
                        width: 1.sw,
                        child: ListView.separated(
                            separatorBuilder: (ctx, ind) => SizedBox(
                                  height: 14.h,
                                ),
                            shrinkWrap: true,
                            padding: EdgeInsets.zero,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: _name.schdule!.length,
                            scrollDirection: Axis.vertical,
                            itemBuilder: (BuildContext context, int index) {
                              return InkWell(
                                onTap: () {
                                  if (index == 0) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const TLearningAlphabets()),
                                    );
                                  } else if (index == 1) {
                                  } else if (index == 2) {
                                  } else if (index == 3) {}
                                },
                                child: loadingData
                                    ? CircularProgressIndicator()
                                    : Container(
                                        height: 64,
                                        // width: Get.size.width * 0.93,
                                        //margin: EdgeInsets.symmetric(horizontal: 16),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(16),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 15.0),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Image.asset(
                                                _name.schdule![index].icon
                                                    .toString(),
                                                errorBuilder: (q, w, e) {
                                                  return Text(
                                                      'Image not loaded');
                                                },
                                                height: 40,
                                                width: 40,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 15.0),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      _name
                                                          .schdule![index].title
                                                          .toString(),
                                                      style: FontConstant
                                                          .k32w500blackText
                                                          .copyWith(
                                                              fontSize: 16),
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text(
                                                          "From ${DateFormat.jm().format(DateFormat("hh:mm:ss").parse('${_name.schdule![index].time}'))} ",
                                                          // '${groups[index]} . ${time[index]}',
                                                          style: FontConstant
                                                              .k14w400lightpurpleText
                                                              .copyWith(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  fontSize: 14,
                                                                  color: Color(
                                                                      0xffB7A4B2)),
                                                        ),
                                                        Text(
                                                          "To ${DateFormat.jm().format(DateFormat("hh:mm:ss").parse('${_name.schdule![index].time}'))} ",
                                                          // '${groups[index]} . ${time[index]}',
                                                          style: FontConstant
                                                              .k14w400lightpurpleText
                                                              .copyWith(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  fontSize: 14,
                                                                  color: Color(
                                                                      0xffB7A4B2)),
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                              );
                            }),
                      ),
              ),
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
                    padding: EdgeInsets.all(16),
                    child: Text("See more".tr(),
                        /*AppLoaclizations.of(context)!
                        .translate("See more")
                        .toString(),*/
                        style: FontConstant.k16w500purpleText.copyWith(
                          fontSize: 18,
                        )),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding:
                    const EdgeInsets.only(left: 16.0, bottom: 10, right: 16),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: SizedBox(
                    width: 1.sw,
                    child: Text(
                      "Attendance".tr(),
                      /*AppLoaclizations.of(context)!
                          .translate("Attendance")
                          .toString(),*/
                      style: FontConstant2.baloothampifont,
                    ),
                  ),
                ),
              ),
              /* Container(
                height: 50,
                color: Colors.black,
              ),*/
              SizedBox(
                height: 128,
                child: Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TAttendanceScreen()),
                        );
                      },
                      child: loadingData
                          ? CircularProgressIndicator()
                          : Attendancecard(
                              image: "assets/images/groupcard2.png",
                              // nameData: _attend,
                              // index: index,
                            ),
                    ),
                    separatorBuilder: (ctx, ind) => SizedBox(
                      width: 16,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 112.h)
            ],
          ),
        ),
      ),
    );
  }
}

class Groupcard extends StatelessWidget {
  THomeModel nameData;
  int index;
  Groupcard({Key? key, required this.nameData, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 283,
      height: 128,
      margin: EdgeInsets.only(left: 16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.transparent,
        /*boxShadow: [
          BoxShadow(
            offset: Offset(0, 0),
            color: ThemeColor.primarycolor.withOpacity(0.4),
            spreadRadius: 0,
            blurRadius: 16,
          ),
        ],*/
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
          image: AssetImage(
            "assets/images/groupc.png",
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
            child: Image.network(
              nameData.group![index].image.toString(),
              errorBuilder: (q, w, e) {
                return Text('Image not loaded');
              },
              // "assets/images/groupimage1.png",
              // fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                nameData.group![index].name.toString(),
                //"Group A",
                style: FontConstant.k18w500whiteText,
              ),
              Text(
                nameData.group![index].section.toString(),
                //"Nursery",
                style: FontConstant.k18w500whiteText.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
              Text(
                "${nameData.group![index].students.toString()} Students",
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
        /* boxShadow: [
          BoxShadow(
            offset: Offset(0, 0),
            color: ThemeColor.primarycolor.withOpacity(0.4),
            spreadRadius: 0,
            blurRadius: 16,
          ),
        ],*/
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
  // THomeModel nameData;
  // int index;
  final String image;
  Attendancecard({
    Key? key,
    // required this.nameData,
    // required this.index,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 128,
      width: 350,

      // margin: EdgeInsets.only(left: 8),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/Attendancec.png'),
          fit: BoxFit.fill,
        ),
        color: Colors.transparent,
        /* boxShadow: [
          BoxShadow(
            offset: Offset(0, 0),
            color: ThemeColor.primarycolor.withOpacity(0.4),
            spreadRadius: 0,
            blurRadius: 16,
          ),
        ],*/
        borderRadius: BorderRadius.circular(16),
      ),
      padding: EdgeInsets.only(left: 16.0, right: 16, top: 13, bottom: 13),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 96,
            width: 72,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/person10.png"
                        // nameData.group![index].image.toString(),
                        ))),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  // nameData.attendance![index].name.toString(),
                  "Group A",
                  style: FontConstant.k18w500whiteText,
                ),
                Text(
                  // nameData.attendance![index].section.toString(),
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
                  // "${nameData.attendance![index].students.toString()}Students",
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
              Text(
                  // nameData.attendance![index].status.toString(),
                  '51 ',
                  style: FontConstant2.k24w500WhiteText),
              Text("present".tr(),
                  /*AppLoaclizations.of(context)!.translate('present').toString(),*/
                  style: FontConstant.k16w400whiteText),
            ],
          ),
        ],
      ),
    );
  }
}
