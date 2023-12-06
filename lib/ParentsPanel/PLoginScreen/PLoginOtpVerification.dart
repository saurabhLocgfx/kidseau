import 'dart:async';

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
import 'package:url_launcher/url_launcher.dart';

import '../../Constants/string_const.dart';
import '../../api/parent_login_apis/parent_login_api.dart';
import '../../api/parent_login_apis/parent_login_otp_api.dart';
import '../PDashBoard.dart';

class PLoginOtpVerification extends StatefulWidget {
  final String loginField;
  PLoginOtpVerification({Key? key, required this.loginField}) : super(key: key);

  @override
  State<PLoginOtpVerification> createState() => _PLoginOtpVerificationState();
}

class _PLoginOtpVerificationState extends State<PLoginOtpVerification> {
  final TextEditingController pinTextController = TextEditingController();
  // Timer? timer;
  // int seconds = 30;
  //
  // startTimer() {
  //   timer = Timer.periodic(Duration(seconds: 1), (timer) {
  //     if (seconds != 0) {
  //       setState(() {});
  //       seconds--;
  //     }
  //   });
  // }

  Timer? _timer;
  int _start = 30;

  _startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  @override
  void initState() {
    _startTimer();
    super.initState();
  }

  @override
  void dispose() {
    _timer!.cancel();
    super.dispose();
  }

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
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    launchUrl(
                        Uri.parse("$kAPIConst/appDetails/privacy-policy.php"));
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
                        "$kAPIConst/appDetails/terms-conditions.php"));
                  },
                text: "Terms and Conditions".tr(),
                style: FontConstant.k14w500B7A4TextU,
              ),
            ])),
          ),
        ),
      ),
      backgroundColor: Color(0xfff7f6fa),
      body: SafeArea(
        child: SingleChildScrollView(
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
                  padding: EdgeInsets.only(
                      // top: 170,
                      top: 10,
                      left: 16,
                      right: 16),
                  child: Center(
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: GestureDetector(
                            behavior: HitTestBehavior.translucent,
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Image.asset(
                              "assets/images/arrow-left.png",
                              height: 24,
                              width: 24,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 130,
                        ),
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
                    Text("OTP verification".tr(),
                        /* AppLoaclizations.of(context)!
                            .translate("OTP verification")
                            .toString(),*/
                        style: FontConstant.k24w500brownText),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "A OTP has been sent to ".tr() +
                              widget.loginField +
                              "".tr(),
                          style: FontConstant.k16w400B7A4Text
                              .copyWith(fontSize: 15),
                        ),
                        Row(
                          children: [
                            Text(
                              "Please enter the OTP here.",
                              style: FontConstant.k16w400B7A4Text
                                  .copyWith(fontSize: 15),
                            ),
                            GestureDetector(
                              behavior: HitTestBehavior.translucent,
                              onTap: _start == 0
                                  ? () {
                                      setState(() {
                                        _start = 30;
                                      });
                                      _startTimer();
                                      final resp = ParentLogin()
                                          .get(email: widget.loginField.trim());
                                      resp.then((value) {
                                        // log(value.toString());
                                        if (value['status'] == 0) {
                                          Fluttertoast.showToast(
                                              msg: value['msg']);
                                        } else {
                                          UserPrefs.setCookies(value['key']);
                                          UserPrefs.setOTP(value['OTP']);
                                          // Fluttertoast.showToast(
                                          //     msg:
                                          //         'Your OTP is ${value['OTP']}');
                                        }
                                      });
                                    }
                                  : () {},
                              child: Text(
                                "  Resend ${_start.toString()}",
                                style: FontConstant.k16w500purpleText,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    // Column(
                    //   children: [
                    //     Row(
                    //       children: [
                    //         Text(
                    //           "A OTP has been sent to ".tr() +
                    //               widget.loginField +
                    //               ". Please enter the OTP here.".tr(),
                    //           style: FontConstant.k16w400B7A4Text
                    //               .copyWith(fontSize: 15),
                    //         ),
                    //         // GestureDetector(
                    //         //   onTap: _start == 0
                    //         //       ? () {
                    //         //           setState(() {
                    //         //             _start = 30;
                    //         //           });
                    //         //           _startTimer();
                    //         //           final resp = ParentLogin()
                    //         //               .get(email: widget.loginField.trim());
                    //         //           resp.then((value) {
                    //         //             // log(value.toString());
                    //         //             if (value['status'] == 0) {
                    //         //               Fluttertoast.showToast(
                    //         //                   msg: value['msg']);
                    //         //             } else {
                    //         //               UserPrefs.setCookies(value['key']);
                    //         //               UserPrefs.setOTP(value['OTP']);
                    //         //               // Fluttertoast.showToast(msg: 'Your OTP is ${value['OTP']}');
                    //         //             }
                    //         //           });
                    //         //         }
                    //         //       : () {
                    //         //           // print(otp.length);
                    //         //         },
                    //         //   child: Text(
                    //         //     "  Resend ${_start.toString()}".tr(),
                    //         //     style: FontConstant.k16w500purpleText,
                    //         //   ),
                    //         // ),
                    //       ],
                    //     ),
                    //   ],
                    // ),
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
      ),
    );
  }
}
