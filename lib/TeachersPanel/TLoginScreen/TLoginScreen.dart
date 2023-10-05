import 'dart:developer';
import 'dart:io' show Platform;

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kidseau/Apple_Sign_In/apple_sign_in_api.dart';
import 'package:kidseau/Facebook_Sign_In/facebook_sign_in.dart';
import 'package:kidseau/Google_SignIn/google_sign_in.dart';
import 'package:kidseau/ParentsPanel/PDashBoard.dart';
import 'package:kidseau/Theme.dart';
import 'package:kidseau/Widgets/buttons.dart';
import 'package:kidseau/api/Teacherpanelapi/teacher_login_apis/teacher_login_api.dart';
//import 'package:kidseau/api/apple_sign_in/appleapi.dart';
import 'package:kidseau/api/google_sign_in/google_sign_in_api.dart';
import 'package:kidseau/api/models/google_sign_in_model/google_sign_in_model.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import '../../Widgets/textfields.dart';
import '../../shard_prefs/shared_prefs.dart';
import '../TDashboard.dart';
import '../THomeScreen/THomeScreen.dart';
import '../TSignupScreen/TSignupCode.dart';
import '../TSignupScreen/TWaitingScreen.dart';
import 'TLoginOtpVerification.dart';

class TLoginScreen extends StatefulWidget {
  TLoginScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<TLoginScreen> createState() => _TLoginScreenState();
}

class _TLoginScreenState extends State<TLoginScreen> {
  final TextEditingController controller = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool isEmail = false;

  String mobileText = ' ';

  GoogleSignInModal? response;

  bool _isLoading = false;

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
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Center(
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "By proceeding you agree to our ".tr(),
                      style: FontConstant.k14w400B7A4Text,
                    ),
                    TextSpan(
                      text: "Privacy Policy".tr(),
                      style: FontConstant.k14w500B7A4TextU,
                    ),
                    TextSpan(
                      text: " & ".tr(),
                      style: FontConstant.k14w400B7A4Text,
                    ),
                    TextSpan(
                      text: "Terms and Conditions".tr(),
                      style: FontConstant.k14w500B7A4TextU,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Container(
                //height: 1.sh,
                width: 1.sw,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    opacity: 0.8,
                    colorFilter: ColorFilter.linearToSrgbGamma(),
                    image: AssetImage(
                      "assets/images/postsbackground.png",
                    ),
                    alignment: Alignment.topLeft,
                    fit: BoxFit.fitWidth,
                  ),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 180.h, left: 16, right: 16),
                      child: Column(
                        children: [
                          Image.asset(
                            "assets/images/logo.png",
                            height: 172.h,
                            width: 173.w,
                          ),
                          Text(
                            'We offer a new way to mark the children and shape them for better future.'
                                .tr(),
                            style: FontConstant.k16w4008471Text,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    //Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0, right: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //  SizedBox(height: 10),
                          Text("Account".tr(),
                              style: FontConstant.k24w500brownText),
                          GestureDetector(
                            onTap: () {},
                            child: Text(
                              "Login/create a new account to track your kids’ activities."
                                  .tr(),
                              style: FontConstant.k16w400B7A4Text
                                  .copyWith(fontSize: 15),
                              textAlign: TextAlign.start,
                            ),
                          ),
                          SizedBox(height: 24),
                          Text("Email/Phone number".tr(),
                              style: FontConstant.k16w500331FText),
                          SizedBox(height: 6),
                          TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            validator: (mobileText) {
                              if (mobileText == null || mobileText.isEmpty) {
                                return "Enter your email/phone number".tr();
                              }
                              return null;
                            },
                            style: FontConstant.k18w5008471Text,
                            decoration: CustomInputDecoration(
                                    hintText:
                                        "Enter your email/phone number".tr())
                                .decoration(),
                            controller: controller,
                          ),
                          SizedBox(height: 32),
                          Row(
                            children: [
                              Expanded(
                                child: MainButton(
                                    onTap: () {
                                      if (_formKey.currentState!.validate()) {
                                        final resp = TeacherLogin()
                                            .get(email: controller.text.trim());
                                        resp.then((value) {
                                          log(value.toString());
                                          if (value['status'] == 0) {
                                            if (value['msg'] ==
                                                "Wait For Director's Approval") {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        TWaitingScreen()),
                                              );
                                            } else {
                                              Fluttertoast.showToast(
                                                  msg: value['msg']);
                                            }
                                          } else {
                                            UserPrefs.setCookies(value['key']);
                                            if (controller.text.contains('@')) {
                                              isEmail = true;
                                            } else {
                                              isEmail = false;
                                            }
                                            print(isEmail);
                                            mobileText = controller.text;
                                            print(mobileText);
                                            UserPrefs.setOTP(value['OTP']);
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        TLoginOtpVerification(
                                                          isEmail: isEmail,
                                                          mobileText: mobileText,
                                                        )));
                                            // Fluttertoast.showToast(
                                            //     msg:
                                            //         'Your OTP is ${value['OTP']}');
                                          }
                                        });
                                        print(controller.text);
                                      }
                                    },
                                    title: "Login with OTP".tr(),
                                    textStyleColor: Colors.white,
                                    backgroundColor: ThemeColor.primarycolor),
                              ),
                            ],
                          ),
                          SizedBox(height: 40.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Platform.isIOS ?
                              GestureDetector(
                                onTap: () async {

                                  final credential =
                                      await SignInWithApple.getAppleIDCredential(
                                    scopes: [
                                      AppleIDAuthorizationScopes.email,
                                      AppleIDAuthorizationScopes.fullName,
                                    ],
                                  );
                                  print(credential.authorizationCode);

                                  appleSignInApi(id_token: credential.identityToken.toString(), auth_code: credential.authorizationCode.toString(),
                                      ParentTeacher: 'teacher').then((value) {
                                    if (value == false) {
                                      Fluttertoast.showToast(
                                          msg: "Sign in failed! Please try again.");
                                      setState(() {
                                        _isLoading = false;
                                      });
                                    }
                                    else if (value['status'] == 0) {
                                      setState(() {
                                        _isLoading = false;
                                      });
                                      Fluttertoast.showToast(msg: "Wait For Director's Approval"                                     // "Sign in failed! Please try again."
                                      );
                                    }


                                    else {
                                      UserPrefs.setCookies(value['key']);
                                      //UserPrefs.setOTP(value['OTP']);

                                      if (value['status'] == 1) {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    TSignupCode(isEmail: false,
                                                      mobileText: '',
                                                      /*isEmail:
                                                      widget
                                                          .isEmail,
                                                      mobileText: widget
                                                          .mobileText*/

                                                    )));
                                      }
                                      else {
                                        //if(value['status'] == 2){

                                        // UserPrefs.setCookies(value['key']);
                                        // UserPrefs.setOTP(value['OTP']);

                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    TDashboard()));
                                        // }
                                        // else{}

                                      }
                                    }

                                  });

                                },

                                // child: Container(
                                //   margin: EdgeInsets.all(16),
                                //   padding: EdgeInsets.all(12),
                                //   decoration: BoxDecoration(
                                //
                                //     color: Colors.white,
                                //     borderRadius: BorderRadius.circular(12)
                                //   ),
                                  child: Image.asset('assets/images/apple logo.png',fit: BoxFit.cover,height: 40,
                                  ),
                                //),
                              ) : SizedBox(),
                              SizedBox(width: 20,),
                              GestureDetector(
                                onTap: () async{
                                  final auth = await GoogleSignInClass().login();
                                  print('below id token');
                                  print(auth.idToken);


                                  googleSignInApi(id_token: auth.idToken!).then((value) {
                                    if (value == false) {
                                      Fluttertoast.showToast(
                                          msg: "Sign in failed! Please try again.");
                                      setState(() {
                                        _isLoading = false;
                                      });
                                    }
                                    else if (value['status'] == 0) {
                                      setState(() {
                                        _isLoading = false;
                                      });
                                      Fluttertoast.showToast(msg: "Wait For Director's Approval");
                                    }


                                    else {
                                      UserPrefs.setCookies(value['key']);
                                      //UserPrefs.setOTP(value['OTP']);

                                      if (value['status'] == 1) {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    TSignupCode(isEmail: false,
                                                      mobileText: '',
                                                      /*isEmail:
                                                      widget
                                                          .isEmail,
                                                      mobileText: widget
                                                          .mobileText*/

                                                    )));
                                      }
                                      else {
                                        //if(value['status'] == 2){

                                        // UserPrefs.setCookies(value['key']);
                                        // UserPrefs.setOTP(value['OTP']);

                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    TDashboard()));
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
                                    child: Image.asset('assets/images/glogo.png',fit: BoxFit.cover,height: 40,
                                    ),
                                  ),
                                //),
                              ),

                              SizedBox(width: 20,),
                              // GestureDetector(
                              //   onTap: () async {
                              // _isLoading = true;
                              // FacebookAuth.instance.login(
                              // permissions: [
                              // "public_profile",
                              // "email"
                              // ]).then((v) {
                              // print('${v.accessToken!.token}');
                              // print(v.accessToken!.token.length);
                              // print(v.accessToken!.token);
                              // // print(v.accessToken!.token.length);
                              // // print(v.accessToken!.token);
                              // /*var d = FacebookAuthProvider.credential(v.accessToken!.token);
                              //     print('_________________________________${d.idToken}');*/
                              // FacebookAuth.instance
                              //     .getUserData()
                              //     .then((val) {
                              // print(val);
                              //
                              //
                              // facebookSignInApi(idToken: v.accessToken!.token.toString(),
                              // parentTeacher: 'teacher', device: 'facebook').then((value) {
                              //
                              // if (value == false) {
                              // Fluttertoast.showToast(
                              // msg: "Sign in failed! Please try again.");
                              // setState(() {
                              // _isLoading = false;
                              // });
                              // }
                              // else if (value['status'] == 0) {
                              // setState(() {
                              // _isLoading = false;
                              // });
                              // Fluttertoast.showToast(msg: "Wait For Director's Approval");
                              // }
                              //
                              //
                              // else {
                              // UserPrefs.setCookies(value['key']);
                              // //UserPrefs.setOTP(value['OTP']);
                              //
                              // if (value['status'] == 1) {
                              // Navigator.of(context).push(
                              // MaterialPageRoute(
                              // builder: (context) =>
                              // TSignupCode(isEmail: false,
                              // mobileText: '',
                              // /*isEmail:
                              //                         widget
                              //                             .isEmail,
                              //                         mobileText: widget
                              //                             .mobileText*/
                              //
                              // )));
                              // }
                              // else {
                              // //if(value['status'] == 2){
                              //
                              // // UserPrefs.setCookies(value['key']);
                              // // UserPrefs.setOTP(value['OTP']);
                              //
                              // Navigator.of(context).push(
                              // MaterialPageRoute(
                              // builder: (context) =>
                              // TDashboard()));
                              // // }
                              // // else{}
                              //
                              // }
                              // }
                              //
                              // });
                              //
                              //
                              // });
                              // });
                              // },
                              //
                              //   /*child: Container(
                              //     margin: EdgeInsets.all(16),
                              //     padding: EdgeInsets.all(12),
                              //     clipBehavior: Clip.hardEdge,
                              //     decoration: BoxDecoration(
                              //
                              //         color: Colors.white,
                              //         borderRadius: BorderRadius.circular(12)
                              //     ),*/
                              //   child: CircleAvatar(
                              //     backgroundColor: Color(0xfff7f6fa),
                              //     child: Image.asset('assets/images/facebookicon.png',fit: BoxFit.cover,height: 40,
                              //     ),
                              //   ),
                              //   //),
                              // ),



                            ],
                          )

                        ],
                      ),
                    ),
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
