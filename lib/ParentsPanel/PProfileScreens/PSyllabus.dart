import 'dart:developer';
import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kidseau/Theme.dart';
import 'package:kidseau/api/models/kid_detail_model/kid_groups_model.dart';
import 'package:kidseau/api/models/parent_models/parent_post_models/parent_post_school_model.dart';
import 'package:kidseau/api/models/parent_models/parent_profile_models/parent_syllabus_model.dart';
import 'package:kidseau/api/parent_panel_apis/parent_kid_details_api/parent_kid_overview_api.dart';
import 'package:kidseau/api/parent_panel_apis/parent_profile_apis/parent_get_syllabus_api.dart';

import '../../api/models/parent_models/parent_home_models/parent_kid_home_model.dart';
import '../../api/parent_panel_apis/parent_dashboard_api/parent_kid_api.dart';
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

  bool loading = true;
  _startLoading() {
    // Simulate a delay of 2 seconds
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        // Stop loading after 2 seconds
        loading = false;
      });
    });
  }

  ParentPostSchoolModel model = ParentPostSchoolModel();
  final CarouselController _controller = CarouselController();
  ParentKidHomeModel _kidModel = ParentKidHomeModel();
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
    _startLoading();
    super.initState();
  }

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
      } else {
        setState(() {
          _isLoading = false;
        });
      }
    }).then((value) {
      _getKidGroups(_kidModel.parentKidId![0].kidId.toString(), 0);
    });
  }

  String selected = 'Sunday'.tr();

  bool _syllabusLoading = false;
  String _str = 'sun';

  _getSyllabus(String syllabusId) {
    print(selected);
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
    print(_str);
    print('$syllabusId 123');
    final resp = ParentGetSyllabusApi().get(grpId: syllabusId, day: _str);
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

  /*PSchoolGroupDetailModel _grpModel = PSchoolGroupDetailModel();*/
  KidGroupsResponse _response =
      KidGroupsResponse(status: 0, groupWithSection: []);
  bool _grpLoading = false;

  String _syllabusId = '';

  _getKidGroups(String kidId, int index) {
    final resp = KidOverviewApi().getKidGroups(kidId: kidId);
    resp.then((value) {
      if (value['status'] == 1) {
        setState(() {
          _response = KidGroupsResponse.fromJson(value);
          _syllabusId = _response.groupWithSection[0].syllabusId;
        });
      } else {
        _isLoading = false;
        _grpLoading = false;
      }
    }).then((value) {
      _getSyllabus(_response.groupWithSection[0].syllabusId);
    });
  }

  /*_getSchGroups(String schId) {
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
  }*/

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
      body: loading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : (_kidModel.parentKidId == null || _kidModel.parentKidId!.isEmpty)
              ? Center(
                  child: Text(
                  "No syllabus added yet",
                  style: FontConstant.k18w5008471Text,
                ))
              : _isLoading
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
                          SingleChildScrollView(
                            child: Column(
                              children: [
                                SizedBox(height: 16),
                                /*Row(
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
                                      */
                                /*_index = index;
                                _postsLoading = true;
                                _getPosts();*/
                                /*
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
                        ),*/
                                CarouselSlider.builder(
                                  carouselController: _controller,
                                  itemCount: _kidModel.parentKidId!.length,
                                  itemBuilder: (ctx, index, realIndex) {
                                    return InkWell(
                                      onTap: () {
                                        /*Navigator.of(context)
                                    .push(MaterialPageRoute(
                                    builder: (ctx) => PKidsDashboard(
                                      kidId: _kidModel
                                          .parentKidId![index].kidId
                                          .toString(),
                                    )));*/
                                      },
                                      child: Container(
                                        //width: 260,
                                        // height: 100,
                                        margin: EdgeInsets.only(
                                            right: 16,
                                            left: index == 0 ? 16 : 0),
                                        decoration: BoxDecoration(
                                          // color: Colors.red,
                                          borderRadius:
                                              BorderRadius.circular(16),
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
                                                _kidModel.parentKidId![index]
                                                    .profilePic
                                                    .toString(),
                                                fit: BoxFit.cover,
                                                errorBuilder: (q, w, e) =>
                                                    Image.asset(
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
                                                /*SizedBox(
                                        height: 8,
                                      ),*/
                                                Text(
                                                  _kidModel
                                                      .parentKidId![index].name
                                                      .toString(),
                                                  style:
                                                      FontConstant.k16w500White,
                                                ),
                                                Text(
                                                  _kidModel.parentKidId![index]
                                                      .secName
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
                                                  _kidModel.parentKidId![index]
                                                      .grpName
                                                      .toString(),
                                                  style:
                                                      FontConstant.k12w400White,
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
                                        _grpLoading = true;
                                        _syllabusLoading = true;
                                        _getKidGroups(
                                            _kidModel.parentKidId![index].kidId
                                                .toString(),
                                            index);
                                        /*_feesLoading = true;
                                _getFees(_kidModel.parentKidId![index].kidId
                                    .toString());*/
                                        // _index = index;
                                        /*_isActivityLoading = true;
                            _getActivity(_kidModel
                                .parentKidId![index].kidId
                                .toString());
                            log(index.toString());*/
                                      });
                                    },
                                    viewportFraction:
                                        _kidModel.parentKidId!.length > 1
                                            ? 0.9
                                            : 1,
                                    //enlargeCenterPage: true,
                                    padEnds: false,
                                    //pageSnapping: false,
                                    enableInfiniteScroll: false,
                                  ),
                                ),
                                /*SizedBox(height: 30),
                        _grpLoading
                            ? SizedBox.shrink()
                            : Container(
                                height: 62,
                                margin: const EdgeInsets.all(10),
                                clipBehavior: Clip.hardEdge,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(81)),
                                child: ListView.builder(
                                    shrinkWrap: true,
                                    physics: const BouncingScrollPhysics(),
                                    itemCount:
                                        _response.groupWithSection.length,
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
                                                _grpId = _response
                                                    .groupWithSection[index]
                                                    .syllabusId
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
                                                  _response
                                                      .groupWithSection[index]
                                                      .grpName
                                                      .toString(),
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
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
                              ),*/
                                SizedBox(height: 16),
                                _grpLoading
                                    ? SizedBox.shrink()
                                    : Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
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
                                                _getSyllabus(_syllabusId);
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
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 16),
                                        width: 1.sw,
                                        child: ListView.separated(
                                            separatorBuilder: (ctx, ind) =>
                                                SizedBox(
                                                  height: 14.h,
                                                ),
                                            shrinkWrap: true,
                                            padding: EdgeInsets.zero,
                                            physics:
                                                NeverScrollableScrollPhysics(),
                                            itemCount: syllabusModel
                                                .allSchdule!.length,
                                            scrollDirection: Axis.vertical,
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              return InkWell(
                                                onTap: () {
                                                  Navigator.of(context).push(
                                                      MaterialPageRoute(
                                                          builder: (ctx) =>
                                                              PLearningAplphabets(
                                                                dayId: syllabusModel
                                                                    .allSchdule![
                                                                        index]
                                                                    .dayId
                                                                    .toString(),
                                                                selectedDay:
                                                                    _str,
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
                                                        BorderRadius.circular(
                                                            16),
                                                  ),
                                                  child: Padding(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        horizontal: 15.0),
                                                    child: Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Image.network(
                                                          syllabusModel
                                                              .allSchdule![
                                                                  index]
                                                              .actIcon
                                                              .toString(),
                                                          errorBuilder:
                                                              (q, w, e) {
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
                                                          padding:
                                                              EdgeInsets.only(
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
                                                                        fontSize:
                                                                            16),
                                                              ),
                                                              Row(
                                                                children: [
                                                                  Text(
                                                                    syllabusModel
                                                                        .allSchdule![
                                                                            index]
                                                                        .timing
                                                                        .toString(),
                                                                    style: FontConstant.k14w400lightpurpleText.copyWith(
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
                                SizedBox(height: 25),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
    );
  }

  Container GroupTab() {
    return Container(
      //width: 414,
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
