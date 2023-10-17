import 'dart:io' show Platform;

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kidseau/Theme.dart';
import 'package:kidseau/Widgets/buttons.dart';
import 'package:kidseau/shard_prefs/shared_prefs.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../Apple_Sign_In/apple_sign_in_api.dart';
import '../../Constants/string_const.dart';
import '../../Google_SignIn/google_sign_in.dart';
import '../../api/google_sign_in/google_sign_in_api.dart';
import '../../api/parent_signup_apis/parent_signup_api.dart';
import '../PDashBoard.dart';
import 'PSignupCodeScreen.dart';
import 'PSignupOtpVerification.dart';

class PSignupScreen extends StatefulWidget {
  PSignupScreen({Key? key}) : super(key: key);

  @override
  State<PSignupScreen> createState() => _PSignupScreenState();
}

class _PSignupScreenState extends State<PSignupScreen> {
  final TextEditingController emailController = TextEditingController();

  bool _isLoading = false;

  bool isChecked = false;
  String parent = '';
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff7f6fa),
      bottomNavigationBar: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Center(
              child: RichText(
                  text: TextSpan(children: [
                TextSpan(
                  text: "By proceeding you agree to our ".tr(),
                  style: FontConstant.k14w400B7A4Text,
                ),
                TextSpan(
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      launchUrl(Uri.parse(
                          "$kAPIConst/appDetails/privacy-policy.php"));
                    },
                  text: "Privacy Policy".tr(),
                  style: FontConstant.k14w500B7A4TextU,
                ),
                TextSpan(
                  text: " & ",
                  style: FontConstant.k14w400B7A4Text,
                ),
                TextSpan(
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      launchUrl(Uri.parse(
                          "$kAPIConst/appDetails/terms-conditions.php"));
                    },
                  text: "Terms and Conditions".tr(),
                  style: FontConstant.k14w500B7A4TextU,
                ),
              ])),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Container(
                //height: 1.sh,
                constraints: BoxConstraints(maxHeight: 1.sh),
                width: 1.sw,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    opacity: 0.4,
                    image: AssetImage("assets/images/postsbackground.png"),
                    fit: BoxFit.fitWidth,
                    alignment: Alignment.topLeft,
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.only(top: 120.h, left: 16, right: 16),
                        child: Column(
                          children: [
                            Image.asset(
                              "assets/images/logo.png",
                              height: 150.w,
                              width: 150.w,
                            ),
                            /*Text(
                              "We offer a new way to track your children and watch them grow.",
                              style: FontConstant.k16w4008471Text,
                              textAlign: TextAlign.center,
                            ),*/
                          ],
                        ),
                      ),
                      //Spacer(),
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0, right: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //SizedBox(height: 40),
                            Text("New Account".tr(),
                                style: FontConstant.k24w500brownText),
                            Text(
                              "Create a new account to track your kids’ activities."
                                  .tr(),
                              style: FontConstant.k16w400B7A4Text
                                  .copyWith(fontSize: 15),
                              textAlign: TextAlign.start,
                            ),
                            SizedBox(height: 24),
                            Text("Email/Phone number".tr(),
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
                                keyboardType: TextInputType.emailAddress,
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
                              "Note: The email/phone number belongs to Father by default"
                                  .tr(),
                              style: FontConstant.k14w400B7A4Text,
                            ),
                            CheckboxListTile(
                              contentPadding: EdgeInsets.only(left: 0),
                              controlAffinity: ListTileControlAffinity.leading,
                              // controlAffinity: ListTileControlAffinity.leading,
                              activeColor: Color(0xffBE74AA),
                              checkColor: Colors.white,
                              checkboxShape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              // checkColor: Colors.white,
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
                                'Note: The email/phone number belongs to mother'
                                    .tr(),
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
                                          UserPrefs.setEnteredVal(
                                              emailController.text);
                                          UserPrefs.setIsMother(isChecked);
                                          if (isChecked) {
                                            UserPrefs.setIsFather(false);
                                          } else {
                                            UserPrefs.setIsFather(true);
                                          }
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      PSignupOtpVerification(
                                                        signUpField:
                                                            emailController
                                                                .text,
                                                        parent: parent,
                                                      )));
                                          // Fluttertoast.showToast(
                                          //     msg:
                                          //         'Your OTP is ${value['OTP']}');
                                        }
                                      });
                                    }
                                  },
                                  title: "Signup with OTP".tr(),
                                  textStyleColor: Colors.white,
                                  backgroundColor: ThemeColor.primarycolor),
                            ),
                            SizedBox(height: 40.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Platform.isIOS
                                    ? GestureDetector(
                                        onTap: () async {
                                          final credential =
                                              await SignInWithApple
                                                  .getAppleIDCredential(
                                            scopes: [
                                              AppleIDAuthorizationScopes.email,
                                              AppleIDAuthorizationScopes
                                                  .fullName,
                                            ],
                                          );

                                          appleSignInApi(
                                                  id_token: credential
                                                      .identityToken
                                                      .toString(),
                                                  auth_code: credential
                                                      .authorizationCode
                                                      .toString(),
                                                  ParentTeacher: 'parent')
                                              .then((value) {
                                            if (value == false) {
                                              Fluttertoast.showToast(
                                                  msg:
                                                      "Sign in failed! Please try again.");
                                              setState(() {
                                                _isLoading = false;
                                              });
                                            } else if (value['status'] == 0) {
                                              setState(() {
                                                _isLoading = false;
                                              });
                                              Fluttertoast.showToast(
                                                  msg:
                                                      "Sign in failed! Please try again.");
                                            } else {
                                              UserPrefs.setCookies(
                                                  value['key']);
                                              if (value['status'] == 1) {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            PSignupCode(
                                                                newKid: true)));

                                                //UserPrefs.getKidsStatus();
                                              } else {
                                                //UserPrefs.setIsTeacher(false);
                                                UserPrefs.setIsTeacher(false);

                                                //if(value['status'] == 2) {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            PDashboard()));
                                                // }
                                                // else{}
                                              }
                                            }
                                          });
                                          print(credential);
                                        },
                                        // child: Container(
                                        //   margin: EdgeInsets.all(16),
                                        //   padding: EdgeInsets.all(12),
                                        //   decoration: BoxDecoration(
                                        //
                                        //     color: Colors.white,
                                        //     borderRadius: BorderRadius.circular(12)
                                        //   ),
                                        child: Image.asset(
                                          'assets/images/apple logo.png',
                                          fit: BoxFit.cover,
                                          height: 40,
                                        ),
                                        //),
                                      )
                                    : SizedBox(),
                                SizedBox(
                                  width: 20,
                                ),

                                Platform.isIOS
                                    ? GestureDetector(
                                        onTap: () async {
                                          final auth =
                                              await GoogleSignInClass().login();

                                          googleSignInApiAndroid(
                                                  id_Token: auth.idToken!,
                                                  device: 'google',
                                                  ParentTeacher: 'parent')
                                              .then((value) {
                                            if (value == false) {
                                              Fluttertoast.showToast(
                                                  msg:
                                                      "Sign in failed! Please try again.");
                                              setState(() {
                                                _isLoading = false;
                                              });
                                            } else if (value['status'] == 0) {
                                              setState(() {
                                                _isLoading = false;
                                              });
                                              Fluttertoast.showToast(
                                                  msg:
                                                      "Sign in failed! Please try again.");
                                            } else {
                                              UserPrefs.setCookies(
                                                  value['key']);
                                              if (value['status'] == 1) {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            PSignupCode(
                                                                newKid: true)));

                                                //UserPrefs.getKidsStatus();
                                              } else {
                                                UserPrefs.setIsTeacher(false);

                                                //if(value['status'] == 2) {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            PDashboard()));
                                                // }
                                                // else{}
                                              }
                                            }
                                          });
                                        },
                                        /*child: Container(
                              margin: EdgeInsets.all(16),
                              padding: EdgeInsets.all(12),
                              clipBehavior: Clip.hardEdge,
                              decoration: BoxDecoration(

                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12)
                              ),*/
                                        child: CircleAvatar(
                                          backgroundColor: Color(0xfff7f6fa),
                                          child: Image.asset(
                                            'assets/images/glogo.png',
                                            fit: BoxFit.cover,
                                            height: 40,
                                          ),
                                        ),
                                        //),
                                      )
                                    : GestureDetector(
                                        onTap: () async {
                                          final auth =
                                              await GoogleSignInClass().login();

                                          googleSignInApiAndroid(
                                                  id_Token: auth.idToken!,
                                                  device: 'android',
                                                  ParentTeacher: 'parent')
                                              .then((value) {
                                            if (value == false) {
                                              Fluttertoast.showToast(
                                                  msg:
                                                      "Sign in failed! Please try again.");
                                              setState(() {
                                                _isLoading = false;
                                              });
                                            } else if (value['status'] == 0) {
                                              setState(() {
                                                _isLoading = false;
                                              });
                                              Fluttertoast.showToast(
                                                  msg:
                                                      "Sign in failed! Please try again.");
                                            } else {
                                              UserPrefs.setCookies(
                                                  value['key']);
                                              if (value['status'] == 1) {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            PSignupCode(
                                                                newKid: true)));

                                                //UserPrefs.getKidsStatus();
                                              } else {
                                                UserPrefs.setIsTeacher(false);

                                                //if(value['status'] == 2) {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            PDashboard()));
                                                // }
                                                // else{}
                                              }
                                            }
                                          });
                                        },
                                        /*child: Container(
                              margin: EdgeInsets.all(16),
                              padding: EdgeInsets.all(12),
                              clipBehavior: Clip.hardEdge,
                              decoration: BoxDecoration(

                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12)
                              ),*/
                                        child: CircleAvatar(
                                          backgroundColor: Color(0xfff7f6fa),
                                          child: Image.asset(
                                            'assets/images/glogo.png',
                                            fit: BoxFit.cover,
                                            height: 40,
                                          ),
                                        ),
                                        //),
                                      ),
                                SizedBox(
                                  width: 20,
                                ),
                                // GestureDetector(
                                //   onTap: () async
                                //   {
                                //     _isLoading = true;
                                //     FacebookAuth.instance.login(
                                //         permissions: [
                                //           "public_profile",
                                //           "email"
                                //         ]).then((v) {
                                //       print('${v.accessToken!.token}');
                                //       print(v.accessToken!.token.length);
                                //       print(v.accessToken!.token);
                                //       // print(v.accessToken!.token.length);
                                //       // print(v.accessToken!.token);
                                //       /*var d = FacebookAuthProvider.credential(v.accessToken!.token);
                                //     print('_________________________________${d.idToken}');*/
                                //       FacebookAuth.instance
                                //           .getUserData()
                                //           .then((val) {
                                //         print(val);
                                //
                                //
                                //         facebookSignInApi(idToken: v.accessToken!.token.toString(),
                                //             parentTeacher: 'parent', device: 'facebook').then((value) {
                                //
                                //           if(value == false){
                                //             Fluttertoast.showToast(
                                //                 msg: "Sign in failed! Please try again.");
                                //             setState(() {
                                //               _isLoading = false;
                                //             });
                                //           }
                                //
                                //           else if (value['status'] == 0) {
                                //             setState(() {
                                //               _isLoading = false;
                                //             });
                                //             Fluttertoast.showToast(msg: "Sign in failed! Please try again.");
                                //           }
                                //
                                //           else{
                                //
                                //             UserPrefs.setCookies(value['key']);
                                //             if(value['status'] == 1 ){
                                //               Navigator.push(context, MaterialPageRoute(builder: (context) =>
                                //                   PSignupCode(newKid: true)));
                                //
                                //               //UserPrefs.getKidsStatus();
                                //
                                //             }
                                //
                                //             else{
                                //
                                //               UserPrefs.setIsTeacher(false);
                                //
                                //
                                //
                                //               //if(value['status'] == 2) {
                                //               Navigator.push(context, MaterialPageRoute(builder: (context)=> PDashboard()));
                                //               // }
                                //               // else{}
                                //
                                //             }
                                //           }
                                //
                                //         });
                                //
                                //
                                //       });
                                //     });
                                //   },
                                //   /*child: Container(
                                // margin: EdgeInsets.all(16),
                                // padding: EdgeInsets.all(12),
                                // clipBehavior: Clip.hardEdge,
                                // decoration: BoxDecoration(
                                //
                                //     color: Colors.white,
                                //     borderRadius: BorderRadius.circular(12)
                                // ),*/
                                //   child: CircleAvatar(
                                //     backgroundColor: Color(0xfff7f6fa),
                                //     child: Image.asset(
                                //       'assets/images/facebookicon.png',
                                //       fit: BoxFit.cover,
                                //       height: 40,
                                //     ),
                                //   ),
                                //   //),
                                // ),
                              ],
                            ),
                            SizedBox(
                              height: 100,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
