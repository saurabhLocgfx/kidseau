import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kidseau/Theme.dart';
import 'package:kidseau/Widgets/buttons.dart';
import 'package:kidseau/api/parent_signup_apis/parent_signup_api.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../Constants/colors.dart';
import '../../api/parent_signup_apis/parent_signup_otp_api.dart';
import '../../shard_prefs/shared_prefs.dart';
import 'PSignupCodeScreen.dart';

class PSignupOtpVerification extends StatefulWidget {
  final String signUpField;
  final String parent;
  const PSignupOtpVerification(
      {Key? key, required this.signUpField, required this.parent})
      : super(key: key);

  @override
  State<PSignupOtpVerification> createState() => _PSignupOtpVerificationState();
}

class _PSignupOtpVerificationState extends State<PSignupOtpVerification> {
  final TextEditingController pinSignTextController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  Timer? timer;
  int seconds = 30;

  startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (seconds != 0) {
        setState(() {});
        seconds--;
      }
    });
  }

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  void dispose() {
    timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              //height: 50.h,
              padding: EdgeInsets.only(
                  left: 16,
                  right: 16,
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("OTP verification".tr(),
                      style: FontConstant.k24w500brownText),
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(
                      text: "A OTP has been sent to . ".tr() +
                          "${widget.signUpField} " +
                          "Please enter the OTP here.".tr(),
                      /*AppLoaclizations.of(context)!
                                      .translate(
                                          "A OTP has been sent to “9876543210”. Please enter the OTP here.")
                                      .toString(),*/
                      style:
                          FontConstant.k16w400B7A4Text.copyWith(fontSize: 15),
                    ),
                    seconds != 0
                        ? TextSpan(
                            text: ' $seconds',
                            style: FontConstant.k16w500purpleText)
                        : WidgetSpan(
                            alignment: PlaceholderAlignment.baseline,
                            baseline: TextBaseline.alphabetic,
                            child: GestureDetector(
                              onTap: () {
                                final resp = ParentSignUp().get(
                                  email: widget.signUpField.trim(),
                                  parents: widget.parent,
                                );
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
                              child: Text(
                                "  Resend".tr(),
                                style: FontConstant.k16w500purpleText,
                              ),
                            ),
                          ),
                    /*TextSpan(
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  //log('');

                                },
                              text: "  Resend".tr(),
                              style: FontConstant.k16w500purpleText,
                            ),*/
                  ])),
                  SizedBox(height: 43),
                  PinCodeTextField(
                    validator: (pinText) {
                      if (pinText == null || pinText.isEmpty) {
                        return "Enter pin";
                      }
                      return null;
                    },
                    controller: pinSignTextController,
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
                  // Spacer(),
                  Center(
                    child: SizedBox(
                      height: 56,
                      width: 382.w,
                      child: Center(
                        child: MainButton(
                            onTap: () {
                              if (_formKey.currentState!.validate()) {
                                final resp = ParentSignUpOtp().get(
                                    code:
                                        int.parse(pinSignTextController.text));
                                print(pinSignTextController.text);
                                resp.then((value) {
                                  print(value);
                                  if (value['status'] == 0) {
                                    Fluttertoast.showToast(msg: value['msg']);
                                  } else {
                                    //change for apk use
                                    /* Navigator.of(context).push(MaterialPageRoute(
                                              builder: (context) => PDashboard()));*/
                                    // voucher use this
                                    /* Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        PDashboard()));*/
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                            builder: (context) => PSignupCode(
                                                  newKid: false,
                                                )));

                                    /*Fluttertoast.showToast(
                                              msg: 'Your Voucher is ${value['voucher']}');*/
                                  }
                                });
                              }
                            },
                            title: "Continue".tr(),
                            textStyleColor: Colors.white,
                            backgroundColor: ThemeColor.primarycolor),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 40),
            Center(
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "By proceeding you agree to our ".tr(),
                      style: FontConstant.k14w400B7A4Text,
                    ),
                    TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          launchUrl(Uri.parse(
                              "https://cerebal.locgfx.com/kidsue/kids/appDetails/privacy-policy.php"));
                        },
                      text: "Privacy Policy".tr(),
                      style: FontConstant.k14w500B7A4TextU,
                    ),
                    TextSpan(
                      text: " & ",
                      style: FontConstant.k14w400B7A4Text,
                    ),
                    TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          launchUrl(Uri.parse(
                              "https://cerebal.locgfx.com/kidsue/kids/appDetails/terms-conditions.php"));
                        },
                      text: "Terms and Conditions".tr(),
                      style: FontConstant.k14w500B7A4TextU,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 25),
          ],
        ),
      ),
      backgroundColor: Color(0xfff7f6fa),
      body: SizedBox(
        height: 1.sh,
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Stack(children: [
                  Container(
                    width: 1.sw,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/postsbackground.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 120.h, left: 16, right: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/images/logo.png",
                            height: 150.w,
                            width: 150.w,
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
                /*Padding(
                  padding: const EdgeInsets.only(left: 16.0, right: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("OTP verification".tr(),
                          style: FontConstant.k24w500brownText),
                      RichText(
                          text: TextSpan(children: [
                        TextSpan(
                          text: "A OTP has been sent to . ".tr() +
                              "${widget.signUpField} " +
                              "Please enter the OTP here.".tr(),
                          */ /*AppLoaclizations.of(context)!
                                  .translate(
                                      "A OTP has been sent to “9876543210”. Please enter the OTP here.")
                                  .toString(),*/ /*
                          style: FontConstant.k16w400B7A4Text
                              .copyWith(fontSize: 15),
                        ),
                        seconds != 0
                            ? TextSpan(
                                text: ' $seconds',
                                style: FontConstant.k16w500purpleText)
                            : WidgetSpan(
                                alignment: PlaceholderAlignment.baseline,
                                baseline: TextBaseline.alphabetic,
                                child: GestureDetector(
                                  onTap: () {
                                    final resp = ParentSignUp().get(
                                      email: widget.signUpField.trim(),
                                      parents: widget.parent,
                                    );
                                    resp.then((value) {
                                      // log(value.toString());
                                      if (value['status'] == 0) {
                                        Fluttertoast.showToast(
                                            msg: value['msg']);
                                      } else {
                                        UserPrefs.setCookies(value['key']);
                                        Fluttertoast.showToast(
                                            msg: 'Your OTP is ${value['OTP']}');
                                      }
                                    });
                                  },
                                  child: Text(
                                    "  Resend".tr(),
                                    style: FontConstant.k16w500purpleText,
                                  ),
                                ),
                              ),
                        */ /*TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              //log('');

                            },
                          text: "  Resend".tr(),
                          style: FontConstant.k16w500purpleText,
                        ),*/ /*
                      ])),
                      SizedBox(height: 43),
                      PinCodeTextField(
                        validator: (pinText) {
                          if (pinText == null || pinText.isEmpty) {
                            return "Enter pin";
                          }
                          return null;
                        },
                        controller: pinSignTextController,
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
                      // Spacer(),
                      Center(
                        child: SizedBox(
                          height: 52.h,
                          width: 382.w,
                          child: Center(
                            child: MainButton(
                                onTap: () {
                                  if (_formKey.currentState!.validate()) {
                                    final resp = ParentSignUpOtp().get(
                                        code: int.parse(
                                            pinSignTextController.text));
                                    print(pinSignTextController.text);
                                    resp.then((value) {
                                      print(value);
                                      if (value['status'] == 0) {
                                        Fluttertoast.showToast(
                                            msg: value['msg']);
                                      } else {
                                        //change for apk use
                                        */ /* Navigator.of(context).push(MaterialPageRoute(
                                          builder: (context) => PDashboard()));*/ /*
                                        // voucher use this
                                        */ /* Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    PDashboard()));*/ /*
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    PSignupCode(
                                                      newKid: false,
                                                    )));

                                        */ /*Fluttertoast.showToast(
                                          msg: 'Your Voucher is ${value['voucher']}');*/ /*
                                      }
                                    });
                                  }
                                },
                                title: "Continue".tr(),
                                textStyleColor: Colors.white,
                                backgroundColor: ThemeColor.primarycolor),
                          ),
                        ),
                      ),
                      SizedBox(height: 40),
                      // Spacer(),

                      // SizedBox(height: 13.h),
                    ],
                  ),
                ),*/
              ],
            ),
          ),
        ),
      ),
    );
  }
}
