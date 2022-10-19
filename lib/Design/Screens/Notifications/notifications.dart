import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kidseau/Design/Screens/Messages/messages.dart';
import 'package:kidseau/Design/Screens/Notifications/notificationbody.dart';
import 'package:kidseau/Theme.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
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

class _NotificationScreenState extends State<NotificationScreen> {
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
          automaticallyImplyLeading: false,
          elevation: 0,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: ThemeColor.lightpurple.withOpacity(0.16),
          ),
          backgroundColor: Color(0xff8267AC).withOpacity(0.16),
          title: GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => MessageScreen()));
            },
            child: Text("Notifications",
                style: FontConstant.k32w5008267Text.copyWith(fontSize: 25)),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Row(
                children: [
                  Image.asset(
                    "assets/images/dots.png",
                    height: 48,
                    width: 48,
                  ),
                ],
              ),
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
              height: 99,
              width: 414,
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
                          Text(
                            "Mohammad Umar has added new post",
                            style: FontConstant.k16w500331FText,
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
            Container(
              height: 99,
              width: 414,
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
                          Text(
                            "Please bring Alphabet notebook tomorrow.",
                            style: FontConstant.k16w500331FText,
                          ),
                          Row(
                            children: [
                              Text(
                                "Anouncement",
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
            list1(),

            // listview1(),
            SizedBox(
              height: 30,
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                "Yesterday",
                style: FontConstant.k14w500B7A4Text,
              ),
            ),
            SizedBox(height: 32),
            list2(),
            // listview2(),
          ],
        )),
      ),
    );
  }
}
