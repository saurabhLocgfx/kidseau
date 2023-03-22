import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kidseau/ParentsPanel/PMessageScreen/PopenChats.dart';
import 'package:kidseau/Theme.dart';
import 'package:kidseau/Widgets/Calender/calendermodel.dart';
import 'package:kidseau/Widgets/buttons.dart';
import 'package:kidseau/api/models/parent_models/kid_details_models/parent_kid_overview_model.dart';
import 'package:kidseau/performance_chart/performance_chart.dart';

import '../../Constants/colors.dart';

class PKidsOverview extends StatefulWidget {
  final ParentKidOverviewModel model;
  const PKidsOverview({Key? key, required this.model}) : super(key: key);

  @override
  State<PKidsOverview> createState() => _PKidsOverviewState();
}

class _PKidsOverviewState extends State<PKidsOverview> {
  var shortnames = ["PG", "RS", "Re", "LA", "VP"];
  var fullnames = [
    "Playing Games",
    "Recognizing Sound",
    "Resting",
    "Learning Alphabets",
    "VP",
    "Voice Practice"
  ];
  List<String> _attendanceVal = [];

  List<String> imageicon = [
    "assets/images/iconprofile.png",
    "assets/images/galleryicon.png",
  ];

  List<String> items = [
    "Overview",
    "Gallery",
  ];
  @override
  void initState() {
    if (widget.model.kidDetails!.attendance!.day1 == '1') {
      _attendanceVal.add('1');
    }
    if (widget.model.kidDetails!.attendance!.day2 == '1') {
      _attendanceVal.add('1');
    }
    if (widget.model.kidDetails!.attendance!.day3 == '1') {
      _attendanceVal.add('1');
    }
    if (widget.model.kidDetails!.attendance!.day4 == '1') {
      _attendanceVal.add('1');
    }
    if (widget.model.kidDetails!.attendance!.day5 == '1') {
      _attendanceVal.add('1');
    }
    super.initState();
  }

  // final List screen = [Messagebody(),];
  final now = DateTime.now();
  int current = 0;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Info".tr(),
                style: FontConstant2.k22w5008471text,
              ),
              Stack(
                children: [
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: SizedBox(
                      width: 134,
                      child: Image.asset('assets/images/birds.png'),
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Class Section".tr(),
                            /*AppLoaclizations.of(context)!
                                  .translate("Class Section")
                                  .toString(),*/
                            style: FontConstant.k16w500331FText,
                          ),
                          //SizedBox(height: 16),
                          Text(
                            "Group".tr(),
                            style: FontConstant.k16w500331FText,
                          ),
                          //SizedBox(height: 16),
                          Text(
                            "Age".tr(),
                            style: FontConstant.k16w500331FText,
                          ),
                          //SizedBox(height: 16),
                          Text(
                            "Birthday".tr(),
                            style: FontConstant.k16w500331FText,
                          ),
                          //SizedBox(height: 16),
                          Text(
                            "Gender".tr(),
                            style: FontConstant.k16w500331FText,
                          ),
                        ],
                      ),
                      SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.model.kidDetails!.sectionName.toString(),
                            style: FontConstant.k16w5008471Text,
                          ),
                          //SizedBox(height: 16),
                          Text(
                            widget.model.kidDetails!.kidClass.toString(),
                            style: FontConstant.k16w5008471Text,
                          ),
                          //SizedBox(height: 16),
                          Text(
                            "${widget.model.kidDetails!.kidAge} ${"years old".tr()}",
                            style: FontConstant.k16w5008471Text,
                          ),
                          //SizedBox(height: 16),
                          Text(
                            DateFormat('dd-MM-yyyy')
                                .format(DateTime.parse(
                                    widget.model.kidDetails!.kidDob.toString()))
                                .toString(),
                            style: FontConstant.k16w5008471Text,
                          ),
                          //SizedBox(height: 16),
                          Text(
                            widget.model.kidDetails!.kidGender
                                        .toString()
                                        .toLowerCase() ==
                                    "m"
                                ? "Male".tr()
                                : "Female".tr(),
                            style: FontConstant.k16w5008471Text,
                          )
                        ],
                      ),
                      //Spacer(),
                    ],
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Performance".tr(),
                /*AppLoaclizations.of(context)!
                      .translate("Performance")
                      .toString(),*/
                style: FontConstant2.k22w5008471text,
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 116,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: 110.w,
                                  child: Text(
                                    "Growth Rank".tr(),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    style: FontConstant.k16w5008471Text,
                                  ),
                                ),
                                Image.asset(
                                  "assets/images/batchicon.png",
                                  height: 24,
                                )
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  '${widget.model.kidDetails!.rank}',
                                  style: FontConstant2.k32w5008267text,
                                  textAlign: TextAlign.end,
                                ),
                                Text(
                                  widget.model.kidDetails!.rank.toString() ==
                                          '1'
                                      ? 'st ${"Place".tr()}'
                                      : widget.model.kidDetails!.rank
                                                  .toString() ==
                                              '2'
                                          ? 'nd ${"Place".tr()}'
                                          : widget.model.kidDetails!.rank
                                                      .toString() ==
                                                  '3'
                                              ? 'rd ${"Place".tr()}'
                                              : 'th  ${"Place".tr()}',
                                  style: FontConstant.k16w400B7A4B2Text,
                                  textAlign: TextAlign.end,
                                ),
                              ],
                            ),
                            /*Row(
                              children: [
                                Text(
                                  widget.model.kidDetails!.rank.toString(),
                                  style: FontConstant2.k32w5008267text,
                                ),
                              ],
                            )*/
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Container(
                      height: 116,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Attendance".tr(),
                                  style: FontConstant.k16w5008471Text,
                                ),
                                Image.asset(
                                  "assets/images/bars1.png",
                                  height: 24,
                                )
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        width: 6,
                                        height: widget.model.kidDetails!
                                                        .attendance!.day1 ==
                                                    null ||
                                                widget.model.kidDetails!
                                                        .attendance!.day1 ==
                                                    '0'
                                            ? 24
                                            : 44,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(18),
                                          color: widget.model.kidDetails!
                                                          .attendance!.day1 ==
                                                      null ||
                                                  widget.model.kidDetails!
                                                          .attendance!.day1 ==
                                                      '0'
                                              ? AppColors()
                                                  .k8267AC
                                                  .withOpacity(0.2)
                                              : AppColors().k8267AC,
                                        ),
                                      ),
                                      Container(
                                        width: 6,
                                        height: widget.model.kidDetails!
                                                        .attendance!.day2 ==
                                                    null ||
                                                widget.model.kidDetails!
                                                        .attendance!.day2 ==
                                                    '0'
                                            ? 24
                                            : 44,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(18),
                                          color: widget.model.kidDetails!
                                                          .attendance!.day2 ==
                                                      null ||
                                                  widget.model.kidDetails!
                                                          .attendance!.day2 ==
                                                      '0'
                                              ? AppColors()
                                                  .k8267AC
                                                  .withOpacity(0.2)
                                              : AppColors().k8267AC,
                                        ),
                                      ),
                                      Container(
                                        width: 6,
                                        height: widget.model.kidDetails!
                                                        .attendance!.day3 ==
                                                    null ||
                                                widget.model.kidDetails!
                                                        .attendance!.day3 ==
                                                    '0'
                                            ? 24
                                            : 44,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(18),
                                          color: widget.model.kidDetails!
                                                          .attendance!.day3 ==
                                                      null ||
                                                  widget.model.kidDetails!
                                                          .attendance!.day3 ==
                                                      '0'
                                              ? AppColors()
                                                  .k8267AC
                                                  .withOpacity(0.2)
                                              : AppColors().k8267AC,
                                        ),
                                      ),
                                      Container(
                                        width: 6,
                                        height: widget.model.kidDetails!
                                                        .attendance!.day4 ==
                                                    null ||
                                                widget.model.kidDetails!
                                                        .attendance!.day4 ==
                                                    '0'
                                            ? 24
                                            : 44,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(18),
                                          color: widget.model.kidDetails!
                                                          .attendance!.day4 ==
                                                      null ||
                                                  widget.model.kidDetails!
                                                          .attendance!.day4 ==
                                                      '0'
                                              ? AppColors()
                                                  .k8267AC
                                                  .withOpacity(0.2)
                                              : AppColors().k8267AC,
                                        ),
                                      ),
                                      Container(
                                        width: 6,
                                        height: widget.model.kidDetails!
                                                        .attendance!.day5 ==
                                                    null ||
                                                widget.model.kidDetails!
                                                        .attendance!.day5 ==
                                                    '0'
                                            ? 24
                                            : 44,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(18),
                                          color: widget.model.kidDetails!
                                                          .attendance!.day5 ==
                                                      null ||
                                                  widget.model.kidDetails!
                                                          .attendance!.day5 ==
                                                      '0'
                                              ? AppColors()
                                                  .k8267AC
                                                  .withOpacity(0.2)
                                              : AppColors().k8267AC,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          "${_attendanceVal.length}/${widget.model.kidDetails!.attendance!.toJson().length}",
                                          style: FontConstant2.k24w4008267text,
                                        ),
                                        Text(
                                          "days".tr(),
                                          style: FontConstant2.k16w400B7A4text,
                                        ),
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                            /*Row(
                              children: [
                                Text(
                                  widget.model.kidDetails!.rank.toString(),
                                  style: FontConstant2.k32w5008267text,
                                ),
                              ],
                            )*/
                          ],
                        ),
                      ),
                    ),
                  ),
                  /* Expanded(
                    child: Container(
                      height: 116,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 4),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Attendance".tr(),
                                    style: FontConstant.k16w5008471Text,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        width: 6,
                                        height: widget.model.kidDetails!
                                                        .attendance!.day1 ==
                                                    null ||
                                                widget.model.kidDetails!
                                                        .attendance!.day1 ==
                                                    '0'
                                            ? 24
                                            : 44,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(18),
                                          color: widget.model.kidDetails!
                                                          .attendance!.day1 ==
                                                      null ||
                                                  widget.model.kidDetails!
                                                          .attendance!.day1 ==
                                                      '0'
                                              ? AppColors()
                                                  .k8267AC
                                                  .withOpacity(0.2)
                                              : AppColors().k8267AC,
                                        ),
                                      ),
                                      Container(
                                        width: 6,
                                        height: widget.model.kidDetails!
                                                        .attendance!.day2 ==
                                                    null ||
                                                widget.model.kidDetails!
                                                        .attendance!.day2 ==
                                                    '0'
                                            ? 24
                                            : 44,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(18),
                                          color: widget.model.kidDetails!
                                                          .attendance!.day2 ==
                                                      null ||
                                                  widget.model.kidDetails!
                                                          .attendance!.day2 ==
                                                      '0'
                                              ? AppColors()
                                                  .k8267AC
                                                  .withOpacity(0.2)
                                              : AppColors().k8267AC,
                                        ),
                                      ),
                                      Container(
                                        width: 6,
                                        height: widget.model.kidDetails!
                                                        .attendance!.day3 ==
                                                    null ||
                                                widget.model.kidDetails!
                                                        .attendance!.day3 ==
                                                    '0'
                                            ? 24
                                            : 44,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(18),
                                          color: widget.model.kidDetails!
                                                          .attendance!.day3 ==
                                                      null ||
                                                  widget.model.kidDetails!
                                                          .attendance!.day3 ==
                                                      '0'
                                              ? AppColors()
                                                  .k8267AC
                                                  .withOpacity(0.2)
                                              : AppColors().k8267AC,
                                        ),
                                      ),
                                      Container(
                                        width: 6,
                                        height: widget.model.kidDetails!
                                                        .attendance!.day4 ==
                                                    null ||
                                                widget.model.kidDetails!
                                                        .attendance!.day4 ==
                                                    '0'
                                            ? 24
                                            : 44,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(18),
                                          color: widget.model.kidDetails!
                                                          .attendance!.day4 ==
                                                      null ||
                                                  widget.model.kidDetails!
                                                          .attendance!.day4 ==
                                                      '0'
                                              ? AppColors()
                                                  .k8267AC
                                                  .withOpacity(0.2)
                                              : AppColors().k8267AC,
                                        ),
                                      ),
                                      Container(
                                        width: 6,
                                        height: widget.model.kidDetails!
                                                        .attendance!.day5 ==
                                                    null ||
                                                widget.model.kidDetails!
                                                        .attendance!.day5 ==
                                                    '0'
                                            ? 24
                                            : 44,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(18),
                                          color: widget.model.kidDetails!
                                                          .attendance!.day5 ==
                                                      null ||
                                                  widget.model.kidDetails!
                                                          .attendance!.day5 ==
                                                      '0'
                                              ? AppColors()
                                                  .k8267AC
                                                  .withOpacity(0.2)
                                              : AppColors().k8267AC,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 3,
                            ),
                            Expanded(
                              child: Column(
                                 mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Image.asset(
                                        "assets/images/bars1.png",
                                        height: 24,
                                      )
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${_attendanceVal.length}/${widget.model.kidDetails!.attendance!.toJson().length}",
                                        style: FontConstant2.k24w4008267text,
                                      ),
                                      Text(
                                        "days".tr(),
                                        style: FontConstant2.k16w400B7A4text,
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
                  ),*/
                ],
              ),
            ],
          ),
          SizedBox(height: 16),
          widget.model.kidDetails!.actvity!.isEmpty
              ? Center(
                  child: Text(
                    "No activity available for the kid.".tr(),
                    style: FontConstant.k16w5008471Text,
                  ),
                )
              : Container(
                  height: 250,
                  width: 1.sw,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16)),
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Activity Tracker".tr(),
                            style: FontConstant.k16w5008471Text,
                          ),
                          Image.asset(
                            "assets/images/bar3.png",
                            height: 24,
                          )
                        ],
                      ),
                      // SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          /*Expanded(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                "75%",
                                style: FontConstant.k14w400B7A4Text,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "50%",
                                style: FontConstant.k14w400B7A4Text,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "10%",
                                style: FontConstant.k14w400B7A4Text,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "100%",
                                style: FontConstant.k14w400B7A4Text,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "5%",
                                style: FontConstant.k14w400B7A4Text,
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Column(
                                children: [
                                  Stack(
                                    children: [
                                      Container(
                                        height: 110.h,
                                        width: 6.w,
                                        decoration: BoxDecoration(
                                            color: Color(0xff8267AC)
                                                .withOpacity(0.28),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(12))),
                                      ),
                                      Positioned(
                                        bottom: 0,
                                        child: Container(
                                          height: 82.h,
                                          width: 6.w,
                                          decoration: BoxDecoration(
                                              color: Color(0xff8267AC),
                                              borderRadius:
                                                  BorderRadius.all(
                                                      Radius.circular(12))),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    "PG",
                                    style: FontConstant.k14w400B7A4Text,
                                  )
                                ],
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Column(
                                children: [
                                  Stack(
                                    children: [
                                      Container(
                                        height: 110.h,
                                        width: 6.w,
                                        decoration: BoxDecoration(
                                            color: Color(0xff8267AC)
                                                .withOpacity(0.28),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(12))),
                                      ),
                                      Positioned(
                                        bottom: 0,
                                        child: Container(
                                          height: 55.h,
                                          width: 6.w,
                                          decoration: BoxDecoration(
                                              color: Color(0xff8267AC),
                                              borderRadius:
                                                  BorderRadius.all(
                                                      Radius.circular(12))),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    "RS",
                                    style: FontConstant.k14w400B7A4Text,
                                  )
                                ],
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Column(
                                children: [
                                  Stack(
                                    children: [
                                      Container(
                                        height: 110.h,
                                        width: 6.w,
                                        decoration: BoxDecoration(
                                            color: Color(0xff8267AC)
                                                .withOpacity(0.28),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(12))),
                                      ),
                                      Positioned(
                                        bottom: 0,
                                        child: Container(
                                          height: 11.h,
                                          width: 6.w,
                                          decoration: BoxDecoration(
                                              color: Color(0xff8267AC),
                                              borderRadius:
                                                  BorderRadius.all(
                                                      Radius.circular(12))),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    "Re",
                                    style: FontConstant.k14w400B7A4Text,
                                  )
                                ],
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Column(
                                children: [
                                  Stack(
                                    children: [
                                      Container(
                                        height: 110.h,
                                        width: 6.w,
                                        decoration: BoxDecoration(
                                            color: Color(0xff8267AC)
                                                .withOpacity(0.28),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(12))),
                                      ),
                                      Positioned(
                                        bottom: 0,
                                        child: Container(
                                          height: 110.h,
                                          width: 6.w,
                                          decoration: BoxDecoration(
                                              color: Color(0xff8267AC),
                                              borderRadius:
                                                  BorderRadius.all(
                                                      Radius.circular(12))),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    "LA",
                                    style: FontConstant.k14w400B7A4Text,
                                  )
                                ],
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Column(
                                children: [
                                  Stack(
                                    children: [
                                      Container(
                                        height: 110.h,
                                        width: 6.w,
                                        decoration: BoxDecoration(
                                            color: Color(0xff8267AC)
                                                .withOpacity(0.28),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(12))),
                                      ),
                                      Positioned(
                                        bottom: 0,
                                        child: Container(
                                          height: 5.h,
                                          width: 6.w,
                                          decoration: BoxDecoration(
                                              color: Color(0xff8267AC),
                                              borderRadius:
                                                  BorderRadius.all(
                                                      Radius.circular(12))),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    "VP",
                                    style: FontConstant.k14w400B7A4Text,
                                  )
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),*/
                          SizedBox(
                            width: 1.sw / 2,
                            height: 180,
                            child: BarChartSample1(
                                activityList:
                                    widget.model.kidDetails!.actvity ?? []),
                          ),
                          Expanded(
                            //height: 140,
                            //width: 1.sw / 2,
                            child: ListView.builder(
                                shrinkWrap: true,
                                padding: EdgeInsets.zero,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount:
                                    widget.model.kidDetails!.actvity!.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Row(
                                    children: [
                                      Text(
                                          widget.model.kidDetails!
                                                  .actvity![index].actName![0]
                                                  .toUpperCase() +
                                              widget.model.kidDetails!
                                                  .actvity![index].actName![1]
                                                  .toUpperCase(),
                                          style: FontConstant.k14w4008471Text
                                              .copyWith(
                                                  color: Color(0xff331F2D))),
                                      SizedBox(width: 10),
                                      Icon(
                                        Icons.circle,
                                        size: 4,
                                        color: Color(0xff84717F),
                                      ),
                                      SizedBox(width: 10),
                                      Text(
                                          widget.model.kidDetails!
                                              .actvity![index].actName!,
                                          style: FontConstant.k12w5008471Text),
                                    ],
                                  );
                                }),
                          )
                        ],
                      )
                    ],
                  ),
                ),
          SizedBox(height: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Attendance".tr(),
                style: FontConstant2.k22w5008471text,
              ),
              SizedBox(height: 10),
              Column(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 150.w,
                        child: Text(
                          "Working Days".tr(),
                          style: FontConstant.k16w500331FText,
                        ),
                      ),
                      Text(
                        "${widget.model.kidDetails!.workingDay} ${"days".tr()}",
                        style: FontConstant.k16w5008471Text,
                      )
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      SizedBox(
                        width: 150.w,
                        child: Text(
                          "Attended days".tr(),
                          style: FontConstant.k16w500331FText,
                        ),
                      ),
                      Text(
                        "${widget.model.kidDetails!.kidAttendDay} ${"days".tr()}",
                        style: FontConstant.k16w5008471Text,
                      )
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      SizedBox(
                        width: 150.w,
                        child: Text(
                          "Holidays".tr(),
                          style: FontConstant.k16w500331FText,
                        ),
                      ),
                      Text(
                        "${widget.model.kidDetails!.holiDay} ${"days".tr()}",
                        style: FontConstant.k16w5008471Text,
                      )
                    ],
                  ),
                ],
              )
            ],
          ),
          SizedBox(height: 16),
          SizedBox(
            height: 52,
            width: 1.sw,
            child: MaterialButton(
              elevation: 0,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30))),
              onPressed: () {
                showDialog(context: context, builder: (_) => CalendarPage3());
              },
              child: Center(
                child: Text(
                  "Open Calendar".tr(),
                  style: FontConstant.k18w500materialbuttonText
                      .copyWith(color: ThemeColor.primarycolor),
                ),
              ),
            ),
          ),
          SizedBox(height: 32),
          SizedBox(
              height: 52,
              width: 1.sw,
              child: MainButton(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (ctx) => POpenChats(
                            userId: widget
                                .model.kidDetails!.teacherDetails!.teacherId
                                .toString(),
                            userType: widget
                                .model.kidDetails!.teacherDetails!.type
                                .toString(),
                            onPop: () {},
                            profilePic: widget
                                .model.kidDetails!.teacherDetails!.teacherImage
                                .toString(),
                            name: widget
                                .model.kidDetails!.teacherDetails!.teacherName
                                .toString(),
                            language: widget
                                .model.kidDetails!.teacherDetails!.lang
                                .toString())));
                  },
                  title: "Talk to class teacher".tr(),
                  textStyleColor: Colors.white,
                  backgroundColor: ThemeColor.primarycolor)),
          SizedBox(
            height: 52,
          )
        ],
      ),
    );
  }
}
