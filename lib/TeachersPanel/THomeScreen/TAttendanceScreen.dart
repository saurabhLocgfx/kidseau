import 'dart:developer';
import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:kidseau/Constants/colors.dart';
import 'package:kidseau/Theme.dart';
import 'package:kidseau/Widgets/Calender/calendermodel.dart';
import 'package:kidseau/Widgets/custom_snack_bar.dart';
import 'package:kidseau/api/Teacherpanelapi/Tattendance_api/attendance_api.dart';
import 'package:kidseau/api/Teacherpanelapi/Tattendance_api/teacher_all_attendance_api.dart';
import 'package:kidseau/api/models/teacher_all_attendance_model/teacher_all_attendance_model.dart';
import 'package:kidseau/api/models/teacher_all_attendance_model/teacher_search_attendance_model.dart';

import '../../Widgets/buttons.dart';
import '../../shard_prefs/shared_prefs.dart';

class TAttendanceScreen extends StatefulWidget {
  final String attendanceId;
  final String groupName;
  const TAttendanceScreen({
    Key? key,
    required this.attendanceId,
    required this.groupName,
  }) : super(key: key);

  @override
  State<TAttendanceScreen> createState() => _TAttendanceScreenState();
}

class _TAttendanceScreenState extends State<TAttendanceScreen> {
  bool isSwitched = false;
  bool val2 = false;
  bool val1 = true;
  List<bool> _values = [];
  // List<int> _searchedIndex = [];

  List<AttendanceModel> selectedAttendance = [];

  @override
  void initState() {
    searchNode.addListener(() {
      setState(() {});
    });
    _getData();
    super.initState();
  }

  bool _isLoading = false;
  TeacherAllAttendanceModel model = TeacherAllAttendanceModel();

  String _val = '';

  _getData() {
    _isLoading = true;
    final resp =
        TeacherAllAttendanceApi().get(attendanceId: widget.attendanceId);
    resp.then((value) {
      log(value.toString());
      try {
        if (value['Status'] == 1) {
          setState(() {
            model = TeacherAllAttendanceModel.fromJson(value);
            for (var v in model.groupAllkid!) {
              print(v.status);
              if (v.status == '0') {
                _values.add(false);
                attendanceList.add({
                  "kid_id": v.kidId,
                  "status": v.status,
                });
              } else if (v.status == '1') {
                _values.add(true);
                attendanceList.add({
                  "kid_id": v.kidId,
                  "status": v.status,
                });
              } else {
                _values.add(false);
                attendanceList.add({
                  "kid_id": v.kidId,
                  "status": '0',
                });
              }
            }
            //print(_values);
            /*for (int i = 0; i <= model.groupAllkid!.length - 1; i++) {
              _searchedIndex.add(i);
            }
            log(_searchedIndex.length.toString());*/
            _isLoading = false;
            _val = '';
          });
          for (int i = 0; i <= _values.length - 1; i++) {
            //print('${_values[i]}123');
            //print(_values.toSet().toList());
            //print(_values[i] = false);
            if (_values[i] == false) {
              val1 = false;
            } /*else {
              val1 = true;
            }*/
            //print('$val1 12');
            //_values[i] = !_values[i];
          }
        } else {
          setState(() {
            _val = 'No kids found.';
            _isLoading = false;
          });
        }
      } catch (e) {
        print(e);
        setState(() {
          _val = 'No kids found.';
          _isLoading = false;
        });
      }
    });
  }

  _getDataWithDate() {
    _isLoading = true;
    final resp = TeacherAllAttendanceApi().getWithDate(
        attendanceId: widget.attendanceId,
        date: DateFormat('yyyy-MM-dd').format(_selectedDay));
    resp.then((value) {
      log(value.toString());
      try {
        if (value['Status'] == 1) {
          setState(() {
            model = TeacherAllAttendanceModel.fromJson(value);
            //print(model.groupAllkid!.isEmpty);
            for (var v in model.groupAllkid!) {
              if (v.status == '0') {
                _values.add(false);
                attendanceList.add({
                  "kid_id": v.kidId,
                  "status": v.status,
                });
              } else if (v.status == '1') {
                _values.add(true);
                attendanceList.add({
                  "kid_id": v.kidId,
                  "status": v.status,
                });
              } else {
                _values.add(false);
                attendanceList.add({
                  "kid_id": v.kidId,
                  "status": '0',
                });
              }
            }
            /*for (int i = 0; i <= model.groupAllkid!.length - 1; i++) {
              _searchedIndex.add(i);
            }
            log(_searchedIndex.length.toString());*/
            _isLoading = false;
            _val = '';
          });
          for (int i = 0; i <= _values.length - 1; i++) {
            //print('${_values[i]}123');
            if (_values[i] == false) {
              val1 = false;
            } /*else {
              val1 = true;
            }*/
            print(val1);
            //_values[i] = !_values[i];
          }
        } else {
          setState(() {
            _val = 'No kids found.';
            _isLoading = false;
          });
        }
      } catch (e) {
        print(e);
        setState(() {
          _val = 'No kids found.';
          _isLoading = false;
        });
      }
    });
  }

  bool _btnLoading = false;
  final TextEditingController _controller = TextEditingController();
  List<Map<String, dynamic>> attendanceList = [];

  AttendanceSearchKidsModel attendanceSearchKidsModel =
      AttendanceSearchKidsModel();
  FocusNode searchNode = FocusNode();

  DateTime _selectedDay = DateTime.now();

  getDate() {
    setState(() {
      _selectedDay = UserPrefs.getDate() != null
          ? DateTime.parse(UserPrefs.getDate()!)
          : DateTime.now();
    });
  }

  @override
  Widget build(BuildContext context) {
    //print('${_values.first} 123');
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        toolbarHeight: 70.0,
        flexibleSpace: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              color: Colors.transparent,
            ),
          ),
        ),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: ThemeColor.lightpurple.withOpacity(0.16),
        ),
        backgroundColor: ThemeColor.lightpurple.withOpacity(0.16),
        title: Row(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Image.asset(
                "assets/images/arrow-left.png",
                height: 24,
                width: 24,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18),
              child: Text(widget.groupName,
                  /* AppLoaclizations.of(context)!
                      .translate("Attendance")
                      .toString(),*/
                  style: FontConstant.k14w400lightpurpleText.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff84717F))),
            ),
          ],
        ),
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : /*_val == 'No kids found.'
              ? Center(child: Text(_val.tr()))
              : */
          SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 40),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: TextFormField(
                      focusNode: searchNode,
                      controller: _controller,
                      onChanged: (val) {
                        /*final resp = TeacherAttendanceSearchAPI().get(
                                groupId: widget.attendanceId,
                                searchedName: _controller.text);
                            resp.then((value) {
                              log(value.toString());
                              // if (value['status'] == 1) {
                              setState(() {
                                attendanceSearchKidsModel =
                                    AttendanceSearchKidsModel.fromJson(value);
                              });
                              // }
                            });*/
                        setState(() {});
                      },
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: EdgeInsets.symmetric(horizontal: 16),
                        hintText: "Search student".tr(),
                        hintStyle: FontConstant.k16w400B7A4Text, // Tex
                        suffixIconConstraints: BoxConstraints(
                          maxWidth: 60,
                          maxHeight: 25,
                        ), // tStyle
                        suffixIcon: Padding(
                          padding: const EdgeInsets.only(right: 16),
                          child: Image.asset(
                            "assets/images/searhcicon.png",
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(67.0),
                          borderSide: BorderSide(
                            width: 2.0,
                            color: ThemeColor.primarycolor.withOpacity(0.16),
                          ), // BorderSide
                        ), // OutlineInputBorder
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(67.0),
                          borderSide: BorderSide(
                            width: 2.0,
                            color: ThemeColor.primarycolor.withOpacity(0.16),
                          ), // BorderSide
                        ), // OutlineInputBorder
                      ), // InputDecoration
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Container(
                    width: 1.sw,
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        image: DecorationImage(
                            image: AssetImage('assets/images/attendancebg.png'),
                            fit: BoxFit.fitWidth)),
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 32),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (_) => CalendarPage2(
                                      date: DateTime.now(),
                                      onPop: (val) {},
                                    )).then((value) {
                              getDate();
                              _getDataWithDate();
                            });
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Today’s attendance".tr(),
                                  style: FontConstant2.k24w5008267text),
                              Row(
                                children: [
                                  Text(
                                    DateFormat('yMMMEd').format(_selectedDay),
                                    style: FontConstant.k16w500B7A4Text,
                                  ),
                                  SizedBox(width: 8),
                                  Image.asset(
                                    "assets/images/calendericon.png",
                                    height: 24,
                                    fit: BoxFit.fitWidth,
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            SizedBox(
                                width: 56.w,
                                height: 32.w,
                                child: FlutterSwitch(
                                    // toggleSize: 25,
                                    inactiveColor: ThemeColor.b7A4B2,
                                    activeColor: ThemeColor.primarycolor,
                                    value: val1,
                                    onToggle: (v) {
                                      setState(() {
                                        val1 = v;
                                        // _values.clear();
                                        for (int i = 0;
                                            i <= _values.length - 1;
                                            i++) {
                                          if (v == true) {
                                            _values[i] = true;
                                          } else {
                                            _values[i] = false;
                                          }
                                          attendanceList.clear();
                                          for (var q in model.groupAllkid!) {
                                            attendanceList.add({
                                              "kid_id": q.kidId,
                                              "status": v == false ? '0' : '1',
                                            });
                                          }
                                          //_values[i] = !_values[i];
                                        }
                                      });
                                    })),
                            SizedBox(height: 4),
                            Text(
                              "All Present".tr(),
                              style: FontConstant.k16w400B7A4Text,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  (model.groupAllkid == null)
                      ? SizedBox(
                          height: 100,
                          child: Center(
                            child: Text(
                              _val.tr(),
                              style: FontConstant.k16blackboldText,
                            ),
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                      "${_controller.text.isEmpty ? model.groupAllkid!.length : model.groupAllkid!.where((e) => e.name!.toLowerCase().contains(_controller.text.toLowerCase())).length} ${"Kids".tr()}",
                                      style: FontConstant.k16w4008471Text),
                                  Text("Present1".tr(),
                                      style: FontConstant.k16w4008471Text),
                                ],
                              ),
                              SizedBox(height: 10),
                              ListView.separated(
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: _controller.text.isEmpty
                                      ? model.groupAllkid!.length
                                      : model.groupAllkid!
                                          .where((e) => e.name!
                                              .toLowerCase()
                                              .contains(_controller.text
                                                  .toLowerCase()))
                                          .length,
                                  separatorBuilder: (ctx, ind) => SizedBox(
                                        height: 16.h,
                                      ),
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return _controller.text.isEmpty
                                        ? Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Container(
                                                        height: 67,
                                                        width: 50,
                                                        clipBehavior:
                                                            Clip.hardEdge,
                                                        decoration:
                                                            BoxDecoration(
                                                                /*image: DecorationImage(
                                              image: AssetImage(image[index],),
                                              fit: BoxFit.cover)*/
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8)),
                                                        child:
                                                            Image.network(
                                                                model
                                                                    .groupAllkid![
                                                                        index]
                                                                    .profilePic
                                                                    .toString(),
                                                                errorBuilder: (q,
                                                                        w, e) =>
                                                                    Text(
                                                                        'Image not loaded'),
                                                                fit: BoxFit
                                                                    .cover),
                                                      ),
                                                      SizedBox(width: 16),
                                                      Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            model
                                                                .groupAllkid![
                                                                    index]
                                                                .name
                                                                .toString(),
                                                            style: FontConstant
                                                                .k18w500331FText,
                                                          ),
                                                          Row(
                                                            children: [
                                                              Text(
                                                                model.groupAllkid![index]
                                                                            .gender!
                                                                            .toLowerCase() ==
                                                                        'm'
                                                                    ? 'S/O '
                                                                    : model.groupAllkid![index].gender!.toLowerCase() == 'f'
                                                                        ? 'D/O '
                                                                        : 'C/O ',
                                                                style: FontConstant
                                                                    .k14w4008471Text,
                                                              ),
                                                              Text(
                                                                model
                                                                    .groupAllkid![
                                                                        index]
                                                                    .father
                                                                    .toString(),
                                                                style: FontConstant
                                                                    .k14w4008471Text,
                                                              ),
                                                            ],
                                                          )
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    width: 48.w,
                                                    height: 24.w,
                                                    child: FlutterSwitch(
                                                        toggleSize: 20,
                                                        inactiveColor:
                                                            ThemeColor.b7A4B2,
                                                        activeColor: ThemeColor
                                                            .primarycolor,
                                                        value: _values[index],
                                                        onToggle: (v) {
                                                          setState(() {
                                                            _values[index] = v;
                                                            attendanceList[
                                                                index] = {
                                                              "kid_id": model
                                                                  .groupAllkid![
                                                                      index]
                                                                  .kidId,
                                                              "status":
                                                                  v == false
                                                                      ? '0'
                                                                      : '1',
                                                            };
                                                          });
                                                        }),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: 16),
                                              Container(
                                                width: 1.sw,
                                                height: 1,
                                                color: AppColors()
                                                    .k8267AC
                                                    .withOpacity(0.16),
                                              ),
                                            ],
                                          )
                                        : Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Container(
                                                        height: 67,
                                                        width: 50,
                                                        decoration: BoxDecoration(
                                                            /*image: DecorationImage(
                                              image: AssetImage(image[index],),
                                              fit: BoxFit.cover)*/
                                                            ),
                                                        child: Image.network(
                                                            model.groupAllkid!
                                                                .where((e) => e
                                                                    .name!
                                                                    .toLowerCase()
                                                                    .contains(
                                                                        _controller
                                                                            .text
                                                                            .toLowerCase()))
                                                                .toList()[index]
                                                                .profilePic
                                                                .toString(),
                                                            errorBuilder: (q, w,
                                                                    e) =>
                                                                Text(
                                                                    'Image not loaded'),
                                                            fit: BoxFit.cover),
                                                      ),
                                                      SizedBox(width: 16),
                                                      Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            model.groupAllkid!
                                                                .where((e) => e
                                                                    .name!
                                                                    .toLowerCase()
                                                                    .contains(
                                                                        _controller
                                                                            .text
                                                                            .toLowerCase()))
                                                                .toList()[index]
                                                                .name
                                                                .toString(),
                                                            style: FontConstant
                                                                .k18w500331FText,
                                                          ),
                                                          Row(
                                                            children: [
                                                              Text(
                                                                model.groupAllkid!
                                                                            .where((e) => e.name!.toLowerCase().contains(_controller.text
                                                                                .toLowerCase()))
                                                                            .toList()[
                                                                                index]
                                                                            .gender!
                                                                            .toLowerCase() ==
                                                                        'm'
                                                                    ? 'S/O '
                                                                    : model.groupAllkid!.where((e) => e.name!.toLowerCase().contains(_controller.text.toLowerCase())).toList()[index].gender!.toLowerCase() ==
                                                                            'f'
                                                                        ? 'D/O '
                                                                        : 'C/O ',
                                                                style: FontConstant
                                                                    .k14w4008471Text,
                                                              ),
                                                              Text(
                                                                model
                                                                    .groupAllkid!
                                                                    .where((e) => e
                                                                        .name!
                                                                        .toLowerCase()
                                                                        .contains(_controller
                                                                            .text
                                                                            .toLowerCase()))
                                                                    .toList()[
                                                                        index]
                                                                    .father
                                                                    .toString(),
                                                                style: FontConstant
                                                                    .k14w4008471Text,
                                                              ),
                                                            ],
                                                          )
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    width: 48.w,
                                                    height: 24.w,
                                                    child: FlutterSwitch(
                                                        toggleSize: 20,
                                                        inactiveColor:
                                                            ThemeColor.b7A4B2,
                                                        activeColor: ThemeColor
                                                            .primarycolor,
                                                        value: _values[index],
                                                        onToggle: (v) {
                                                          setState(() {
                                                            _values[index] = v;
                                                            attendanceList[
                                                                index] = {
                                                              "kid_id": model
                                                                  .groupAllkid!
                                                                  .where((e) => e
                                                                      .name!
                                                                      .toLowerCase()
                                                                      .contains(_controller
                                                                          .text
                                                                          .toLowerCase()))
                                                                  .toList()[
                                                                      index]
                                                                  .kidId,
                                                              "status":
                                                                  v == false
                                                                      ? '0'
                                                                      : '1',
                                                            };
                                                          });
                                                        }),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: 16),
                                              Container(
                                                width: 1.sw,
                                                height: 1,
                                                color: AppColors()
                                                    .k8267AC
                                                    .withOpacity(0.16),
                                              ),
                                            ],
                                          );
                                    /*Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Container(
                                                  height: 67,
                                                  width: 50,
                                                  decoration: BoxDecoration(
                                                      */
                                    /*image: DecorationImage(
                                          image: AssetImage(image[index],),
                                          fit: BoxFit.cover)*/
                                    /*
                                                      ),
                                                  child: Image.network(
                                                      attendanceSearchKidsModel
                                                          .serchKid![index]
                                                          .profilePic
                                                          .toString(),
                                                      errorBuilder: (q, w, e) =>
                                                          Text(
                                                              'Image not loaded'),
                                                      fit: BoxFit.cover),
                                                ),
                                                SizedBox(width: 16),
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      attendanceSearchKidsModel
                                                          .serchKid![index].name
                                                          .toString(),
                                                      style: FontConstant
                                                          .k18w500331FText,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text(
                                                          model
                                                                      .groupAllkid![
                                                                          index]
                                                                      .gender!
                                                                      .toLowerCase() ==
                                                                  'm'
                                                              ? 'S/O '
                                                              : model.groupAllkid![index]
                                                                          .gender!
                                                                          .toLowerCase() ==
                                                                      'f'
                                                                  ? 'D/O '
                                                                  : 'C/O ',
                                                          style: FontConstant
                                                              .k14w4008471Text,
                                                        ),
                                                        Text(
                                                          attendanceSearchKidsModel
                                                              .serchKid![index]
                                                              .fatherName
                                                              .toString(),
                                                          style: FontConstant
                                                              .k14w4008471Text,
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              width: 48.w,
                                              height: 24.w,
                                              child: FlutterSwitch(
                                                  toggleSize: 20,
                                                  inactiveColor:
                                                      ThemeColor.b7A4B2,
                                                  activeColor:
                                                      ThemeColor.primarycolor,
                                                  value: _values[index],
                                                  onToggle: (v) {
                                                    setState(() {
                                                      _values[index] = v;
                                                      attendanceList[index] = {
                                                        "kid_id": model
                                                            .groupAllkid![index]
                                                            .kidId,
                                                        "status": v == false
                                                            ? '0'
                                                            : '1',
                                                      };
                                                    });
                                                  }),
                                            ),
                                          ],
                                        )*/
                                  }),
                            ],
                          ),
                        ),
                  SizedBox(height: 30.h)
                ],
              ),
            ),
      bottomNavigationBar: _val == 'No kids found.'
          ? SingleChildScrollView()
          : Container(
              height: 56,
              width: 1.sw,
              margin: EdgeInsets.only(bottom: 10, left: 16, right: 16),
              child: _btnLoading
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : _controller.text.isEmpty
                      ? MainButton(
                          onTap: () {
                            setState(() {
                              _btnLoading = true;
                            });
                            final resp = TeacherSubmitAttendanceAPI()
                                .submit(attendanceList);
                            resp.then((value) {
                              log(value.toString());
                              if (value['status'] == 1) {
                                CustomSnackBar.customSnackBar(
                                    context, 'Attendance submitted!');
                                setState(() {
                                  _btnLoading = false;
                                });
                              } else {
                                CustomSnackBar.customErrorSnackBar(
                                    context, 'Attendance not submitted!');
                                setState(() {
                                  _btnLoading = false;
                                });
                              }
                            });
                          },
                          title: "Submit".tr(),
                          textStyleColor: Colors.white,
                          backgroundColor: ThemeColor.primarycolor)
                      : model.groupAllkid!
                              .where((e) => e.name!
                                  .toLowerCase()
                                  .contains(_controller.text.toLowerCase()))
                              .isNotEmpty
                          ? MainButton(
                              onTap: () {
                                setState(() {
                                  _btnLoading = true;
                                });
                                final resp = TeacherSubmitAttendanceAPI()
                                    .submit(attendanceList);
                                resp.then((value) {
                                  log(value.toString());
                                  if (value['status'] == 1) {
                                    CustomSnackBar.customSnackBar(
                                        context, 'Attendance submitted!');
                                    setState(() {
                                      _btnLoading = false;
                                    });
                                  } else {
                                    CustomSnackBar.customErrorSnackBar(
                                        context, 'Attendance not submitted!');
                                    setState(() {
                                      _btnLoading = false;
                                    });
                                  }
                                });
                              },
                              title: "Submit".tr(),
                              textStyleColor: Colors.white,
                              backgroundColor: ThemeColor.primarycolor)
                          : Container(),
            ),
    );
  }
}

class AttendanceModel {
  String image, name;
  bool isSelected;
  AttendanceModel(this.image, this.name, this.isSelected);
}
