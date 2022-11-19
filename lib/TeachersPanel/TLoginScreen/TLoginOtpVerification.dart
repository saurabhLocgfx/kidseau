import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kidseau/Constants/colors.dart';
import 'package:kidseau/TeachersPanel/TDashboard.dart';
import 'package:kidseau/Theme.dart';
import 'package:kidseau/Widgets/buttons.dart';
import 'package:kidseau/Widgets/textfields.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class TLoginOtpVerification extends StatefulWidget {
  const TLoginOtpVerification({Key? key}) : super(key: key);

  @override
  State<TLoginOtpVerification> createState() => _TLoginOtpVerificationState();
}

class _TLoginOtpVerificationState extends State<TLoginOtpVerification> {
  @override
  Widget build(BuildContext context) {
    return Container(
      /*height: 896,
      width: 414,*/
      child: Scaffold(
        backgroundColor: Color(0xfff7f6fa),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(children: [
                Container(
                  height: 414,
                  width: 1.sw,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/postsbackground.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 180.0, left: 16, right: 16),
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/images/logo.png",
                        height: 172.h,
                        width: 173.w,
                      ),
                      Text(
                        "We offer a new way to track your children and watch them grow.",
                        style: FontConstant.k16w4008471Text,
                        textAlign: TextAlign.center,
                      ),
                    ],
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
                     cursorColor: AppColors().k8267AC,
                     keyboardType: TextInputType.number,
                       appContext: context,
                       length: 4,
                       onChanged: (val){},
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
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => TDashboard()));
                                },
                                title: "Continue",
                                textStyleColor: Colors.white,
                                backgroundColor: ThemeColor.primarycolor),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 40),
                    RichText(
                        text: TextSpan(
                            children: [
                              TextSpan(
                                text: "By proceeding you agree to our ",
                                style: FontConstant.k14w400B7A4Text,
                              ),TextSpan(
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
                            ]
                        ) ),
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
