import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kidseau/Constants/colors.dart';
import 'package:kidseau/TeachersPanel/TDashboard.dart';
import 'package:kidseau/Theme.dart';
import 'package:kidseau/Widgets/buttons.dart';
import 'package:kidseau/api/Teacherpanelapi/teacher_login_apis/teacher_otp_check.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../TSignupScreen/TSignupCode.dart';

class TLoginOtpVerification extends StatefulWidget {
  final bool isEmail;
  String mobileText;
  TLoginOtpVerification(
      {Key? key, required this.isEmail, required this.mobileText})
      : super(key: key);

  @override
  State<TLoginOtpVerification> createState() => _TLoginOtpVerificationState();
}

class _TLoginOtpVerificationState extends State<TLoginOtpVerification> {
  final TextEditingController pinTextController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      /*height: 896,
      width: 414,*/
      child: Scaffold(
        backgroundColor: Color(0xfff7f6fa),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Container(
                  height: 1.sh,
                  width: 1.sw,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      opacity: 0.2,
                      image: AssetImage("assets/images/postsbackground.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 100.0, left: 16, right: 16),
                        child: Column(
                          children: [
                            Image.asset(
                              "assets/images/logo.png",
                              height: 120.h,
                              width: 120.w,
                            ),
                            Text(
                              "We offer a new way to track your children and watch them grow.",
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
                            SizedBox(height: 25),
                            Text("OTP verification".tr(),
                                /*AppLoaclizations.of(context)!
                                    .translate("OTP verification")
                                    .toString(),*/
                                style: FontConstant.k24w500brownText),
                            RichText(
                                text: TextSpan(children: [
                              TextSpan(
                                text:
                                    "A OTP has been sent to “9876543210”. Please enter the OTP here."
                                        .tr(),
                                /*AppLoaclizations.of(context)!
                                    .translate(
                                        "A OTP has been sent to “9876543210”. Please enter the OTP here.")
                                    .toString(),*/
                                style: FontConstant.k16w400B7A4Text
                                    .copyWith(fontSize: 15),
                              ),
                              TextSpan(
                                text: "  Resend",
                                style: FontConstant.k16w4008471Text,
                              ),
                            ])),
                            /*  Row(
                      children: [
                        Text(
                          AppLoaclizations.of(context)!
                              .translate(
                                  "A OTP has been sent to “9876543210”. Please enter the OTP here.")
                              .toString(),
                          style: FontConstant.k16w400B7A4Text
                              .copyWith(fontSize: 15),
                          textAlign: TextAlign.start,
                        ),
                        Text("Resend", style: FontConstant.k16w4008471Text),
                      ],
                    ),*/

                            SizedBox(height: 43),
                            PinCodeTextField(
                              validator: (pinText) {
                                if (pinText == null || pinText.isEmpty) {
                                  return 'Enter pin';
                                }
                                return null;
                              },
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
                            /* Container(
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            height: 19,
                            width: 60,
                            child: Otpfield(
                              onTap: () {},
                              title: "",
                              underlinecolor1: ThemeColor.primarycolor,
                              underlinecolor2: ThemeColor.primarycolor,
                            ),
                          ),
                          SizedBox(
                            height: 19,
                            width: 60,
                            child: Otpfield(
                              onTap: () {},
                              title: "",
                              underlinecolor1: ThemeColor.primarycolor,
                              underlinecolor2: ThemeColor.primarycolor,
                            ),
                          ),
                          SizedBox(
                            height: 19,
                            width: 60,
                            child: Otpfield(
                              onTap: () {},
                              title: "",
                              underlinecolor1: ThemeColor.primarycolor,
                              underlinecolor2: ThemeColor.primarycolor,
                            ),
                          ),
                          SizedBox(
                            height: 19,
                            width: 60,
                            child: Otpfield(
                              onTap: () {},
                              title: "",
                              underlinecolor1: ThemeColor.primarycolor,
                              underlinecolor2: ThemeColor.primarycolor,
                            ),
                          ),
                        ],
                      ),
                    ),*/
                            SizedBox(height: 32),
                            Row(
                              children: [
                                Expanded(
                                  child: SizedBox(
                                    height: 52,
                                    //width: 382,
                                    child: MainButton(
                                        onTap: () {
                                          /*Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      TDashboard()));*/
                                          if (_formKey.currentState!
                                              .validate()) {
                                            final resp = TeacherOtpCheck().get(
                                                code: int.parse(
                                                    pinTextController.text));
                                            resp.then((value) {
                                              print(value);
                                              if (value['status'] == 0) {
                                                Fluttertoast.showToast(
                                                    msg: value['msg']);
                                              } else if (value['status'] == 2) {
                                                print(widget.mobileText);
                                                Navigator.of(context).push(
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            TSignupCode(
                                                                isEmail: widget
                                                                    .isEmail,
                                                                mobileText: widget
                                                                    .mobileText)));
                                              }
                                              if (value['status'] == 1) {
                                                print(widget.mobileText);
                                                Navigator.of(context).push(
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            TDashboard()));
                                              }
                                            });
                                          }
                                        },
                                        title: "Continue".tr(),
                                        /*AppLoaclizations.of(context)!
                                            .translate("Continue")
                                            .toString(),*/
                                        textStyleColor: Colors.white,
                                        backgroundColor:
                                            ThemeColor.primarycolor),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 30),
                            RichText(
                                text: TextSpan(children: [
                              TextSpan(
                                text: "By proceeding you agree to our ",
                                style: FontConstant.k14w400B7A4Text,
                              ),
                              TextSpan(
                                text: "Privacy Policy",
                                style: FontConstant.k14w500B7A4TextU,
                              ),
                              TextSpan(
                                text: " & ",
                                style: FontConstant.k14w400B7A4Text,
                              ),
                              TextSpan(
                                text: "Terms and Conditions",
                                style: FontConstant.k14w500B7A4TextU,
                              ),
                            ])),
                            // SizedBox(height: 13.h),
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
    );
  }
}
