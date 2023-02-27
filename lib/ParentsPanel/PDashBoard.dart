import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kidseau/ParentsPanel/PHomeScreen/PHomeScreen.dart';
import 'package:kidseau/ParentsPanel/PMessageScreen/PMessageDashboard.dart';
import 'package:kidseau/ParentsPanel/PNotificationScreen/PNotificationScreen.dart';
import 'package:kidseau/ParentsPanel/PPostsScreen/PPostScreen.dart';
import 'package:kidseau/ParentsPanel/PProfileScreens/PProfileDashBoard.dart';
import 'package:kidseau/Theme.dart';
import 'package:kidseau/api/notification_api/notification_api.dart';
import 'package:kidseau/shard_prefs/shared_prefs.dart';

class PDashboard extends StatefulWidget {
  const PDashboard({Key? key}) : super(key: key);
  @override
  _PDashboardState createState() => _PDashboardState();
}

class _PDashboardState extends State<PDashboard> {
  final PageController _pageController = PageController(
    initialPage: 0,
  );
  int pageIndex = 0;

  String _fcmToken = '';
  Future<void> initializeFirebaseService() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    String firebaseAppToken = await messaging.getToken(
          vapidKey:
              "BNS6eMFlYikBmzbB_Wy2O97R7aU4gL55FJpBQMXLIdmJv4ZN-i25wz8RvgQg4e34dLdpgM9fFbF7SWxJVhTMJ0E",
        ) ??
        '';

    /*if (AwesomeStringUtils.isNullOrEmpty(firebaseAppToken,
        considerWhiteSpaceAsEmpty: true)) return;*/

    if (!mounted) {
      _fcmToken = firebaseAppToken;
    } else {
      setState(() {
        _fcmToken = firebaseAppToken;
      });
    }

    UserPrefs.setFCM(_fcmToken);
    log('Firebase token: $firebaseAppToken');
    /*var _prefs = await SharedPreferences.getInstance();
      _prefs.setString('fcmToken', firebaseAppToken);*/
    // UserPrefs.setFcm(_fcmToken);
    /*FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      if (!AwesomeStringUtils.isNullOrEmpty(message.notification?.title,
              considerWhiteSpaceAsEmpty: true) ||
          !AwesomeStringUtils.isNullOrEmpty(message.notification?.body,
              considerWhiteSpaceAsEmpty: true)) {
        print('Message also contained a notification: ${message.notification}');

        late String imageUrl;
        imageUrl = message.notification!.android!.imageUrl!;
        imageUrl = message.notification!.apple!.imageUrl!;

        Map<String, dynamic> notificationAdapter = {
          NOTIFICATION_CONTENT: {
            NOTIFICATION_ID: Random().nextInt(2147483647),
            NOTIFICATION_CHANNEL_KEY: 'basic_channel',
            NOTIFICATION_TITLE: message.notification!.title,
            NOTIFICATION_BODY: message.notification!.body,
          }
        };

        AwesomeNotifications()
            .createNotificationFromJsonData(notificationAdapter);
      } else {
        AwesomeNotifications().createNotificationFromJsonData(message.data);
      }
    });*/
    // NotificationAPI.get(uniqueId: _fcmToken.toString(), isLoggedIn: false);

    NotificationApi().get();
  }

  @override
  void initState() {
    initializeFirebaseService();
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        extendBody: true,
        appBar: AppBar(
          toolbarHeight: 0,
          elevation: 0,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarBrightness: Brightness.light,
          ),
          backgroundColor: Colors.transparent,
        ),
        bottomNavigationBar: buildMyNavBar(context),
        body: PageView(
          controller: _pageController,
          physics: NeverScrollableScrollPhysics(),
          onPageChanged: (page) {
            setState(
              () {
                pageIndex = page;
              },
            );
          },
          children: <Widget>[
            PHomeScreen(),
            PProfileDashBoard(),
            PPostScreen(),
            PNotificationScreen(),
            PMessageDashboard(),
            // HomeProfile(),
            // Posts(),
            // NotificationScreen(),
            // MessageScreen()
          ],
        ),
      ),
    );
  }

  Container buildMyNavBar(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      height: 56.h,
      width: 382.w,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(126),
        boxShadow: [
          BoxShadow(
            color: Color(0xff5D3D8F).withOpacity(0.3),
            spreadRadius: 0,
            blurRadius: 16,
            offset: Offset(0, 0), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InkWell(
            onTap: () {
              setState(() {
                selectedIndex = pageIndex = 0;
                _pageController.jumpToPage(
                  pageIndex,
                );
                pageIndex = 0;
              });
            },
            child: Container(
              color: Colors.transparent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    pageIndex == 0
                        ? "assets/images/homeiconfill.png"
                        : "assets/images/iconhome.png",
                    height: 24,
                    // color: pageIndex == 0 ? Colors.green : Colors.grey,
                  ),
                  Text("Home".tr(),
                      style: FontConstant.k12w400B7A4Text.copyWith(
                          color: pageIndex == 0
                              ? Color(0xff8267AC)
                              : Color(0xffB7A4B2)))
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                selectedIndex = pageIndex = 1;
                _pageController.jumpToPage(
                  pageIndex,
                );
                pageIndex = 1;
              });
            },
            child: Container(
              color: Colors.transparent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    pageIndex == 1
                        ? "assets/images/profileiconfill.png"
                        : "assets/images/profileicon.png",
                    height: 24,
                  ),
                  Text("Profile".tr(),
                      style: FontConstant.k12w400B7A4Text.copyWith(
                          color: pageIndex == 1
                              ? Color(0xff8267AC)
                              : Color(0xffB7A4B2)))
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = pageIndex = 2;
                _pageController.jumpToPage(
                  pageIndex,
                );
                pageIndex = 2;
              });
            },
            child: Container(
              color: Colors.transparent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    pageIndex == 2
                        ? "assets/images/postsiconfill.png"
                        : "assets/images/Postsicon.png",
                    height: 24,
                  ),
                  Text("Posts".tr(),
                      style: FontConstant.k12w400B7A4Text.copyWith(
                          color: pageIndex == 2
                              ? Color(0xff8267AC)
                              : Color(0xffB7A4B2)))
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = pageIndex = 3;
                _pageController.jumpToPage(
                  pageIndex,
                );
                pageIndex = 3;
              });
            },
            child: Container(
              color: Colors.transparent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    pageIndex == 3
                        ? "assets/images/notificationiconfill.png"
                        : "assets/images/notificationicon.png",
                    height: 24,
                  ),
                  Text("Notification".tr(),
                      style: FontConstant.k12w400B7A4Text.copyWith(
                          color: pageIndex == 3
                              ? Color(0xff8267AC)
                              : Color(0xffB7A4B2)))
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = pageIndex = 4;
                _pageController.jumpToPage(
                  pageIndex,
                );
                pageIndex = 4;
              });
            },
            child: Container(
              color: Colors.transparent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    pageIndex == 4
                        ? "assets/images/messageiconfill.png"
                        : "assets/images/messageicon.png",
                    height: 24,
                  ),
                  Text("Message".tr(),
                      style: FontConstant.k12w400B7A4Text.copyWith(
                          color: pageIndex == 4
                              ? Color(0xff8267AC)
                              : Color(0xffB7A4B2)))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
