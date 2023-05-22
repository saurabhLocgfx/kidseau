import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kidseau/Theme.dart';
import 'package:kidseau/Widgets/buttons.dart';
import 'package:kidseau/api/Teacherpanelapi/teacher_login_apis/teacher_login_api.dart';

import '../../Widgets/textfields.dart';
import '../../shard_prefs/shared_prefs.dart';
import '../TSignupScreen/TWaitingScreen.dart';
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
    return Scaffold(
      backgroundColor: Color(0xfff7f6fa),
      bottomNavigationBar: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Center(
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "By proceeding you agree to our ".tr(),
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
                ],
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Container(
              //height: 1.sh,
              width: 1.sw,
              decoration: BoxDecoration(
                image: DecorationImage(
                  opacity: 0.8,
                  colorFilter: ColorFilter.linearToSrgbGamma(),
                  image: AssetImage(
                    "assets/images/postsbackground.png",
                  ),
                  alignment: Alignment.topLeft,
                  fit: BoxFit.fitWidth,
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 180.h, left: 16, right: 16),
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
                  //Spacer(),
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
                            if (mobileText == null || mobileText.isEmpty) {
                              return "Enter your email/phone number".tr();
                            }
                            return null;
                          },
                          style: FontConstant.k18w5008471Text,
                          decoration: CustomInputDecoration(
                                  hintText:
                                      "Enter your email/phone number".tr())
                              .decoration(),
                          controller: controller,
                        ),
                        SizedBox(height: 32),
                        Row(
                          children: [
                            Expanded(
                              child: MainButton(
                                  onTap: () {
                                    if (_formKey.currentState!.validate()) {
                                      final resp = TeacherLogin()
                                          .get(email: controller.text.trim());
                                      resp.then((value) {
                                        log(value.toString());
                                        if (value['status'] == 0) {
                                          if (value['msg'] ==
                                              "Wait For Director's Approval") {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      TWaitingScreen()),
                                            );
                                          } else {
                                            Fluttertoast.showToast(
                                                msg: value['msg']);
                                          }
                                        } else {
                                          UserPrefs.setCookies(value['key']);
                                          if (controller.text.contains('@')) {
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
                                                        isEmail: isEmail,
                                                        mobileText: mobileText,
                                                      )));
                                          // Fluttertoast.showToast(
                                          //     msg:
                                          //         'Your OTP is ${value['OTP']}');
                                        }
                                      });
                                      print(controller.text);
                                    }
                                  },
                                  title: "Login with OTP".tr(),
                                  textStyleColor: Colors.white,
                                  backgroundColor: ThemeColor.primarycolor),
                            ),
                          ],
                        ),
                        // SizedBox(height: 40.h),
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
