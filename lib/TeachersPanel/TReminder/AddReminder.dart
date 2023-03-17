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
import 'package:kidseau/reminder_notifications_class.dart';
import 'package:kidseau/shard_prefs/shared_prefs.dart';

class TAddReminder extends StatefulWidget {
  final Function onPop;
  const TAddReminder({Key? key, required this.onPop}) : super(key: key);

  @override
  State<TAddReminder> createState() => _TAddReminderState();
}

class _TAddReminderState extends State<TAddReminder> {
  final TextEditingController _controller = TextEditingController();
  String date = 'select date'.tr();
  String time = 'select time'.tr();
  bool _btnLoading = false;

  NotificationServices notificationServices = NotificationServices();
  @override
  void dispose() {
    widget.onPop();
    super.dispose();
  }

  @override
  void initState() {
    notificationServices.initializeNotification();
    super.initState();
  }

  DateTime? v;
  TimeOfDay? q;
  TimeOfDay holder = TimeOfDay.now();
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
                    style: FontConstant.k16w500331FText,
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  InkWell(
                    onTap: () async {
                      q = await showTimePicker(
                        context: context,
                        initialTime: time == 'select time'.tr()
                            ? TimeOfDay.now()
                            : holder,
                      );
                      if (q != null) {
                        log(q.toString());
                        final now = DateTime.now();
                        holder = q!;
                        setState(() {
                          time = DateFormat.jm().format(DateTime(now.year,
                              now.month, now.day, q!.hour, q!.minute));
                          log(holder.toString().substring(10, 15));
                          //log(time);
                          //log(DateFormat('HH:mm').format(DateTime(now.year, now.month, now.day, q!.hour, q!.minute)));
                          /*log(int.parse(time.split(":").first).toString());
                          log(int.parse(time.split(":").last.split(" ").first)
                              .toString());*/
                          /* log(DateFormat("HH:mm").format(DateTime(
                              now.year,
                              now.month,
                              now.day,
                              int.parse(time.split(":").first),
                              int.parse(
                                  time.split(":").last.split(" ").first))));*/
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
                    style: FontConstant.k16w500331FText,
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  InkWell(
                    onTap: () async {
                      v = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime.now(),
                          lastDate: DateTime(2100));
                      if (v != null) {
                        setState(() {
                          date = DateFormat("yyyy-MM-dd").format(v!);
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
                            time: // time.split(" ").first);
                                holder.toString().substring(10, 15));
                        resp.then((value) {
                          log(value.toString());
                          if (value['status'] == 1) {
                            setState(() {
                              _btnLoading = false;
                            });
                            var dateTime = DateTime(
                                v!.year, v!.month, v!.day, q!.hour, q!.minute);
                            notificationServices.scheduleNotification(
                              id: value["id"],
                              title: value['title'],
                              body: '',
                              datetime: dateTime,
                            );
                            UserPrefs.setShowReminder(true);
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
                    "Reminder Added".tr(),
                    style: FontConstant2.k24w500331Ftext,
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                      height: 48.h,
                      width: 250.w,
                      child: MainButton(
                          onTap: () {
                            int count = 0;
                            Navigator.of(context).popUntil((_) => count++ >= 2);
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
