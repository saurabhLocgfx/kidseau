import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:kidseau/Design/Screens/SignupScreen/otpverificationscreen.dart';
import 'package:kidseau/Theme.dart';
import 'package:kidseau/Widgets/buttons.dart';
import 'package:kidseau/Widgets/textfields.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 896,
      width: 414,
      child: Scaffold(
        backgroundColor: Color(0xfff7f6fa),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(children: [
                Container(
                  height: Get.size.height * 0.40,
                  width: Get.size.width,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/backgrounddesigns.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 180.0),
                  child: Container(
                    width: 482,
                    child: Column(
                      children: [
                        Image.asset("assets/images/logo.png"),
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
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child:
                          Text("Account", style: FontConstant.k24w500brownText),
                    ),
                    Text(
                      "Login/create a new account to track your kids’ activities.",
                      style: FontConstant.k16w400B7A4Text,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 24),
                    Text("Email/Phone number",
                        style: FontConstant.k16w500331FText),
                    textfield(context, "Enter Password"),
                    SizedBox(height: 32),
                    SizedBox(
                      height: 52,
                      width: 382,
                      child: MainButton(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => OtpScreen()));
                          },
                          title: "Login with OTP",
                          textStyleColor: Colors.white,
                          backgroundColor: ThemeColor.primarycolor),
                    ),
                    SizedBox(height: 80),
                    Text(
                      "By proceeding you agree to our Privacy Policy an& Terms and Conditions",
                      style: FontConstant.k14w500B7A4Text,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 34),
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
