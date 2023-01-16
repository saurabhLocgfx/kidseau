import 'dart:developer';
import 'dart:ui';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kidseau/Constants/colors.dart';
import 'package:kidseau/TeachersPanel/THomeScreen/TGroupScreen.dart';
import 'package:kidseau/TeachersPanel/THomeScreen/TLearningAlphabets.dart';
import 'package:kidseau/TeachersPanel/TNotificationScreen/TNotificationScreen.dart';
import 'package:kidseau/Theme.dart';
import 'package:kidseau/api/Teacherpanelapi/Tmodel/THomemodel.dart';
import 'package:kidseau/api/Teacherpanelapi/Tmodel/TScheduleModel.dart';
import 'package:kidseau/api/Teacherpanelapi/Tschedule_api/schedule_api.dart';
import 'package:kidseau/api/Teacherpanelapi/teacher_home_api/THomeApi.dart';
import 'package:kidseau/shard_prefs/shared_prefs.dart';
import '../../api/models/teacher_profile_details_model/teacher_profile_details_model.dart';
import '../../restartappwidget/restartwidgets.dart';
import '../TReminder/TReminderScreen.dart';
import 'TAttendanceScreen.dart';
import 'TScheduleScreen.dart';

class THomeScreen extends StatefulWidget {
  bool Ezarabic = false;
  THomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<THomeScreen> createState() => _THomeScreenState();
}

class _THomeScreenState extends State<THomeScreen> {
  bool colorChange = false;
  bool loadingData = false;
  bool loadingsch = false;
  @override
  void initState() {
    getData();
    super.initState();
  }

  int length = 0;

  getData() {
    loadingData = true;
    final rsp = THomeApi().get();
    rsp.then((value) {
      log(value.toString());
      try {
        setState(() {
          _name = value;
          _countLength();
          loadingData = false;
        });
      } catch (e) {
        setState(() {
          loadingData = false;
        });
      }
    });
  }

  _countLength() {
    setState(() {
      if (_name.attendance!.isEmpty) {
        length = _name.schdule!.length;
      } else {
        if (_name.schdule!.length > 4) {
          length = 4;
        } else {
          length = _name.schdule!.length;
        }
      }
      log(length.toString());
    });
  }

  THomeModel _name = THomeModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors().bgColor,
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
        backgroundColor: Color(0xff8267AC).withAlpha(16),
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Text(_name.hello ?? '',
                  style: FontConstant2.k32w5008267text.copyWith(fontSize: 25)),
            ),
          ],
        ),
        actions: [
          SizedBox(
            width: 164,
            child: Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: PopupMenuButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16)),
                          itemBuilder: (context) {
                            return [
                              PopupMenuItem(
                                enabled: true,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        UserPrefs.setEArbBool(false);
                                        context.locale = Locale('en', 'US');
                                        RestartWidget.restartApp(context);
                                        setState(() {
                                          colorChange;
                                        });
                                      },
                                      child: Row(
                                        children: [
                                          Text(
                                            ("English"),
                                            style: colorChange
                                                ? FontConstant.k16w5008267Text
                                                : FontConstant.k18w5008471Text,
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 20),
                                    GestureDetector(
                                      onTap: () {
                                        UserPrefs.setEArbBool(false);
                                        context.locale = Locale('fr', 'FR');
                                        RestartWidget.restartApp(context);
                                        setState(() {
                                          colorChange;
                                        });
                                      },
                                      child: Row(
                                        children: [
                                          Text(
                                            ("French"),
                                            style: colorChange
                                                ? FontConstant.k16w5008267Text
                                                : FontConstant.k18w5008471Text,
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 20),
                                    GestureDetector(
                                      onTap: () {
                                        UserPrefs.setEArbBool(true);
                                        context.locale = Locale('ar', 'AR');
                                        RestartWidget.restartApp(context);

                                        setState(() {
                                          colorChange;
                                        });
                                      },
                                      child: Row(
                                        children: [
                                          Text(
                                            ("Arabic"),
                                            style: colorChange
                                                ? FontConstant.k16w5008267Text
                                                : FontConstant.k18w5008471Text,
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ];
                          },
                          child: Image.asset(
                            "assets/images/Languageicon.png",
                            height: 24,
                          ))),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => TReminderScreen(),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Image.asset(
                        "assets/images/clockicon.png",
                        height: 24,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TNotificationScreen()),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Image.asset(
                        "assets/images/iconbell.png",
                        height: 24,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      body: loadingData
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Container(
                width: 1.sw,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 40,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 16.0),
                      child: SizedBox(
                        height: 128,
                        width: 1.sw,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: _name.groupInCard!.length,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => TGroupScreen()),
                                  );
                                },
                                child: Groupcard(
                                  nameData: _name,
                                  index: index,
                                ));
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0, right: 16),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: SizedBox(
                          width: 1.sw,
                          child: Text(
                            "Schedule".tr(),
                            style: FontConstant2.baloothampifont,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      width: 1.sw,
                      child: ListView.separated(
                          separatorBuilder: (ctx, ind) => SizedBox(
                                height: 14.h,
                              ),
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: length,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (BuildContext context, int index) {
                            return InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => TLearningAlphabets(
                                            scheduleID: _name
                                                .schdule![index].actId
                                                .toString(),
                                          )),
                                );
                              },
                              child: Container(
                                height: 64,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15.0),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        _name.schdule![index].actIcon
                                            .toString(),
                                        errorBuilder: (q, w, e) {
                                          return Text('Image not loaded');
                                        },
                                        height: 40,
                                        width: 40,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 15.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              _name.schdule![index].actTitle
                                                  .toString(),
                                              style: FontConstant
                                                  .k32w500blackText
                                                  .copyWith(fontSize: 16),
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  _name.schdule![index].grpName
                                                      .toString(),
                                                  style: FontConstant
                                                      .k14w400lightpurpleText
                                                      .copyWith(
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontSize: 14,
                                                          color: Color(
                                                              0xffB7A4B2)),
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Container(
                                                  width: 3,
                                                  height: 3,
                                                  decoration: BoxDecoration(
                                                      color: Color(0xffB7A4B2),
                                                      shape: BoxShape.circle),
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  "From ${_name.schdule![index].timing!.split('-').first} ",
                                                  style: FontConstant
                                                      .k14w400lightpurpleText
                                                      .copyWith(
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontSize: 14,
                                                          color: Color(
                                                              0xffB7A4B2)),
                                                ),
                                                Text(
                                                  "To ${_name.schdule![index].timing!.split('-').last}",
                                                  style: FontConstant
                                                      .k14w400lightpurpleText
                                                      .copyWith(
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontSize: 14,
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
                    length == _name.schdule!.length
                        ? SizedBox.shrink()
                        : Center(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => ScheduleScreen(),
                                  ),
                                );
                              },
                              child: Container(
                                color: Colors.transparent,
                                padding: EdgeInsets.all(16),
                                child: Text("See more".tr(),
                                    style:
                                        FontConstant.k16w500purpleText.copyWith(
                                      fontSize: 18,
                                    )),
                              ),
                            ),
                          ),
                    SizedBox(height: 10),
                    _name.attendance!.isEmpty
                        ? SizedBox.shrink()
                        : Padding(
                            padding: const EdgeInsets.only(
                                left: 16.0, bottom: 10, right: 16),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: SizedBox(
                                width: 1.sw,
                                child: Text(
                                  "Attendance".tr(),
                                  style: FontConstant2.baloothampifont,
                                ),
                              ),
                            ),
                          ),
                    _name.attendance?.isEmpty ?? [].isEmpty
                        ? SizedBox.shrink()
                        : SizedBox(
                            height: 128,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(right: 16, left: 16),
                              child: ListView.separated(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: _name.attendance!.length,
                                itemBuilder: (context, index) =>
                                    GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              TAttendanceScreen(
                                                attendanceId: _name
                                                    .attendance![index].groupId
                                                    .toString(),
                                              )),
                                    );
                                  },
                                  child: Attendancecard(
                                    index: index,
                                    model: _name,
                                  ),
                                ),
                                separatorBuilder: (ctx, ind) => SizedBox(
                                  width: 16,
                                ),
                              ),
                            ),
                          ),
                    SizedBox(height: 112.h)
                  ],
                ),
              ),
            ),
    );
  }

  Padding schedulelistapi() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: loadingData
          ? CircularProgressIndicator()
          : SizedBox(
              // height: 300.h,
              width: 1.sw,
              child: ListView.separated(
                  separatorBuilder: (ctx, ind) => SizedBox(
                        height: 14.h,
                      ),
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: _name.schdule!.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TLearningAlphabets(
                                    scheduleID:
                                        _name.schdule![index].actId.toString(),
                                  )),
                        );
                      },
                      child: loadingData
                          ? CircularProgressIndicator()
                          : Container(
                              height: 64,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      _name.schdule![index].actIcon.toString(),
                                      errorBuilder: (q, w, e) {
                                        return Text('Image not loaded');
                                      },
                                      height: 40,
                                      width: 40,
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 15.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            _name.schdule![index].actTitle
                                                .toString(),
                                            style: FontConstant.k32w500blackText
                                                .copyWith(fontSize: 16),
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                _name.schdule![index].grpName
                                                    .toString(),
                                                style: FontConstant
                                                    .k14w400lightpurpleText
                                                    .copyWith(
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: 14,
                                                        color:
                                                            Color(0xffB7A4B2)),
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Container(
                                                width: 3,
                                                height: 3,
                                                decoration: BoxDecoration(
                                                    color: Color(0xffB7A4B2),
                                                    shape: BoxShape.circle),
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                "From ${_name.schdule![index].timing!.split('-').first} ",
                                                style: FontConstant
                                                    .k14w400lightpurpleText
                                                    .copyWith(
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: 14,
                                                        color:
                                                            Color(0xffB7A4B2)),
                                              ),
                                              Text(
                                                "To ${_name.schdule![index].timing!.split('-').last}",
                                                // '${groups[index]} . ${time[index]}',
                                                style: FontConstant
                                                    .k14w400lightpurpleText
                                                    .copyWith(
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: 14,
                                                        color:
                                                            Color(0xffB7A4B2)),
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
    );
  }
}

class schedulewidgetapi extends StatefulWidget {
  const schedulewidgetapi({Key? key}) : super(key: key);

  @override
  State<schedulewidgetapi> createState() => _schedulewidgetapiState();
}

class _schedulewidgetapiState extends State<schedulewidgetapi> {
  @override
  void initState() {
    getData();
    super.initState();
  }

  getData() {
    loadingData = true;
    final rsp = THomeApi().get();
    rsp.then((value) {
      try {
        setState(() {
          loadingData = false;
        });
        _name = value as THomeModel;
      } catch (e) {
        setState(() {
          loadingData = false;
        });
      }
    });
  }

  bool loadingsch = false;
  bool loadingData = false;
  THomeModel _name = THomeModel();
  TScheduleModel _schedule = TScheduleModel();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: loadingData
          ? CircularProgressIndicator()
          : SizedBox(
              // height: 300.h,
              width: 1.sw,
              child: ListView.separated(
                  separatorBuilder: (ctx, ind) => SizedBox(
                        height: 14.h,
                      ),
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: _name.schdule!.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        if (index == 0) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TLearningAlphabets(
                                      scheduleID: '',
                                    )),
                          );
                        } else if (index == 1) {
                        } else if (index == 2) {
                        } else if (index == 3) {}
                      },
                      child: Container(
                        height: 64,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                _name.schdule![index].actIcon.toString(),
                                errorBuilder: (q, w, e) {
                                  return Text('Image not loaded');
                                },
                                height: 40,
                                width: 40,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 15.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      _name.schdule![index].actTitle.toString(),
                                      style: FontConstant.k32w500blackText
                                          .copyWith(fontSize: 16),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          _name.schdule![index].grpName
                                              .toString(),
                                          style: FontConstant
                                              .k14w400lightpurpleText
                                              .copyWith(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 14,
                                                  color: Color(0xffB7A4B2)),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Container(
                                          width: 3,
                                          height: 3,
                                          decoration: BoxDecoration(
                                              color: Color(0xffB7A4B2),
                                              shape: BoxShape.circle),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          "From ${_name.schdule![index].timing!.split('-').first} ",
                                          style: FontConstant
                                              .k14w400lightpurpleText
                                              .copyWith(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 14,
                                                  color: Color(0xffB7A4B2)),
                                        ),
                                        Text(
                                          "To ${_name.schdule![index].timing!.split('-').last}",
                                          style: FontConstant
                                              .k14w400lightpurpleText
                                              .copyWith(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 14,
                                                  color: Color(0xffB7A4B2)),
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
    );
  }
}

class Groupcard extends StatelessWidget {
  THomeModel nameData;
  int index;
  Groupcard({Key? key, required this.nameData, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 283,
      height: 128,
      margin: EdgeInsets.only(left: 16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
          image: AssetImage(
            "assets/images/groupc.png",
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
            ),
            clipBehavior: Clip.hardEdge,
            width: 72,
            height: 96,
            child: Image.network(
              nameData.groupInCard![index].grpImage.toString(),
              errorBuilder: (q, w, e) {
                return Text('Image not loaded');
              },
            ),
          ),
          SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                nameData.groupInCard![index].grpName.toString(),
                style: FontConstant.k18w500whiteText,
              ),
              Text(
                nameData.groupInCard![index].secName.toString(),
                style: FontConstant.k18w500whiteText.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
              Text(
                "${nameData.groupInCard![index].allKid.toString()} Students",
                style: FontConstant.k18w500whiteText.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SchoolCard extends StatelessWidget {
  final TeacherProfileDetailsModel model;
  const SchoolCard({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 128,
      width: 1.sw,
      margin: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/scard.png'),
          fit: BoxFit.fill,
        ),
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: EdgeInsets.only(left: 16.0, right: 16, top: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 96,
            width: 72,
            child: Image.network(
              model.school!.schoolImage.toString(),
              errorBuilder: (q, w, e) => Text('Image not loaded'),
            ),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  model.school!.schoolName.toString(),
                  style: FontConstant2.k18w500Black,
                ),
                Row(
                  children: [
                    SizedBox(
                        width: 20,
                        child: Image.asset(
                          'assets/images/clockicon.png',
                          color: Color(0xFFB7A4B2),
                        )),
                    SizedBox(width: 8),
                    Text(
                      '${DateFormat.jm().format(DateFormat("hh:mm:ss").parse(model.school!.schoolTime!.split('To').first.toString()))} to ${DateFormat.jm().format(DateFormat("hh:mm:ss").parse(model.school!.schoolTime!.split(' To ').last.toString()))}',
                      style: FontConstant.k18w500whiteText.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFFB7A4B2),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                        width: 20,
                        child: Image.asset(
                          'assets/images/call.png',
                          color: Color(0xFFB7A4B2),
                        )),
                    SizedBox(width: 8),
                    Text(
                      model.school!.schoolPhone.toString(),
                      style: FontConstant.k18w500whiteText.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFFB7A4B2),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Attendancecard extends StatelessWidget {
  final THomeModel model;
  final int index;
  Attendancecard({Key? key, required this.model, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 128,
      width: 350,
      // margin: EdgeInsets.only(left: 8),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/Attendancec.png'),
          fit: BoxFit.fill,
        ),
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: EdgeInsets.only(left: 16.0, right: 16, top: 13, bottom: 13),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 96,
            width: 72,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Image.asset(
              model.attendance![index].groupImage.toString(),
              errorBuilder: (q, w, e) {
                return Text('Image not loaded');
              },
              height: 40,
              width: 40,
            ),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  model.attendance![index].groupName.toString(),
                  style: FontConstant.k18w500whiteText,
                ),
                Text(
                  model.attendance![index].sectionName.toString(),
                  style: FontConstant.k18w500whiteText.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
                Text(
                  "${model.attendance![index].totalStudent.toString()} Students",
                  style: FontConstant.k18w500whiteText.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Text(model.attendance![index].studentPresent.toString(),
                  style: FontConstant2.k24w500WhiteText),
              Text("present".tr(), style: FontConstant.k16w400whiteText),
            ],
          ),
        ],
      ),
    );
  }
}
