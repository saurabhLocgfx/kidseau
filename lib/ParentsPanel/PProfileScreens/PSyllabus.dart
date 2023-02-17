import 'dart:developer';
import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kidseau/ParentsPanel/PHomeScreen/PHomebody.dart';
import 'package:kidseau/Theme.dart';
import 'package:kidseau/api/models/parent_models/parent_post_models/parent_post_school_model.dart';
import 'package:kidseau/api/models/parent_models/parent_profile_models/parent_sch_group_model.dart';
import 'package:kidseau/api/models/parent_models/parent_profile_models/parent_syllabus_model.dart';
import 'package:kidseau/api/parent_panel_apis/parent_profile_apis/parent_get_syllabus_api.dart';
import 'package:kidseau/api/parent_panel_apis/parent_profile_apis/parent_kid_syllabus_api.dart';

import '../../api/parent_panel_apis/parent_post_api/parent_post_school_api.dart';
import '../PHomeScreen/PLearningAlphabets.dart';

class PSyllabus extends StatefulWidget {
  const PSyllabus({Key? key}) : super(key: key);

  @override
  State<PSyllabus> createState() => _PSyllabusState();
}

class _PSyllabusState extends State<PSyllabus> {
  List<String> items = [
    "Group A",
    "Group B",
    "Group C",
    "Group D",
    "Group E",
  ];

  ParentPostSchoolModel model = ParentPostSchoolModel();
  final CarouselController _controller = CarouselController();
  @override
  void initState() {
    if (DateFormat('EEEE').format(DateTime.now()) == 'Friday') {
      selected = 'Sunday'.tr();
    } else if (DateFormat('EEEE').format(DateTime.now()) == 'Saturday') {
      selected = 'Sunday'.tr();
    } else {
      selected = DateFormat('EEEE').format(DateTime.now());
    }
    _getData();
    super.initState();
  }

  bool _isLoading = false;
  _getData() {
    _isLoading = true;
    final resp = ParentPostSchoolApi().get();
    resp.then((value) {
      log(value.toString());
      if (value['status'] == 1) {
        setState(() {
          model = ParentPostSchoolModel.fromJson(value);
        });
      } else {
        setState(() {
          _isLoading = false;
        });
      }
    }).then((value) {
      /*setState(() {
        _postsLoading = true;
      });*/
      //_getPosts();
      _getSchGroups(model.kidSch![0].schId.toString());
    });
  }

  String selected = 'Sunday'.tr();

  bool _syllabusLoading = false;
  String _str = 'sun';

  _getSyllabus(String grpId) {
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
    final resp = ParentGetSyllabusApi().get(grpId: grpId, day: _str);
    resp.then((value) {
      log(value.toString());
      if (value['status'] == 1) {
        setState(() {
          syllabusModel = PSyllabusModel.fromJson(value);
          _syllabusLoading = false;
          _grpLoading = false;
          _isLoading = false;
        });
      } else {
        setState(() {
          _grpLoading = false;
          _isLoading = false;
          _syllabusLoading = false;
        });
      }
    });
  }

  PSchoolGroupDetailModel _grpModel = PSchoolGroupDetailModel();
  bool _grpLoading = false;

  String _grpId = '';

  _getSchGroups(String schId) {
    final resp = ParentKidSyllabusApi().get(schId: schId);
    resp.then((value) {
      if (value['status'] == 1) {
        setState(() {
          _grpModel = PSchoolGroupDetailModel.fromJson(value);
          _grpId = _grpModel.groupWithSection![0].grpId.toString();
        });
      } else {
        setState(() {
          _isLoading = false;
          _grpLoading = false;
        });
      }
    }).then((value) {
      setState(() {
        _getSyllabus(_grpId);
      });
    });
  }

  PSyllabusModel syllabusModel = PSyllabusModel();
  int current = 0;
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
          : SafeArea(
              child: Stack(
                children: [
                  Image.asset(
                    "assets/images/postsbackground.png",
                    height: 414,
                    width: 1.sw,
                    alignment: Alignment.topLeft,
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        children: [
                          SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              if (model.kidSch!.length > 1)
                                InkWell(
                                  onTap: () {
                                    _controller.previousPage();
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 16, vertical: 8),
                                    child: Image.asset(
                                      "assets/images/arrleft.png",
                                      height: 24,
                                      width: 24,
                                    ),
                                  ),
                                ),
                              SizedBox(
                                width: 200,
                                child: CarouselSlider.builder(
                                  carouselController: _controller,
                                  itemCount: model.kidSch!.length,
                                  itemBuilder: (ctx, index, realIndex) {
                                    return Text(
                                      model.kidSch![index].schoolName
                                          .toString(),
                                      style: FontConstant2.k24w5008267text,
                                    );
                                  },
                                  options: CarouselOptions(
                                    scrollPhysics:
                                        NeverScrollableScrollPhysics(),
                                    height: 40.h,
                                    onPageChanged: (index, reason) {
                                      setState(() {
                                        /*_index = index;
                                  _postsLoading = true;
                                  _getPosts();*/
                                        _grpLoading = true;
                                        _getSchGroups(model.kidSch![index].schId
                                            .toString());
                                      });
                                    },
                                    viewportFraction: 1,
                                    enlargeCenterPage: true,
                                    //pageSnapping: false,
                                    enableInfiniteScroll: false,
                                  ),
                                ),
                              ),
                              if (model.kidSch!.length > 1)
                                InkWell(
                                  onTap: () {
                                    _controller.nextPage();
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 16, vertical: 8),
                                    child: Image.asset(
                                      "assets/images/arrright.png",
                                      height: 24,
                                      width: 24,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          _grpLoading
                              ? SizedBox.shrink()
                              : Container(
                                  width: 414,
                                  height: 62,
                                  margin: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(81)),
                                  child: ListView.builder(
                                      shrinkWrap: true,
                                      physics: const BouncingScrollPhysics(),
                                      itemCount:
                                          _grpModel.groupWithSection!.length,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (ctx, index) {
                                        return Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  current = index;
                                                  _grpId = _grpModel
                                                      .groupWithSection![index]
                                                      .grpId
                                                      .toString();
                                                  _syllabusLoading = true;
                                                  _getSyllabus(_grpId);
                                                });
                                              },
                                              child: AnimatedContainer(
                                                duration: const Duration(
                                                    milliseconds: 200),
                                                margin: const EdgeInsets.all(5),
                                                width: 72,
                                                height: 43,
                                                decoration: BoxDecoration(
                                                  color: current == index
                                                      ? Color(0xff8267AC)
                                                          .withOpacity(.08)
                                                      : Colors.white,
                                                  borderRadius: current == index
                                                      ? BorderRadius.circular(
                                                          69)
                                                      : BorderRadius.circular(
                                                          69),
                                                  border: current == index
                                                      ? Border.all(
                                                          color: Color(
                                                                  0xff8267AC)
                                                              .withOpacity(.08),
                                                          width: 0)
                                                      : null,
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    _grpModel
                                                        .groupWithSection![
                                                            index]
                                                        .grpName
                                                        .toString(),
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: current == index
                                                            ? Color(0xff8267AC)
                                                            : Color(
                                                                0xffB7A4B2)),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        );
                                      }),
                                ),
                          SizedBox(height: 15),
                          _grpLoading
                              ? SizedBox.shrink()
                              : Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    DropdownButton<String>(
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
                                          _getSyllabus(_grpId);
                                        });
                                      },
                                    ),
                                    /*Text(
                          "Today",
                          style: FontConstant.k18w5008471Text,
                        ),
                        Image.asset(
                          "assets/images/arrowdown.png",
                          width: 24,
                          height: 24,
                          color: Color(0xff84717F),
                        )*/
                                  ],
                                ),
                          SizedBox(height: 20),
                          _syllabusLoading
                              ? Center(
                                  child: CircularProgressIndicator(),
                                )
                              : Container(
                                  padding: EdgeInsets.symmetric(horizontal: 16),
                                  width: 1.sw,
                                  child: ListView.separated(
                                      separatorBuilder: (ctx, ind) => SizedBox(
                                            height: 14.h,
                                          ),
                                      shrinkWrap: true,
                                      padding: EdgeInsets.zero,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemCount:
                                          syllabusModel.allSchdule!.length,
                                      scrollDirection: Axis.vertical,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return InkWell(
                                          onTap: () {
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (ctx) =>
                                                        PLearningAplphabets(
                                                          actId: syllabusModel
                                                              .allSchdule![
                                                                  index]
                                                              .actId
                                                              .toString(),
                                                        )));
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
                                                  Image.network(
                                                    syllabusModel
                                                        .allSchdule![index]
                                                        .actIcon
                                                        .toString(),
                                                    errorBuilder: (q, w, e) {
                                                      return Image.asset(
                                                        "assets/images/book 1.png",
                                                        height: 40,
                                                        width: 40,
                                                      );
                                                    },
                                                    height: 40,
                                                    width: 40,
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.only(
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
                                                          syllabusModel
                                                              .allSchdule![
                                                                  index]
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
                                                              syllabusModel
                                                                  .allSchdule![
                                                                      index]
                                                                  .timing
                                                                  .toString(),
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
                        ],
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
