import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kidseau/ParentsPanel/PLoginScreen/PLoginScreen.dart';
import 'package:kidseau/ParentsPanel/PSignUpScreen/PSignupOtpVerification.dart';
import 'package:kidseau/Theme.dart';
import 'package:kidseau/Widgets/buttons.dart';
import 'package:kidseau/Widgets/textfields.dart';

class PSignupScreen extends StatelessWidget {
  const PSignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 896.h,
      width: 414.w,
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
                          "We offers a new way to track your children and watch them grow.",
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
                    Text("Account", style: FontConstant.k24w500brownText),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => PLoginScreen()));
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
                    SizedBox(
                      height: 52,
                      width: 382,
                      child: MainButton(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    PSignupOtpVerification()));
                          },
                          title: "Signup with OTP",
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
