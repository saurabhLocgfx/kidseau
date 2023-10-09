import 'dart:developer';
import 'dart:io' show Platform;

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kidseau/Apple_Sign_In/apple_sign_in_api.dart';
import 'package:kidseau/ParentsPanel/PDashBoard.dart';
import 'package:kidseau/ParentsPanel/PSignUpScreen/PSignupCodeScreen.dart';
//import 'package:kidseau/api/apple_sign_in/appleapi.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../Constants/string_const.dart';
import '../../Google_SignIn/google_sign_in.dart';
import '../../Theme.dart';
import '../../Widgets/buttons.dart';
import '../../Widgets/textfields.dart';
import '../../api/google_sign_in/google_sign_in_api.dart';
import '../../api/parent_login_apis/parent_login_api.dart';
import '../../shard_prefs/shared_prefs.dart';
import '../POnboardingScreens/PStartScreen.dart';
import '../PSignUpScreen/PSignupScreen.dart';
import 'PLoginOtpVerification.dart';

class PLoginScreen extends StatefulWidget {
  const PLoginScreen({super.key});

  @override
  State<PLoginScreen> createState() => _PLoginScreenState();
}

class _PLoginScreenState extends State<PLoginScreen> {
  final TextEditingController emailController = TextEditingController();
  bool _isLoading = false;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        backgroundColor: Color(0xfff7f6fa),
        bottomNavigationBar: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
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
        body: Form(
          key: _formKey,
          child: SafeArea(
            child: SingleChildScrollView(
              child: Container(
                width: 1.sw,
                constraints: BoxConstraints(maxHeight: 1.sh),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    opacity: 0.4,
                    image: AssetImage("assets/images/postsbackground.png"),
                    fit: BoxFit.fitWidth,
                    alignment: Alignment.topLeft,
                  ),
                ),
                child: ListView(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 16, right: 16),
                      child: Center(
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: GestureDetector(
                                behavior: HitTestBehavior.translucent,
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => PStartScreen(),
                                    ),
                                  );
                                },
                                child: Image.asset(
                                  "assets/images/arrow-left.png",
                                  height: 24,
                                  width: 24,
                                ),
                              ),
                            ),
                            SizedBox(height: 80),
                            Image.asset(
                              "assets/images/logo.png",
                              height: 150.w,
                              width: 150.w,
                            ),
                            Text(
                              "We offer a new way to track your children and watch them grow."
                                  .tr(),
                              style: FontConstant.k16w4008471Text,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                    //Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 16.0,
                        right: 16,
                        bottom: 25,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 24),
                          Text("Welcome".tr(),
                              style: FontConstant.k24w500brownText),
                          Text(
                            "Login/create a new account to track your kids’ activities."
                                .tr(),
                            style: FontConstant.k16w400B7A4Text
                                .copyWith(fontSize: 15),
                            textAlign: TextAlign.start,
                          ),
                          SizedBox(height: 24),
                          Text("Email/Phone number".tr(),
                              style: FontConstant.k16w500331FText),
                          SizedBox(height: 6),
                          SizedBox(
                            // height: 56,
                            width: 1.sw,
                            child: TextFormField(
                              validator: (phoneText) {
                                if (phoneText == null || phoneText.isEmpty) {
                                  return "Enter your email/phone number".tr();
                                }
                                return null;
                              },
                              controller: emailController,
                              style: FontConstant.k18w5008471Text,
                              decoration: /*InputDecoration(
                            contentPadding: EdgeInsets.all(14.0),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide.none,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(30.0)),
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
                          )*/
                                  CustomInputDecoration(
                                          hintText:
                                              "Enter your email/phone number"
                                                  .tr())
                                      .decoration(),
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
                                    final resp = ParentLogin().get(
                                        email: emailController.text.trim());
                                    resp.then((value) {
                                      log(value.toString());
                                      if (value['status'] == 0) {
                                        Fluttertoast.showToast(
                                            msg: value['msg']);
                                      } else {
                                        UserPrefs.setCookies(value['key']);
                                        UserPrefs.setOTP(value['OTP']);
                                        log(value['key']);
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    PLoginOtpVerification(
                                                      loginField:
                                                          emailController.text
                                                              .trim(),
                                                    )));
                                        // Fluttertoast.showToast(
                                        //     msg: 'Your OTP is ${value['OTP']}');
                                      }
                                    });
                                  }
                                },
                                title: "Login with OTP".tr(),
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
                                        final credential = await SignInWithApple
                                            .getAppleIDCredential(
                                          scopes: [
                                            AppleIDAuthorizationScopes.email,
                                            AppleIDAuthorizationScopes.fullName,
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
                                            UserPrefs.setCookies(value['key']);
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
                                            UserPrefs.setCookies(value['key']);
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
                                            UserPrefs.setCookies(value['key']);
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
                            height: 40.h,
                          ),
                          Center(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => PSignupScreen()));
                              },
                              child: Container(
                                color: Colors.transparent,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: 5.w,
                                    ),
                                    Text("First time on Kidseau".tr(),
                                        style: FontConstant.k16w4008471Text),
                                    SizedBox(
                                      width: 5.w,
                                    ),
                                    Text("?",
                                        style: FontConstant.k16w4008471Text),
                                    SizedBox(width: 5.w),
                                    Text("Register".tr(),
                                        style: FontConstant.k16w500purpleText)
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                        ],
                      ),
                    ),
                    SizedBox(height: 80),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
