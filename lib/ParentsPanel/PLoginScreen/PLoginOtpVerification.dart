import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kidseau/Constants/colors.dart';
import 'package:kidseau/Theme.dart';
import 'package:kidseau/Widgets/buttons.dart';
import 'package:kidseau/shard_prefs/shared_prefs.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../api/parent_login_apis/parent_login_api.dart';
import '../../api/parent_login_apis/parent_login_otp_api.dart';
import '../PDashBoard.dart';

class PLoginOtpVerification extends StatelessWidget {
  final String loginField;
  PLoginOtpVerification({Key? key, required this.loginField}) : super(key: key);
  final TextEditingController pinTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        //height: 50.h,
        padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
        child: SingleChildScrollView(
          child: Center(
            child: RichText(
                text: TextSpan(children: [
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
            ])),
          ),
        ),
      ),
      backgroundColor: Color(0xfff7f6fa),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(children: [
              Container(
                height: 414.h,
                width: 1.sw,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/postsbackground.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 180.h, left: 16, right: 16),
                child: Center(
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/images/logo.png",
                        height: 172,
                        width: 173,
                      ),
                      Text(
                        "We offer a new way to track your children and watch them grow."
                            .tr(),
                        style: FontConstant.k16w4008471Text,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              )
            ]),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 25),
                  Text("OTP verification".tr(),
                      /* AppLoaclizations.of(context)!
                          .translate("OTP verification")
                          .toString(),*/
                      style: FontConstant.k24w500brownText),
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(
                      text: "A OTP has been sent to . ".tr() +
                          loginField +
                          "Please enter the OTP here.".tr(),
                      /*AppLoaclizations.of(context)!
                                  .translate(
                                      "A OTP has been sent to “9876543210”. Please enter the OTP here.")
                                  .toString(),*/
                      style:
                          FontConstant.k16w400B7A4Text.copyWith(fontSize: 15),
                    ),
                    TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          //log('');
                          final resp =
                              ParentLogin().get(email: loginField.trim());
                          resp.then((value) {
                            // log(value.toString());
                            if (value['status'] == 0) {
                              Fluttertoast.showToast(msg: value['msg']);
                            } else {
                              UserPrefs.setCookies(value['key']);
                              Fluttertoast.showToast(
                                  msg: 'Your OTP is ${value['OTP']}');
                            }
                          });
                        },
                      text: "  Resend",
                      style: FontConstant.k16w500purpleText,
                    ),
                  ])),
                  SizedBox(height: 43),
                  PinCodeTextField(
                    controller: pinTextController,
                    cursorColor: AppColors().k8267AC,
                    keyboardType: TextInputType.number,
                    appContext: context,
                    length: 4,
                    onChanged: (val) {},
                    pinTheme: PinTheme(
                      activeColor: AppColors().k8267AC,
                      inactiveColor: AppColors().k8267AC,
                    ),
                  ),
                  SizedBox(height: 32),
                  SizedBox(
                    height: 52,
                    //width: 382,
                    child: MainButton(
                        onTap: () {
                          final resp = ParentLoginOtp()
                              .get(code: pinTextController.text);
                          resp.then((value) {
                            print(value);
                            if (value['status'] == 0) {
                              Fluttertoast.showToast(msg: value['msg']);
                            } else {
                              UserPrefs.setIsTeacher(false);
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => PDashboard()));
                            }
                          });
                        },
                        title: "Continue".tr(),
                        textStyleColor: Colors.white,
                        backgroundColor: ThemeColor.primarycolor),
                  ),
                  SizedBox(height: 13.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
