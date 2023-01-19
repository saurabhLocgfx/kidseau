import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:kidseau/TeachersPanel/TNotificationScreen/TNotificationScreen.dart';
import 'package:kidseau/Theme.dart';
import 'package:kidseau/Widgets/Calender/calendermodel.dart';
import 'package:kidseau/api/Teacherpanelapi/teacher_student_performance_apis/student_performance_api.dart';
import 'package:kidseau/api/models/perforamnce_models/performance_activity_model.dart';
import 'package:kidseau/api/models/teacher_group_model/teacher_group_model.dart';

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

  _getPerformanceActivity() {
    final resp = TeacherStudentPerformanceApi().get(grpId: _grpId);
    resp.then((value) {
      if (value['status'] == 1) {
        setState(() {
          _activityModel = PerformanceActivityModel.fromJson(value);
          _dropDownList.clear();
          for (var v in _activityModel.allKidActvity!) {
            _dropDownList.add(v.actTitle.toString());
            _map.add({'name': v.actTitle, 'id': v.dayActId});
          }
          selected = _activityModel.allKidActvity![0].actTitle.toString();
          _isLoading = false;
          _activityLoading = false;
        });
      } else {
        setState(() {
          _isLoading = false;
          _activityLoading = false;
        });
      }
    });
  }

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
                                enabled: true,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 15.0, top: 15, bottom: 15),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          context.locale = Locale('en', 'US');
                                          RestartWidget.restartApp(context);

                                          setState(() {
                                            colorChange;
                                          });
                                        },
                                        child: Row(
                                          children: [
                                            Text(
                                              ("English"),
                                              style: colorChange
                                                  ? FontConstant.k16w5008267Text
                                                  : FontConstant
                                                      .k18w5008471Text,
                                            )
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 20),
                                      GestureDetector(
                                        onTap: () {
                                          context.locale = Locale('fr', 'FR');
                                          RestartWidget.restartApp(context);

                                          setState(() {
                                            colorChange;
                                          });
                                          // Navigator.of(context).push(
                                          //   MaterialPageRoute(
                                          //     builder: (context) => Fees(),
                                          //   ),
                                          // );
                                        },
                                        child: Row(
                                          children: [
                                            Text(
                                              ("French"),
                                              style: colorChange
                                                  ? FontConstant.k16w5008267Text
                                                  : FontConstant
                                                      .k18w5008471Text,
                                            )
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 20),
                                      GestureDetector(
                                        onTap: () {
                                          context.locale = Locale('ar', 'AR');
                                          RestartWidget.restartApp(context);

                                          setState(() {
                                            colorChange;
                                          });
                                          /* Navigator.pop(context);
                                            Navigator.of(context).push(
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    TSettings(),
                                              ),
                                            );*/
                                        },
                                        child: Row(
                                          children: [
                                            Text(
                                              ("Arabic"),
                                              style: colorChange
                                                  ? FontConstant.k16w5008267Text
                                                  : FontConstant
                                                      .k18w5008471Text,
                                            )
                                          ],
                                        ),
                                      ),
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
                                        }
                                      }
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
                                  "Today",
                                  style: FontConstant.k16w500B7A4Text,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 24),
                    ListView.separated(
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
                                                TStudentDetailScreen()),
                                      );
                                    },
                                    child: Container(
                                      width: 80,
                                      height: 105,
                                      clipBehavior: Clip.hardEdge,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Image.asset(
                                          'assets/images/Rectangle 2715.png'),
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
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Child Name',
                                                    style: FontConstant
                                                        .k18w500331FText,
                                                  ),
                                                  SizedBox(height: 0),
                                                  Text(
                                                    'S/O - Father Name',
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
                                              inactiveColor: ThemeColor.b7A4B2,
                                              activeColor:
                                                  ThemeColor.primarycolor,
                                              inactiveIcon: Image.asset(
                                                  'assets/images/sf.png'),
                                              activeIcon: Image.asset(
                                                  'assets/images/baby.png'),
                                              value: toggle1,
                                              onToggle: (v) {
                                                setState(() {
                                                  toggle1 = v;
                                                });
                                              },
                                            ),
                                          ],
                                        ),
                                        Slider(
                                            divisions: 4,
                                            label: value.round().toString(),
                                            activeColor: Color(0xFFF5C88E),
                                            inactiveColor: ThemeColor.ebe6F2,
                                            thumbColor: Color(0xFFF0AD56),
                                            min: 1,
                                            max: 5,
                                            value: value.round().toDouble(),
                                            onChanged: (val) {
                                              setState(() {
                                                value = val;
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
                        itemCount: 5),
                  ],
                ),
              ),
            ),
      bottomNavigationBar: Container(
        height: 55.h,
        width: 1.sw,
        margin: EdgeInsets.only(bottom: 90, left: 16, right: 16),
        child: MainButton(
            onTap: () {
              /*final resp = TeacherSubmitAttendanceAPI().submit(attendanceList);
              resp.then((value) {
                log(value.toString());
                if (value['status'] == 1) {
                  CustomSnackBar.customSnackBar(
                      context, 'Attendance submitted!');
                } else {
                  CustomSnackBar.customErrorSnackBar(
                      context, 'Attendance not submitted!');
                }
              });*/
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
                      _activityLoading = true;
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
