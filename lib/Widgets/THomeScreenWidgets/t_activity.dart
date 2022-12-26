import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kidseau/TeachersPanel/THomeScreen/TLearningAlphabets.dart';
import 'package:kidseau/Theme.dart';
import 'package:kidseau/Tmodel/TScheduleModel.dart';

class TActivity extends StatefulWidget {
  TScheduleModel schedule;
  TActivity({Key? key, required this.schedule}) : super(key: key);

  @override
  State<TActivity> createState() => _TActivityState();
}

class _TActivityState extends State<TActivity> {
  var title = [
    "learning Alphabets",
    "play game",
    "Sound recognization",
    "Rest"
  ];

  var groups = [
    "A",
    "B",
    "C",
    "D",
  ];

  var time = [
    "From 08:00 - 09:00 am",
    "From 09:15 - 10:00 am",
    "From 09:15 - 10:00 am",
    "From 09:15 - 10:00 am",
  ];

  // List<String> images =["assets/images/book 1.png","assets/images/block 1.png","assets/images/music-player 1.png","assets/images/sleeping 1.png"];
  var images = [
    "assets/images/book 1.png",
    "assets/images/block 1.png",
    "assets/images/music-player 1.png",
    "assets/images/sleeping 1.png"
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: 300.h,

      width: 1.sw,
      child: ListView.separated(
          separatorBuilder: (ctx, ind) => SizedBox(
                height: 14.h,
              ),
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          physics: NeverScrollableScrollPhysics(),
          itemCount: widget.schedule.schedule!.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () {
                if (index == 0) {
                  Get.to(() => TLearningAlphabets());
                } else if (index == 1) {
                } else if (index == 2) {
                } else if (index == 3) {}
              },
              child: Container(
                height: 64,
                // width: Get.size.width * 0.93,
                //margin: EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        widget.schedule.schedule![index].actIcon.toString(),
                        errorBuilder: (q, w, e) {
                          return Text('Image not loaded');
                        },
                        height: 40,
                        width: 40,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              widget.schedule.schedule![index].actTitle
                                  .toString(),
                              style: FontConstant.k32w500blackText
                                  .copyWith(fontSize: 16),
                            ),
                            Row(
                              children: [
                                Text(
                                  "From ${DateFormat.jm().format(DateFormat("hh:mm:ss").parse('${widget.schedule.schedule![index].actTimeStart}'))} ",
                                  // '${groups[index]} . ${time[index]}',
                                  style: FontConstant.k14w400lightpurpleText
                                      .copyWith(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14,
                                          color: Color(0xffB7A4B2)),
                                ),
                                Text(
                                  "To ${DateFormat.jm().format(DateFormat("hh:mm:ss").parse('${widget.schedule.schedule![index].actTimeEnd}'))} ",
                                  // '${groups[index]} . ${time[index]}',
                                  style: FontConstant.k14w400lightpurpleText
                                      .copyWith(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14,
                                          color: Color(0xffB7A4B2)),
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
    );
  }
}

class Tutorials extends StatefulWidget {
  const Tutorials({Key? key}) : super(key: key);

  @override
  State<Tutorials> createState() => _TutorialsState();
}

class _TutorialsState extends State<Tutorials> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            tutorialWidget(
                image: "assets/images/tutorial1.png",
                title: "How to add a new kid ",
                press: () {},
                minutes: "16 mins",
                hours: "2 hours ago"),
            tutorialWidget(
                image: "assets/images/Rectangle 2713.png",
                title: "How to add a new kid ",
                press: () {},
                minutes: "16 mins",
                hours: "2 hours ago"),
          ],
        ),
      ),
    );
  }
}

class tutorialWidget extends StatefulWidget {
  const tutorialWidget({
    Key? key,
    required this.image,
    required this.title,
    required this.press,
    required this.minutes,
    required this.hours,
  }) : super(key: key);
  final String image;
  final String title;
  final String minutes;
  final String hours;
  final Function press;

  @override
  State<tutorialWidget> createState() => _tutorialWidgetState();
}

class _tutorialWidgetState extends State<tutorialWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.only(left: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 148,
              width: 349,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(image: AssetImage(widget.image))),
            ),
            Text(
              widget.title,
              style: FontConstant.k16w500brownText,
            ),
            Row(
              children: [
                Image.asset(
                  "assets/images/clock.png",
                  height: 13,
                  width: 13,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 06.0),
                  child: Text(
                    widget.minutes,
                    style: FontConstant.k14w400lightpurpleText,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 4.0),
                  child: Text(
                    widget.hours,
                    style: FontConstant.k14w400lightpurpleText,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
