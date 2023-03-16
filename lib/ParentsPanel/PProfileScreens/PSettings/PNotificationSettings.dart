import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:kidseau/Theme.dart';
import 'package:kidseau/api/notification_api/notification_api.dart';
import 'package:kidseau/shard_prefs/shared_prefs.dart';

class PNotificationsettings extends StatefulWidget {
  PNotificationsettings({Key? key}) : super(key: key);

  @override
  State<PNotificationsettings> createState() => _PNotificationsettingsState();
}

class _PNotificationsettingsState extends State<PNotificationsettings> {
  bool val1 = false;

  bool val2 = false;

  bool val3 = false;
  bool val4 = false;

  @override
  void initState() {
    getData();
    super.initState();
  }

  getData() {
    setState(() {
      val2 = UserPrefs.getNoti1() ?? false;
      val3 = UserPrefs.getNoti2() ?? false;
      val4 = UserPrefs.getNoti3() ?? false;
      if (val2 && val3 && val4) {
        val1 = true;
      }
    });
  }

  setData() {
    UserPrefs.setNoti1(val2);
    UserPrefs.setNoti2(val3);
    UserPrefs.setNoti3(val4);
    NotificationApi()
        .setNotificationSettings(
          post: val2 ? '1' : '0',
          announcement: val3 ? '1' : '0',
          message: val4 ? '1' : '0',
        )
        .then((value) => print(value));
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
          automaticallyImplyLeading: false,
          elevation: 0,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Color(0xff8267AC).withOpacity(0.16),
          ),
          backgroundColor: Color(0xff8267AC).withOpacity(0.16),
          centerTitle: false,
          title: Text(
            "Notification settings".tr(),
            style: FontConstant.k18w5008471Text,
          ),
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              color: Colors.transparent,
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Image.asset(
                "assets/images/backarrow.png",
                height: 24,
                width: 24,
              ),
            ),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                SizedBox(height: 40),
                GestureDetector(
                  onTap: () {
                    // Navigator.of(context).push(
                    //   MaterialPageRoute(
                    //     builder: (context) => const SongScreen(),
                    //   ),
                    // );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 30,
                        width: 156,
                        child: Text(
                          "Notification Settings".tr(),
                          style: FontConstant.k18w500331FText,
                        ),
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
                                setData();
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
                              setData();
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
                          "New Announcement".tr(),
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
                              setData();
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
                              setData();
                            })),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
