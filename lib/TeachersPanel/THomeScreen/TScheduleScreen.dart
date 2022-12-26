import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kidseau/Tmodel/TScheduleModel.dart';
import 'package:kidseau/Widgets/THomeScreenWidgets/t_activity.dart';

import '../../Theme.dart';
import '../../api/Tschedule_api/schedule_api.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({Key? key}) : super(key: key);

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  bool loading = false;
  @override
  void initState() {
    getSchedule();

    super.initState();
  }

  getSchedule() {
    final rsp = TScheduleApi().get();
    rsp.then((value) {
      print(value);
      try {
        _schedule = value;
        setState(() {
          loading = false;
        });
      } catch (e) {
        setState(() {
          loading = false;
        });
      }
      //print(_schedule.schedule!.length);
      print(_schedule.schedule!.length);
      print(_schedule.schedule![0].actTitle);
    });
  }

  TScheduleModel _schedule = TScheduleModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          "Back".tr(),
          /* AppLoaclizations.of(context)!.translate("Back").toString(),*/
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
      body: SingleChildScrollView(
        child: Container(
          color: Color(0xff8267AC).withOpacity(.06),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 24),
              Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  "Schedule".tr(),
                  /* AppLoaclizations.of(context)!.translate("Schedule").toString(),*/
                  style: FontConstant2.baloothampifont,
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              loading
                  ? CircularProgressIndicator()
                  : Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: TActivity(
                        schedule: _schedule,
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
