import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kidseau/Theme.dart';
import 'package:kidseau/Widgets/buttons.dart';
import 'package:kidseau/Widgets/textfields.dart';

class TAddReminder extends StatefulWidget {
  const TAddReminder({Key? key}) : super(key: key);

  @override
  State<TAddReminder> createState() => _TAddReminderState();
}

class _TAddReminderState extends State<TAddReminder> {
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
            "Reminder",
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
                    "Title",
                    style: FontConstant.k16w500331FText,
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  textfield(context, "Enter Reminder’s title")
                ],
              ),
              SizedBox(height: 8.h),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Time",
                    style: FontConstant.k16w500331FText,
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  textfield(context, "Enter Reminder’s time")
                ],
              ),
              SizedBox(height: 8.h),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Date",
                    style: FontConstant.k16w500331FText,
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  IconTextfield(
                      Icon: "assets/images/calendericon.png",
                      title: "Select date")
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
                        title: 'Save',
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
                          title: 'Close',
                          textStyleColor: Colors.white,
                          backgroundColor: ThemeColor.primarycolor))
                ],
              ),
            ),
          );
        });
  }
}
