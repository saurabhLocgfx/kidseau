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
import 'package:kidseau/Theme.dart';
import 'package:kidseau/api/models/parent_models/parent_home_models/parent_kid_home_model.dart';
import 'package:kidseau/api/parent_panel_apis/parent_dashboard_api/parent_activity_home_api.dart';
import 'package:kidseau/api/parent_panel_apis/parent_dashboard_api/parent_kid_api.dart';
import 'package:kidseau/shard_prefs/shared_prefs.dart';

import '../../Constants/colors.dart';
import '../../TeachersPanel/TReminder/TReminderScreen.dart';
import '../../Widgets/custom_snack_bar.dart';
import '../../api/models/parent_models/parent_home_models/parent_activity_home_model.dart';
import '../../api/models/reminder_model/reminder_model.dart';
import '../../api/reminder_apis/get_reminders_api.dart';
import '../../restartappwidget/restartwidgets.dart';
import '../POnboardingScreens/PStartScreen.dart';

class PHomeScreen extends StatefulWidget {
  PHomeScreen({Key? key}) : super(key: key);

  @override
  State<PHomeScreen> createState() => _PHomeScreenState();
}

class _PHomeScreenState extends State<PHomeScreen> {
  final CarouselController _controller = CarouselController();

  bool colorChange = false;
  bool Ezarabic = false;

  setReminderFalse() {
    UserPrefs.setShowReminder(false);
    _getDataReminders();
    getShowReminder();
  }

  getShowReminder() {
    setState(() {
      reminder = UserPrefs.getShowReminder() ?? false;
    });
  }

  List<ReminderModel> modelList = [];
  _getDataReminders() {
    _isLoading = true;
    final resp = GetRemindersApi().get();
    resp.then((value) {
      log(value.toString());
      if (value['status'] == 1) {
        modelList.clear();
        setState(() {
          for (var v in value['reminder']) {
            modelList.add(ReminderModel.fromJson(v));
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

  @override
  void initState() {
    getShowReminder();
    _getData();
    _getDataReminders();

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
      } else if (value['msg'] == "go_to_login") {
        setState(() {
          UserPrefs.clearData(UserPrefs.cookies);
          UserPrefs.clearData(UserPrefs.Teacher);
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (ctx) => PStartScreen()),
              (route) => false);
          _isLoading = false;
          CustomSnackBar.customSnackBar(
              context, 'Session expired. Please login again');
        });
      } else {
        setState(() {
          _isLoading = false;
        });
      }
    }).then((value) {
      _isActivityLoading = true;
      _getActivity(_kidModel.parentKidId![0].grpId.toString());
    });
  }

  bool _isActivityLoading = false;

  ParentActivityHomeModel _activityModel = ParentActivityHomeModel();

  _getActivity(String kidId) {
    _isLoading = true;
    _isActivityLoading = true;
    if(mounted){
      final resp = ParentActivityHomeApi().get(kidId: kidId);
      resp.then((value) {
        print(value);
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
  final GlobalKey<PopupMenuButtonState> pop = GlobalKey<PopupMenuButtonState>();
  bool reminder = false;
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
        centerTitle: false,
        title: Text("${"Hello".tr()} ${_activityModel.greet ?? ''}",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: FontConstant2.k32w5008267text.copyWith(fontSize: 32.sp)),
        actions: [
          InkWell(
            onTap: () {
              pop.currentState!.showButtonMenu();
            },
            child: Container(
                color: Colors.transparent,
                padding: EdgeInsets.all(10),
                child:
                // PopupMenuButton(
                //   key: pop,
                //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                //   onSelected: (String selectedLanguage) {
                //     // Update the language and colorChange state here
                //     setState(() {
                //       if (selectedLanguage == 'English') {
                //         UserPrefs.setEArbBool(false);
                //         UserPrefs.setLang('English');
                //         context.locale = Locale('en', 'US');
                //         colorChange = true;
                //         log("Eng");
                //       } else if (selectedLanguage == 'French') {
                //         UserPrefs.setEArbBool(false);
                //         UserPrefs.setLang('French');
                //         context.locale = Locale('fr', 'FR');
                //         colorChange = false;
                //         log('fre');
                //       } else if (selectedLanguage == 'Arabic') {
                //         UserPrefs.setEArbBool(true);
                //         UserPrefs.setLang('Arabic');
                //         context.locale = Locale('ar', 'AR');
                //         colorChange = true;
                //         log('ar');
                //       }else{}
                //
                //     });
                //   },
                //   itemBuilder: (context) {
                //     return [
                //       PopupMenuItem(
                //         value: 'English',
                //         child: Row(
                //           children: [
                //             Text(
                //               "English".tr(),
                //               style: colorChange
                //                   ? FontConstant.k16w5008267Text
                //                   : FontConstant.k18w5008471Text,
                //             ),
                //           ],
                //         ),
                //       ),
                //       PopupMenuItem(
                //         value: 'French',
                //         child: Row(
                //           children: [
                //             Text(
                //               "French".tr(),
                //               style: colorChange
                //                   ? FontConstant.k16w5008267Text
                //                   : FontConstant.k18w5008471Text,
                //             ),
                //           ],
                //         ),
                //       ),
                //       PopupMenuItem(
                //         value: 'Arabic',
                //         child: Row(
                //           children: [
                //             Text(
                //               "Arabic".tr(),
                //               style: colorChange
                //                   ? FontConstant.k16w5008267Text
                //                   : FontConstant.k18w5008471Text,
                //             ),
                //           ],
                //         ),
                //       ),
                //     ];
                //   },
                //   child: Image.asset(
                //     "assets/images/Languageicon.png",
                //     height: 24,
                //     width: 24,
                //   ),
                // )
                PopupMenuButton(
                    key: pop,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                    itemBuilder: (context) {
                      return [
                        PopupMenuItem(
                          enabled: false,
                          child: GestureDetector(
                            onTap: () {
                              UserPrefs.setEArbBool(false);
                              UserPrefs.setLang('English');
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
                        ),
                        PopupMenuItem(
                          enabled: false,
                          child: GestureDetector(
                            onTap: () {
                              UserPrefs.setEArbBool(false);
                              UserPrefs.setLang('French');
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
                        ),
                        PopupMenuItem(
                          enabled: false,
                          child: GestureDetector(
                            onTap: () {
                              UserPrefs.setEArbBool(true);
                              UserPrefs.setLang('Arabic');
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
                        ),
                      ];
                    },
                    child: Image.asset(
                      "assets/images/Languageicon.png",
                      height: 24,
                      width: 24,
                    ))
            ),
          ),
          SizedBox(width: 8),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => TReminderScreen(),
                ),
              );
            },
            child: Container(
              color: Colors.transparent,
              padding: const EdgeInsets.all(10),
              child: Image.asset(
                "assets/images/clockicon.png",
                height: 24,
                width: 24,
              ),
            ),
          ),
          SizedBox(width: 8),
          /*Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [

              */ /*
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
              ),*/ /*
            ],
          )*/
        ],
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 16),
                  if (modelList.isNotEmpty && reminder)
                    Container(
                      width: 1.sw,
                      margin: EdgeInsets.symmetric(horizontal: 16),
                      padding:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: AppColors().k8267AC.withOpacity(0.32)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                "assets/images/clockfilled.png",
                                width: 34,
                                height: 34,
                              ),
                              SizedBox(
                                width: 12,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    modelList.last.title.toString(),
                                    style: FontConstant2.k18w500331Ftext,
                                  ),
                                  SizedBox(height: 2),
                                  Text(
                                    DateFormat('hh:mm a').format(DateTime.parse(
                                        '${modelList.last.remDate!} ${modelList.last.remTime!}')),
                                    style: FontConstant.k16w4008471Text,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: () {
                              setReminderFalse();
                            },
                            child: Container(
                              color: Colors.transparent,
                              padding: EdgeInsets.all(12),
                              child: Icon(Icons.close),
                            ),
                          ),
                        ],
                      ),
                    ),
                  SizedBox(height: 16),
                  if (_kidModel.parentKidId != null)
                    CarouselSlider.builder(
                      carouselController: _controller,
                      itemCount: _kidModel.parentKidId!.length,
                      itemBuilder: (ctx, index, realIndex) {
                        return InkWell(
                          onTap: _kidModel.parentKidId![index].kidId == null
                              ? () {}
                              : () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (ctx) => PKidsDashboard(
                                            kidId: _kidModel
                                                .parentKidId![index].kidId
                                                .toString(),
                                          )));
                                },
                          child: Container(
                            //width: 330,
                            // height: 100,
                            margin: EdgeInsets.only(
                                right: 16, left: index == 0 ? 16 : 0),
                            decoration: BoxDecoration(
                              // color: Colors.red,
                              borderRadius: BorderRadius.circular(16),
                              image: DecorationImage(
                                image: AssetImage(
                                    "assets/images/Student Card.png"),
                                fit: BoxFit.cover,
                              ),
                            ),
                            padding: const EdgeInsets.all(16),
                            child: Row(
                              children: [
                                Container(
                                  height: 100,
                                  width: 72,
                                  clipBehavior: Clip.hardEdge,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Image.network(
                                    _kidModel.parentKidId![index].profilePic
                                        .toString(),
                                    fit: BoxFit.cover,
                                    errorBuilder: (q, w, e) => Image.asset(
                                        "assets/images/Rectangle 2715.png"),
                                  ),
                                ),
                                SizedBox(width: 16),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      _kidModel.parentKidId![index].name
                                          .toString(),
                                      style: FontConstant.k16w500White,
                                    ),
                                    _kidModel.parentKidId![index].kidId == null
                                        ? Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 10, vertical: 5),
                                            decoration: BoxDecoration(
                                                color: Colors.red,
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            child: Text(
                                              "Voucher expired!".tr(),
                                              style: FontConstant.k14w400White,
                                            ),
                                          )
                                        : Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                _kidModel
                                                    .parentKidId![index].secName
                                                    .toString(),
                                                style:
                                                    FontConstant.k14w400White,
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
                                                    .parentKidId![index].grpName
                                                    .toString()
                                                    .tr(),
                                                style:
                                                    FontConstant.k12w400White,
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
                        height: 128,
                        onPageChanged: (index, reason) {
                          setState(() {
                            // _index = index;
                            _isActivityLoading = true;
                            _getActivity(
                                _kidModel.parentKidId![index].grpId.toString());
                            log(index.toString());
                          });
                        },
                        viewportFraction:
                            _kidModel.parentKidId!.length == 1 ? 1 : 0.9,
                        //enlargeCenterPage: true,
                        padEnds: false,
                        //pageSnapping: false,
                        enableInfiniteScroll: false,
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
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
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
                      if (_activityModel.kidAndActivity != null)
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
                                        "Oops!".tr(),
                                        style: FontConstant2.k24w5008267text,
                                      ),
                                      Text(
                                        "No activity available for the kid."
                                            .tr(),
                                        style: FontConstant.k16w4008471Text,
                                      ),
                                    ],
                                  )
                                : Activity(
                                    model: _activityModel, length: length),
                      SizedBox(height: 10),
                      if (_activityModel.kidAndActivity != null)
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
                                        style: FontConstant.k16w500purpleText
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
                  ),
                  if (_activityModel.videoTutorial != null)
                    if (_activityModel.videoTutorial!.isNotEmpty)
                      Column(
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
                          SizedBox(height: 10.h),
                          Tutorials(model: _activityModel),
                        ],
                      ),
                  //Tutorials card
                  SizedBox(height: 90),
                ],
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
