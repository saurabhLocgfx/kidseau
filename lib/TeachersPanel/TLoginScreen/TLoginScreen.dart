import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kidseau/Theme.dart';
import 'package:kidseau/Widgets/buttons.dart';
import 'package:kidseau/api/Teacherpanelapi/teacher_login_apis/teacher_login_api.dart';

import '../../shard_prefs/shared_prefs.dart';
import 'TLoginOtpVerification.dart';

class TLoginScreen extends StatelessWidget {
  TLoginScreen({
    Key? key,
  }) : super(key: key);

  final TextEditingController controller = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isEmail = false;
  String mobileText = ' ';
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Scaffold(
        backgroundColor: Color(0xfff7f6fa),
        body: SingleChildScrollView(
          child: SizedBox(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: 1.sh,
                    width: 1.sw,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        opacity: 0.2,
                        colorFilter: ColorFilter.linearToSrgbGamma(),
                        image: AssetImage(
                          "assets/images/postsbackground.png",
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding:
                              EdgeInsets.only(top: 180.h, left: 16, right: 16),
                          child: Column(
                            children: [
                              Image.asset(
                                "assets/images/logo.png",
                                height: 172.h,
                                width: 173.w,
                              ),
                              Text(
                                'We offer a new way to mark the children and shape them for better future.'
                                    .tr(),
                                style: FontConstant.k16w4008471Text,
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0, right: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              //  SizedBox(height: 10),
                              Text("Account".tr(),
                                  style: FontConstant.k24w500brownText),
                              GestureDetector(
                                onTap: () {},
                                child: Text(
                                  "Login/create a new account to track your kids’ activities."
                                      .tr(),
                                  style: FontConstant.k16w400B7A4Text
                                      .copyWith(fontSize: 15),
                                  textAlign: TextAlign.start,
                                ),
                              ),
                              SizedBox(height: 24),
                              Text("Email/Phone number".tr(),
                                  style: FontConstant.k16w500331FText),
                              SizedBox(height: 6),
                              TextFormField(
                                keyboardType: TextInputType.emailAddress,
                                validator: (mobileText) {
                                  if (mobileText == null ||
                                      mobileText.isEmpty) {
                                    return 'Enter mobile or email';
                                  }
                                  return null;
                                },
                                style: FontConstant.k18w5008471Text,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(14.0),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: BorderSide.none,
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30.0)),
                                    borderSide: BorderSide(
                                        color: Color(0xffBE74AA), width: 1.0),
                                  ),
                                  isDense: true,
                                  hintText:
                                      "Enter your email/phone number".tr(),
                                  filled: true,
                                  fillColor: Colors.white,
                                  hintStyle: FontConstant.k14w400lightText
                                      .copyWith(
                                          color: Color(0xffB7A4B2),
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w400),
                                ),
                                controller: controller,
                              ),
                              SizedBox(height: 32),
                              Center(
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: SizedBox(
                                        height: 52,
                                        //width: 382,
                                        child: MainButton(
                                            onTap: () {
                                              if (_formKey.currentState!
                                                  .validate()) {
                                                final resp = TeacherLogin().get(
                                                    email:
                                                        controller.text.trim());
                                                resp.then((value) {
                                                  log(value.toString());
                                                  if (value['status'] == 0) {
                                                    Fluttertoast.showToast(
                                                        msg: value['msg']);
                                                  } else {
                                                    UserPrefs.setCookies(
                                                        value['key']);
                                                    if (controller.text
                                                        .contains('@')) {
                                                      isEmail = true;
                                                    } else {
                                                      isEmail = false;
                                                    }
                                                    print(isEmail);
                                                    mobileText =
                                                        controller.text;
                                                    print(mobileText);
                                                    Navigator.of(context).push(
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                TLoginOtpVerification(
                                                                  isEmail:
                                                                      isEmail,
                                                                  mobileText:
                                                                      mobileText,
                                                                )));
                                                    Fluttertoast.showToast(
                                                        msg:
                                                            'Your OTP is ${value['OTP']}');
                                                  }
                                                });
                                                print(controller.text);
                                              }
                                            },
                                            title: "Login with OTP".tr(),
                                            textStyleColor: Colors.white,
                                            backgroundColor:
                                                ThemeColor.primarycolor),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 40.h),
                              Center(
                                child: RichText(
                                  text: TextSpan(children: [
                                    TextSpan(
                                      text: "By proceeding you agree to our "
                                          .tr(),
                                      style: FontConstant.k14w400B7A4Text,
                                    ),
                                    TextSpan(
                                      text: "Privacy Policy".tr(),
                                      style: FontConstant.k14w500B7A4TextU,
                                    ),
                                    TextSpan(
                                      text: " & ".tr(),
                                      style: FontConstant.k14w400B7A4Text,
                                    ),
                                    TextSpan(
                                      text: "Terms and Conditions".tr(),
                                      style: FontConstant.k14w500B7A4TextU,
                                    ),
                                  ]),
                                ),
                              ),
                              SizedBox(height: 13.h),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
