import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kidseau/Constants/colors.dart';
import 'package:kidseau/api/Teacherpanelapi/teacher_student_performance_apis/student_detail_api.dart';
import 'package:kidseau/api/models/kid_detail_model/kid_performance_detail_model.dart';
import 'package:kidseau/shard_prefs/shared_prefs.dart';

import '../../Theme.dart';
import '../../Widgets/Calender/calendermodel.dart';
import '../../Widgets/buttons.dart';

class TStudentDetailScreen extends StatefulWidget {
  final String kidId;
  const TStudentDetailScreen({Key? key, required this.kidId}) : super(key: key);

  @override
  State<TStudentDetailScreen> createState() => _TStudentDetailScreenState();
}

class _TStudentDetailScreenState extends State<TStudentDetailScreen> {
  List<String> imageicon = [
    "assets/images/iconprofile.png",
    "assets/images/galleryicon.png",
  ];

  List<String> items = [
    "Overview",
    "Gallery",
  ];
  // final List screen = [Messagebody(),];
  int selectedIndex = 0;

  final controller = PageController(initialPage: 1);

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    print(widget.kidId);
    _isArabic = UserPrefs.getArbBool() ?? false;
    _getDetails();
    super.initState();
  }

  KidPerformanceDetailModel model = KidPerformanceDetailModel();

  List<String> _attendanceVal = [];
  bool _isLoading = false;
  _getDetails() {
    _isLoading = true;
    final resp = TStudentDetailAPi().get(kidId: widget.kidId);
    resp.then((value) {
      if (value['status'] == 1) {
        setState(() {
          model = KidPerformanceDetailModel.fromJson(value);
          if (model.attendance!.day1 == '1') {
            _attendanceVal.add('1');
          }
          if (model.attendance!.day2 == '1') {
            _attendanceVal.add('1');
          }
          if (model.attendance!.day3 == '1') {
            _attendanceVal.add('1');
          }
          if (model.attendance!.day4 == '1') {
            _attendanceVal.add('1');
          }
          if (model.attendance!.day5 == '1') {
            _attendanceVal.add('1');
          }
          _isLoading = false;
        });
      } else {
        setState(() {
          _isLoading = false;
        });
      }
    });
  }

  final PageController _pageController = PageController(
    initialPage: 0,
  );

  bool _isArabic = false;
  int pageIndex = 0;
  var shortnames = ["PG", "RS", "Re", "LA", "VP"];
  var fullnames = [
    "Playing Games",
    "Recognizing Sound",
    "Resting",
    "Learning Alphabets",
    "VP",
    "Voice Practice"
  ];

  List<String> imageicon2 = [
    "assets/images/iconprofile.png",
    "assets/images/galleryicon.png",
  ];

  List<String> items2 = [
    "Overview",
    "Gallery",
  ];
  // final List screen = [Messagebody(),];
  final now = DateTime.now();
  int current = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Color(0xffF8F6FA),
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
              statusBarColor: ThemeColor.lightpurple.withOpacity(0.06),
            ),
            backgroundColor: Color(0xff8267AC).withOpacity(0.06),
            centerTitle: false,
            leading: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Image.asset(
                      "assets/images/backarrow.png",
                      height: 24,
                      width: 24,
                    ),
                  ),
                ),
              ],
            ),
            title: GestureDetector(
              onTap: () {},
              child: Text(
                "Kid’s Profile".tr(),
                style: FontConstant.k18w5008471Text,
              ),
            ),
          ),
          body: _isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                  child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                              "assets/images/Group8270.png",
                            ),
                            fit: BoxFit.cover)),
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color(0xffF8F6FA).withOpacity(0.7),
                            Color(0xffF8F6FA),
                            Color(0xffF8F6FA),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          stops: [0.3, 0.6, 0.9],
                        ),
                      ),
                      child: Stack(
                        children: [
                          Container(
                            width: 1.sw,
                          ),
                          Container(
                            width: 1.sw,
                            height: 455,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Column(
                              children: [
                                SizedBox(height: 30),
                                Row(
                                  children: [
                                    Container(
                                      height: 128,
                                      width: 96,
                                      child: Image.network(
                                        model.kidImage.toString(),
                                        fit: BoxFit.fitHeight,
                                        errorBuilder: (q, w, e) => Image.asset(
                                            "assets/images/profileperson.png"),
                                      ),
                                    ),
                                    SizedBox(width: 16),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          model.kidName.toString(),
                                          style: FontConstant2.k32w500331Ftext,
                                        ),
                                        Text(
                                          model.kidGender!.toLowerCase() == 'm'
                                              ? 'S/O ${model.kidFather}'
                                              : 'D/O ${model.kidFather}',
                                          style: FontConstant.k16w5008471Text,
                                        ),
                                        Row(
                                          children: [
                                            Text(model.kidGroup.toString(),
                                                style: FontConstant
                                                    .k16w5008471Text),
                                            SizedBox(
                                              width: 4,
                                            ),
                                            Container(
                                              width: 4,
                                              height: 4,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Colors.black),
                                            ),
                                            SizedBox(
                                              width: 4,
                                            ),
                                            Text(
                                                '${model.kidAge} ${"years".tr()}',
                                                style: FontConstant
                                                    .k16w5008471Text),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(height: 20),
                                Column(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "info".tr(),
                                              style:
                                                  FontConstant2.k22w5008471text,
                                            ),
                                            Stack(
                                              children: [
                                                _isArabic
                                                    ? SizedBox.shrink()
                                                    : Positioned(
                                                        bottom: 0,
                                                        right: 0,
                                                        child: SizedBox(
                                                          width: 134,
                                                          child: Image.asset(
                                                              'assets/images/birds.png'),
                                                        ),
                                                      ),
                                                Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: [
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          "Class Section".tr(),
                                                          style: FontConstant
                                                              .k16w500331FText,
                                                        ),
                                                        SizedBox(height: 16),
                                                        Text(
                                                          "Group".tr(),
                                                          style: FontConstant
                                                              .k16w500331FText,
                                                        ),
                                                        SizedBox(height: 16),
                                                        Text(
                                                          "Age".tr(),
                                                          style: FontConstant
                                                              .k16w500331FText,
                                                        ),
                                                        SizedBox(height: 16),
                                                        Text(
                                                          "Birthday".tr(),
                                                          style: FontConstant
                                                              .k16w500331FText,
                                                        ),
                                                        SizedBox(height: 16),
                                                        Text(
                                                          "Gender".tr(),
                                                          style: FontConstant
                                                              .k16w500331FText,
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(width: 16),
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          model.kidSection
                                                              .toString(),
                                                          style: FontConstant
                                                              .k16w5008471Text,
                                                        ),
                                                        SizedBox(height: 16),
                                                        Text(
                                                          model.kidGroup
                                                              .toString(),
                                                          style: FontConstant
                                                              .k16w5008471Text,
                                                        ),
                                                        SizedBox(height: 16),
                                                        Text(
                                                          '${model.kidAge} ${"years".tr()}',
                                                          style: FontConstant
                                                              .k16w5008471Text,
                                                        ),
                                                        SizedBox(height: 16),
                                                        Text(
                                                          model.kidDob
                                                              .toString(),
                                                          style: FontConstant
                                                              .k16w5008471Text,
                                                        ),
                                                        SizedBox(height: 16),
                                                        Text(
                                                          model.kidGender
                                                                      .toString() ==
                                                                  "M"
                                                              ? "Male".tr()
                                                              : "Female".tr(),
                                                          style: FontConstant
                                                              .k16w5008471Text,
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
                                      ],
                                    ),
                                    SizedBox(height: 20),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Performance".tr(),
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
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16)),
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 16.0),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Expanded(
                                                              child: Text(
                                                            "Growth Rank".tr(),
                                                            style: FontConstant
                                                                .k16w5008471Text,
                                                          )),
                                                          Image.asset(
                                                            "assets/images/batchicon.png",
                                                            height: 24,
                                                          )
                                                        ],
                                                      ),
                                                      Row(
                                                        children: [
                                                          Text(
                                                            model.rank
                                                                .toString(),
                                                            style: FontConstant2
                                                                .k32w5008267text,
                                                          ),
                                                        ],
                                                      )
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
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16)),
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 16.0,
                                                      vertical: 4),
                                                  child: Row(
                                                    children: [
                                                      Expanded(
                                                        flex: 2,
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              "Attendance".tr(),
                                                              style: FontConstant
                                                                  .k16w5008471Text,
                                                            ),
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Container(
                                                                  width: 6,
                                                                  height: model.attendance!.day1 ==
                                                                              null ||
                                                                          model.attendance!.day1 ==
                                                                              '0'
                                                                      ? 24
                                                                      : 44,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            18),
                                                                    color: model.attendance!.day1 ==
                                                                                null ||
                                                                            model.attendance!.day1 ==
                                                                                '0'
                                                                        ? AppColors()
                                                                            .k8267AC
                                                                            .withOpacity(
                                                                                0.2)
                                                                        : AppColors()
                                                                            .k8267AC,
                                                                  ),
                                                                ),
                                                                Container(
                                                                  width: 6,
                                                                  height: model.attendance!.day2 ==
                                                                              null ||
                                                                          model.attendance!.day2 ==
                                                                              '0'
                                                                      ? 24
                                                                      : 44,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            18),
                                                                    color: model.attendance!.day2 ==
                                                                                null ||
                                                                            model.attendance!.day2 ==
                                                                                '0'
                                                                        ? AppColors()
                                                                            .k8267AC
                                                                            .withOpacity(
                                                                                0.2)
                                                                        : AppColors()
                                                                            .k8267AC,
                                                                  ),
                                                                ),
                                                                Container(
                                                                  width: 6,
                                                                  height: model.attendance!.day3 ==
                                                                              null ||
                                                                          model.attendance!.day3 ==
                                                                              '0'
                                                                      ? 24
                                                                      : 44,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            18),
                                                                    color: model.attendance!.day3 ==
                                                                                null ||
                                                                            model.attendance!.day3 ==
                                                                                '0'
                                                                        ? AppColors()
                                                                            .k8267AC
                                                                            .withOpacity(
                                                                                0.2)
                                                                        : AppColors()
                                                                            .k8267AC,
                                                                  ),
                                                                ),
                                                                Container(
                                                                  width: 6,
                                                                  height: model.attendance!.day4 ==
                                                                              null ||
                                                                          model.attendance!.day4 ==
                                                                              '0'
                                                                      ? 24
                                                                      : 44,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            18),
                                                                    color: model.attendance!.day4 ==
                                                                                null ||
                                                                            model.attendance!.day4 ==
                                                                                '0'
                                                                        ? AppColors()
                                                                            .k8267AC
                                                                            .withOpacity(
                                                                                0.2)
                                                                        : AppColors()
                                                                            .k8267AC,
                                                                  ),
                                                                ),
                                                                Container(
                                                                  width: 6,
                                                                  height: model.attendance!.day5 ==
                                                                              null ||
                                                                          model.attendance!.day5 ==
                                                                              '0'
                                                                      ? 24
                                                                      : 44,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            18),
                                                                    color: model.attendance!.day5 ==
                                                                                null ||
                                                                            model.attendance!.day5 ==
                                                                                '0'
                                                                        ? AppColors()
                                                                            .k8267AC
                                                                            .withOpacity(
                                                                                0.2)
                                                                        : AppColors()
                                                                            .k8267AC,
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
                                                          /*mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,*/
                                                          children: [
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Image.asset(
                                                                  "assets/images/bars1.png",
                                                                  height: 24,
                                                                )
                                                              ],
                                                            ),
                                                            Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  "${_attendanceVal.length}/${model.attendance!.toJson().length}",
                                                                  style: FontConstant2
                                                                      .k24w4008267text,
                                                                ),
                                                                Text(
                                                                  "days".tr(),
                                                                  style: FontConstant2
                                                                      .k16w400B7A4text,
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
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 16),
                                    Container(
                                      /*height: 190.h,
                          width: 392.w,*/
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(16)),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 16.0, vertical: 5),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "Activity Tracker".tr(),
                                                  style: FontConstant
                                                      .k16w5008471Text,
                                                ),
                                                Image.asset(
                                                  "assets/images/bar3.png",
                                                  height: 24,
                                                )
                                              ],
                                            ),
                                            SizedBox(height: 15),
                                            Row(
                                              children: [
                                                Expanded(
                                                  child: Column(
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Text(
                                                            "75%",
                                                            style: FontConstant
                                                                .k14w400B7A4Text,
                                                          ),
                                                          SizedBox(
                                                            width: 5,
                                                          ),
                                                          Text(
                                                            "50%",
                                                            style: FontConstant
                                                                .k14w400B7A4Text,
                                                          ),
                                                          SizedBox(
                                                            width: 5,
                                                          ),
                                                          Text(
                                                            "10%",
                                                            style: FontConstant
                                                                .k14w400B7A4Text,
                                                          ),
                                                          SizedBox(
                                                            width: 5,
                                                          ),
                                                          Text(
                                                            "100%",
                                                            style: FontConstant
                                                                .k14w400B7A4Text,
                                                          ),
                                                          SizedBox(
                                                            width: 5,
                                                          ),
                                                          Text(
                                                            "5%",
                                                            style: FontConstant
                                                                .k14w400B7A4Text,
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
                                                                    height:
                                                                        110.h,
                                                                    width: 6.w,
                                                                    decoration: BoxDecoration(
                                                                        color: Color(0xff8267AC).withOpacity(
                                                                            0.28),
                                                                        borderRadius:
                                                                            BorderRadius.all(Radius.circular(12))),
                                                                  ),
                                                                  Positioned(
                                                                    bottom: 0,
                                                                    child:
                                                                        Container(
                                                                      height:
                                                                          82.h,
                                                                      width:
                                                                          6.w,
                                                                      decoration: BoxDecoration(
                                                                          color: Color(
                                                                              0xff8267AC),
                                                                          borderRadius:
                                                                              BorderRadius.all(Radius.circular(12))),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Text(
                                                                "PG",
                                                                style: FontConstant
                                                                    .k14w400B7A4Text,
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
                                                                    height:
                                                                        110.h,
                                                                    width: 6.w,
                                                                    decoration: BoxDecoration(
                                                                        color: Color(0xff8267AC).withOpacity(
                                                                            0.28),
                                                                        borderRadius:
                                                                            BorderRadius.all(Radius.circular(12))),
                                                                  ),
                                                                  Positioned(
                                                                    bottom: 0,
                                                                    child:
                                                                        Container(
                                                                      height:
                                                                          55.h,
                                                                      width:
                                                                          6.w,
                                                                      decoration: BoxDecoration(
                                                                          color: Color(
                                                                              0xff8267AC),
                                                                          borderRadius:
                                                                              BorderRadius.all(Radius.circular(12))),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Text(
                                                                "RS",
                                                                style: FontConstant
                                                                    .k14w400B7A4Text,
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
                                                                    height:
                                                                        110.h,
                                                                    width: 6.w,
                                                                    decoration: BoxDecoration(
                                                                        color: Color(0xff8267AC).withOpacity(
                                                                            0.28),
                                                                        borderRadius:
                                                                            BorderRadius.all(Radius.circular(12))),
                                                                  ),
                                                                  Positioned(
                                                                    bottom: 0,
                                                                    child:
                                                                        Container(
                                                                      height:
                                                                          11.h,
                                                                      width:
                                                                          6.w,
                                                                      decoration: BoxDecoration(
                                                                          color: Color(
                                                                              0xff8267AC),
                                                                          borderRadius:
                                                                              BorderRadius.all(Radius.circular(12))),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Text(
                                                                "Re",
                                                                style: FontConstant
                                                                    .k14w400B7A4Text,
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
                                                                    height:
                                                                        110.h,
                                                                    width: 6.w,
                                                                    decoration: BoxDecoration(
                                                                        color: Color(0xff8267AC).withOpacity(
                                                                            0.28),
                                                                        borderRadius:
                                                                            BorderRadius.all(Radius.circular(12))),
                                                                  ),
                                                                  Positioned(
                                                                    bottom: 0,
                                                                    child:
                                                                        Container(
                                                                      height:
                                                                          110.h,
                                                                      width:
                                                                          6.w,
                                                                      decoration: BoxDecoration(
                                                                          color: Color(
                                                                              0xff8267AC),
                                                                          borderRadius:
                                                                              BorderRadius.all(Radius.circular(12))),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Text(
                                                                "LA",
                                                                style: FontConstant
                                                                    .k14w400B7A4Text,
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
                                                                    height:
                                                                        110.h,
                                                                    width: 6.w,
                                                                    decoration: BoxDecoration(
                                                                        color: Color(0xff8267AC).withOpacity(
                                                                            0.28),
                                                                        borderRadius:
                                                                            BorderRadius.all(Radius.circular(12))),
                                                                  ),
                                                                  Positioned(
                                                                    bottom: 0,
                                                                    child:
                                                                        Container(
                                                                      height:
                                                                          5.h,
                                                                      width:
                                                                          6.w,
                                                                      decoration: BoxDecoration(
                                                                          color: Color(
                                                                              0xff8267AC),
                                                                          borderRadius:
                                                                              BorderRadius.all(Radius.circular(12))),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Text(
                                                                "VP",
                                                                style: FontConstant
                                                                    .k14w400B7A4Text,
                                                              )
                                                            ],
                                                          ),
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(width: 8),
                                                Expanded(
                                                  child: SizedBox(
                                                    // height: 140,
                                                    child: ListView.builder(
                                                        shrinkWrap: true,
                                                        padding:
                                                            EdgeInsets.zero,
                                                        physics:
                                                            NeverScrollableScrollPhysics(),
                                                        itemCount:
                                                            shortnames.length,
                                                        itemBuilder:
                                                            (BuildContext
                                                                    context,
                                                                int index) {
                                                          return Row(
                                                            children: [
                                                              Text(
                                                                  shortnames[
                                                                      index],
                                                                  style: FontConstant
                                                                      .k14w4008471Text
                                                                      .copyWith(
                                                                          color:
                                                                              Color(0xff331F2D))),
                                                              SizedBox(
                                                                  width: 5),
                                                              Icon(
                                                                Icons.circle,
                                                                size: 4,
                                                                color: Color(
                                                                    0xff84717F),
                                                              ),
                                                              SizedBox(
                                                                  width: 5),
                                                              Expanded(
                                                                child: Text(
                                                                    fullnames[
                                                                            index]
                                                                        .tr(),
                                                                    /* AppLoaclizations.of(
                                                                context)!
                                                            .translate(
                                                                fullnames[index])
                                                            .toString(),*/
                                                                    style: FontConstant
                                                                        .k12w5008471Text),
                                                              ),
                                                            ],
                                                          );
                                                        }),
                                                  ),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 16),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                                  width: 200,
                                                  child: Text(
                                                    "Working Days".tr(),
                                                    /*AppLoaclizations.of(context)!
                                            .translate("Working Days")
                                            .toString(),*/
                                                    style: FontConstant
                                                        .k16w500331FText,
                                                  ),
                                                ),
                                                SizedBox(width: 16),
                                                Text(
                                                  "${model.workingDay} ${'days'.tr()}",
                                                  style: FontConstant
                                                      .k16w5008471Text,
                                                )
                                              ],
                                            ),
                                            SizedBox(height: 10),
                                            Row(
                                              children: [
                                                SizedBox(
                                                  width: 200,
                                                  child: Text(
                                                    "Attended days".tr(),
                                                    /*AppLoaclizations.of(context)!
                                            .translate("Attended days")
                                            .toString(),*/
                                                    style: FontConstant
                                                        .k16w500331FText,
                                                  ),
                                                ),
                                                SizedBox(width: 16),
                                                Text(
                                                  "${model.kidAttendDay} ${'days'.tr()}",
                                                  style: FontConstant
                                                      .k16w5008471Text,
                                                )
                                              ],
                                            ),
                                            SizedBox(height: 10),
                                            Row(
                                              children: [
                                                SizedBox(
                                                  width: 200,
                                                  child: Text(
                                                    "Holidays".tr(),
                                                    /*AppLoaclizations.of(context)!
                                            .translate("Working Days")
                                            .toString(),*/
                                                    style: FontConstant
                                                        .k16w500331FText,
                                                  ),
                                                ),
                                                SizedBox(width: 16),
                                                Text(
                                                  "${model.holiDay} ${'days'.tr()}",
                                                  style: FontConstant
                                                      .k16w5008471Text,
                                                )
                                              ],
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                    SizedBox(height: 16),
                                    SizedBox(
                                      height: 52.h,
                                      width: 382.w,
                                      child: MaterialButton(
                                        elevation: 0,
                                        color: Colors.white,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(30))),
                                        onPressed: () {
                                          showDialog(
                                            context: context,
                                            builder: (_) => CalendarPage2(),
                                          );
                                        },
                                        child: Center(
                                          child: Text(
                                            "Open Calendar".tr(),
                                            /* AppLoaclizations.of(context)!
                                    .translate("Open Calendar")
                                    .toString(),*/
                                            style: FontConstant
                                                .k18w500materialbuttonText
                                                .copyWith(
                                                    color: ThemeColor
                                                        .primarycolor),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 32),
                                    SizedBox(
                                        height: 52.h,
                                        width: 382.w,
                                        child: MainButton(
                                            onTap: () {},
                                            title: "Edit".tr(),
                                            textStyleColor: Colors.white,
                                            backgroundColor:
                                                ThemeColor.primarycolor)),
                                    SizedBox(
                                      height: 52,
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
        ));
  }
}
