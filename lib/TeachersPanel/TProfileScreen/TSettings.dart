import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kidseau/ParentsPanel/PProfileScreens/PSettings/PAboutus.dart';
import 'package:kidseau/ParentsPanel/PProfileScreens/PSettings/PPrivacyPolicy.dart';
import 'package:kidseau/ParentsPanel/PProfileScreens/PSettings/PTermsAndConditions.dart';
import 'package:kidseau/Theme.dart';

import '../../ParentsPanel/PMessageScreen/PChats.dart';
import '../../ParentsPanel/PMessageScreen/PopenChats.dart';
import '../../ParentsPanel/PProfileScreens/PSettings/PNotificationSettings.dart';
import '../../Widgets/feedback_widget.dart';

class TSettings extends StatefulWidget {
  TSettings({Key? key}) : super(key: key);

  @override
  State<TSettings> createState() => _TSettingsState();
}

class _TSettingsState extends State<TSettings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
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
          title: Text(
            "Settings".tr(),
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
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                SizedBox(height: 16),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => PNotificationsettings(),
                      ),
                    );
                  },
                  child: Container(
                    color: Colors.transparent,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Notification Settings".tr(),
                          style: FontConstant.k18w500331FText,
                        ),
                        Image.asset(
                          "assets/images/rightarrow.png",
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => PPrivacypolicy(),
                      ),
                    );
                  },
                  child: Container(
                    color: Colors.transparent,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Privacy Policy".tr(),
                          style: FontConstant.k18w500331FText,
                        ),
                        Image.asset(
                          "assets/images/rightarrow.png",
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => PAboutus(),
                      ),
                    );
                  },
                  child: Container(
                    color: Colors.transparent,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "About Us".tr(),
                          style: FontConstant.k18w500331FText,
                        ),
                        Image.asset(
                          "assets/images/rightarrow.png",
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => PTermsAndConditions(),
                      ),
                    );
                  },
                  child: Container(
                    color: Colors.transparent,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Terms and Conditions".tr(),
                          style: FontConstant.k18w500331FText,
                        ),
                        Image.asset(
                          "assets/images/rightarrow.png",
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ),
                /*SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => PChats(
                          onPop: () {},
                          profilePic: '',
                          name: 'Kidseau support',
                          language: '',
                          userId: '1',
                          userType: 'admin',
                        ),
                      ),
                    );
                  },
                  child: Container(
                    color: Colors.transparent,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Kidseau support".tr(),
                          style: FontConstant.k18w500331FText,
                        ),
                        Image.asset(
                          "assets/images/rightarrow.png",
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ),*/
                SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: const Radius.circular(20.0),
                              topRight: const Radius.circular(20.0))),
                      context: context,
                      isScrollControlled: true,
                      builder: (val) {
                        return FeedbackWidget();
                      },
                    );
                  },
                  child: Container(
                    color: Colors.transparent,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Feedback".tr(),
                          style: FontConstant.k18w500331FText,
                        ),
                        Image.asset(
                          "assets/images/rightarrow.png",
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
