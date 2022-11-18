import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kidseau/TeachersPanel/TLoginScreen/TLoginOtpVerification.dart';
import 'package:kidseau/TeachersPanel/TSignupScreen/TSignupScreen.dart';
import 'package:kidseau/Theme.dart';
import 'package:kidseau/Widgets/buttons.dart';
import 'package:kidseau/Widgets/textfields.dart';

class TLoginScreen extends StatelessWidget {
  const TLoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      /*height: 896.h,
      width: 414.w,*/
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
                  padding:
                      const EdgeInsets.only(top: 180.0, left: 16, right: 16),
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/images/logo.png",
                        height: 172.h,
                        width: 173.w,
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
                    Text("Account", style: FontConstant.k24w500brownText),
                    GestureDetector(
                      onTap: () {
                       /* Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => TSignupScreen()));*/
                      },
                      child: Text(
                        "Login/create a new account to track your kids’ activities.",
                        style:
                            FontConstant.k16w400B7A4Text.copyWith(fontSize: 15),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    SizedBox(height: 24),
                    Text("Email/Phone number",
                        style: FontConstant.k16w500331FText),
                    SizedBox(height: 6),
                    textfield(context, "Enter Password"),
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
                                      builder: (context) => TLoginOtpVerification()));
                                },
                                title: "Login with OTP",
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
      ),
    );
  }
}
