import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kidseau/ParentsPanel/PHomeScreen/PLearningAlphabets.dart';
import 'package:kidseau/Theme.dart';

class Activity extends StatefulWidget {
  Activity({Key? key}) : super(key: key);

  @override
  State<Activity> createState() => _ActivityState();
}

class _ActivityState extends State<Activity> {
  var title = [
    "learning Alphabets",
    "play game",
    "Sound recognization",
    "Rest"
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
    return Container(
      height: Get.size.height * 0.38,
      width: Get.size.width * 0.95,
      child: ListView.builder(
          padding: EdgeInsets.zero,
          physics: NeverScrollableScrollPhysics(),
          itemCount: images.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () {
                if (index == 0) {
                  Get.to(() => PLearningAplphabets());
                } else if (index == 1) {
                } else if (index == 2) {
                } else if (index == 3) {}
              },
              child: Padding(
                padding: const EdgeInsets.only(bottom: 15.0),
                child: Container(
                  height: 64,
                  width: Get.size.width * 0.93,
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
                          images[index],
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
                                title[index],
                                style: FontConstant.k32w500blackText
                                    .copyWith(fontSize: 16),
                              ),
                              Text(
                                time[index],
                                style: FontConstant.k14w400lightpurpleText
                                    .copyWith(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                        color: Color(0xffB7A4B2)),
                              )
                            ],
                          ),
                        ),
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
