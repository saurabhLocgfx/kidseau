// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
//
// class FacebookLoginButton extends StatefulWidget {
//   const FacebookLoginButton({Key? key}) : super(key: key);
//
//   @override
//   State<FacebookLoginButton> createState() => _FacebookLoginButtonState();
// }
//
// class _FacebookLoginButtonState extends State<FacebookLoginButton> {
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () async {
//         final LoginResult result = await FacebookAuth.instance.login();
//
//         // Check if the login was successful
//         if (result.status == LoginStatus.success) {
//           // Retrieve the Facebook access token
//           final AccessToken accessToken = result.accessToken!;
//           AuthCredential credential =
//               FacebookAuthProvider.credential(accessToken.token);
//
//           // Sign in with Firebase using the Facebook credentials
//           await FirebaseAuth.instance.signInWithCredential(credential);
//
//           print("Successfully signed in with Facebook");
//         } else {
//           print("Facebook login failed");
//         }
//         // _isLoading = true;
//         // _loginWithFacebook();
//         // FacebookAuth.instance.login(permissions: [
//         //   "public_profile",
//         //   "email",
//         // ]).then((v) {
//         //   print('${v.accessToken!.token}');
//         //   print(v.accessToken!.token.length);
//         //   print(v.accessToken!.token);
//         //   // print("user_birthday");
//         //   // print(v.accessToken!.token.length);
//         //   // print(v.accessToken!.token);
//         //   /*var d = FacebookAuthProvider.credential(v.accessToken!.token);
//         // print('_________________________________${d.idToken}');*/
//         //   FacebookAuth.instance
//         //       .getUserData()
//         //       .then((val) {
//         //     print(val);
//         //     facebookSignInApi(
//         //             idToken:
//         //                 v.accessToken!.token.toString(),
//         //             parentTeacher: 'teacher',
//         //             device: 'facebook')
//         //         .then((value) {
//         //       if (value == false) {
//         //         Fluttertoast.showToast(
//         //             msg:
//         //                 "Sign in failed! Please try again.");
//         //         setState(() {
//         //           _isLoading = false;
//         //         });
//         //       } else if (value['status'] == 0) {
//         //         setState(() {
//         //           _isLoading = false;
//         //         });
//         //         Fluttertoast.showToast(
//         //             msg:
//         //                 "Wait For Director's Approval");
//         //       } else {
//         //         UserPrefs.setCookies(value['key']);
//         //         //UserPrefs.setOTP(value['OTP']);
//         //
//         //         if (value['status'] == 1) {
//         //           Navigator.of(context).push(
//         //               MaterialPageRoute(
//         //                   builder: (context) =>
//         //                       TSignupCode(
//         //                         isEmail: false,
//         //                         mobileText: '',
//         //                         /*isEmail:
//         //                     widget
//         //                         .isEmail,
//         //                     mobileText: widget
//         //                         .mobileText*/
//         //                       )));
//         //         } else {
//         //           //if(value['status'] == 2){
//         //
//         //           // UserPrefs.setCookies(value['key']);
//         //           // UserPrefs.setOTP(value['OTP']);
//         //
//         //           Navigator.of(context).push(
//         //               MaterialPageRoute(
//         //                   builder: (context) =>
//         //                       TDashboard()));
//         //           // }
//         //           // else{}
//         //         }
//         //       }
//         //     });
//         //   });
//         // });
//       },
//
//       /*child: Container(
//                                 margin: EdgeInsets.all(16),
//                                 padding: EdgeInsets.all(12),
//                                 clipBehavior: Clip.hardEdge,
//                                 decoration: BoxDecoration(
//
//                                     color: Colors.white,
//                                     borderRadius: BorderRadius.circular(12)
//                                 ),*/
//       child: CircleAvatar(
//         backgroundColor: Color(0xfff7f6fa),
//         child: Image.asset(
//           'assets/images/facebookicon.png',
//           fit: BoxFit.cover,
//           height: 40,
//         ),
//       ),
//       //),
//     );
//   }
// }
