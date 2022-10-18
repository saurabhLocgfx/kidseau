import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:kidseau/Design/Screens/HomeScreen/homescreen.dart';
import 'package:kidseau/Design/Screens/SignupScreen/signupscreen.dart';
import 'package:kidseau/Theme.dart';
import 'package:kidseau/Widgets/buttons.dart';
import 'package:kidseau/Widgets/textfields.dart';
import 'package:kidseau/Widgets/widgets.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 414,
      height: 896,
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
                  padding: const EdgeInsets.only(top: 132.0),
                  child: Column(
                    children: [
                      mainlogo(),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(
                          "We offers a new way to track your children and watch them grow.",
                          style: FontConstant.k16w400greyText,
                        ),
                      )
                    ],
                  ),
                ),
              ]),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 24.0),
                      child:
                          Text("Email", style: FontConstant.k16blackboldText),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 10,
                      ),
                      child: textfield(context, "Enter your kid's name"),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 24.0),
                      child: Text("Password",
                          style: FontConstant.k16blackboldText),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 10,
                      ),
                      child: textfield(context, "Change Password"),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 32,
                    ),
                    SizedBox(
                      height: 52,
                      width: 382,
                      child: MainButton(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => HomeScreen()));
                          },
                          title: "Login",
                          textStyleColor: Colors.white,
                          backgroundColor: ThemeColor.primarycolor),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: Get.size.height * 0.10,
                        ),
                        Text(
                          "Don't remeber the password?  ",
                          style: FontConstant.k13w400blackText,
                        ),
                        Text(
                          "Reset",
                          style: FontConstant.k16w500purpleText,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "First time on kidseau?  ",
                          style: FontConstant.k13w400blackText,
                        ),
                        GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => SignupScreen()));
                            },
                            child: Text(
                              "Register",
                              style: FontConstant.k16w500purpleText,
                            )),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "By proceeding you agree to our ",
                                  style: FontConstant.k14w400lightpurpleText,
                                ),
                                Text("Privacy Policy",
                                    style: TextStyle(
                                        color: Color(0xffB7A4B2),
                                        decoration: TextDecoration.underline,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400)),
                                Text(
                                  " and",
                                  style: FontConstant.k14w400lightpurpleText,
                                ),
                                Text(
                                  "Terms &",
                                  style: TextStyle(
                                      color: Color(0xffB7A4B2),
                                      decoration: TextDecoration.underline,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "Conditions ",
                                  style: TextStyle(
                                      color: Color(0xffB7A4B2),
                                      decoration: TextDecoration.underline,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 30,
                            )
                          ],
                        ),
                      ],
                    ),
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
