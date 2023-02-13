import 'dart:developer';
import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kidseau/Constants/colors.dart';
import 'package:kidseau/Theme.dart';
import 'package:kidseau/Widgets/buttons.dart';
import 'package:kidseau/Widgets/custom_snack_bar.dart';
import 'package:kidseau/Widgets/textfields.dart';
import 'package:kidseau/api/reminder_apis/add_reminder_api.dart';

class TAddReminder extends StatefulWidget {
  final Function onPop;
  const TAddReminder({Key? key, required this.onPop}) : super(key: key);

  @override
  State<TAddReminder> createState() => _TAddReminderState();
}

class _TAddReminderState extends State<TAddReminder> {
  final TextEditingController _controller = TextEditingController();
  String date = 'select date';
  String time = 'select time';
  bool _btnLoading = false;

  @override
  void dispose() {
    widget.onPop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 896.h,
      width: 1.sw,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xff8267AC).withOpacity(.06),
            Colors.white,
          ],
        ),
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
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
          title: Text(
            "Add Reminder".tr(),
            /*AppLoaclizations.of(context)!.translate("Add Reminder").toString(),*/
            style: FontConstant.k18w5008471Text,
          ),
        ),
        body: Container(
          color: AppColors().bgColor,
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              SizedBox(height: 26.h),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Title".tr(),
                    /*AppLoaclizations.of(context)!.translate("Title").toString(),*/
                    style: FontConstant.k16w500331FText,
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  Container(
                    //height: 64.h,
                    width: 1.sw,
                    child: TextFormField(
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return 'This field cannot be empty'.tr();
                        } else {
                          return null;
                        }
                      },
                      style: FontConstant.k18w5008471Text,
                      decoration: CustomInputDecoration(
                              hintText: "Enter reminder’s title".tr())
                          .decoration(),
                      controller: _controller,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8.h),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Time".tr(),
                    /*AppLoaclizations.of(context)!.translate("Time").toString(),*/
                    style: FontConstant.k16w500331FText,
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  InkWell(
                    onTap: () async {
                      var v = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay(hour: 12, minute: 00),
                      );
                      if (v != null) {
                        final now = DateTime.now();
                        setState(() {
                          time = DateFormat.jm().format(DateTime(
                              now.year, now.month, now.day, v.hour, v.minute));
                        });
                      }
                    },
                    child: IgnorePointer(
                      child: IconTextfield(
                          Icon: "assets/images/clock.png", title: time),
                    ),
                  )
                ],
              ),
              SizedBox(height: 8.h),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Date".tr(),
                    /*  AppLoaclizations.of(context)!.translate("Date").toString(),*/
                    style: FontConstant.k16w500331FText,
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  InkWell(
                    onTap: () async {
                      var v = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime.now(),
                          lastDate: DateTime(2100));
                      if (v != null) {
                        setState(() {
                          date = DateFormat("yyyy-MM-dd").format(v);
                        });
                      }
                    },
                    child: IgnorePointer(
                      child: IconTextfield(
                          Icon: "assets/images/calendericon.png", title: date),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          color: AppColors().bgColor,
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 30),
          child: SizedBox(
            height: 52.h,
            width: 1.sw,
            child: _btnLoading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : MainButton(
                    onTap: () {
                      if (date == 'select date') {
                        CustomSnackBar.customErrorSnackBar(
                            context, "Date not selected");
                        return;
                      }
                      if (time == 'select time') {
                        CustomSnackBar.customErrorSnackBar(
                            context, "Time not selected");
                        return;
                      }
                      if (_controller.text.isNotEmpty) {
                        setState(() {
                          _btnLoading = true;
                        });
                        final resp = AddReminderApi().get(
                            title: _controller.text.trim(),
                            date: date,
                            time: time.split(' ').first);
                        resp.then((value) {
                          log(value.toString());
                          if (value['status'] == 1) {
                            setState(() {
                              _btnLoading = false;
                            });
                            Reminderaddeddialog(context);
                          } else {
                            setState(() {
                              _btnLoading = false;
                            });
                            CustomSnackBar.customErrorSnackBar(
                                context, "Reminder not added");
                          }
                        });
                      }
                    },
                    title: "Save".tr(),
                    /*AppLoaclizations.of(context)!
                          .translate("Save")
                          .toString(),*/
                    textStyleColor: Colors.white,
                    backgroundColor: ThemeColor.primarycolor),
          ),
        ),
      ),
    );
  }

  Future<dynamic> Reminderaddeddialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)), //this right here
            child: Container(
              height: 317,
              width: 450,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/done.gif",
                    height: 136,
                    width: 240,
                  ),
                  Text(
                    "Reminder Added",
                    style: FontConstant2.k24w500331Ftext,
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                      height: 48.h,
                      width: 250.w,
                      child: MainButton(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          title: "Close".tr(),
                          /*AppLoaclizations.of(context)!
                              .translate("Close")
                              .toString(),*/
                          textStyleColor: Colors.white,
                          backgroundColor: ThemeColor.primarycolor))
                ],
              ),
            ),
          );
        });
  }
}
