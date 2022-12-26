import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:kidseau/TeachersPanel/TReminder/AddReminder.dart';
import 'package:kidseau/Theme.dart';
import 'package:kidseau/Widgets/buttons.dart';

class TReminderScreen extends StatefulWidget {
  const TReminderScreen({Key? key}) : super(key: key);

  @override
  State<TReminderScreen> createState() => _TReminderScreenState();
}

class _TReminderScreenState extends State<TReminderScreen> {
  bool val1 = false;
  bool val2 = false;
  bool val3 = false;

  onChangedFunction1(bool newvalue1) {
    setState(() {
      val1 = newvalue1;
    });
  }

  onChangedFunction2(bool newvalue2) {
    setState(() {
      val2 = newvalue2;
    });
  }

  onChangedFunction3(bool newvalue3) {
    setState(() {
      val3 = newvalue3;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 896.h,
      width: 1.sw,
      color: ThemeColor.primarycolor.withOpacity(.06),
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
          automaticallyImplyLeading: false,
          elevation: 0,
          centerTitle: false,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Color(0xff8267AC).withOpacity(0.16),
          ),
          backgroundColor: Color(0xff8267AC).withOpacity(0.16),
          leading: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Image.asset(
                    "assets/images/backarrow.png",
                    height: 24,
                    width: 24,
                  ),
                ),
              ),
            ],
          ),
          title: Text(
            "Reminder",
            /*AppLoaclizations.of(context)!.translate("Reminder").toString(),*/
            style: FontConstant.k18w5008471Text,
          ),
          actions: [/*Image.asset("assets/images/dots2.png")*/],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Tomorrow is holiday".tr(),
                        /*AppLoaclizations.of(context)!
                            .translate("Tomorrow is holiday")
                            .toString(),*/
                        style: FontConstant2.k18w500331Ftext,
                      ),
                      Text(
                        "${/*AppLoaclizations.of(context)!.translate("Scheduled  at")*/
                        "Scheduled  at".tr()} 08:00 am - 30/09/2022",
                        style: FontConstant.k16w4008471Text,
                      ),
                    ],
                  ),
                  SizedBox(
                      width: 48.w,
                      height: 24.w,
                      child: FlutterSwitch(
                          toggleSize: 18,
                          inactiveColor: ThemeColor.b7A4B2,
                          activeColor: ThemeColor.primarycolor,
                          value: val1,
                          onToggle: (v) {
                            setState(() {
                              val1 = v;
                            });
                          })),
                ],
              ),
              SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Tomorrow is holiday".tr(),
                        /*AppLoaclizations.of(context)!
                            .translate("Tomorrow is holiday")
                            .toString(),*/
                        style: FontConstant2.k18w500331Ftext,
                      ),
                      Text(
                        "${/*AppLoaclizations.of(context)!.translate("Scheduled  at")*/ "Scheduled  at".tr()} 08:00 am - 30/09/2022",
                        style: FontConstant.k16w4008471Text,
                      ),
                    ],
                  ),
                  SizedBox(
                      width: 48.w,
                      height: 24.w,
                      child: FlutterSwitch(
                          toggleSize: 18,
                          inactiveColor: ThemeColor.b7A4B2,
                          activeColor: ThemeColor.primarycolor,
                          value: val2,
                          onToggle: (v) {
                            setState(() {
                              val2 = v;
                            });
                          })),
                ],
              ),
              SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Bring notebook".tr(),
                        /*AppLoaclizations.of(context)!
                            .translate("Bring notebook")
                            .toString(),*/
                        style: FontConstant2.k18w500331Ftext,
                      ),
                      Text(
                        "Expired".tr(),
                        /*AppLoaclizations.of(context)!
                            .translate("Expired")
                            .toString(),*/
                        style: FontConstant.k16w4008471Text,
                      ),
                    ],
                  ),
                  SizedBox(
                      width: 48.w,
                      height: 24.w,
                      child: FlutterSwitch(
                          toggleSize: 18,
                          inactiveColor: ThemeColor.b7A4B2,
                          activeColor: ThemeColor.primarycolor,
                          value: val3,
                          onToggle: (v) {
                            setState(() {
                              val3 = v;
                            });
                          })),
                ],
              ),
              Spacer(),
              /* SizedBox(
                height: 100,
              ),*/
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 52.h,
                      // width: 1.sw,
                      child: MainButton(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => TAddReminder(),
                              ),
                            );
                          },
                          title: "Add Reminder".tr(),
                          /*AppLoaclizations.of(context)!
                              .translate("Add reminder")
                              .toString(),*/
                          textStyleColor: Colors.white,
                          backgroundColor: ThemeColor.primarycolor),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30.h,
              )
            ],
          ),
        ),
      ),
    );
  }
}
