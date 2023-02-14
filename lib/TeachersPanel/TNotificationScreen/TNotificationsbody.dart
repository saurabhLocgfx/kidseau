import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kidseau/TeachersPanel/TNotificationScreen/TNotificationScreen.dart';
import 'package:kidseau/Theme.dart';

import '../TReminder/TReminderScreen.dart';

class Tnotificationlist2 extends StatelessWidget {
  const Tnotificationlist2({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        // padding: EdgeInsets.zero,
        physics: NeverScrollableScrollPhysics(),
        itemCount: images2.length,
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.only(top: 2.0),
            child: GestureDetector(
              onTap: () {
                Tnotificationdialog(context);
              },
              child: Container(
                height: 99,
                width: 414,
                color: Colors.white,
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
                                image: AssetImage(images2[index]))),
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
          );
        });
  }
}

class Tnotificationlist1 extends StatelessWidget {
  const Tnotificationlist1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.40,
      child: ListView.builder(
          padding: EdgeInsets.zero,
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: images.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(2.0),
              child: GestureDetector(
                onTap: () {
                  Tnotificationdialog(context);
                },
                child: Container(
                  height: 99,
                  width: 414,
                  color: Colors.white,
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
                                  image: AssetImage(images[index]))),
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
            );
          }),
    );
  }
}

Future<dynamic> Tnotificationdialog(BuildContext context) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          insetPadding: EdgeInsets.symmetric(horizontal: 30),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0)), //this right here
          child: Container(
            height: 290,
            width: 1.sw,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Tomorrow will be holiday",
                    style: FontConstant2.k24w500331Ftext,
                  ),
                  Text(
                    "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit. Exercitation veniam consequat sunt nostrud amet.",
                    style: FontConstant.k16w4008471Text,
                  ),
                  SizedBox(height: 24),
                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 52,
                          //width: 170,
                          child: MaterialButton(
                            elevation: 0,
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                                side: BorderSide(
                                    color: ThemeColor.lightpurple, width: 1),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(94))),
                            child: Text(
                              "Close".tr(),
                              /*AppLoaclizations.of(context)!
                                  .translate("Close")
                                  .toString(),*/
                              style: FontConstant.k16w5008267Text,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: SizedBox(
                          height: 52,
                          //width: 170,
                          child: MaterialButton(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            elevation: 0,
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => TReminderScreen(),
                                ),
                              );
                            },
                            color: ThemeColor.primarycolor,
                            shape: RoundedRectangleBorder(
                                side: BorderSide(
                                    color: ThemeColor.lightpurple, width: 1),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(94))),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "assets/images/clockicon.png",
                                  height: 24,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 4,
                                ),
                                Expanded(
                                  child: Text("Add Reminder".tr(),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: FontConstant.k16w5008267Text
                                          .copyWith(color: Colors.white)),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      });
}
