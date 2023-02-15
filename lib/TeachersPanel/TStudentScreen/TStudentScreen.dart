import 'dart:developer';
import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:kidseau/TeachersPanel/TNotificationScreen/TNotificationScreen.dart';
import 'package:kidseau/Theme.dart';
import 'package:kidseau/Widgets/Calender/calendermodel.dart';
import 'package:kidseau/Widgets/custom_snack_bar.dart';
import 'package:kidseau/api/Teacherpanelapi/teacher_student_performance_apis/get_student_performance.dart';
import 'package:kidseau/api/Teacherpanelapi/teacher_student_performance_apis/student_performance_api.dart';
import 'package:kidseau/api/Teacherpanelapi/teacher_student_performance_apis/submit_performance_api.dart';
import 'package:kidseau/api/models/perforamnce_models/performance_activity_model.dart';
import 'package:kidseau/api/models/perforamnce_models/student_performance_model.dart';
import 'package:kidseau/api/models/teacher_group_model/teacher_group_model.dart';
import 'package:kidseau/shard_prefs/shared_prefs.dart';

import '../../Widgets/buttons.dart';
import '../../api/Teacherpanelapi/teacher_home_api/teacher_group_api.dart';
import '../../restartappwidget/restartwidgets.dart';
import '../TReminder/TReminderScreen.dart';
import 'TStudentDetailScreen.dart';

class TStudentScreen extends StatefulWidget {
  const TStudentScreen({Key? key}) : super(key: key);

  @override
  State<TStudentScreen> createState() => _TStudentScreenState();
}

class _TStudentScreenState extends State<TStudentScreen> {
  double value = 1;
  bool toggle1 = false;
  bool colorChange = false;
  String selected = 'Activity A';
  List<String> _dropDownList = [];

  @override
  void initState() {
    _getData();
    super.initState();
  }

  List<Map<String, dynamic>> _performance = [];
  TeacherGroupsModel model = TeacherGroupsModel();
  bool _isLoading = false;
  bool _activityLoading = false;
  String _grpId = '';
  PerformanceActivityModel _activityModel = PerformanceActivityModel();
  List<Map<String, dynamic>> _map = [];
  Map<String, dynamic> _selectedMap = {};

  _getData() {
    _isLoading = true;
    final resp = TeacherGroupApi().get();
    resp.then((value) {
      // log(value.toString());
      try {
        setState(() {
          model = TeacherGroupsModel.fromJson(value);
          _grpId = model.groupInCard![0].grpId ?? '';
        });
      } catch (e) {
        print(e.toString());
        setState(() {
          _isLoading = false;
        });
      }
    }).then((value) {
      if (model.groupInCard!.isNotEmpty) {
        _getPerformanceActivity();
      }
    });
  }

  bool _studentPerformanceLoading = false;
  List<Map<String, dynamic>> _performanceStatus = [];
  StudentPerformanceModel _studentPerformanceModel = StudentPerformanceModel();

  // String selectedActivityId = '';
  _getPerformanceActivity() {
    final resp = TeacherStudentPerformanceApi().get(grpId: _grpId);
    resp.then((value) {
      log(value.toString());
      if (value['status'] == 1) {
        setState(() {
          _activityModel = PerformanceActivityModel.fromJson(value);
          _dropDownList.clear();
          for (var v in _activityModel.allKidActvity!) {
            _dropDownList.add(v.actTitle.toString());
            _map.add({'name': v.actTitle, 'id': v.dayActId});
          }
          selected = _activityModel.allKidActvity![0].actTitle.toString();
          //selectedActivityId = _activityModel.allKidActvity![0].dayActId.toString();
          _selectedMap = {
            "id": _activityModel.allKidActvity![0].dayActId,
            "name": _activityModel.allKidActvity![0].actTitle,
          };
          _isLoading = false;
          _activityLoading = false;
          if (_activityModel.allKidActvity!.isEmpty) {
            _studentPerformanceLoading = false;
          }
        });
      } else {
        setState(() {
          _isLoading = false;
          _activityLoading = false;
        });
      }
    }).then((value) {
      setState(() {
        _studentPerformanceLoading = true;
      });
      _getPerformanceData();
    });
  }

  List<bool> _valueList = [];
  _getPerformanceData() {
    final resp =
        GetStudentPerformance().get(grpId: _grpId, actId: _selectedMap['id']);
    resp.then((value) {
      _valueList.clear();
      _performanceStatus.clear();
      log(value.toString());
      if (value['status'] == 1) {
        setState(() {
          _studentPerformanceModel = StudentPerformanceModel.fromJson(value);
          for (var v in _studentPerformanceModel.performance!) {
            _performanceStatus
                .add({"performance": v.performanceRate, "id": v.kidId});
            _valueList.add(false);
          }
          _studentPerformanceLoading = false;
          _isLoading = false;
          _activityLoading = false;
        });
      } else {
        setState(() {
          /*_valueList.clear();
          _performanceStatus.clear();*/
          _studentPerformanceModel = StudentPerformanceModel.fromJson(value);
          _studentPerformanceLoading = false;
        });
      }
    });
  }

  bool _btnLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            GestureDetector(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Text("students".tr(),
                    style:
                        FontConstant2.k32w5008267text.copyWith(fontSize: 25)),
              ),
            ),
          ],
        ),
        actions: [
          Container(
            width: 164,
            child: Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: PopupMenuButton(
                          child: Image.asset(
                            "assets/images/Languageicon.png",
                            height: 24,
                          ),
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
                          })),
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
                      padding: const EdgeInsets.all(15),
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
                            builder: (context) => TNotificationScreen()),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Image.asset(
                        "assets/images/iconbell.png",
                        height: 24,
                      ),
                    ),
                  ),
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
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    SizedBox(height: 40),
                    GroupTab(),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 150,
                          height: 50,
                          child: _activityLoading
                              ? SizedBox()
                              : DropdownButton<String>(
                                  borderRadius: BorderRadius.circular(8),
                                  elevation: 1,
                                  dropdownColor: Colors.white,
                                  underline: SizedBox.shrink(),
                                  isExpanded: true,
                                  icon: Image.asset(
                                    "assets/images/arrowdown.png",
                                    width: 24,
                                    height: 24,
                                    color: Color(0xff84717F),
                                  ),
                                  hint: Text(
                                    selected,
                                    style: FontConstant2.k24w5008267text,
                                  ),
                                  items: _dropDownList.map((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                  onChanged: (val) {
                                    setState(() {
                                      selected = val!;
                                      for (int i = 0;
                                          i <= _map.length - 1;
                                          i++) {
                                        if (selected == _map[i]['name']) {
                                          _selectedMap = {
                                            "id": _map[i]['id'],
                                            "name": _map[i]['name'],
                                          };

                                          // selectedActivityId = _map[i]['id'];
                                        }
                                      }
                                      _studentPerformanceLoading = true;
                                      _getPerformanceData();
                                    });
                                  },
                                ),
                        ),
                        GestureDetector(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (_) => CalendarPage2(),
                            );
                          },
                          child: Container(
                            color: Colors.transparent,
                            child: Row(
                              children: [
                                Image.asset(
                                  "assets/images/calendericon.png",
                                  height: 16,
                                ),
                                SizedBox(width: 8),
                                Text(
                                  "Today".tr(),
                                  style: FontConstant.k16w500B7A4Text,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 24),
                    _studentPerformanceLoading
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : _studentPerformanceModel.performance!.isEmpty
                            ? Center(
                                child: Text('No Students found.'),
                              )
                            : ListView.separated(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                      width: 1.sw,
                                      height: 148,
                                      padding: EdgeInsets.all(16),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(16),
                                        color: Colors.white,
                                        image: DecorationImage(
                                          fit: BoxFit.fill,
                                          image: AssetImage(
                                            'assets/images/sp.png',
                                          ),
                                        ),
                                      ),
                                      child: Row(
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        TStudentDetailScreen(
                                                          kidId:
                                                              _studentPerformanceModel
                                                                  .performance![
                                                                      index]
                                                                  .kidId
                                                                  .toString(),
                                                        )),
                                              );
                                            },
                                            child: Container(
                                              width: 80,
                                              height: 105,
                                              clipBehavior: Clip.hardEdge,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              child: Image.network(
                                                _studentPerformanceModel
                                                    .performance![index]
                                                    .profilePic
                                                    .toString(),
                                                fit: BoxFit.fill,
                                                errorBuilder: (q, w, e) =>
                                                    Image.asset(
                                                        'assets/images/Rectangle 2715.png'),
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 12),
                                          Expanded(
                                            child: Column(
                                              children: [
                                                Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Expanded(
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            _studentPerformanceModel
                                                                .performance![
                                                                    index]
                                                                .name
                                                                .toString(),
                                                            style: FontConstant
                                                                .k18w500331FText,
                                                          ),
                                                          SizedBox(height: 0),
                                                          Text(
                                                            _studentPerformanceModel
                                                                        .performance![
                                                                            index]
                                                                        .gender!
                                                                        .toLowerCase() ==
                                                                    'm'
                                                                ? "S/O ${_studentPerformanceModel.performance![index].fatherName}"
                                                                : "D/O ${_studentPerformanceModel.performance![index].fatherName}",
                                                            style: FontConstant
                                                                .k16w400B7A4B2Text,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    FlutterSwitch(
                                                      width: 56,
                                                      height: 32,
                                                      toggleSize: 30,
                                                      inactiveColor:
                                                          ThemeColor.b7A4B2,
                                                      activeColor: ThemeColor
                                                          .primarycolor,
                                                      inactiveIcon: Image.asset(
                                                          'assets/images/sf.png'),
                                                      activeIcon: Image.asset(
                                                          'assets/images/baby.png'),
                                                      value: _studentPerformanceModel
                                                                      .performance![
                                                                          index]
                                                                      .attendance! ==
                                                                  'null' ||
                                                              _studentPerformanceModel
                                                                      .performance![
                                                                          index]
                                                                      .attendance! ==
                                                                  '0'
                                                          ? false
                                                          : _valueList[index],
                                                      onToggle: (v) {
                                                        setState(() {
                                                          _valueList[index] = v;
                                                        });
                                                      },
                                                    ),
                                                  ],
                                                ),
                                                _studentPerformanceModel
                                                                .performance![
                                                                    index]
                                                                .attendance! ==
                                                            'null' ||
                                                        _studentPerformanceModel
                                                                .performance![
                                                                    index]
                                                                .attendance! ==
                                                            '0'
                                                    ? Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          Container(
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    horizontal:
                                                                        8,
                                                                    vertical:
                                                                        4),
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            75),
                                                                color: Color(
                                                                        0xffF97070)
                                                                    .withOpacity(
                                                                        0.16)),
                                                            child: Text(
                                                              'Absent',
                                                              style: FontConstant
                                                                  .k16w400F97070,
                                                            ),
                                                          ),
                                                        ],
                                                      )
                                                    : Slider(
                                                        divisions: 5,
                                                        label: _performanceStatus[index]['performance'] == 'null'
                                                            ? '1'
                                                            : _performanceStatus[index]
                                                                ['performance'],
                                                        activeColor:
                                                            Color(0xFFF5C88E),
                                                        inactiveColor:
                                                            ThemeColor.ebe6F2,
                                                        thumbColor:
                                                            Color(0xFFF0AD56),
                                                        min: 0,
                                                        max: 5,
                                                        value: _performanceStatus[index]['performance'] == 'null'
                                                            ? 0
                                                            : int.parse(_performanceStatus[index]['performance'])
                                                                .round()
                                                                .toDouble(),
                                                        onChanged:
                                                            _valueList[index] ==
                                                                    false
                                                                ? null
                                                                : (val) {
                                                                    setState(
                                                                        () {
                                                                      value =
                                                                          val;
                                                                      _performanceStatus[index]['performance'] = val
                                                                          .round()
                                                                          .toString();
                                                                      //_performanceStatus[index]['id'] = _studentPerformanceModel.performance![index].kidId;
                                                                    });
                                                                  }),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                                separatorBuilder: (ctx, ind) => SizedBox(
                                      height: 16.h,
                                    ),
                                itemCount: _studentPerformanceModel
                                    .performance!.length),
                  ],
                ),
              ),
            ),
      bottomNavigationBar: Container(
        height: 55.h,
        width: 1.sw,
        margin: EdgeInsets.only(bottom: 90, left: 16, right: 16),
        child: _btnLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : MainButton(
                onTap: () {
                  setState(() {
                    _btnLoading = true;
                  });
                  for (var v in _performanceStatus) {
                    _performance.add(
                      {
                        "kid_id": v['id'],
                        "pfm": v['performance'] == 'null'
                            ? 0
                            : int.parse(v['performance']),
                        "days_activity_id": _selectedMap['id']
                      },
                    );
                  }
                  final resp =
                      SubmitPerformanceApi().get(performance: _performance);
                  resp.then((value) {
                    if (value['status'] == 1) {
                      CustomSnackBar.customSnackBar(
                          context, 'Submitted successfully.');
                      setState(() {
                        _btnLoading = false;
                      });
                    } else {
                      CustomSnackBar.customErrorSnackBar(
                          context, 'Submit failed. Please try again later.');
                      setState(() {
                        _btnLoading = false;
                      });
                    }
                  });
                },
                title: "Submit".tr(),
                textStyleColor: Colors.white,
                backgroundColor: ThemeColor.primarycolor),
      ),
    );
  }

  List<String> items = [
    "Group A",
    "Group B",
    "Group C",
    "Group D",
    "Group E",
  ];

  int current = 0;
  Container GroupTab() {
    return Container(
      width: 414,
      height: 62,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(81)),
      child: ListView.builder(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemCount: model.groupInCard!.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (ctx, index) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      current = index;
                      _grpId = model.groupInCard![index].grpId.toString();
                      _activityLoading = true;
                      _studentPerformanceLoading = true;
                      _getPerformanceActivity();
                    });
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    margin: const EdgeInsets.all(5),
                    width: 72,
                    height: 43,
                    decoration: BoxDecoration(
                      color: current == index
                          ? Color(0xff8267AC).withOpacity(.08)
                          : Colors.white,
                      borderRadius: current == index
                          ? BorderRadius.circular(69)
                          : BorderRadius.circular(69),
                      border: current == index
                          ? Border.all(
                              color: Color(0xff8267AC).withOpacity(.08),
                              width: 0)
                          : null,
                    ),
                    child: Center(
                      child: Text(
                        model.groupInCard![index].groupName.toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: current == index
                                ? Color(0xff8267AC)
                                : Color(0xffB7A4B2)),
                      ),
                    ),
                  ),
                ),
              ],
            );
          }),
    );
  }
}
