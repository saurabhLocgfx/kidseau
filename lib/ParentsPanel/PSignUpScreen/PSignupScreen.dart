import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kidseau/Theme.dart';
import 'package:kidseau/Widgets/buttons.dart';
import 'package:kidseau/shard_prefs/shared_prefs.dart';

import '../../api/parent_signup_apis/parent_signup_api.dart';
import '../PLoginScreen/PLoginScreen.dart';
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
                        padding: EdgeInsets.only(top: 20, left: 16, right: 16),
                        child: Container(
                          child: Column(
                            children: [
                              Image.asset(
                                "assets/images/logo.png",
                                height: 120,
                                width: 120,
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
                            GestureDetector(
                              onTap: () {
                                /*Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => PSignupScreen()));*/
                              },
                              child: Text(
                                "Create a new account to track your kids’ activities.",
                                style: FontConstant.k16w400B7A4Text
                                    .copyWith(fontSize: 15),
                                textAlign: TextAlign.start,
                              ),
                            ),
                            SizedBox(height: 24),
                            Text("Email/Phone number",
                                style: FontConstant.k16w500331FText),
                            SizedBox(height: 6),
                            Container(
                              height: 56,
                              width: 382.w,
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
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Note: The email/phone number belongs to Father by default",
                              style: FontConstant.k14w400B7A4Text,
                            ),
                            Row(
                              children: [
                                Checkbox(
                                  checkColor: Colors.white,
                                  value: isChecked,
                                  shape: RoundedRectangleBorder(),
                                  onChanged: (bool? value) {
                                    setState(() {
                                      isChecked = value!;
                                      if (value == true) {
                                        parent = 'Mother';
                                      } else {
                                        parent = 'Father';
                                      }
                                    });
                                  },
                                ),
                                Text(
                                  'This email/phone number belongs to\n Mother',
                                  style: FontConstant.k16w4008471Text,
                                )
                              ],
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
                                                      PSignupOtpVerification()));
                                          Fluttertoast.showToast(
                                              msg:
                                                  'Your OTP is ${value['OTP']}');
                                        }
                                      });
                                    }
                                  },
                                  title: "Signup with OTP",
                                  textStyleColor: Colors.white,
                                  backgroundColor: ThemeColor.primarycolor),
                            ),
                            SizedBox(height: 20),
                            Row(
                              children: [
                                SizedBox(
                                  width: 50,
                                ),
                                Text("Already have account?",
                                    style: FontConstant.k16w4008471Text),
                                SizedBox(
                                  width: 20,
                                ),
                                GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  PLoginScreen()));
                                    },
                                    child: Text("Login",
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
