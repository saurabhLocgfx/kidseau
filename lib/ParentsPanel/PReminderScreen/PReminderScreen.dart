import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kidseau/ParentsPanel/PReminderScreen/PAddReminder.dart';
import 'package:kidseau/Theme.dart';
import 'package:kidseau/Widgets/buttons.dart';

class PReminderScreen extends StatefulWidget {
  const PReminderScreen({Key? key}) : super(key: key);

  @override
  State<PReminderScreen> createState() => _PReminderScreenState();
}

class _PReminderScreenState extends State<PReminderScreen> {
  bool val1 = false;
  bool val2 = false;
  bool val3 = false;

  onChangedFunction1(bool newvalue1) {
    setState(() {
      val1 = newvalue1;
    });
  }

  onChangedFunction2(bool newvalue2) {
    setState(() {
      val2 = newvalue2;
    });
  }

  onChangedFunction3(bool newvalue3) {
    setState(() {
      val3 = newvalue3;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 896.h,
      width: 414.w,
      color: ThemeColor.primarycolor.withOpacity(.06),
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
          actions: [/*Image.asset("assets/images/dots2.png")*/],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              SizedBox(height: 10),
              Container(
                height: 96,
                width: 382.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Tomorrow is holiday",
                          style: FontConstant2.k18w500331Ftext,
                        ),
                        Text(
                          "Scheduled  at 08:00 am - 30/09/2022".tr(),
                          style: FontConstant.k16w4008471Text,
                        ),
                      ],
                    ),
                    customSwitch(val1, onChangedFunction1)
                  ],
                ),
              ),
              // SizedBox(height: 12),
              Container(
                height: 96,
                width: 382.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Tomorrow is holiday",
                          style: FontConstant2.k18w500331Ftext,
                        ),
                        Text(
                          "Scheduled  at 08:00 am - 30/09/2022",
                          style: FontConstant.k16w4008471Text,
                        ),
                      ],
                    ),
                    customSwitch(val2, onChangedFunction2)
                  ],
                ),
              ),
              //SizedBox(height: 12),
              Container(
                height: 96,
                width: 382.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Bring notebook",
                          style: FontConstant2.k18w500331Ftext,
                        ),
                        Text(
                          "Expired".tr(),
                          style: FontConstant.k16w4008471Text,
                        ),
                      ],
                    ),
                    customSwitch(val3, onChangedFunction3)
                  ],
                ),
              ),
              Expanded(
                child: Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: SizedBox(
                    height: 52.h,
                    width: 382.w,
                    child: MainButton(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => PAddReminder(),
                            ),
                          );
                        },
                        title: "Add Reminder".tr(),
                        /*AppLoaclizations.of(context)!
                            .translate("Add Reminder")
                            .toString(),*/
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
}

Widget customSwitch(bool val, Function OnChangedMethod) {
  return Container(
    height: 24.h,
    width: 48.w,
    child: CupertinoSwitch(
        activeColor: ThemeColor.primarycolor,
        value: val,
        onChanged: (newValue) {
          OnChangedMethod(newValue);
        }),
  );
}
