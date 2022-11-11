import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kidseau/TeachersPanel/TSignupScreen/TSignupCode.dart';
import 'package:kidseau/Theme.dart';
import 'package:kidseau/Widgets/buttons.dart';
import 'package:kidseau/Widgets/textfields.dart';

class TSignupOtpVerification extends StatefulWidget {
  const TSignupOtpVerification({Key? key}) : super(key: key);

  @override
  State<TSignupOtpVerification> createState() => _TSignupOtpVerificationState();
}

class _TSignupOtpVerificationState extends State<TSignupOtpVerification> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 896,
      width: 414,
      child: Scaffold(
        backgroundColor: Color(0xfff7f6fa),
        body: SingleChildScrollView(
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
                  padding:
                      const EdgeInsets.only(top: 199.0, left: 16, right: 16),
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/images/logo.png",
                        height: 172,
                        width: 173,
                      ),
                      Text(
                        "We offer a new way to mark the children and shape them for better future.",
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
                    Container(
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
                    ),
                    SizedBox(height: 32),
                    SizedBox(
                      height: 52,
                      width: 382,
                      child: MainButton(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => TSignupCode()));
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
    );
  }
}
