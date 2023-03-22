import 'dart:developer';
import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kidseau/Theme.dart';
import 'package:kidseau/api/models/parent_models/parent_profile_models/parent_kid_fees_model.dart';
import 'package:kidseau/api/parent_panel_apis/parent_profile_apis/parent_fees_api.dart';

import '../../api/models/parent_models/parent_home_models/parent_kid_home_model.dart';
import '../../api/parent_panel_apis/parent_dashboard_api/parent_kid_api.dart';
import '../KidsDashboard/KidsDashboard.dart';

class PFees extends StatefulWidget {
  const PFees({Key? key}) : super(key: key);

  @override
  State<PFees> createState() => _PFeesState();
}

class _PFeesState extends State<PFees> {
  var feeimage = [
    "assets/images/feesimage1.png",
    "assets/images/feesimage2.png",
    "assets/images/feesimage1.png",
    "assets/images/feesimage2.png"
  ];
  var feeschool = ["ABC School", "XYZ School", "ABC School", "XYZ School"];
  ParentKidHomeModel _kidModel = ParentKidHomeModel();
  ParentKidFeesModel feesModel = ParentKidFeesModel();
  final CarouselController _controller = CarouselController();

  @override
  void initState() {
    _getData();
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
      _getFees(_kidModel.parentKidId![0].kidId.toString());
    });
  }

  bool _feesLoading = false;
  _getFees(String kidId) {
    log(kidId);
    final resp = ParentFeesApi().get(kidId: kidId);
    resp.then((value) {
      log(value.toString());
      if (value['status'] == 1) {
        setState(() {
          feesModel = ParentKidFeesModel.fromJson(value);
          _feesLoading = false;
          _isLoading = false;
        });
      } else {
        setState(() {
          _feesLoading = false;
          _isLoading = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
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
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Color(0xff8267AC).withOpacity(0.16),
        ),
        backgroundColor: Color(0xff8267AC).withOpacity(0.16),
        centerTitle: false,
        title: Text(
          "Fees".tr(),
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
                    fit: BoxFit.fitWidth,
                    alignment: Alignment.topLeft,
                    color: Color(0xffD9D9D9),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 16.0,
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 32),
                          CarouselSlider.builder(
                            carouselController: _controller,
                            itemCount: _kidModel.parentKidId!.length,
                            itemBuilder: (ctx, index, realIndex) {
                              return InkWell(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (ctx) => PKidsDashboard(
                                            kidId: _kidModel
                                                .parentKidId![index].kidId
                                                .toString(),
                                          )));
                                },
                                child: Container(
                                  //width: 260,
                                  //height: 100,
                                  margin: EdgeInsets.only(right: 16),
                                  decoration: BoxDecoration(
                                    //color: Colors.red,
                                    borderRadius: BorderRadius.circular(16),
                                    image: DecorationImage(
                                      image: AssetImage(
                                          "assets/images/Student Card.png"),
                                      fit: BoxFit.cover,
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
                                          _kidModel
                                              .parentKidId![index].profilePic
                                              .toString(),
                                          fit: BoxFit.cover,
                                          errorBuilder: (q, w, e) => Image.asset(
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
                                            _kidModel.parentKidId![index].name
                                                .toString(),
                                            style: FontConstant.k16w500White,
                                          ),
                                          Text(
                                            _kidModel
                                                .parentKidId![index].secName
                                                .toString(),
                                            style: FontConstant.k14w400White,
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                "${"From".tr()} ${DateFormat.jm().format(DateFormat("hh:mm:ss").parse(_kidModel.parentKidId![index].schTimeIn.toString().split('.').first))} ",
                                                style:
                                                    FontConstant.k14w400White,
                                              ),
                                              Text(
                                                "${"To".tr()} ${DateFormat.jm().format(DateFormat("hh:mm:ss").parse(_kidModel.parentKidId![index].schTimeOut.toString().split('.').first))}",
                                                style:
                                                    FontConstant.k14w400White,
                                              ),
                                            ],
                                          ),
                                          /*Text(
                                            _kidModel
                                                .parentKidId![index].grpId
                                                .toString()
                                                .tr(),
                                            style: FontConstant.k12w400White,
                                          ),*/
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                            options: CarouselOptions(
                              height: 140,
                              onPageChanged: (index, reason) {
                                setState(() {
                                  _feesLoading = true;
                                  _getFees(_kidModel.parentKidId![index].kidId
                                      .toString());
                                  // _index = index;
                                  /*_isActivityLoading = true;
                            _getActivity(_kidModel
                                .parentKidId![index].kidId
                                .toString());
                            log(index.toString());*/
                                });
                              },
                              viewportFraction:
                                  _kidModel.parentKidId!.length > 1 ? 0.9 : 1,
                              //enlargeCenterPage: true,
                              padEnds: false,
                              //pageSnapping: false,
                              enableInfiniteScroll: false,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          _feesLoading
                              ? Center(
                                  child: CircularProgressIndicator(),
                                )
                              : Padding(
                                  padding: EdgeInsets.only(right: 16.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Remaining fees".tr(),
                                            style:
                                                FontConstant.k24w500brownText,
                                          ),
                                          Text(
                                            feesModel.remainingFees.toString(),
                                            style:
                                                FontConstant.k24w500brownText,
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Total Paid fees".tr(),
                                            style: FontConstant.k16w4008471Text,
                                          ),
                                          SizedBox(height: 16),
                                          Text(
                                            feesModel.totalFees.toString(),
                                            style: FontConstant.k16w4008471Text,
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 20),
                                      Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          "View Fees Structure".tr(),
                                          style: FontConstant.k18w5008267Text,
                                        ),
                                      ),
                                      SizedBox(height: 20),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Previous Payment".tr(),
                                            style: FontConstant.k22w5008471Text
                                                .copyWith(fontSize: 22),
                                          ),
                                          SizedBox(
                                            // width: 382.w,
                                            // height: 400.h,
                                            child: ListView.builder(
                                                padding: EdgeInsets.zero,
                                                shrinkWrap: true,
                                                itemCount: feesModel
                                                    .previousPayment!.length,
                                                physics:
                                                    NeverScrollableScrollPhysics(),
                                                itemBuilder:
                                                    (BuildContext context,
                                                        int index) {
                                                  return Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        vertical: 8.0),
                                                    child: Row(
                                                      children: [
                                                        Container(
                                                          height: 67,
                                                          width: 50,
                                                          clipBehavior:
                                                              Clip.hardEdge,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8),
                                                          ),
                                                          child: Image.network(
                                                            feesModel
                                                                .previousPayment![
                                                                    index]
                                                                .schoolImage
                                                                .toString(),
                                                            fit: BoxFit.fill,
                                                            errorBuilder: (q, w,
                                                                    e) =>
                                                                Image.asset(
                                                                    "assets/images/feesimage1.png"),
                                                          ),
                                                        ),
                                                        SizedBox(width: 16),
                                                        Expanded(
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                    "Paid to"
                                                                        .tr(),
                                                                    style: FontConstant
                                                                        .k16w400B7A4Text,
                                                                  ),
                                                                  Text(
                                                                    feesModel
                                                                        .previousPayment![
                                                                            index]
                                                                        .schoolName
                                                                        .toString(),
                                                                    style: FontConstant
                                                                        .k18w500331FText,
                                                                  ),
                                                                ],
                                                              ),
                                                              Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .end,
                                                                children: [
                                                                  Text(
                                                                    feesModel
                                                                        .previousPayment![
                                                                            index]
                                                                        .date
                                                                        .toString(),
                                                                    style: FontConstant
                                                                        .k16w400B7A4Text,
                                                                  ),
                                                                  Text(
                                                                    feesModel
                                                                        .previousPayment![
                                                                            index]
                                                                        .paidFees
                                                                        .toString(),
                                                                    style: FontConstant
                                                                        .k18w500331FText,
                                                                  ),
                                                                ],
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                }),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                          SizedBox(height: 24),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
    );
  }
}
