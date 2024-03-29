import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kidseau/TeachersPanel/TSignupScreen/TSignupOTPVerification.dart';
import 'package:kidseau/Theme.dart';
import 'package:kidseau/Widgets/buttons.dart';
import 'package:kidseau/Widgets/textfields.dart';

class TSignupScreen extends StatelessWidget {
  final bool isEmail;
  String mobileText;
  TSignupScreen({Key? key, required this.isEmail, required this.mobileText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 896.h,
      width: 414.w,
      child: Scaffold(
        backgroundColor: Color(0xfff7f6fa),
        /*bottomNavigationBar: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16,vertical: 24),
            child: ,
          ),
        ),*/
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
                      alignment: Alignment.topLeft,
                      fit: BoxFit.fitWidth,
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
                    Text("Account", style: FontConstant.k24w500brownText),
                    GestureDetector(
                      onTap: () {
                        // Navigator.of(context).push(MaterialPageRoute(
                        //     builder: (context) => SignupScreen()));
                      },
                      child: Text(
                        "Login/create a new account.",
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
                            print(mobileText);
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => TSignupOtpVerification(
                                    isEmail: isEmail, mobileText: mobileText)));
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
