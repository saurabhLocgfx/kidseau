import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:kidseau/Theme.dart';

class TNotificationsettings extends StatefulWidget {
  TNotificationsettings({Key? key}) : super(key: key);

  @override
  State<TNotificationsettings> createState() => _TNotificationsettingsState();
}

class _TNotificationsettingsState extends State<TNotificationsettings> {
  bool val1 = false;

  bool val2 = false;

  bool val3 = false;
  bool val4 = false;

  onChangedFunction1(bool newvalue1) {
    setState(() {
      val1 = newvalue1;
      val2 = newvalue1;
      val3 = newvalue1;
      val4 = newvalue1;
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

  onChangedFunction4(bool newvalue4) {
    setState(() {
      val4 = newvalue4;
    });
  }

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
          centerTitle: false,
          automaticallyImplyLeading: false,
          elevation: 0,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Color(0xff8267AC).withOpacity(0.16),
          ),
          backgroundColor: Color(0xff8267AC).withOpacity(0.16),
          title: Text(
            "Notification settings".tr(),
            style: FontConstant.k18w5008471Text,
          ),
          leading: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: SizedBox(
                    height: 30,
                    width: 30,
                    child: Image.asset(
                      "assets/images/backarrow.png",
                      height: 24,
                      width: 24,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              SizedBox(height: 140),
              GestureDetector(
                onTap: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Notification Settings".tr(),
                      style: FontConstant.k18w500331FText,
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
                                val2 = v;
                                val3 = v;
                                val4 = v;
                              });
                            })),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.circle, size: 6, color: Color(0xff331F2D)),
                      SizedBox(width: 10),
                      Text(
                        "New Post".tr(),
                        /*AppLoaclizations.of(context)!
                            .translate("New Post")
                            .toString(),*/
                        style: FontConstant.k18w500331FText,
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
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.circle, size: 6, color: Color(0xff331F2D)),
                      SizedBox(width: 10),
                      Text(
                        "New Activity".tr(),
                        /* AppLoaclizations.of(context)!
                            .translate("New Activity")
                            .toString(),*/
                        style: FontConstant.k18w500331FText,
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
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.circle, size: 6, color: Color(0xff331F2D)),
                      SizedBox(width: 10),
                      Text(
                        "New Message".tr(),
                        /*AppLoaclizations.of(context)!
                            .translate("New Message ")
                            .toString(),*/
                        style: FontConstant.k18w500331FText,
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
                          value: val4,
                          onToggle: (v) {
                            setState(() {
                              val4 = v;
                            });
                          })),
                ],
              ),
            ],
          ),
        ));
  }
}
