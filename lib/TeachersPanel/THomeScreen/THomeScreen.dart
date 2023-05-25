import 'dart:async';
import 'dart:developer';
import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:kidseau/Constants/colors.dart';
import 'package:kidseau/TeachersPanel/THomeScreen/TGroupScreen.dart';
import 'package:kidseau/TeachersPanel/THomeScreen/TLearningAlphabets.dart';
import 'package:kidseau/Theme.dart';
import 'package:kidseau/api/Teacherpanelapi/Tmodel/THomemodel.dart';
import 'package:kidseau/api/Teacherpanelapi/Tmodel/TScheduleModel.dart';
import 'package:kidseau/api/Teacherpanelapi/teacher_home_api/THomeApi.dart';
import 'package:kidseau/shard_prefs/shared_prefs.dart';

import '../../ParentsPanel/PNotificationScreen/PNotificationScreen.dart';
import '../../ParentsPanel/POnboardingScreens/PStartScreen.dart';
import '../../Widgets/custom_snack_bar.dart';
import '../../api/models/reminder_model/reminder_model.dart';
import '../../api/models/teacher_profile_details_model/teacher_profile_details_model.dart';
import '../../api/reminder_apis/delete_reminder_api.dart';
import '../../api/reminder_apis/get_reminders_api.dart';
import '../../restartappwidget/restartwidgets.dart';
import '../TReminder/TReminderScreen.dart';
import 'TAttendanceScreen.dart';
import 'TScheduleScreen.dart';

class THomeScreen extends StatefulWidget {
  bool Ezarabic = false;
  THomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<THomeScreen> createState() => _THomeScreenState();
}

class _THomeScreenState extends State<THomeScreen> {
  bool colorChange = false;
  bool loadingData = false;
  bool loadingsch = false;
  Timer? timer;
  @override
  void initState() {
    getData();
    _getDataReminders();
    timer = Timer.periodic(Duration(seconds: 5), (timer) {
      //_getDataReminders();
      _setReminder();
    });
    super.initState();
  }

  int length = 0;

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  bool _grpLoading = false;
  getData() {
    loadingData = true;
    _grpLoading = true;
    final rsp = THomeApi().get();
    rsp.then((value) {
      //log(value.toString());
      if (value['status'] == 1) {
        try {
          setState(() {
            _name = THomeModel.fromJson(value);
            _countLength();
            loadingData = false;
            _grpLoading = false;
          });
        } catch (e) {
          setState(() {
            loadingData = false;
            _grpLoading = false;
          });
        }
      } else if (value['msg'] == 'go_to_login') {
        setState(() {
          UserPrefs.clearData(UserPrefs.cookies);
          UserPrefs.clearData(UserPrefs.Teacher);
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (ctx) => PStartScreen()),
              (route) => false);
          loadingData = false;
          CustomSnackBar.customSnackBar(
              context, 'Session expired. Please login again');
        });
      } else {
        setState(() {
          loadingData = false;
        });
      }
    });
  }

  _countLength() {
    setState(() {
      if (_name.attendance!.isEmpty) {
        length = _name.schdule!.length;
      } else {
        if (_name.schdule!.length > 4) {
          length = 4;
        } else {
          length = _name.schdule!.length;
        }
      }
      log(length.toString());
    });
  }

  THomeModel _name = THomeModel();

  List<ReminderModel> modelList = [];

  _getDataReminders() {
    loadingData = true;
    final resp = GetRemindersApi().get();
    resp.then((value) {
      // log(value.toString());
      if (value['status'] == 1) {
        modelList.clear();
        if (mounted) {
          setState(() {
            for (var v in value['reminder']) {
              modelList.add(ReminderModel.fromJson(v));
            }
            _setReminder();
            loadingData = false;
          });
        }
      } else {
        setState(() {
          loadingData = false;
        });
      }
    });
  }

  ReminderModel reminder = ReminderModel();
  _setReminder() {
    //log("message");
    setState(() {
      if (!showReminder) {
        for (var v in modelList) {
          if (DateTime.parse('${v.remDate!} ${v.remTime!}').hour ==
                  DateTime.now().hour &&
              DateTime.parse('${v.remDate!} ${v.remTime!}').minute ==
                  DateTime.now().minute) {
            reminder = v;
            showReminder = true;
          }
        }
      }
    });
  }

  bool showReminder = false;

  /*setReminderFalse() {
    UserPrefs.setShowReminder(false);
    _getDataReminders();
    getShowReminder();
  }*/

  /*getShowReminder() {
    setState(() {
      reminder = UserPrefs.getShowReminder() ?? false;
    });
  }*/

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
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Flexible(
              //width: 150,
              //padding: const EdgeInsets.only(top: 15.0),
              child: Text("${"Hello".tr()} ${_name.hello ?? ''}",
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.start,
                  maxLines: 1,
                  style: FontConstant2.k32w5008267text.copyWith(fontSize: 20)),
            ),
          ],
        ),
        actions: [
          Row(
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
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PNotificationScreen()),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Image.asset(
                    "assets/images/iconbell.png",
                    height: 24,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      body: loadingData
          ? Center(child: CircularProgressIndicator())
          : _name.groupInCard!.isEmpty
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
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
                      "No activity assigned by director.".tr(),
                      style: FontConstant.k16w4008471Text,
                    ),
                  ],
                )
              : SingleChildScrollView(
                  child: SizedBox(
                    width: 1.sw,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (modelList.isNotEmpty) SizedBox(height: 16),
                        if (modelList.isNotEmpty && showReminder)
                          Container(
                            width: 1.sw,
                            margin: EdgeInsets.symmetric(horizontal: 16),
                            padding: EdgeInsets.symmetric(
                                horizontal: 12, vertical: 8),
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          reminder.title.toString(),
                                          style: FontConstant2.k18w500331Ftext,
                                        ),
                                        SizedBox(height: 2),
                                        Text(
                                          DateFormat('hh:mm a').format(
                                              DateTime.parse(
                                                  '${reminder.remDate!} ${reminder.remTime!}')),
                                          style: FontConstant.k16w4008471Text,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      showReminder = false;
                                      modelList.removeWhere((element) =>
                                          element.id.toString() ==
                                          reminder.id.toString());
                                    });
                                    final resp = DeleteReminderApi().get(
                                        reminderId: reminder.id.toString());
                                    resp.then((value) {
                                      if (value['status'] == 1) {
                                        reminder = ReminderModel();
                                        /*setState(() {
                                      //modelList.removeAt(index);
                                      //Navigator.of(context).pop();
                                    });*/
                                      } else {
                                        //Navigator.of(context).pop();
                                      }
                                    });
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
                        if (_name.groupInCard!.isNotEmpty) SizedBox(height: 16),
                        /*_name.groupInCard!.isEmpty || _name.groupInCard == null
                        ? Text(
                            'No Groups Allotted Yet.',
                            style: FontConstant.k16w500B7A4Text,
                          )
                        :*/
                        _grpLoading
                            ? SizedBox.shrink()
                            : SizedBox(
                                height: _name.groupInCard != null &&
                                        _name.groupInCard!.isNotEmpty
                                    ? 128
                                    : 0,
                                width: 1.sw,
                                child: MediaQuery.removePadding(
                                  context: context,
                                  removeTop: true,
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemCount: _name.groupInCard!.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      TGroupScreen(
                                                        grpId: _name
                                                            .groupInCard![index]
                                                            .grpId
                                                            .toString(),
                                                        index: index,
                                                      )),
                                            );
                                          },
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                                right: index ==
                                                        _name.groupInCard!
                                                                .length -
                                                            1
                                                    ? 16
                                                    : 0),
                                            child: Groupcard(
                                              nameData: _name,
                                              index: index,
                                            ),
                                          ));
                                    },
                                  ),
                                ),
                              ),
                        if (_name.groupInCard!.isNotEmpty) SizedBox(height: 32),
                        if (length > 0)
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 16.0, right: 16),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: SizedBox(
                                width: 1.sw,
                                child: Text(
                                  "Schedule".tr(),
                                  style: FontConstant2.baloothampifont,
                                ),
                              ),
                            ),
                          ),
                        if (length > 0) SizedBox(height: 16),
                        if (length > 0)
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            width: 1.sw,
                            child: ListView.separated(
                                separatorBuilder: (ctx, ind) => SizedBox(
                                      height: 14.h,
                                    ),
                                shrinkWrap: true,
                                padding: EdgeInsets.zero,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: length,
                                scrollDirection: Axis.vertical,
                                itemBuilder: (BuildContext context, int index) {
                                  return InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                TLearningAlphabets(
                                                  scheduleID: _name
                                                      .schdule![index].actId
                                                      .toString(),
                                                )),
                                      );
                                    },
                                    child: Container(
                                      height: 64,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15.0),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              child: Image.network(
                                                _name.schdule![index].actIcon
                                                    .toString(),
                                                fit: BoxFit.cover,
                                                errorBuilder: (q, w, e) {
                                                  return Text(
                                                      'Image not loaded'.tr());
                                                },
                                                height: 40,
                                                width: 40,
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 15.0),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    _name.schdule![index]
                                                        .actTitle
                                                        .toString(),
                                                    style: FontConstant
                                                        .k32w500blackText
                                                        .copyWith(fontSize: 16),
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        _name.schdule![index]
                                                            .grpName
                                                            .toString(),
                                                        style: FontConstant
                                                            .k14w400lightpurpleText
                                                            .copyWith(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                fontSize: 14,
                                                                color: Color(
                                                                    0xffB7A4B2)),
                                                      ),
                                                      SizedBox(
                                                        width: 5,
                                                      ),
                                                      Container(
                                                        width: 3,
                                                        height: 3,
                                                        decoration:
                                                            BoxDecoration(
                                                                color: Color(
                                                                    0xffB7A4B2),
                                                                shape: BoxShape
                                                                    .circle),
                                                      ),
                                                      SizedBox(
                                                        width: 5,
                                                      ),
                                                      Text(
                                                        "${"From".tr()} ${_name.schdule![index].timing!.split('-').first} ",
                                                        style: FontConstant
                                                            .k14w400lightpurpleText
                                                            .copyWith(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                fontSize: 14,
                                                                color: Color(
                                                                    0xffB7A4B2)),
                                                      ),
                                                      Text(
                                                        "${"To".tr()} ${_name.schdule![index].timing!.split('-').last}",
                                                        style: FontConstant
                                                            .k14w400lightpurpleText
                                                            .copyWith(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                fontSize: 14,
                                                                color: Color(
                                                                    0xffB7A4B2)),
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
                          ),
                        _name.schdule != null
                            ? length == _name.schdule!.length
                                ? SizedBox.shrink()
                                : Center(
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (_) => ScheduleScreen(),
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
                                  )
                            : Container(),
                        SizedBox(height: 32),
                        _name.attendance != null
                            ? _name.attendance!.isEmpty
                                ? SizedBox.shrink()
                                : Padding(
                                    padding: const EdgeInsets.only(
                                        left: 16.0, bottom: 10, right: 16),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: SizedBox(
                                        width: 1.sw,
                                        child: Text(
                                          "Attendance".tr(),
                                          style: FontConstant2.baloothampifont,
                                        ),
                                      ),
                                    ),
                                  )
                            : Container(),
                        _name.attendance != null
                            ? _name.attendance?.isEmpty ?? [].isEmpty
                                ? SizedBox.shrink()
                                : Container(
                                    padding: EdgeInsets.only(left: 16),
                                    height: 128,
                                    child: ListView.separated(
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      itemCount: _name.attendance!.length,
                                      itemBuilder: (context, index) =>
                                          GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  TAttendanceScreen(
                                                groupName: _name
                                                    .attendance![index]
                                                    .groupName
                                                    .toString(),
                                                attendanceId: _name
                                                    .attendance![index].groupId
                                                    .toString(),
                                              ),
                                            ),
                                          );
                                        },
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              right: index ==
                                                      _name.attendance!.length -
                                                          1
                                                  ? 16
                                                  : 0),
                                          child: Attendancecard(
                                            index: index,
                                            model: _name,
                                          ),
                                        ),
                                      ),
                                      separatorBuilder: (ctx, ind) => SizedBox(
                                        width: 16,
                                      ),
                                    ),
                                  )
                            : Container(),
                        SizedBox(height: 90),
                      ],
                    ),
                  ),
                ),
    );
  }

  Padding schedulelistapi() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: loadingData
          ? CircularProgressIndicator()
          : SizedBox(
              // height: 300.h,
              width: 1.sw,
              child: ListView.separated(
                  separatorBuilder: (ctx, ind) => SizedBox(
                        height: 14.h,
                      ),
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: _name.schdule!.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TLearningAlphabets(
                                    scheduleID:
                                        _name.schdule![index].actId.toString(),
                                  )),
                        );
                      },
                      child: loadingData
                          ? CircularProgressIndicator()
                          : Container(
                              height: 64,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      _name.schdule![index].actIcon.toString(),
                                      errorBuilder: (q, w, e) {
                                        return Text('Image not loaded');
                                      },
                                      height: 40,
                                      width: 40,
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 15.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            _name.schdule![index].actTitle
                                                .toString(),
                                            style: FontConstant.k32w500blackText
                                                .copyWith(fontSize: 16),
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                _name.schdule![index].grpName
                                                    .toString(),
                                                style: FontConstant
                                                    .k14w400lightpurpleText
                                                    .copyWith(
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: 14,
                                                        color:
                                                            Color(0xffB7A4B2)),
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Container(
                                                width: 3,
                                                height: 3,
                                                decoration: BoxDecoration(
                                                    color: Color(0xffB7A4B2),
                                                    shape: BoxShape.circle),
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                "${"From".tr()} ${_name.schdule![index].timing!.split('-').first} ",
                                                style: FontConstant
                                                    .k14w400lightpurpleText
                                                    .copyWith(
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: 14,
                                                        color:
                                                            Color(0xffB7A4B2)),
                                              ),
                                              Text(
                                                "To ${_name.schdule![index].timing!.split('-').last}",
                                                // '${groups[index]} . ${time[index]}',
                                                style: FontConstant
                                                    .k14w400lightpurpleText
                                                    .copyWith(
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: 14,
                                                        color:
                                                            Color(0xffB7A4B2)),
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
            ),
    );
  }
}

class schedulewidgetapi extends StatefulWidget {
  const schedulewidgetapi({Key? key}) : super(key: key);

  @override
  State<schedulewidgetapi> createState() => _schedulewidgetapiState();
}

class _schedulewidgetapiState extends State<schedulewidgetapi> {
  @override
  void initState() {
    getData();
    super.initState();
  }

  getData() {
    loadingData = true;
    final rsp = THomeApi().get();
    rsp.then((value) {
      try {
        setState(() {
          loadingData = false;
        });
        _name = value as THomeModel;
      } catch (e) {
        setState(() {
          loadingData = false;
        });
      }
    });
  }

  bool loadingsch = false;
  bool loadingData = false;
  THomeModel _name = THomeModel();
  TScheduleModel _schedule = TScheduleModel();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: loadingData
          ? CircularProgressIndicator()
          : SizedBox(
              // height: 300.h,
              width: 1.sw,
              child: ListView.separated(
                  separatorBuilder: (ctx, ind) => SizedBox(
                        height: 14.h,
                      ),
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: _name.schdule!.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        if (index == 0) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TLearningAlphabets(
                                      scheduleID: '',
                                    )),
                          );
                        } else if (index == 1) {
                        } else if (index == 2) {
                        } else if (index == 3) {}
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
                              Image.asset(
                                _name.schdule![index].actIcon.toString(),
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
                                      _name.schdule![index].actTitle.toString(),
                                      style: FontConstant.k32w500blackText
                                          .copyWith(fontSize: 16),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          _name.schdule![index].grpName
                                              .toString(),
                                          style: FontConstant
                                              .k14w400lightpurpleText
                                              .copyWith(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 14,
                                                  color: Color(0xffB7A4B2)),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Container(
                                          width: 3,
                                          height: 3,
                                          decoration: BoxDecoration(
                                              color: Color(0xffB7A4B2),
                                              shape: BoxShape.circle),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          "From ${_name.schdule![index].timing!.split('-').first} ",
                                          style: FontConstant
                                              .k14w400lightpurpleText
                                              .copyWith(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 14,
                                                  color: Color(0xffB7A4B2)),
                                        ),
                                        Text(
                                          "To ${_name.schdule![index].timing!.split('-').last}",
                                          style: FontConstant
                                              .k14w400lightpurpleText
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
            ),
    );
  }
}

class Groupcard extends StatelessWidget {
  THomeModel nameData;
  int index;
  Groupcard({Key? key, required this.nameData, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 283,
      height: 128,
      margin: EdgeInsets.only(left: 16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
          image: AssetImage(
            "assets/images/groupc.png",
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
            ),
            clipBehavior: Clip.hardEdge,
            width: 72,
            height: 96,
            child: Image.network(
              nameData.groupInCard![index].grpImage.toString(),
              fit: BoxFit.cover,
              loadingBuilder: (q, w, e) {
                if (e == null) {
                  return w;
                } else {
                  return SpinKitThreeBounce(
                    size: 30,
                    color: Colors.white,
                  );
                }
              },
              errorBuilder: (q, w, e) {
                return Text('Image not loaded');
              },
            ),
          ),
          SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                nameData.groupInCard![index].grpName.toString(),
                style: FontConstant.k18w500whiteText,
              ),
              Text(
                nameData.groupInCard![index].secName.toString(),
                style: FontConstant.k18w500whiteText.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
              Text(
                "${nameData.groupInCard![index].allKid.toString()} ${"Kids".tr()}",
                style: FontConstant.k18w500whiteText.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SchoolCard extends StatelessWidget {
  final TeacherProfileDetailsModel model;
  const SchoolCard({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 128,
      width: 1.sw,
      margin: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/scard.png'),
          fit: BoxFit.cover,
        ),
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: EdgeInsets.only(left: 16.0, right: 16, top: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 96,
            width: 72,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
            child: Image.network(
              model.school!.schoolImage.toString(),
              errorBuilder: (q, w, e) => Text('Image not loaded'),
              fit: BoxFit.fitHeight,
            ),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  model.school!.schoolName.toString(),
                  style: FontConstant2.k18w500Black,
                ),
                Row(
                  children: [
                    SizedBox(
                        width: 20,
                        child: Image.asset(
                          'assets/images/clockicon.png',
                          color: Color(0xFFB7A4B2),
                        )),
                    SizedBox(width: 8),
                    Text(
                      '${DateFormat.jm().format(DateFormat("hh:mm:ss").parse(model.school!.schoolTime!.split('To').first.toString()))} to ${DateFormat.jm().format(DateFormat("hh:mm:ss").parse(model.school!.schoolTime!.split(' To ').last.toString()))}',
                      style: FontConstant.k18w500whiteText.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFFB7A4B2),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                        width: 20,
                        child: Image.asset(
                          'assets/images/call.png',
                          color: Color(0xFFB7A4B2),
                        )),
                    SizedBox(width: 8),
                    Text(
                      model.school!.schoolPhone.toString(),
                      style: FontConstant.k18w500whiteText.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFFB7A4B2),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Attendancecard extends StatelessWidget {
  final THomeModel model;
  final int index;
  Attendancecard({Key? key, required this.model, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 128,
      width: 320,
      // margin: EdgeInsets.only(left: 8),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/Attendancec.png'),
          fit: BoxFit.fill,
        ),
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 96,
            width: 72,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Image.network(
              model.attendance![index].groupImage.toString(),
              fit: BoxFit.cover,
              loadingBuilder: (q, w, e) {
                if (e == null) {
                  return w;
                } else {
                  return SpinKitThreeBounce(
                    size: 30,
                    color: Colors.white,
                  );
                }
              },
              errorBuilder: (q, w, e) {
                return Text('Image not loaded');
              },
              height: 40,
              width: 40,
            ),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  model.attendance![index].groupName.toString(),
                  style: FontConstant.k18w500whiteText,
                ),
                Text(
                  model.attendance![index].sectionName.toString(),
                  style: FontConstant.k18w500whiteText.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
                Text(
                  "${model.attendance![index].totalStudent.toString()} ${"Kids".tr()}",
                  style: FontConstant.k18w500whiteText.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Text(model.attendance![index].studentPresent.toString(),
                  style: FontConstant2.k24w500WhiteText),
              Text("present".tr(), style: FontConstant.k16w400whiteText),
            ],
          ),
        ],
      ),
    );
  }
}
