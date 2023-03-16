import 'dart:developer';
import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:kidseau/Constants/colors.dart';
import 'package:kidseau/TeachersPanel/THomeScreen/TLearningAlphabets.dart';
import 'package:kidseau/Theme.dart';
import 'package:kidseau/api/Teacherpanelapi/teacher_home_api/teacher_group_api.dart';
import 'package:kidseau/api/Teacherpanelapi/teacher_profile_api/teacher_syllabus_api/teacher_syllabus_api.dart';
import 'package:kidseau/api/models/teacher_group_model/teacher_group_model.dart';
import 'package:kidseau/api/models/teacher_syllabus_model/teacher_syllabus_model.dart';

class TSyllabus extends StatefulWidget {
  const TSyllabus({Key? key}) : super(key: key);

  @override
  State<TSyllabus> createState() => _TSyllabusState();
}

class _TSyllabusState extends State<TSyllabus> {
  List<String> items = [
    "Group A",
    "Group B",
    "Group C",
    "Group D",
    "Group E",
  ];

  String selected = 'Sunday'.tr();

  int current = 0;

  String _grpId = '';
  bool _isLoading = false;
  TeacherGroupsModel model = TeacherGroupsModel();

  @override
  void initState() {
    _getData();
    if (DateFormat('EEEE').format(DateTime.now()) == 'Friday') {
      selected = 'Sunday'.tr();
    } else if (DateFormat('EEEE').format(DateTime.now()) == 'Saturday') {
      selected = 'Sunday'.tr();
    } else {
      selected = DateFormat('EEEE').format(DateTime.now());
    }
    super.initState();
  }

  _getData() {
    _isLoading = true;
    final resp = TeacherGroupApi().get();
    resp.then((value) {
      //log(value.toString());
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
        _getSyllabus();
      }
    });
  }

  bool _syllabusLoading = false;
  String _str = 'sun';
  TeacherSyllabusModel _syllabusModel = TeacherSyllabusModel();
  _getSyllabus() {
    if (selected == 'Monday'.tr()) {
      _str = 'mon';
    } else if (selected == 'Tuesday'.tr()) {
      _str = 'tues';
    } else if (selected == 'Wednesday'.tr()) {
      _str = 'wed';
    } else if (selected == 'Thursday'.tr()) {
      _str = 'thrus';
    } else {
      _str = 'sun';
    }
    final resp = TeacherSyllabusApi().get(grpId: _grpId, day: _str);
    resp.then((value) {
      log(value.toString());
      setState(() {
        if (value['status'] == 1) {
          _syllabusModel = TeacherSyllabusModel.fromJson(value);
        } else {}
        _isLoading = false;
        _syllabusLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: false,
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
          statusBarColor: Color(0xff8267AC).withOpacity(0.16),
        ),
        backgroundColor: Color(0xff8267AC).withOpacity(0.16),
        title: Text(
          "Syllabus".tr(),
          style: FontConstant.k18w5008471Text,
        ),
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
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              color: AppColors().k8267AC.withOpacity(0.06),
              child: Stack(
                children: [
                  Image.asset(
                    "assets/images/postsbackground.png",
                    height: 414,
                    width: 1.sw,
                    fit: BoxFit.fitWidth,
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 0.0),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(height: 130),
                            GroupTab(),
                            SizedBox(height: 15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 150,
                                  child: DropdownButton<String>(
                                    borderRadius: BorderRadius.circular(8),
                                    elevation: 1,
                                    dropdownColor: Colors.white,
                                    isExpanded: true,
                                    icon: Image.asset(
                                      "assets/images/arrowdown.png",
                                      width: 24,
                                      height: 24,
                                      color: Color(0xff84717F),
                                    ),
                                    hint: Text(selected.tr()),
                                    items: <String>[
                                      'Sunday'.tr(),
                                      'Monday'.tr(),
                                      'Tuesday'.tr(),
                                      'Wednesday'.tr(),
                                      'Thursday'.tr(),
                                    ].map((String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                    onChanged: (val) {
                                      setState(() {
                                        selected = val!;
                                        _syllabusLoading = true;
                                        _getSyllabus();
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 20),
                            _syllabusLoading
                                ? Center(
                                    child: CircularProgressIndicator(),
                                  )
                                : SizedBox(
                                    // height: 300.h,
                                    width: 1.sw,
                                    child: ListView.separated(
                                        separatorBuilder: (ctx, ind) =>
                                            SizedBox(
                                              height: 14.h,
                                            ),
                                        shrinkWrap: true,
                                        padding: EdgeInsets.zero,
                                        physics: NeverScrollableScrollPhysics(),
                                        itemCount:
                                            _syllabusModel.syllabus!.length,
                                        scrollDirection: Axis.vertical,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return InkWell(
                                            onTap: () {
                                              Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (ctx) =>
                                                          TLearningAlphabets(
                                                              scheduleID:
                                                                  _syllabusModel
                                                                      .syllabus![
                                                                          index]
                                                                      .actId
                                                                      .toString())));
                                            },
                                            child: Container(
                                              //height: 64.h,
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 12),
                                              // width: Get.size.width * 0.93,
                                              margin: EdgeInsets.only(
                                                  left: 16,
                                                  right: 16,
                                                  bottom: index ==
                                                          _syllabusModel
                                                                  .syllabus!
                                                                  .length -
                                                              1
                                                      ? 25
                                                      : 0),
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(16),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 15.0),
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Image.network(
                                                      _syllabusModel
                                                          .syllabus![index]
                                                          .actIcon
                                                          .toString(),
                                                      errorBuilder: (q, w, e) =>
                                                          Text(
                                                              'Image not loaded'),
                                                      height: 40,
                                                      width: 40,
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 15.0),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            _syllabusModel
                                                                .syllabus![
                                                                    index]
                                                                .actTitle
                                                                .toString(),
                                                            style: FontConstant
                                                                .k32w500blackText
                                                                .copyWith(
                                                                    fontSize:
                                                                        16),
                                                          ),
                                                          Text(
                                                            '${_syllabusModel.syllabus![index].timing}',
                                                            style: FontConstant
                                                                .k14w400lightpurpleText
                                                                .copyWith(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    fontSize:
                                                                        14,
                                                                    color: Color(
                                                                        0xffB7A4B2)),
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
                          ],
                        ),
                      ))
                ],
              ),
            ),
    );
  }

  Container GroupTab() {
    return Container(
      width: 414,
      height: 62,
      margin: const EdgeInsets.all(10),
      clipBehavior: Clip.hardEdge,
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
                      _syllabusLoading = true;
                      _getSyllabus();
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
