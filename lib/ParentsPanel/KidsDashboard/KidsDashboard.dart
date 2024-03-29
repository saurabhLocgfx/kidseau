import 'dart:developer';
import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kidseau/ParentsPanel/KidsDashboard/KidsOverview.dart';
import 'package:kidseau/ParentsPanel/KidsDashboard/Kidsgallery.dart';
import 'package:kidseau/Theme.dart';
import 'package:kidseau/api/models/holiday_model/holiday_model.dart';
import 'package:kidseau/api/models/parent_models/kid_details_models/parent_kid_overview_model.dart';
import 'package:kidseau/api/parent_panel_apis/parent_kid_details_api/parent_kid_overview_api.dart';

class PKidsDashboard extends StatefulWidget {
  final String kidId;
  const PKidsDashboard({Key? key,
    required this.kidId
  }) : super(key: key);

  @override
  State<PKidsDashboard> createState() => _PKidsDashboardState();
}

class _PKidsDashboardState extends State<PKidsDashboard> {
  List<String> imageicon = [
    "assets/images/iconprofile.png",
    "assets/images/galleryicon.png",
  ];

  List<String> _items = [
    "Overview",
    "Gallery",
  ];
  // final List screen = [Messagebody(),];
  //int selectedIndex = 0;

  final controller = PageController(initialPage: 1);

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _getData();
    super.initState();
  }

  bool _isLoading = false;
  _getData() {
    _isLoading = true;
    final resp = KidOverviewApi().get(
        kidId: widget.kidId
    );
    resp.then((value) {
      if (value['Status'] == 1) {
        setState(() {
          overviewModel = ParentKidOverviewModel.fromJson(value);
          var v = overviewModel.kidDetails!.actvity!.toSet().toList();
          log(v.toString());
          _isLoading = false;
        });
      } else {
        setState(() {
          _isLoading = false;
        });
      }
    });
  }

  HolidayApiModel holidayModel = HolidayApiModel();
  ParentKidOverviewModel overviewModel = ParentKidOverviewModel();
  /* final PageController _pageController = PageController(
    initialPage: 0,
  );
*/

  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xff8267AC).withOpacity(.06),
      ),
      child: Scaffold(
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
            statusBarColor: ThemeColor.lightpurple.withOpacity(0.06),
          ),
          backgroundColor: Color(0xff8267AC).withOpacity(0.06),
          centerTitle: false,
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
          title: GestureDetector(
            onTap: () {},
            child: Text(
              "Kid’s Profile".tr(),
              style: FontConstant.k18w5008471Text,
            ),
          ),
        ),
        body: _isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        //height: 414.h,
                        //width: 414.w,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Color(0xffD9D9D9).withOpacity(.100),
                                Color(0xffD9D9D9).withOpacity(.0),
                              ],
                            ),
                            image: DecorationImage(
                                opacity: 1,
                                image: AssetImage(
                                    "assets/images/postsbackground.png"),
                                fit: BoxFit.fitWidth,
                                alignment: Alignment.topLeft)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Column(
                            children: [
                              SizedBox(height: 40),
                              Row(
                                children: [
                                  Container(
                                    height: 128,
                                    width: 90,
                                    clipBehavior: Clip.hardEdge,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8)),
                                    child: Image.network(
                                      overviewModel.kidDetails!.kidImage
                                          .toString(),
                                      fit: BoxFit.cover,
                                      errorBuilder: (q, w, e) => Image.asset(
                                          "assets/images/profileperson.png"),
                                    ),
                                  ),
                                  SizedBox(width: 20),
                                  SizedBox(
                                    height: 105,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: 250.w,
                                          child: Text(
                                            overviewModel.kidDetails!.kidName
                                                .toString(),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style:
                                                FontConstant2.k32w500331Ftext,
                                          ),
                                        ),
                                        Text(
                                          overviewModel.kidDetails!.kidGender
                                                      .toString()
                                                      .toLowerCase() ==
                                                  'm'
                                              ? "S/O -  ${overviewModel.kidDetails!.kidFather.toString()}"
                                              : "D/O -  ${overviewModel.kidDetails!.kidFather.toString()}",
                                          style: FontConstant.k16w5008471Text,
                                        ),
                                        Text(
                                            overviewModel.kidDetails!.kidVoucher
                                                .toString(),
                                            style:
                                                FontConstant.k16w5008471Text),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 40),
                              Pageviewtabprofile(),
                              SizedBox(height: 20),
                              pageIndex == 0
                                  ? PKidsOverview(
                                      model: overviewModel,
                                    )
                                  : PKidsGallery(
                                      kidId: overviewModel.kidDetails!.kidId
                                          .toString(),
                                    )
                              /* SizedBox(
                      height: 1350.h,
                      child: PageView(
                        controller: _pageController,
                        onPageChanged: (page) {
                          setState(
                            () {
                              pageIndex = page;
                            },
                          );
                        },
                        children: [],
                      ),
                    ),*/
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }

  Container Pageviewtabprofile() {
    return Container(
      height: 56,
      width: 250,
      padding: EdgeInsets.symmetric(horizontal: 2),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(76),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                pageIndex = 0;
              });
            },
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      // selectedIndex = pageIndex = 0;
                      /* _pageController.animateToPage(
                        pageIndex,
                        duration: Duration(milliseconds: 100),
                        curve: Curves.linear,
                      );*/
                      pageIndex = 0;
                    });
                  },
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(93),
                        color:
                            pageIndex == 0 ? Color(0xffEBE6F2) : Colors.white),
                    child: Center(
                      child: Image.asset(
                          pageIndex == 0
                              ? "assets/images/profileiconfill.png"
                              : "assets/images/profileicon.png",
                          height: 24),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 4.0),
                  child: Text("Overview".tr(),
                      style: FontConstant.k14w500B7A4Text.copyWith(
                          color: pageIndex == 0
                              ? Color(0xff8267AC)
                              : Color(0xffB7A4B2))),
                ),
              ],
            ),
          ),
          SizedBox(width: 10),
          GestureDetector(
            onTap: () {
              setState(() {
                //selectedIndex = pageIndex = 1;
                /* _pageController.animateToPage(
                  pageIndex,
                  duration: Duration(milliseconds: 100),
                  curve: Curves.linear,
                );*/
                pageIndex = 1;
              });
            },
            child: Row(
              children: [
                Text("Gallery".tr(),
                    style: FontConstant.k14w500B7A4Text.copyWith(
                        color: pageIndex == 1
                            ? Color(0xff8267AC)
                            : Color(0xffB7A4B2))),
                Padding(
                  padding: const EdgeInsets.only(left: 4.0),
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(93),
                        color:
                            pageIndex == 1 ? Color(0xffEBE6F2) : Colors.white),
                    child: Center(
                      child: Image.asset(
                          pageIndex == 1
                              ? "assets/images/Galleryfill.png"
                              : "assets/images/galleryicon.png",
                          height: 24),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
