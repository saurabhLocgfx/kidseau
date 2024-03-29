import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kidseau/TeachersPanel/TLoginScreen/TLoginScreen.dart';
import 'package:kidseau/Theme.dart';
import 'package:kidseau/Widgets/buttons.dart';
import 'package:kidseau/Widgets/widgets.dart';

class TWaitingScreen extends StatefulWidget {
  const TWaitingScreen({Key? key}) : super(key: key);

  @override
  State<TWaitingScreen> createState() => _TWaitingScreenState();
}

class _TWaitingScreenState extends State<TWaitingScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(16),
          child: SizedBox(
            height: 52,
            width: 382,
            child: MainButton(
                onTap: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (ctx) => TLoginScreen()),
                      (route) => false);
                },
                title: "Close".tr(),
                /*AppLoaclizations.of(context)!.translate("Close").toString(),*/
                textStyleColor: Colors.white,
                backgroundColor: ThemeColor.primarycolor),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              SizedBox(height: 111),
              Center(child: SizedBox(height: 160, child: mainlogo())),
              SizedBox(height: 32),
              Center(
                child: Image.asset(
                  "assets/images/owlwithbook.png",
                  height: 188.h,
                  width: 286.w,
                ),
              ),
              SizedBox(height: 20.h),
              Center(
                child: Text(
                  "Wait for director’s approval".tr(),
                  style: FontConstant2.k32w5008267text.copyWith(fontSize: 28),
                  textAlign: TextAlign.center,
                ),
              ),
              Center(
                child: Text(
                  "Thank you for your patience".tr(),
                  style: FontConstant.k16w5008471Text,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
