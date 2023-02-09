import 'dart:developer';
import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:kidseau/Constants/colors.dart';
import 'package:kidseau/api/Teacherpanelapi/teacher_student_performance_apis/edit_performance_api.dart';
import 'package:kidseau/api/Teacherpanelapi/teacher_student_performance_apis/student_detail_api.dart';
import 'package:kidseau/api/models/kid_detail_model/kid_performance_detail_model.dart';
import 'package:kidseau/api/models/perforamnce_models/edit_student_performance_model.dart';
import 'package:kidseau/shard_prefs/shared_prefs.dart';

import '../../Theme.dart';
import '../../Widgets/Calender/calendermodel.dart';
import '../../Widgets/buttons.dart';

class TStudentDetailEditScreen extends StatefulWidget {
  final KidPerformanceDetailModel model;
  final String kidId;
  const TStudentDetailEditScreen(
      {Key? key, required this.model, required this.kidId})
      : super(key: key);

  @override
  State<TStudentDetailEditScreen> createState() =>
      _TStudentDetailEditScreenState();
}

class _TStudentDetailEditScreenState extends State<TStudentDetailEditScreen> {
  List<String> imageicon = [
    "assets/images/iconprofile.png",
    "assets/images/galleryicon.png",
  ];

  List<String> items = [
    "Overview",
    "Gallery",
  ];
  // final List screen = [Messagebody(),];
  int selectedIndex = 0;

  final controller = PageController(initialPage: 1);

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    _isLoading = true;
    _getData();
    log(DateFormat('yyyy-MM-dd').format(DateTime.now()));
    for (int i = 0; i <= 6; i++) {
      dayList.add({
        "day": DateFormat.EEEE()
            .format(DateTime.now().subtract(Duration(days: i))),
        "date": DateFormat('yyyy-MM-dd')
            .format(DateTime.now().subtract(Duration(days: i)))
      });
    }
    dayList.removeWhere((element) => element['day'] == "Friday");
    dayList.removeWhere((element) => element['day'] == "Saturday");
    log(dayList.toString());
    super.initState();
  }

  bool _isArabic = false;
  int pageIndex = 0;
  var shortnames = ["PG", "RS", "Re", "LA", "VP"];
  var fullnames = [
    "Playing Games",
    "Recognizing Sound",
    "Resting",
    "Learning Alphabets",
    "VP",
    "Voice Practice"
  ];

  List<String> imageicon2 = [
    "assets/images/iconprofile.png",
    "assets/images/galleryicon.png",
  ];

  List<String> items2 = [
    "Overview",
    "Gallery",
  ];

  EditStudentPerformanceModel model = EditStudentPerformanceModel();

  String date = DateFormat('yyyy-MM-dd').format(DateTime.now());
  bool _performanceLoading = false;
  _getData() {
    final resp = EditStudentApi().get(kidId: widget.kidId, date: date);
    resp.then((value) {
      if (value['status'] == 1) {
        setState(() {
          model = EditStudentPerformanceModel.fromJson(value);
          _isLoading = false;
          _performanceLoading = false;
        });
      } else {
        setState(() {
          model = EditStudentPerformanceModel(pfmRate: []);
          _isLoading = false;
          _performanceLoading = false;
        });
      }
    });
  }

  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Color(0xffF8F6FA),
        ),
        child: Scaffold(
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
              : SingleChildScrollView(
                  child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                              "assets/images/Group8270.png",
                            ),
                            fit: BoxFit.cover)),
                    child: Container(
                      height: 1.sh,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color(0xffF8F6FA).withOpacity(0.7),
                            Color(0xffF8F6FA),
                            Color(0xffF8F6FA),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          stops: [0.3, 0.6, 0.9],
                        ),
                      ),
                      child: Stack(
                        children: [
                          Container(
                            width: 1.sw,
                          ),
                          Container(
                            width: 1.sw,
                            height: 455,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  SizedBox(height: 30),
                                  Row(
                                    children: [
                                      Container(
                                        height: 128,
                                        width: 96,
                                        child: Image.network(
                                          widget.model.kidImage.toString(),
                                          fit: BoxFit.fitHeight,
                                          errorBuilder: (q, w, e) => Image.asset(
                                              "assets/images/profileperson.png"),
                                        ),
                                      ),
                                      SizedBox(width: 16),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            widget.model.kidName.toString(),
                                            style:
                                                FontConstant2.k32w500331Ftext,
                                          ),
                                          Text(
                                            widget.model.kidGender!
                                                        .toLowerCase() ==
                                                    'm'
                                                ? 'S/O ${widget.model.kidFather}'
                                                : 'D/O ${widget.model.kidFather}',
                                            style: FontConstant.k16w5008471Text,
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                  widget.model.kidGroup
                                                      .toString(),
                                                  style: FontConstant
                                                      .k16w5008471Text),
                                              SizedBox(
                                                width: 4,
                                              ),
                                              Container(
                                                width: 4,
                                                height: 4,
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: Colors.black),
                                              ),
                                              SizedBox(
                                                width: 4,
                                              ),
                                              Text(
                                                  '${widget.model.kidAge} ${"years".tr()}',
                                                  style: FontConstant
                                                      .k16w5008471Text),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 50),
                                  GroupTab(),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  _performanceLoading
                                      ? Center(
                                          child: CircularProgressIndicator(),
                                        )
                                      : ListView.separated(
                                          shrinkWrap: true,
                                          physics:
                                              NeverScrollableScrollPhysics(),
                                          itemBuilder: (context, index) {
                                            return Container(
                                              width: 1.sw,
                                              height: 148,
                                              padding: EdgeInsets.all(16),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(16),
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
                                                  Expanded(
                                                    child: Column(
                                                      children: [
                                                        Row(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Expanded(
                                                              child: Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                    model
                                                                        .pfmRate![
                                                                            index]
                                                                        .actTitle
                                                                        .toString(),
                                                                    style: FontConstant
                                                                        .k18w500331FText,
                                                                  ),
                                                                  SizedBox(
                                                                      height:
                                                                          0),
                                                                  Text(
                                                                    '${"Teacher".tr()} - ${model.pfmRate![index].teacherName.toString()}',
                                                                    style: FontConstant
                                                                        .k16w400B7A4B2Text,
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            /*FlutterSwitch(
                                                              width: 56,
                                                              height: 32,
                                                              toggleSize: 30,
                                                              inactiveColor:
                                                                  ThemeColor
                                                                      .b7A4B2,
                                                              activeColor:
                                                                  ThemeColor
                                                                      .primarycolor,
                                                              inactiveIcon:
                                                                  Image.asset(
                                                                      'assets/images/sf.png'),
                                                              activeIcon:
                                                                  Image.asset(
                                                                      'assets/images/baby.png'),
                                                              value: false,
                                                              onToggle: (v) {
                                                                setState(() {
                                                                  // _valueList[index] = v;
                                                                });
                                                              },
                                                            ),*/
                                                          ],
                                                        ),
                                                        /* Row(
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
                                                        :*/
                                                        Slider(
                                                          divisions: 5,
                                                          label: model
                                                              .pfmRate![index]
                                                              .pfmRate!,
                                                          activeColor:
                                                              Color(0xFFF5C88E),
                                                          inactiveColor:
                                                              ThemeColor.ebe6F2,
                                                          thumbColor:
                                                              Color(0xFFF0AD56),
                                                          min: 0,
                                                          max: 5,
                                                          value: double.parse(
                                                              model
                                                                  .pfmRate![
                                                                      index]
                                                                  .pfmRate!),
                                                          onChanged: (val) {
                                                            setState(() {});
                                                          },
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                          separatorBuilder: (ctx, ind) =>
                                              SizedBox(
                                                height: 16.h,
                                              ),
                                          itemCount: model.pfmRate!.length)
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
        ));
  }

  int current = 0;
  List<Map<String, String>> dayList = [];

  Container GroupTab() {
    return Container(
      width: 414,
      height: 62,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(81)),
      child: ListView.builder(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemCount: dayList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (ctx, index) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      current = index;
                      date = dayList[index]['date']!;
                      _performanceLoading = true;
                      _getData();
                    });
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    margin: const EdgeInsets.all(5),
                    //width: 72,
                    height: 43,
                    padding: EdgeInsets.symmetric(horizontal: 8),
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
                        dayList[index]['day']!.tr(),
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
