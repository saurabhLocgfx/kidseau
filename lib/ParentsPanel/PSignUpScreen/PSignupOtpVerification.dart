import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kidseau/Theme.dart';
import 'package:kidseau/Widgets/buttons.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../Constants/colors.dart';
import '../../api/parent_signup_apis/parent_signup_otp_api.dart';
import 'PSignupCodeScreen.dart';

class PSignupOtpVerification extends StatefulWidget {
  const PSignupOtpVerification({Key? key}) : super(key: key);

  @override
  State<PSignupOtpVerification> createState() => _PSignupOtpVerificationState();
}

class _PSignupOtpVerificationState extends State<PSignupOtpVerification> {
  final TextEditingController pinSignTextController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 896,
      width: 414,
      child: Scaffold(
        backgroundColor: Color(0xfff7f6fa),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Stack(children: [
                  Container(
                    height: 414,
                    width: 414,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/postsbackground.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 199.0),
                    child: Container(
                      child: Column(
                        children: [
                          Image.asset(
                            "assets/images/logo.png",
                            height: 172,
                            width: 173,
                          ),
                          Text(
                            "We offer a new way to track your children and watch them grow.",
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
                      Text("OTP verification",
                          style: FontConstant.k24w500brownText),
                      Text(
                        "A OTP has been sent to “9876543210”. Please enter the OTP here.",
                        style:
                            FontConstant.k16w400B7A4Text.copyWith(fontSize: 15),
                        textAlign: TextAlign.start,
                      ),
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
                      /*Container(
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
                      SizedBox(
                        height: 52,
                        width: 382,
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
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                PSignupCode()));

                                    /*Fluttertoast.showToast(
                                      msg: 'Your Voucher is ${value['voucher']}');*/
                                  }
                                });
                              }
                            },
                            title: "Continue",
                            textStyleColor: Colors.white,
                            backgroundColor: ThemeColor.primarycolor),
                      ),
                      SizedBox(height: 40),
                      Text(
                        "By proceeding you agree to our Privacy Policy an& Terms and Conditions",
                        style: FontConstant.k14w500B7A4Text,
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(height: 13.h),
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
