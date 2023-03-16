import 'dart:developer';
import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:kidseau/api/Teacherpanelapi/teacher_student_performance_apis/edit_performance_api.dart';
import 'package:kidseau/api/models/kid_detail_model/kid_performance_detail_model.dart';
import 'package:kidseau/api/models/perforamnce_models/edit_student_performance_model.dart';

import '../../Theme.dart';
import '../../Widgets/buttons.dart';
import '../../Widgets/custom_snack_bar.dart';
import '../../api/Teacherpanelapi/teacher_student_performance_apis/submit_performance_api.dart';

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

  double value = 1;
  String date = DateFormat('yyyy-MM-dd').format(DateTime.now());
  bool _performanceLoading = false;
  _getData() {
    final resp = EditStudentApi().get(kidId: widget.kidId, date: date);
    resp.then((value) {
      log(value.toString());
      if (value['status'] == 1) {
        setState(() {
          model = EditStudentPerformanceModel.fromJson(value);
          for (var v in model.pfmRate!) {
            _performanceStatus
                .add({"performance": v.pfmRate, "id": v.dayActId});
            _valueList.add(false);
          }
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

  //List<Map<String, dynamic>> _performanceStatus = [];
  List<bool> _valueList = [];
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
              : Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                            "assets/images/Group8270.png",
                          ),
                          fit: BoxFit.fitWidth,
                          alignment: Alignment.topLeft)),
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
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: SingleChildScrollView(
                            //physics: NeverScrollableScrollPhysics(),
                            child: Column(
                              children: [
                                SizedBox(height: 30),
                                Row(
                                  children: [
                                    Container(
                                      height: 128,
                                      width: 96,
                                      clipBehavior: Clip.hardEdge,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      child: Image.network(
                                        widget.model.kidImage.toString(),
                                        fit: BoxFit.fill,
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
                                          style: FontConstant2.k32w500331Ftext,
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
                                    : model.pfmRate!.isEmpty
                                        ? Column(
                                            children: [
                                              Image.asset(
                                                "assets/images/chicken.png",
                                                width: 1.sw,
                                                height: 200,
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Text(
                                                "Oops!".tr(),
                                                style: FontConstant2
                                                    .k24w5008267text,
                                              ),
                                              Text(
                                                "No activity available for the kid."
                                                    .tr(),
                                                style: FontConstant
                                                    .k16w4008471Text,
                                              ),
                                            ],
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
                                                              date !=
                                                                      DateFormat(
                                                                              "yyyy-MM-dd")
                                                                          .format(
                                                                              DateTime.now())
                                                                  ? FlutterSwitch(
                                                                      width: 56,
                                                                      height:
                                                                          32,
                                                                      toggleSize:
                                                                          30,
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
                                                                      value:
                                                                          false,
                                                                      onToggle:
                                                                          (v) {
                                                                        /*setState(
                                                                          () {
                                                                        _valueList[
                                                                            index] = v;
                                                                      });*/
                                                                      },
                                                                    )
                                                                  : FlutterSwitch(
                                                                      width: 56,
                                                                      height:
                                                                          32,
                                                                      toggleSize:
                                                                          30,
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
                                                                      value: _valueList[
                                                                          index],
                                                                      onToggle:
                                                                          (v) {
                                                                        setState(
                                                                            () {
                                                                          _valueList[index] =
                                                                              !_valueList[index];
                                                                        });
                                                                      },
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
                                                              label: _performanceStatus[index]
                                                                          [
                                                                          'performance'] ==
                                                                      'null'
                                                                  ? '1'
                                                                  : _performanceStatus[
                                                                          index]
                                                                      [
                                                                      'performance'],
                                                              activeColor: Color(
                                                                  0xFFF5C88E),
                                                              inactiveColor:
                                                                  ThemeColor
                                                                      .ebe6F2,
                                                              thumbColor: Color(
                                                                  0xFFF0AD56),
                                                              min: 0,
                                                              max: 5,
                                                              value: _performanceStatus[index]['performance'] ==
                                                                      'null'
                                                                  ? 0
                                                                  : int.parse(_performanceStatus[index]['performance'])
                                                                      .round()
                                                                      .toDouble(),
                                                              onChanged:
                                                                  _valueList[index] ==
                                                                          false
                                                                      ? null
                                                                      : (val) {
                                                                          setState(
                                                                              () {
                                                                            value =
                                                                                val;
                                                                            _performanceStatus[index]['performance'] =
                                                                                val.round().toString();
                                                                            //_performanceStatus[index]['id'] = _studentPerformanceModel.performance![index].kidId;
                                                                          });
                                                                        }),
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
                                            itemCount: model.pfmRate!.length),
                                if (date ==
                                    DateFormat('yyyy-MM-dd')
                                        .format(DateTime.now()))
                                  if (!_performanceLoading)
                                    if (model.pfmRate != null)
                                      if (model.pfmRate!.isNotEmpty)
                                        SizedBox(
                                          height: 24,
                                        ),
                                if (date ==
                                    DateFormat('yyyy-MM-dd')
                                        .format(DateTime.now()))
                                  if (!_performanceLoading)
                                    if (model.pfmRate != null)
                                      if (model.pfmRate!.isNotEmpty)
                                        Container(
                                          height: 56,
                                          width: 1.sw,
                                          margin: EdgeInsets.only(bottom: 100),
                                          child: _btnLoading
                                              ? Center(
                                                  child:
                                                      CircularProgressIndicator(),
                                                )
                                              : MainButton(
                                                  onTap: () {
                                                    setState(() {
                                                      _btnLoading = true;
                                                    });
                                                    for (var v
                                                        in _performanceStatus) {
                                                      _performance.add(
                                                        {
                                                          "kid_id": model.kidId,
                                                          "pfm": v['performance'] ==
                                                                  'null'
                                                              ? 0
                                                              : int.parse(v[
                                                                  'performance']),
                                                          "days_activity_id":
                                                              v['id']
                                                        },
                                                      );
                                                    }
                                                    final resp =
                                                        SubmitPerformanceApi()
                                                            .get(
                                                                performance:
                                                                    _performance);
                                                    resp.then((value) {
                                                      if (value['status'] ==
                                                          1) {
                                                        CustomSnackBar
                                                            .customSnackBar(
                                                                context,
                                                                'Submitted successfully.');
                                                        _getData();
                                                        setState(() {
                                                          current = 0;
                                                          _btnLoading = false;
                                                        });
                                                      } else {
                                                        CustomSnackBar
                                                            .customErrorSnackBar(
                                                                context,
                                                                'Submit failed. Please try again later.');
                                                        setState(() {
                                                          _btnLoading = false;
                                                        });
                                                      }
                                                    });
                                                  },
                                                  title: "Submit".tr(),
                                                  textStyleColor: Colors.white,
                                                  backgroundColor:
                                                      ThemeColor.primarycolor),
                                        ),
                                SizedBox(height: 25),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
        ));
  }

  List<Map<String, dynamic>> _performanceStatus = [];
  List<Map<String, dynamic>> _performance = [];
  Map<String, dynamic> _selectedMap = {};
  bool _btnLoading = false;

  int current = 0;
  List<Map<String, String>> dayList = [];

  Container GroupTab() {
    return Container(
      width: 414,
      height: 62,
      clipBehavior: Clip.hardEdge,
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
                      print(date);
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
