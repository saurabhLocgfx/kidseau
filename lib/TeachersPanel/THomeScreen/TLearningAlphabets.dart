import 'dart:developer';
import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:kidseau/ParentsPanel/PHomeScreen/PHomeScreen.dart';
import 'package:kidseau/Theme.dart';
import 'package:kidseau/Widgets/buttons.dart';
import 'package:kidseau/api/Teacherpanelapi/Tschedule_detail_api/Tschedule_detail_api.dart';
import 'package:kidseau/api/models/Tschedule_detail_model.dart';

import '../../TeachersPanel/TMessages/TChats.dart';

class TLearningAlphabets extends StatefulWidget {
  String scheduleID;
  TLearningAlphabets({Key? key, required this.scheduleID}) : super(key: key);

  @override
  State<TLearningAlphabets> createState() => _TLearningAlphabetsState();
}

class _TLearningAlphabetsState extends State<TLearningAlphabets> {
  @override
  void initState() {
    _getData();
    super.initState();
  }

  bool _isLoading = false;

  TScheduleDetailModel _model = TScheduleDetailModel();
  _getData() {
    _isLoading = true;
    final resp = TScheduleDetailApi().get(scheduleId: widget.scheduleID);
    resp.then((value) {
      try {
        setState(() {
          _model = TScheduleDetailModel.fromJson(value);
          _isLoading = false;
        });
      } catch (e) {
        log('TLearningAlphabets $value');
        setState(() {
          _isLoading = false;
        });
      }
    });
  }

  // bool _flag = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: 1.sw,
      height: 1.sh,
      child: Scaffold(
        backgroundColor: ThemeColor.lightpurple.withOpacity(0.06),
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
            statusBarColor: ThemeColor.lightpurple.withOpacity(0.16),
          ),
          backgroundColor: ThemeColor.lightpurple.withOpacity(0.16),
          title: Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Image.asset(
                  "assets/images/arrow-left.png",
                  height: 24,
                  width: 24,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 17.93),
                child: Text("Activity".tr(),
                    style: FontConstant.k14w400lightpurpleText.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff84717F))),
              ),
            ],
          ),
        ),
        /*appBar: PreferredSize(
          preferredSize: Size.fromHeight(104.0), // here the desired height
          child: SingleChildScrollView(
            child: Column(
              children: [
                AppBar(
                  backgroundColor: Color(0x2a8267ac),
                  automaticallyImplyLeading: false,
                  elevation: 0,
                  title: Row(
                    children: [
                      GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: Image.asset(
                            "assets/images/arrow-left.png",
                            height: 24,
                            width: 24,
                          )),
                      Padding(
                        padding: const EdgeInsets.only(left: 17.93),
                        child: Text("Good Morning",
                            style: FontConstant.k14w400lightpurpleText.copyWith(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff84717F))),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),*/
        body: _isLoading
            ? Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: [
                      SizedBox(height: 20.h),
                      Align(
                        alignment: Alignment.topCenter,
                        child: Text(
                          _model.learningAlaphabets!.title.toString(),
                          style: FontConstant.k16w500brownText
                              .copyWith(fontSize: 32),
                        ),
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  /*height: 286,
                            width: 382,*/
                                  clipBehavior: Clip.hardEdge,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Image.network(
                                    _model.learningAlaphabets!.image.toString(),
                                    loadingBuilder: (q, w, e) {
                                      if (e == null) {
                                        return w;
                                      } else {
                                        return SpinKitThreeBounce(
                                          size: 30,
                                          color: Colors.grey,
                                        );
                                      }
                                    },
                                    errorBuilder: (q, w, e) =>
                                        Text('Image not found'),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 16),
                          Row(
                            children: [
                              Image.asset(
                                "assets/images/clock.png",
                                height: 20,
                                width: 20,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 06.0),
                                child: Text(
                                    "${_model.learningAlaphabets!.time!.split('-').first} to ${_model.learningAlaphabets!.time!.split('-').last}",
                                    style: FontConstant.k14w400lightpurpleText
                                        .copyWith(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500)),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 24),
                      Text(_model.learningAlaphabets!.description.toString(),
                          style: FontConstant.k14w4008471Text.copyWith(
                              fontWeight: FontWeight.w400, fontSize: 18)),
                      SizedBox(height: 30),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Weak Students",
                            style: FontConstant2.baloothampifont,
                          )),
                      _model.weakStudent!.isEmpty
                          ? SizedBox.shrink()
                          : SizedBox(height: 24),
                      ListView.separated(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) => Studentcard(),
                          separatorBuilder: (ctx, ind) => SizedBox(
                                height: 16.h,
                              ),
                          itemCount: 5),
                      SizedBox(
                        height: 32,
                      ),
                      /*materialButton(context, () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => TChats(),
                    ),
                  );
                }, "Ask Question", ThemeColor.primarycolor, 52.0),*/
                      SizedBox(height: 40.h),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}

class TeacherCard extends StatelessWidget {
  const TeacherCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 128,
      width: 382,
      decoration: BoxDecoration(
          image: DecorationImage(
              image:
                  AssetImage("assets/images/Teacher card leaarning ap.png"))),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Container(
              height: 96,
              width: 72,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                image: DecorationImage(
                    image: AssetImage("assets/images/leaning alp person.png")),
              ),
            ),
            SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Mohammad Umar",
                  style: FontConstant.k18w500whiteText,
                ),
                Text("Class teacher",
                    style: FontConstant.k18w500whiteText.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.white.withOpacity(0.6),
                    )),
                Text("Class teacher",
                    style: FontConstant.k18w500whiteText.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.white.withOpacity(0.74),
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
