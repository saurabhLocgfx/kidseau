import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kidseau/Theme.dart';
import 'package:kidseau/Widgets/buttons.dart';
import 'package:kidseau/Widgets/textfields.dart';

class PAddReminder extends StatefulWidget {
  const PAddReminder({Key? key}) : super(key: key);

  @override
  State<PAddReminder> createState() => _PAddReminderState();
}

class _PAddReminderState extends State<PAddReminder> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 896.h,
      width: 414.w,
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
            "Reminder".tr(),
            style: FontConstant.k18w5008471Text,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              SizedBox(height: 26.h),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Title".tr(),
                    style: FontConstant.k16w500331FText,
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  textfield(context, "Enter Reminder’s title".tr())
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
                  textfield(context, "Enter Reminder’s time".tr())
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
                  IconTextfield(
                      Icon: "assets/images/calendericon.png",
                      title: "Select date".tr())
                ],
              ),
              Expanded(
                child: Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: SizedBox(
                    height: 52.h,
                    width: 382..w,
                    child: MainButton(
                        onTap: () {
                          Reminderaddeddialog(context);
                        },
                        title: 'Save'.tr(),
                        textStyleColor: Colors.white,
                        backgroundColor: ThemeColor.primarycolor),
                  ),
                ),
              ),
              SizedBox(
                height: 30.h,
              )
            ],
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
                    "assets/images/ticklogo.png",
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
