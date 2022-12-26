import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kidseau/Theme.dart';
import 'package:kidseau/Widgets/buttons.dart';

import '../../api/teacher_login_apis/teacher_login_api.dart';
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
      /*height: 896.h,
      width: 414.w,*/
      child: Scaffold(
        backgroundColor: Color(0xfff7f6fa),
        body: SingleChildScrollView(
          child: SizedBox(
            // height: 1.sh,
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                //crossAxisAlignment: CrossAxisAlignment.center,
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
                          padding: const EdgeInsets.only(
                              top: 100, left: 16, right: 16),
                          child: Column(
                            //crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              //SizedBox.shrink(),
                              //Spacer(),
                              Image.asset(
                                "assets/images/logo.png",
                                height: 120.h,
                                width: 120.w,
                              ),
                              Text(
                                'We offer a new way to mark the children and shape them for better future.'
                                    .tr(),
                                /*AppLoaclizations.of(context)!
                                    .translate(
                                        'We offer a new way to mark the children and shape them for better future.')
                                    .toString(),*/
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
                                  /*AppLoaclizations.of(context)!
                                      .translate("Account")
                                      .toString(),*/
                                  style: FontConstant.k24w500brownText),
                              GestureDetector(
                                onTap: () {
                                  /* Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => TSignupScreen()));*/
                                },
                                child: Text(
                                  "Login/create a new account to track your kids’ activities."
                                      .tr(),

                                  /*AppLoaclizations.of(context)!
                                      .translate(
                                          "Login/create a new account to track your kids’ activities.")
                                      .toString(),*/
                                  style: FontConstant.k16w400B7A4Text
                                      .copyWith(fontSize: 15),
                                  textAlign: TextAlign.start,
                                ),
                              ),
                              SizedBox(height: 24),
                              Text("Email/Phone number".tr(),
                                  /* AppLoaclizations.of(context)!
                                      .translate("Email/Phone number")
                                      .toString(),*/
                                  style: FontConstant.k16w500331FText),
                              SizedBox(height: 6),
                              TextFormField(
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
                                  /*AppLoaclizations.of(context)!
                                      .translate(
                                          "Enter your email/phone number")
                                      .toString(),*/
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
                              Row(
                                children: [
                                  Expanded(
                                    child: SizedBox(
                                      height: 52,
                                      //width: 382,
                                      child: MainButton(
                                          onTap: () {
                                            if (_formKey.currentState!
                                                .validate()) {
                                              final resp = TeacherLogin()
                                                  .get(email: controller.text);
                                              resp.then((value) {
                                                print(value);
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
                                                  mobileText = controller.text;
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
                                            /* */
                                          },
                                          title: "Login with OTP".tr(),
                                          /*AppLoaclizations.of(context)!
                                              .translate("Login with OTP")
                                              .toString(),*/
                                          textStyleColor: Colors.white,
                                          backgroundColor:
                                              ThemeColor.primarycolor),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 40.h),
                              RichText(
                                  text: TextSpan(children: [
                                TextSpan(
                                  text: ("By proceeding you agree to our "),
                                  style: FontConstant.k14w400B7A4Text,
                                ),
                                TextSpan(
                                  text: ("Privacy Policy"),
                                  style: FontConstant.k14w500B7A4TextU,
                                ),
                                TextSpan(
                                  text: " & ",
                                  style: FontConstant.k14w400B7A4Text,
                                ),
                                TextSpan(
                                  text: ("Terms and Conditions"),
                                  style: FontConstant.k14w500B7A4TextU,
                                ),
                              ])),
                              /*Row(
                  children: [
                  Text(
                    "By proceeding you agree to our ",
                    style: FontConstant.k14w500B7A4Text,
                    textAlign: TextAlign.start,
                  ),
                  Text(
                    "Privacy Policy & ",
                    style: FontConstant.k14w500B7A4Text,
                    textAlign: TextAlign.start,
                  ),Text(
                    "Terms and Conditions",
                    style: FontConstant.k14w500B7A4Text,
                    textAlign: TextAlign.start,
                  ),
                  ],
                  ),*/
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
