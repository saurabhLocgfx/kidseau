import 'dart:developer';
import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
import 'package:kidseau/ParentsPanel/KidsDashboard/KidsDashboard.dart';
import 'package:kidseau/ParentsPanel/PHomeScreen/PHomebody.dart';
import 'package:kidseau/ParentsPanel/PHomeScreen/parent_all_schedule_screen.dart';
import 'package:kidseau/ParentsPanel/PReminderScreen/PReminderScreen.dart';
import 'package:kidseau/Theme.dart';
import 'package:kidseau/api/models/Tschedule_detail_model.dart';
import 'package:kidseau/api/models/parent_models/parent_home_models/parent_kid_home_model.dart';
import 'package:kidseau/api/parent_panel_apis/parent_dashboard_api/parent_activity_home_api.dart';
import 'package:kidseau/api/parent_panel_apis/parent_dashboard_api/parent_kid_api.dart';
import 'package:kidseau/shard_prefs/shared_prefs.dart';

import '../../Constants/colors.dart';
import '../../TeachersPanel/THomeScreen/TScheduleScreen.dart';
import '../../TeachersPanel/TReminder/TReminderScreen.dart';
import '../../api/models/parent_models/parent_home_models/parent_activity_home_model.dart';
import '../../restartappwidget/restartwidgets.dart';

class PHomeScreen extends StatefulWidget {
  PHomeScreen({Key? key}) : super(key: key);

  @override
  State<PHomeScreen> createState() => _PHomeScreenState();
}

class _PHomeScreenState extends State<PHomeScreen> {
  final CarouselController _controller = CarouselController();

  bool colorChange = false;
  bool Ezarabic = false;

  @override
  void initState() {
    _getData();

    // cookie = UserPrefs.getCookies()!;
    super.initState();
  }

  // String cookie = '';
  bool _isLoading = false;
  _getData() {
    _isLoading = true;
    final resp = ParentKidApi().get();
    resp.then((value) {
      log(value.toString());
      if (value['status'] == 1) {
        setState(() {
          _kidModel = ParentKidHomeModel.fromJson(value);
        });
        // _isLoading = false;
      } else {
        setState(() {
          _isLoading = false;
        });
      }
    }).then((value) {
      _getActivity(_kidModel.parentKidId![0].kidId.toString());
    });
  }

  bool _isActivityLoading = false;

  ParentActivityHomeModel _activityModel = ParentActivityHomeModel();
  _getActivity(String kidId) {
    final resp = ParentActivityHomeApi().get(kidId: kidId);
    resp.then((value) {
      if (value['status'] == 1) {
        setState(() {
          _activityModel = ParentActivityHomeModel.fromJson(value);
          _countLength();
          _isLoading = false;
          _isActivityLoading = false;
        });
      } else {
        setState(() {
          _isLoading = false;
          _isActivityLoading = false;
        });
      }
    });
  }

  int length = 0;
  _countLength() {
    setState(() {
      if (_activityModel.kidAndActivity!.isEmpty) {
        length = _activityModel.kidAndActivity!.length;
      } else {
        if (_activityModel.kidAndActivity!.length > 4) {
          length = 4;
        } else {
          length = _activityModel.kidAndActivity!.length;
        }
      }
      log(length.toString());
    });
  }

  // int _index = 0;
  ParentKidHomeModel _kidModel = ParentKidHomeModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors().bgColor,
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
        backgroundColor: Color(0xff8267AC).withAlpha(16),
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Text("${"Hello".tr()} ${_activityModel.greet ?? ''}",
                  overflow: TextOverflow.ellipsis,
                  style: FontConstant2.k32w5008267text.copyWith(fontSize: 20)),
            ),
          ],
        ),
        actions: [
          SizedBox(
            width: 158,
            child: Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: PopupMenuButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16)),
                          itemBuilder: (context) {
                            return [
                              PopupMenuItem(
                                enabled: true,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        UserPrefs.setEArbBool(false);
                                        context.locale = Locale('en', 'US');
                                        RestartWidget.restartApp(context);
                                        setState(() {
                                          colorChange;
                                        });
                                      },
                                      child: Row(
                                        children: [
                                          Text(
                                            ("English".tr()),
                                            style: colorChange
                                                ? FontConstant.k16w5008267Text
                                                : FontConstant.k18w5008471Text,
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 20),
                                    GestureDetector(
                                      onTap: () {
                                        UserPrefs.setEArbBool(false);
                                        context.locale = Locale('fr', 'FR');
                                        RestartWidget.restartApp(context);
                                        setState(() {
                                          colorChange;
                                        });
                                      },
                                      child: Row(
                                        children: [
                                          Text(
                                            ("French".tr()),
                                            style: colorChange
                                                ? FontConstant.k16w5008267Text
                                                : FontConstant.k18w5008471Text,
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 20),
                                    GestureDetector(
                                      onTap: () {
                                        UserPrefs.setEArbBool(true);
                                        context.locale = Locale('ar', 'AR');
                                        RestartWidget.restartApp(context);

                                        setState(() {
                                          colorChange;
                                        });
                                      },
                                      child: Row(
                                        children: [
                                          Text(
                                            ("Arabic".tr()),
                                            style: colorChange
                                                ? FontConstant.k16w5008267Text
                                                : FontConstant.k18w5008471Text,
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ];
                          },
                          child: Image.asset(
                            "assets/images/Languageicon.png",
                            height: 24,
                          ))),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => TReminderScreen(),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Image.asset(
                        "assets/images/clockicon.png",
                        height: 24,
                      ),
                    ),
                  ),
                  /*
                InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TNotificationScreen()),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Image.asset(
                        "assets/images/iconbell.png",
                        height: 24,
                      ),
                    ),
                  ),*/
                ],
              ),
            ),
          )
        ],
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              //color: AppColors().bgColor,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 30),
                    Column(
                      children: [
                        //Text(cookie),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 0.w),
                          // color: Colors.black,
                          child: CarouselSlider.builder(
                            carouselController: _controller,
                            itemCount: _kidModel.parentKidId!.length,
                            itemBuilder: (ctx, index, realIndex) {
                              return InkWell(
                                onTap: _kidModel.parentKidId![index].kidId ==
                                        null
                                    ? () {}
                                    : () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (ctx) =>
                                                    PKidsDashboard(
                                                      kidId: _kidModel
                                                          .parentKidId![index]
                                                          .kidId
                                                          .toString(),
                                                    )));
                                      },
                                child: Container(
                                  //width: 260,
                                  // height: 100,
                                  margin: EdgeInsets.only(left: 16),
                                  decoration: BoxDecoration(
                                    // color: Colors.red,
                                    borderRadius: BorderRadius.circular(16),
                                    image: DecorationImage(
                                      image: AssetImage(
                                          "assets/images/Student Card.png"),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0, vertical: 8),
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 100,
                                        width: 72,
                                        clipBehavior: Clip.hardEdge,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                        child: Image.network(
                                          _kidModel
                                              .parentKidId![index].profilePic
                                              .toString(),
                                          fit: BoxFit.fill,
                                          errorBuilder: (q, w, e) => Image.asset(
                                              "assets/images/Rectangle 2715.png"),
                                        ),
                                      ),
                                      SizedBox(width: 16),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            _kidModel.parentKidId![index].name
                                                .toString(),
                                            style: FontConstant.k16w500White,
                                          ),
                                          _kidModel.parentKidId![index].kidId ==
                                                  null
                                              ? Container(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 10,
                                                      vertical: 5),
                                                  decoration: BoxDecoration(
                                                      color: Colors.red,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20)),
                                                  child: Text(
                                                    "Voucher expired!",
                                                    style: FontConstant
                                                        .k14w400White,
                                                  ),
                                                )
                                              : Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      _kidModel
                                                          .parentKidId![index]
                                                          .secName
                                                          .toString(),
                                                      style: FontConstant
                                                          .k14w400White,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text(
                                                          "${"From".tr()} ${DateFormat.jm().format(DateFormat("hh:mm:ss").parse(_kidModel.parentKidId![index].schTimeIn.toString().split('.').first))} ",
                                                          style: FontConstant
                                                              .k14w400White,
                                                        ),
                                                        Text(
                                                          "${"To".tr()} ${DateFormat.jm().format(DateFormat("hh:mm:ss").parse(_kidModel.parentKidId![index].schTimeOut.toString().split('.').first))}",
                                                          style: FontConstant
                                                              .k14w400White,
                                                        ),
                                                      ],
                                                    ),
                                                    Text(
                                                      _kidModel
                                                          .parentKidId![index]
                                                          .grpName
                                                          .toString()
                                                          .tr(),
                                                      style: FontConstant
                                                          .k12w400White,
                                                    ),
                                                  ],
                                                ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                            options: CarouselOptions(
                              height: 150,
                              onPageChanged: (index, reason) {
                                setState(() {
                                  // _index = index;
                                  _isActivityLoading = true;
                                  _getActivity(_kidModel
                                      .parentKidId![index].kidId
                                      .toString());
                                  log(index.toString());
                                });
                              },
                              viewportFraction: 0.9,
                              //enlargeCenterPage: true,
                              padEnds: false,
                              //pageSnapping: false,
                              enableInfiniteScroll: false,
                            ),
                          ),
                        ),
                        /*Row(
                    //mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PKidsDashboard()),
                          );
                        },
                        child: Container(
                          height: 132,
                          width: MediaQuery.of(context).size.width * 0.98,
                          padding: EdgeInsets.only(left: 16),
                          child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(right: 15.0),
                                  child: PStudentcard(),
                                );
                              },
                              itemCount: 3),
                        ),
                      ),
                      SizedBox(width: 5),
                    ],
                  ),*/
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 15.h,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 16.0),
                              child: Text(
                                "Activity".tr(),
                                style: FontConstant2.baloothampifont,
                              ),
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            _isActivityLoading
                                ? Center(
                                    child: CircularProgressIndicator(),
                                  )
                                : _activityModel.kidAndActivity!.isEmpty
                                    ? Column(
                                        children: [
                                          Image.asset(
                                            "assets/images/chicken.png",
                                            width: 1.sw,
                                            height: 200,
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Text(
                                            "Oops!",
                                            style:
                                                FontConstant2.k24w5008267text,
                                          ),
                                          Text(
                                            "No activity available for the kid.",
                                            style: FontConstant.k16w4008471Text,
                                          ),
                                        ],
                                      )
                                    : Activity(
                                        model: _activityModel, length: length),
                            SizedBox(height: 10),
                            length == _activityModel.kidAndActivity!.length
                                ? SizedBox.shrink()
                                : Center(
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (_) => PScheduleScreen(
                                              model: _activityModel,
                                            ),
                                          ),
                                        );
                                      },
                                      child: Container(
                                        color: Colors.transparent,
                                        padding: EdgeInsets.all(16),
                                        child: Text("See more".tr(),
                                            style: FontConstant
                                                .k16w500purpleText
                                                .copyWith(
                                              fontSize: 18,
                                            )),
                                      ),
                                    ),
                                  ),
                            /*Center(
                              child: Text("See more".tr(),
                                  style:
                                      FontConstant.k16w500purpleText.copyWith(
                                    fontSize: 18,
                                  )),
                            ),*/
                          ],
                        )
                      ],
                    ),
                    _activityModel.videoTutorial!.isEmpty
                        ? SizedBox.shrink()
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 20.h),
                              Padding(
                                padding: EdgeInsets.only(left: 16.0),
                                child: Text(
                                  "Tutorials".tr(),
                                  style: FontConstant2.baloothampifont,
                                ),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                      child: Tutorials(
                                    model: _activityModel,
                                  )),
                                ],
                              ),
                            ],
                          ),
                    //Tutorials card
                    SizedBox(
                      height: 100.h,
                    )
                  ],
                ),
              ),
            ),
    );
  }
}

class PStudentcard extends StatelessWidget {
  PStudentcard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 260.w,
      decoration: BoxDecoration(
        //color: Colors.black,
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
          image: AssetImage("assets/images/Student Card.png"),
          fit: BoxFit.fitWidth,
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
      child: Row(
        children: [
          Container(
            height: 96,
            width: 72,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/Rectangle 2715.png"))),
          ),
          SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 8,
              ),
              Text(
                "Nobite ",
                style: FontConstant.k16w500White,
              ),
              Text(
                "Nursery sec A",
                style: FontConstant.k14w400White,
              ),
              Text(
                "08:00 am to 01:00 pm",
                style: FontConstant.k12w400White,
              ),
              Text(
                "2nd rank".tr(),
                style: FontConstant.k12w400White,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
//
