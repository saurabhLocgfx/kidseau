import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kidseau/ParentsPanel/PNotificationScreen/PNotificationbody.dart';
import 'package:kidseau/Theme.dart';
import 'package:kidseau/Widgets/widgets.dart';

class PNotificationScreen extends StatefulWidget {
  const PNotificationScreen({Key? key}) : super(key: key);

  @override
  State<PNotificationScreen> createState() => _PNotificationScreenState();
}

var images = [
  "assets/images/person6.png",
  "assets/images/person7.png",
  "assets/images/person8.png",
];
var title = [
  "Mohammad Umar has added new post",
  "Mohammad Umar has added new post",
  "Mohammad Umar has added new post",
];
var images2 = [
  "assets/images/person9.png",
  "assets/images/person10.png",
];
var title2 = [
  "Mohammad Umar has added new post",
  "Mohammad Umar has added new post",
];
var desc = [
  "Anouncement",
  "Anouncement",
  "Anouncement",
];
var desc2 = [
  "Anouncement",
  "Anouncement",
];

class _PNotificationScreenState extends State<PNotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(
        190,
        116,
        170,
        0.08,
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
          automaticallyImplyLeading: false,
          elevation: 0,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: ThemeColor.lightpurple.withOpacity(0.16),
          ),
          backgroundColor: Color(0xff8267AC).withOpacity(0.16),
          title: GestureDetector(
            onTap: () {
              // Navigator.of(context).push(
              //     MaterialPageRoute(builder: (context) => MessageScreen()));
            },
            child: Text("Notifications",
                style: FontConstant2.k32w5008267text.copyWith(fontSize: 25)),
          ),
          actions: [
            Notificationpopup(
              image: "assets/images/markicon.png",
              title: "Mark all as read",
              image2: "assets/images/markicon.png",
              title2: "Notification settings",
            ),
          ],
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                "Today",
                style: FontConstant.k14w500B7A4Text,
              ),
            ),
            SizedBox(height: 16),
            Container(
              // height: 99,
              // width: 414,
              color: ThemeColor.primarycolor.withOpacity(0.16),
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Row(
                  children: [
                    Container(
                      height: 67,
                      width: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(08),
                          image: DecorationImage(
                              image: AssetImage("assets/images/person3.png"))),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10.0, left: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 50,
                            child: Text(
                              "Mohammad Umar has added new post",
                              style: FontConstant.k16w500331FText,
                            ),
                          ),
                          Text(
                            "2 hours ago.",
                            style: FontConstant.k14w5008471Text,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 2),
            GestureDetector(
              onTap: () {
                notificationdialog(context);
                // AnnouncementDialog(context);
              },
              child: Container(
                /* height: 99,
                width: 414,*/
                color: ThemeColor.primarycolor.withOpacity(0.16),
                child: Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Row(
                    children: [
                      Container(
                        height: 67,
                        width: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(08),
                            image: DecorationImage(
                                image:
                                    AssetImage("assets/images/person4fm.png"))),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10.0, left: 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 200.w,
                              child: Text(
                                "Please bring Alphabet notebook tomorrow.",
                                style: FontConstant.k16w500331FText,
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  "Announcement",
                                  style: FontConstant.k14w5008471Text,
                                ),
                                SizedBox(width: 08),
                                Center(
                                  child: Icon(
                                    Icons.circle,
                                    size: 3,
                                    color: Color(0xffB7A4B2),
                                  ),
                                ),
                                SizedBox(width: 06),
                                Text(
                                  "2 hours ago.",
                                  style: FontConstant.k14w5008471Text,
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Plist1(),
            // list1(),
            Align(
              alignment: Alignment.center,
              child: Text(
                "Yesterday",
                style: FontConstant.k14w500B7A4Text,
              ),
            ),
            SizedBox(height: 24),
            Plist2()
          ],
        )),
      ),
    );
  }
}
