import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kidseau/ParentsPanel/PMessageScreen/PopenChats.dart';
import 'package:kidseau/Theme.dart';
import 'package:kidseau/Widgets/dialogs.dart';

class PMessages extends StatefulWidget {
  const PMessages({Key? key}) : super(key: key);

  @override
  State<PMessages> createState() => _PMessagesState();
}

class _PMessagesState extends State<PMessages> {
  List<String> images = [
    "assets/images/messageperson1.png",
    "assets/images/messageperson2.png",
    "assets/images/messageperson3.png",
    "assets/images/messageperson4.png",
    "assets/images/messageperson5.png",
    "assets/images/messageperson6.png",
  ];
  List<String> txt = [
    "Mohammad Umar",
    "Mohammad Umar",
    "Monish",
    "Mohammad Ali",
    "Mohammad Umar",
    "Mohammad Umar",
  ];
  List<String> name = [
    "Mohammad Umar",
    "Mohammad Umar",
    "Monish",
    "Mohammad Ali",
    "Mohammad Umar",
    "Mohammad Umar",
  ];
  List<String> title = [
    "Class teacher",
    "Director",
    "Class teacher",
    "Class teacher",
    "Class teacher",
    "Class teacher",
  ];
  bool _isVisible = false;
  void showToast() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: images.length,
          physics: NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => POpenChats(),
                  ),
                );
              },
              child: Container(
                  height: 90,
                  width: 382.w,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 70,
                              width: 50,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(images[index]))),
                            ),
                            SizedBox(width: 16),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      name[index],
                                      style: FontConstant.k18w5008471Text
                                          .copyWith(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500,
                                              color: Color(0xff331F2D)),
                                    ),
                                  ],
                                ),
                                Text(title[index],
                                    style: FontConstant.k14w4008471Text),
                                Text("last message - 2 days ago",
                                    style: FontConstant.k12w4008267Text),
                              ],
                            ),
                          ],
                        ),
                        Container(
                          child: Stack(children: [
                            Image.asset(
                              "assets/images/dots2.png",
                              height: 48.h,
                              width: 48.w,
                            ),
                            messageoptiondialog(),
                          ]),
                        ),
                      ],
                    ),
                  )),
            );
          }),
    );
  }
}
