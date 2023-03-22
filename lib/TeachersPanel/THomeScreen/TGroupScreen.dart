import 'dart:developer';
import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kidseau/TeachersPanel/THomeScreen/TAllStudentsScreen.dart';
import 'package:kidseau/Theme.dart';
import 'package:kidseau/Widgets/buttons.dart';
import 'package:kidseau/api/Teacherpanelapi/teacher_home_api/teacher_group_api.dart';
import 'package:kidseau/api/Teacherpanelapi/teacher_home_api/teacher_group_schedule_api.dart';
import 'package:kidseau/api/Teacherpanelapi/teacher_home_api/teacher_group_students_api.dart';
import 'package:kidseau/api/models/teacher_group_model/teacher_group_model.dart';
import 'package:kidseau/api/models/teacher_group_model/teacher_group_schedule_model.dart';

import '../../Constants/colors.dart';
import '../../api/models/teacher_group_model/teacher_group_students_model.dart';
import 'TKidsDetails.dart';
import 'TLearningAlphabets.dart';

class TGroupScreen extends StatefulWidget {
  final String grpId;
  final int index;
  TGroupScreen({Key? key, required this.grpId, required this.index})
      : super(key: key);

  @override
  State<TGroupScreen> createState() => _TGroupScreenState();
}

class _TGroupScreenState extends State<TGroupScreen> {
  bool _isLoading = false;
  bool _isScheduleLoading = false;

  TeacherGroupsModel model = TeacherGroupsModel();

  TeacherGroupsScheduelModel scheduelModel = TeacherGroupsScheduelModel();

  String _grpId = '';
  _getData() {
    _isLoading = true;
    final resp = TeacherGroupApi().get();
    resp.then((value) {
      log(value.toString());
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
        _getSchedule();
      }
    });
  }

  @override
  void initState() {
    _grpId = widget.grpId;
    current = widget.index;
    _getData();
    super.initState();
  }

  _getSchedule() {
    final resp = TeacherGroupScheduleApi().get(grpId: _grpId);
    resp.then((value) {
      try {
        setState(() {
          scheduelModel = TeacherGroupsScheduelModel.fromJson(value);
        });
      } catch (e) {
        print(e.toString());
      }
    }).then((value) {
      _getStudents();
    });
  }

  TGroupStudentsModel _studentModel = TGroupStudentsModel();

  _getStudents() {
    final resp = TeacherGroupStudentsAPi().get(grpId: _grpId, page: '0');
    resp.then((value) {
      try {
        setState(() {
          _studentModel = TGroupStudentsModel.fromJson(value);
          _isLoading = false;
          _isScheduleLoading = false;
        });
      } catch (e) {
        setState(() {
          _isLoading = false;
          _isScheduleLoading = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
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
        centerTitle: false,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Color(0xff8267AC).withOpacity(0.16),
        ),
        backgroundColor: Color(0xff8267AC).withOpacity(0.16),
        title: Text(
          "Groups".tr(),
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
              height: 1.sh,
              color: AppColors().bgColor,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: [
                      SizedBox(height: 30.h),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(81),
                        child: Container(
                          //width: 414,
                          height: 45,
                          decoration: BoxDecoration(
                            color: Colors.white,
                          ),
                          child: ListView.builder(
                              shrinkWrap: true,
                              //  physics: const BouncingScrollPhysics(),
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
                                          _grpId = model
                                              .groupInCard![index].grpId
                                              .toString();
                                          _isScheduleLoading = true;
                                          _getSchedule();
                                        });
                                      },
                                      child: Container(
                                        margin: const EdgeInsets.all(5),
                                        width: 72,
                                        height: 35,
                                        decoration: BoxDecoration(
                                          color: current == index
                                              ? Color(0xff8267AC)
                                                  .withOpacity(.08)
                                              : Colors.white,
                                          borderRadius: current == index
                                              ? BorderRadius.circular(69)
                                              : BorderRadius.circular(69),
                                          border: current == index
                                              ? Border.all(
                                                  color: Color(0xff8267AC)
                                                      .withOpacity(.08),
                                                  width: 0)
                                              : null,
                                        ),
                                        child: Center(
                                          child: Text(
                                            model.groupInCard![index].groupName
                                                .toString(),
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
                        ),
                      ),
                      // GroupTab(),
                      SizedBox(height: 24),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Schedule".tr(),
                          style: FontConstant2.baloothampifont,
                        ),
                      ),
                      _isScheduleLoading
                          ? Center(
                              child: CircularProgressIndicator(),
                            )
                          : Column(
                              children: [
                                SizedBox(height: 16),
                                SizedBox(
                                  width: 1.sw,
                                  child: ListView.separated(
                                      separatorBuilder: (ctx, ind) => SizedBox(
                                            height: 14.h,
                                          ),
                                      shrinkWrap: true,
                                      padding: EdgeInsets.zero,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemCount: scheduelModel.schdule!.length,
                                      scrollDirection: Axis.vertical,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return InkWell(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      TLearningAlphabets(
                                                        scheduleID:
                                                            scheduelModel
                                                                .schdule![index]
                                                                .actId
                                                                .toString(),
                                                      )),
                                            );
                                          },
                                          child: Container(
                                            height: 64,
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
                                                  ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            6),
                                                    child: Image.network(
                                                      scheduelModel
                                                          .schdule![index]
                                                          .actIcon
                                                          .toString(),
                                                      fit: BoxFit.cover,
                                                      errorBuilder: (q, w, e) {
                                                        return Text(
                                                            'Image not loaded');
                                                      },
                                                      height: 40,
                                                      width: 40,
                                                    ),
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
                                                          scheduelModel
                                                              .schdule![index]
                                                              .actTitle
                                                              .toString(),
                                                          style: FontConstant
                                                              .k32w500blackText
                                                              .copyWith(
                                                                  fontSize: 16),
                                                        ),
                                                        Row(
                                                          children: [
                                                            Text(
                                                              "${"From".tr()}  ${scheduelModel.schdule![index].timing!.split('-').first} ",
                                                              // '${groups[index]} . ${time[index]}',
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
                                                            ),
                                                            Text(
                                                              "${"To".tr()} ${scheduelModel.schdule![index].timing!.split('-').last}",
                                                              // '${groups[index]} . ${time[index]}',
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
                                SizedBox(
                                  height: 5.h,
                                ),
                                /* TActivity(),*/
                                SizedBox(
                                  height: 32,
                                ),
                                _studentModel.student!.isEmpty
                                    ? SizedBox.shrink()
                                    : Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "Kids".tr(),
                                          style: FontConstant2.baloothampifont,
                                        ),
                                      ),
                                SizedBox(height: 8),
                                _studentModel.student!.isEmpty
                                    ? SizedBox.shrink()
                                    : ListView.builder(
                                        physics: NeverScrollableScrollPhysics(),
                                        itemCount:
                                            _studentModel.student!.length,
                                        shrinkWrap: true,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 8.0),
                                            child: SizedBox(
                                                height: 128,
                                                width: 382,
                                                child: InkWell(
                                                  child: TStudentCard(
                                                    model: _studentModel,
                                                    index: index,
                                                  ),
                                                  onTap: () {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              TKidsOverview(
                                                                kidId: _studentModel
                                                                    .student![
                                                                        index]
                                                                    .kidId
                                                                    .toString(),
                                                              )),
                                                    );
                                                  },
                                                )),
                                          );
                                        }),
                                _studentModel.student!.isEmpty
                                    ? SizedBox.shrink()
                                    : SizedBox(height: 24),
                                _studentModel.student!.isEmpty
                                    ? SizedBox.shrink()
                                    : SizedBox(
                                        height: 56,
                                        width: 382.w,
                                        child: MainButton(
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        TAllStudents(
                                                          grpId: _grpId,
                                                        )),
                                              );
                                            },
                                            title: "View all kids".tr(),
                                            textStyleColor: Colors.white,
                                            backgroundColor:
                                                ThemeColor.primarycolor),
                                      ),
                              ],
                            ),
                      SizedBox(height: 25),
                    ],
                  ),
                ),
              ),
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
      //width: 414,
      height: 62.h,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(81)),
      child: ListView.builder(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemCount: items.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (ctx, index) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      current = index;
                    });
                  },
                  child: AnimatedContainer(
                    curve: Curves.easeIn,
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
                        items[index],
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

class TStudentCard extends StatelessWidget {
  final TGroupStudentsModel model;
  final int index;
  TStudentCard({Key? key, required this.index, required this.model})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 260.w,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
          image: AssetImage("assets/images/Student Card.png"),
          fit: BoxFit.cover,
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
      child: Row(
        children: [
          Container(
            height: 96,
            width: 72,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
            child: Image.network(
              model.student![index].image.toString(),
              fit: BoxFit.cover,
              errorBuilder: (q, w, e) =>
                  Image.asset("assets/images/Rectangle 2715.png"),
            ),
          ),
          SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 8,
              ),
              Text(
                model.student![index].name.toString(),
                style: FontConstant.k16w500White,
              ),
              Text(
                model.student![index].sectionName.toString(),
                style: FontConstant.k14w400White,
              ),
              Text(
                model.student![index].fatherName.toString(),
                style: FontConstant.k12w400White,
              ),
              Text(
                "${model.student![index].rank} ${"rank".tr()}",
                style: FontConstant.k12w400White,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
