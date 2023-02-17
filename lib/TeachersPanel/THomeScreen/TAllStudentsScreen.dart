import 'dart:developer';
import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kidseau/ParentsPanel/PHomeScreen/PHomeScreen.dart';
import 'package:kidseau/TeachersPanel/THomeScreen/TKidsDetails.dart';
import 'package:kidseau/Theme.dart';
import 'package:kidseau/api/models/teacher_group_model/t_students_model.dart';
import 'package:kidseau/api/models/teacher_group_model/teacher_group_students_model.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

import '../../api/Teacherpanelapi/teacher_home_api/teacher_group_students_api.dart';

class TAllStudents extends StatefulWidget {
  final String grpId;
  const TAllStudents({Key? key, required this.grpId}) : super(key: key);

  @override
  State<TAllStudents> createState() => _TAllStudentsState();
}

class _TAllStudentsState extends State<TAllStudents> {
  //TGroupStudentsModel _studentModel = TGroupStudentsModel();

  final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    _scrollController.addListener(() {
      if (_scrollController.position.maxScrollExtent ==
          _scrollController.offset) {
        if (_postCount >= 10) {
          _getReloadedStudents();
        }
        setState(() {
          _onBottom = true;
        });
      } else {
        setState(() {
          _onBottom = false;
        });
      }
    });
    _getStudents();
    super.initState();
  }

  int _scroll = 0;
  int _postCount = 0;
  String reloadedVal = '';

  List<TStudentsModel> modelList = [];
  bool _isLoading = false;
  bool _onBottom = false;

  _getReloadedStudents() {
    _scroll++;
    _isLoading = true;
    final resp = TeacherGroupStudentsAPi()
        .get(grpId: widget.grpId, page: _scroll.toString());
    resp.then((value) {
      log(value.toString());
      try {
        setState(() {
          for (var v in value['student']) {
            modelList.add(TStudentsModel.fromJson(v));
          }
          _postCount = value['student'].length;
          if (value['student'].isEmpty) {
            reloadedVal = 'no_post_found';
          }
          log(modelList[0].fatherName.toString());
          _isLoading = false;
        });
      } catch (e) {
        setState(() {
          _isLoading = false;
        });
      }
    });
  }

  _getStudents() {
    _isLoading = true;
    final resp = TeacherGroupStudentsAPi().get(grpId: widget.grpId, page: '0');
    resp.then((value) {
      log(value.toString());
      try {
        setState(() {
          for (var v in value['student']) {
            modelList.add(TStudentsModel.fromJson(v));
          }
          _postCount = value['student'].length;
          if (value['student'].isEmpty) {
            reloadedVal = 'no_post_found';
          }
          log(modelList[0].fatherName.toString());
          _isLoading = false;
        });
      } catch (e) {
        setState(() {
          _isLoading = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
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
          statusBarColor: Color(0xff8267AC).withOpacity(0.16),
        ),
        backgroundColor: Color(0xff8267AC).withOpacity(0.16),
        centerTitle: false,
        title: Text(
          "Kids".tr(),
          /*AppLoaclizations.of(context)!.translate("Kids").toString(),*/
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
          : SingleChildScrollView(
              controller: _scrollController,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    SizedBox(height: 20.h),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Kids".tr(),
                        /* AppLoaclizations.of(context)!.translate("Kids").toString(),*/
                        style: FontConstant2.baloothampifont,
                      ),
                    ),
                    SizedBox(height: 8),
                    LazyLoadScrollView(
                      onEndOfPage: () => _getReloadedStudents(),
                      child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: modelList.length + 1,
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) {
                            if (index < modelList.length) {
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 16.0),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => TKidsOverview(
                                                kidId: modelList[index]
                                                    .kidId
                                                    .toString(),
                                              )),
                                    );
                                  },
                                  child: SizedBox(
                                      height: 128,
                                      width: 382,
                                      child: Container(
                                        width: 260.w,
                                        decoration: BoxDecoration(
                                          color: Colors.transparent,
                                          borderRadius:
                                              BorderRadius.circular(16),
                                          image: DecorationImage(
                                            image: AssetImage(
                                                "assets/images/Student Card.png"),
                                            fit: BoxFit.fitWidth,
                                          ),
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 16.0, vertical: 8),
                                        child: Row(
                                          children: [
                                            Container(
                                              height: 96,
                                              width: 72,
                                              clipBehavior: Clip.hardEdge,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(8)),
                                              child: Image.network(
                                                modelList[index]
                                                    .image
                                                    .toString(),
                                                fit: BoxFit.fill,
                                                errorBuilder: (q, w, e) =>
                                                    Image.asset(
                                                        "assets/images/Rectangle 2715.png"),
                                              ),
                                            ),
                                            SizedBox(width: 16),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  height: 8,
                                                ),
                                                Text(
                                                  modelList[index]
                                                      .name
                                                      .toString(),
                                                  style:
                                                      FontConstant.k16w500White,
                                                ),
                                                Text(
                                                  modelList[index]
                                                      .sectionName
                                                      .toString(),
                                                  style:
                                                      FontConstant.k14w400White,
                                                ),
                                                Text(
                                                  modelList[index]
                                                      .fatherName
                                                      .toString(),
                                                  style:
                                                      FontConstant.k12w400White,
                                                ),
                                                Text(
                                                  "${modelList[index].rank} ${"rank".tr()}",
                                                  style:
                                                      FontConstant.k12w400White,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      )),
                                ),
                              );
                            } else if (reloadedVal == 'no_post_found') {
                              return Center(child: Text('No Posts found.'));
                            } else if (_onBottom && _postCount >= 10) {
                              return Center(child: CircularProgressIndicator());
                            } else {
                              return SizedBox.shrink();
                            }
                          }),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
