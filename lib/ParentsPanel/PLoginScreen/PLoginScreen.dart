import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kidseau/ParentsPanel/PLoginScreen/PLoginOtpVerification.dart';
import 'package:kidseau/ParentsPanel/PSignUpScreen/PSignupScreen.dart';
import 'package:kidseau/Theme.dart';
import 'package:kidseau/Widgets/buttons.dart';

import '../../api/parent_login_apis/parent_login_api.dart';

class PLoginScreen extends StatelessWidget {
  PLoginScreen({Key? key}) : super(key: key);

  final TextEditingController emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      /*height: 896.h,
      width: 414.w,*/
      child: Scaffold(
        backgroundColor: Color(0xfff7f6fa),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Container(
                  height: 1.sh,
                  width: 1.sw,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      opacity: 0.2,
                      image: AssetImage("assets/images/postsbackground.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 20, left: 16, right: 16),
                        child: Container(
                          child: Column(
                            children: [
                              Image.asset(
                                "assets/images/logo.png",
                                height: 151,
                                width: 151,
                              ),
                              Text(
                                "We offer a new way to track your children and watch them grow.",
                                style: FontConstant.k16w4008471Text,
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0, right: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //SizedBox(height: 10),
                            Text("Welcome",
                                style: FontConstant.k24w500brownText),
                            Text(
                              "Login/create a new account to track your kids’ activities.",
                              style: FontConstant.k16w400B7A4Text
                                  .copyWith(fontSize: 15),
                              textAlign: TextAlign.start,
                            ),
                            SizedBox(height: 24),
                            Text("Email/Phone number",
                                style: FontConstant.k16w500331FText),
                            SizedBox(height: 6),
                            Container(
                              height: 56,
                              width: 382.w,
                              child: TextFormField(
                                validator: (phoneText) {
                                  if (phoneText == null || phoneText.isEmpty) {
                                    return 'Enter mobile or email';
                                  }
                                  return null;
                                },
                                controller: emailController,
                                style: FontConstant.k18w5008471Text,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(14.0),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(30.0)),
                                      borderSide: BorderSide(
                                          color: Colors.white, width: 1.0)),
                                  disabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.white, width: 1.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30.0)),
                                    borderSide: BorderSide(
                                        color: Color(0xffBE74AA), width: 1.0),
                                  ),
                                  isDense: true,
                                  hintText: "Enter Email/Phone number ",
                                  filled: true,
                                  fillColor: Colors.white,
                                  hintStyle: FontConstant.k14w400lightText
                                      .copyWith(
                                          color: Color(0xffB7A4B2),
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w400),
                                ),
                                /*  controller: controller,*/
                              ),
                            ),
                            SizedBox(height: 32),
                            SizedBox(
                              height: 52,
                              //width: 382,
                              child: MainButton(
                                  onTap: () {
                                    if (_formKey.currentState!.validate()) {
                                      final resp = ParentLogin()
                                          .get(email: emailController.text);
                                      resp.then((value) {
                                        print(value);
                                        if (value['status'] == 0) {
                                          Fluttertoast.showToast(
                                              msg: value['msg']);
                                        } else {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      PLoginOtpVerification()));
                                          Fluttertoast.showToast(
                                              msg:
                                                  'Your OTP is ${value['OTP']}');
                                        }
                                      });
                                    }
                                  },
                                  title: "Login with OTP",
                                  textStyleColor: Colors.white,
                                  backgroundColor: ThemeColor.primarycolor),
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 50,
                                ),
                                Text("First time on Kidseau?",
                                    style: FontConstant.k16w4008471Text),
                                SizedBox(
                                  width: 20,
                                ),
                                GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  PSignupScreen()));
                                    },
                                    child: Text("Register",
                                        style: FontConstant.k16w500purpleText))
                              ],
                            ),
                            SizedBox(height: 20),
                            RichText(
                                text: TextSpan(children: [
                              TextSpan(
                                text: "By proceeding you agree to our ",
                                style: FontConstant.k14w400B7A4Text,
                              ),
                              TextSpan(
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
                            ])),
                            SizedBox(height: 13),
                          ],
                        ),
                      ),
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
