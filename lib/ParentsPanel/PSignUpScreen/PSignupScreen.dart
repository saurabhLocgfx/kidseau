import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kidseau/Theme.dart';
import 'package:kidseau/Widgets/buttons.dart';
import 'package:kidseau/shard_prefs/shared_prefs.dart';

import '../../api/parent_signup_apis/parent_signup_api.dart';
import 'PSignupOtpVerification.dart';

class PSignupScreen extends StatefulWidget {
  PSignupScreen({Key? key}) : super(key: key);

  @override
  State<PSignupScreen> createState() => _PSignupScreenState();
}

class _PSignupScreenState extends State<PSignupScreen> {
  final TextEditingController emailController = TextEditingController();

  bool isChecked = false;
  String parent = '';
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
                        padding:
                            EdgeInsets.only(top: 180.h, left: 16, right: 16),
                        child: Container(
                          child: Column(
                            children: [
                              Image.asset(
                                "assets/images/logo.png",
                                height: 172,
                                width: 173,
                              ),
                              /*Text(
                                "We offer a new way to track your children and watch them grow.",
                                style: FontConstant.k16w4008471Text,
                                textAlign: TextAlign.center,
                              ),*/
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
                            SizedBox(height: 10),
                            Text("New Account",
                                style: FontConstant.k24w500brownText),
                            Text(
                              "Create a new account to track your kids’ activities.",
                              style: FontConstant.k16w400B7A4Text
                                  .copyWith(fontSize: 15),
                              textAlign: TextAlign.start,
                            ),
                            SizedBox(height: 24),
                            Text("Email/Phone number",
                                style: FontConstant.k16w500331FText),
                            SizedBox(height: 6),
                            Container(
                              // height: 56,
                              width: 1.sw,
                              child: TextFormField(
                                validator: (mobileText) {
                                  if (mobileText == null ||
                                      mobileText.isEmpty) {
                                    return 'Enter email or phone number';
                                  }
                                  return null;
                                },
                                controller: emailController,
                                style: FontConstant.k18w5008471Text,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(14.0),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: BorderSide.none,
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30.0)),
                                    borderSide: BorderSide(
                                        color: Color(0xffBE74AA), width: 1.0),
                                  ),
                                  isDense: true,
                                  hintText:
                                      "Enter your email/phone number".tr(),
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
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Note: The email/phone number belongs to Father by default",
                              style: FontConstant.k14w400B7A4Text,
                            ),
                            CheckboxListTile(
                              contentPadding: EdgeInsets.only(left: 0),
                              controlAffinity: ListTileControlAffinity.leading,
                              checkColor: Colors.white,
                              value: isChecked,
                              onChanged: (val) {
                                setState(() {
                                  isChecked = val!;
                                  if (val == true) {
                                    parent = 'Mother';
                                  } else {
                                    parent = 'Father';
                                  }
                                });
                              },
                              title: Text(
                                'This email/phone number belongs to Mother',
                                style: FontConstant.k16w4008471Text,
                              ),
                            ),
                            SizedBox(height: 32),
                            SizedBox(
                              height: 52,
                              //width: 382,
                              child: MainButton(
                                  onTap: () {
                                    if (_formKey.currentState!.validate()) {
                                      final resp = ParentSignUp().get(
                                          email: emailController.text,
                                          parents: parent);
                                      print(emailController.text);
                                      resp.then((value) {
                                        print(value);
                                        if (value['status'] == 0) {
                                          Fluttertoast.showToast(
                                              msg: value['msg']);
                                        } else {
                                          UserPrefs.setCookies(value['key']);
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      PSignupOtpVerification(
                                                        signUpField:
                                                            emailController
                                                                .text,
                                                      )));
                                          Fluttertoast.showToast(
                                              msg:
                                                  'Your OTP is ${value['OTP']}');
                                        }
                                      });
                                    }
                                  },
                                  title: "Signup with OTP".tr(),
                                  textStyleColor: Colors.white,
                                  backgroundColor: ThemeColor.primarycolor),
                            ),
                            SizedBox(height: 20),
                            SizedBox(height: 20),
                            Center(
                              child: RichText(
                                  text: TextSpan(children: [
                                TextSpan(
                                  text: "By proceeding you agree to our ".tr(),
                                  style: FontConstant.k14w400B7A4Text,
                                ),
                                TextSpan(
                                  text: "Privacy Policy & ".tr(),
                                  style: FontConstant.k14w500B7A4TextU,
                                ),
                                TextSpan(
                                  text: "Terms and Conditions".tr(),
                                  style: FontConstant.k14w500B7A4TextU,
                                ),
                              ])),
                            ),
                            SizedBox(height: 13.h),
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
