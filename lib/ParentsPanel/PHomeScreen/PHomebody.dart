import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kidseau/ParentsPanel/PHomeScreen/PLearningAlphabets.dart';
import 'package:kidseau/Theme.dart';

import '../../api/models/parent_models/parent_home_models/parent_activity_home_model.dart';

class Activity extends StatefulWidget {
  ParentActivityHomeModel model;
  final int length;

  Activity({Key? key, required this.model, required this.length})
      : super(key: key);

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
    "assets/images/block 1.png",
    "assets/images/music-player 1.png",
    "assets/images/sleeping 1.png"
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      width: 1.sw,
      child: ListView.separated(
          separatorBuilder: (ctx, ind) => SizedBox(
                height: 14.h,
              ),
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          physics: NeverScrollableScrollPhysics(),
          itemCount: widget.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () {
                Get.to(() => PLearningAplphabets(
                      actId:
                          widget.model.kidAndActivity![index].actId.toString(),
                    ));
              },
              child: Container(
                height: 64,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.network(
                        widget.model.kidAndActivity![index].actIcon.toString(),
                        errorBuilder: (q, w, e) {
                          return Image.asset(
                            "assets/images/book 1.png",
                            height: 40,
                            width: 40,
                          );
                        },
                        height: 40,
                        width: 40,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              widget.model.kidAndActivity![index].actTitle
                                  .toString(),
                              style: FontConstant.k32w500blackText
                                  .copyWith(fontSize: 16),
                            ),
                            Row(
                              children: [
                                Text(
                                  widget.model.kidAndActivity![index].timing
                                      .toString(),
                                  style: FontConstant.k14w400lightpurpleText
                                      .copyWith(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14,
                                          color: Color(0xffB7A4B2)),
                                ),
                                /*SizedBox(
                                  width: 5,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  " ${widget.model.kidAndActivity![index].timing!.split('-').first} ",
                                  style: FontConstant.k14w400lightpurpleText
                                      .copyWith(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14,
                                          color: Color(0xffB7A4B2)),
                                ),
                                Text(
                                  " ${widget.model.kidAndActivity![index].timing!.split('-').last}",
                                  style: FontConstant.k14w400lightpurpleText
                                      .copyWith(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14,
                                          color: Color(0xffB7A4B2)),
                                ),*/
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
  ParentActivityHomeModel model;
  Tutorials({Key? key, required this.model}) : super(key: key);

  @override
  State<Tutorials> createState() => _TutorialsState();
}

class _TutorialsState extends State<Tutorials> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: Padding(
        padding: const EdgeInsets.only(right: 5.0, left: 5),
        child: ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return GestureDetector(
                child: Container(
                  //color: Colors.black,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(8)),
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 148,
                        width: 349,
                        child: Center(
                          child: Image.network(
                            widget.model.videoTutorial![index].vPoster
                                .toString(),
                            errorBuilder: (q, w, e) => Text("Image not loaded"),
                          ),
                        ),
                      ),
                      Text(
                        widget.model.videoTutorial![index].vTitle.toString(),
                        style: FontConstant.k16w500brownText,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset(
                                "assets/images/clock.png",
                                height: 13,
                                width: 13,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 06.0),
                                child: Text(
                                  "16 min",
                                  style: FontConstant.k14w400lightpurpleText,
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 4.0),
                            child: Text(
                              DateFormat.yMMMEd().format(DateTime.parse(widget
                                  .model.videoTutorial![index].vDate
                                  .toString())),
                              style: FontConstant.k14w400lightpurpleText,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (ctx, ind) => SizedBox(
                  width: 10,
                ),
            itemCount: widget.model.videoTutorial!.length),
      ),
    );
  }
}
