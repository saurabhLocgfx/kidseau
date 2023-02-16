import 'dart:developer';
import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:kidseau/Constants/colors.dart';
import 'package:kidseau/TeachersPanel/TReminder/AddReminder.dart';
import 'package:kidseau/Theme.dart';
import 'package:kidseau/Widgets/buttons.dart';
import 'package:kidseau/Widgets/screen_loader.dart';
import 'package:kidseau/api/reminder_apis/delete_reminder_api.dart';
import 'package:kidseau/api/reminder_apis/get_reminders_api.dart';
import 'package:kidseau/reminder_notifications_class.dart';

import '../../api/models/reminder_model/reminder_model.dart';

class TReminderScreen extends StatefulWidget {
  const TReminderScreen({Key? key}) : super(key: key);

  @override
  State<TReminderScreen> createState() => _TReminderScreenState();
}

class _TReminderScreenState extends State<TReminderScreen> {
  NotificationServices notificationServices = NotificationServices();

  @override
  void initState() {
    _getData();
    notificationServices.initializeNotification();
    super.initState();
  }

  List<ReminderModel> modelList = [];
  bool _isLoading = false;
  _getData() {
    _isLoading = true;
    final resp = GetRemindersApi().get();
    resp.then((value) {
      log(value.toString());
      if (value['status'] == 1) {
        modelList.clear();
        setState(() {
          for (var v in value['reminder']) {
            modelList.add(ReminderModel.fromJson(v));
          }
          _isLoading = false;
        });
      } else {
        setState(() {
          _isLoading = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 896.h,
      width: 1.sw,
      color: ThemeColor.primarycolor.withOpacity(.06),
      child: Scaffold(
        //backgroundColor: AppColors().bgColor,
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
          title: InkWell(
            onTap: () {},
            child: Text(
              "Reminder".tr(),
              /*AppLoaclizations.of(context)!.translate("Reminder").toString(),*/
              style: FontConstant.k18w5008471Text,
            ),
          ),
          actions: [
            /*InkWell(
              child: Image.asset("assets/images/dots2.png"),
              onTap: () {
                log("stop");
                notificationServices.stopNotification();
              },
            )*/
          ],
        ),
        body: _isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Container(
                //color: AppColors().bgColor,
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: EdgeInsets.symmetric(vertical: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  modelList[index].title.toString(),
                                  style: FontConstant2.k18w500331Ftext,
                                ),
                                Text(
                                  "${"Scheduled  at".tr()} ${modelList[index].remTime} - ${modelList[index].remDate}",
                                  style: FontConstant.k16w4008471Text,
                                ),
                              ],
                            ),
                            InkWell(
                              onTap: () {
                                ScreenLoader().onLoading(context);
                                final resp = DeleteReminderApi().get(
                                    reminderId: modelList[index].id.toString());
                                resp.then((value) {
                                  if (value['status'] == 1) {
                                    setState(() {
                                      modelList.removeAt(index);
                                      Navigator.of(context).pop();
                                    });
                                  } else {
                                    Navigator.of(context).pop();
                                  }
                                });
                              },
                              child: Container(
                                padding: EdgeInsets.all(16),
                                color: Colors.transparent,
                                child: SizedBox(
                                    width: 48.w,
                                    height: 24.w,
                                    child:
                                        Image.asset("assets/images/trash.png")),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (ctx, ind) => Divider(
                          thickness: 2,
                          color: AppColors().bgColor,
                        ),
                    itemCount: modelList.length),
              ),
        bottomNavigationBar: Container(
            //color: AppColors().bgColor,
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 30),
            child: SizedBox(
              height: 52.h,
              // width: 1.sw,
              child: MainButton(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => TAddReminder(
                          onPop: () {
                            _getData();
                          },
                        ),
                      ),
                    );
                  },
                  title: "Add Reminder".tr(),
                  textStyleColor: Colors.white,
                  backgroundColor: ThemeColor.primarycolor),
            )),
      ),
    );
  }
}
