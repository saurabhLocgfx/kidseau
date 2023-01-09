import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kidseau/Constants/colors.dart';
import 'package:kidseau/Widgets/buttons.dart';

import '../../Theme.dart';

class TEditProfileScreen extends StatefulWidget {
  const TEditProfileScreen({Key? key}) : super(key: key);

  @override
  State<TEditProfileScreen> createState() => _TEditProfileScreenState();
}

class _TEditProfileScreenState extends State<TEditProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // backgroundColor: AppColors().bgColor,
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
        title: Text(
          "Edit Profile".tr(),
          style: FontConstant.k18w5008471Text,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          // height: 414,
          decoration: BoxDecoration(
            color: AppColors().bgColor,
              image: DecorationImage(
                  image: AssetImage(
                    "assets/images/Group8270.png",
                  ),
                  fit: BoxFit.cover)),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.white.withOpacity(0.5),
                  Colors.white.withOpacity(0.7),
                  Colors.grey.shade100.withOpacity(0.9),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.3, 0.6, 0.9],
              ),
            ),
            child: Stack(
              children: [
                SizedBox(
                  width: 1.sw,
                  /* child: Image.asset(
                "assets/images/Group8270.png",
                fit: BoxFit.fitWidth,
              ),*/
                ),
                Container(
                  width: 1.sw,
                  height: 455,
                  /* decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.white.withOpacity(0.7),
                    Colors.white,
                    Colors.white
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0.3, 0.6, 0.9],
                ),
              ),*/
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 40),
                      Center(
                        child: Container(
                          width: 96,
                          height: 128,
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Image.asset('assets/images/profileperson.png'),
                        ),
                      ),
                      SizedBox(height: 12.5),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          color: Colors.transparent,
                          padding: EdgeInsets.symmetric(
                              horizontal: 50, vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 25,
                                child: Image.asset('assets/images/edit.png'),
                              ),
                              SizedBox(width: 16),
                              Text(
                                'Change Profile'.tr(),
                                style: FontConstant.k16w5008471Text,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 40),
                      Text('Personal Details'.tr(),
                          style: FontConstant2.k24w5008471text),
                      SizedBox(height: 24),
                      Text('Email Address'.tr(),
                          style: FontConstant.k16w500331FText),
                      SizedBox(height: 4),
                      TextFormField(
                        decoration: TextFieldDecoration().curvedWhiteDecoration(
                            label: 'Enter your email address'.tr(), curved: true),
                      ),
                      SizedBox(height: 16),
                      Text('Birthday'.tr(), style: FontConstant.k16w500331FText),
                      SizedBox(height: 4),
                      Container(
                        width: 1.sw,
                        height: 56.h,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(90),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 18),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('dd/mm/yyyy',
                                style: FontConstant.k16w400B7A4Text),
                            InkWell(
                              onTap: () {
                                showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(1960),
                                    lastDate: DateTime(2100));
                              },
                              child: SizedBox(
                                width: 30,
                                child: Image.asset(
                                  'assets/images/calendericon.png',
                                  color: ThemeColor.b7A4B2,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 16),
                      Text('Education'.tr(), style: FontConstant.k16w500331FText),
                      SizedBox(height: 4),
                      TextFormField(
                        decoration: TextFieldDecoration().curvedWhiteDecoration(
                            label: 'Enter your highest degree'.tr(), curved: true),
                      ),
                      SizedBox(height: 16),
                      Text('Gender'.tr(), style: FontConstant.k16w500331FText),
                      SizedBox(height: 4),
                      Container(
                        width: 1.sw,
                        height: 56.h,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(90),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 18),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Gender', style: FontConstant.k16w400B7A4Text),
                            SizedBox(
                              width: 30,
                              child: Image.asset(
                                'assets/images/arrowdown.png',
                                color: ThemeColor.b7A4B2,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 16),
                      Text('Year Of Experience'.tr(),
                          style: FontConstant.k16w500331FText),
                      SizedBox(height: 4),
                      TextFormField(
                        decoration: TextFieldDecoration().curvedWhiteDecoration(
                            label: 'Enter your years of experience'.tr(),
                            curved: true),
                      ),
                      SizedBox(height: 16),
                      Text('Address'.tr(), style: FontConstant.k16w500331FText),
                      SizedBox(height: 4),
                      TextFormField(
                        decoration: TextFieldDecoration().curvedWhiteDecoration(
                            label: 'Enter your address'.tr(), curved: true),
                      ),
                      SizedBox(height: 32),
                      materialButton(
                        context,
                        () {},
                        "Save".tr(),
                        //AppLoaclizations.of(context)!.translate("Save").toString(),
                        ThemeColor.primarycolor,
                        52.0,
                      ),
                      SizedBox(height: 30),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
