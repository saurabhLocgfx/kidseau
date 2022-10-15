import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:kidseau/HomeScreen/homescreen.dart';
import 'package:kidseau/SignupScreen/signupscreen.dart';
import 'package:kidseau/Theme.dart';
import 'package:kidseau/widgets.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff7f6fa),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: Get.size.height *0.40,
                  width: Get.size.width,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/backgrounddesigns.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 160.0),
                  child: Center(child: Image.asset("assets/images/logowithtext.png",height: 200,)),
                ),
              ]
            ),


            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: Text("Email",style: FontConstant.smallboldText),
                      ),
                      Padding(padding: EdgeInsets.only(top: 10,),child:
                      textfield(context, "Enter your kid's name"),),
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: Text("Password",style: FontConstant.smallboldText),
                      ),
                      Padding(padding: EdgeInsets.only(top: 10,),child:
                      textfield(context, "Change Password"),),
                      Padding(
                        padding: const EdgeInsets.only(top: 30.0),
                        child: materialButton(context, () {
                          Get.to(()=> HomeScreen());
                        }, "Login", Color(0xff8267AC),52.0),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: Get.size.height * 0.10,),
                    Text("Don't remeber the password?  ",style: FontConstant.smallnormalText,),
                    Text("Reset",style: FontConstant.smallpurpleText,),
                  ],
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("First time on kidseau?  ",style: FontConstant.smallnormalText,),
                    GestureDetector(
                      onTap: () {
                      Get.to(()=>SignupScreen());
                      },
                        child: Text("Register",style: FontConstant.smallpurpleText,)),

                    ],
                  ),
                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text("By proceeding you agree to our ",style: FontConstant.smalllightpurpleText,),
                            Text("Privacy Policy",style: TextStyle(color: Color(0xffB7A4B2),decoration: TextDecoration.underline,fontSize: 14,fontWeight: FontWeight.w400)),
                            Text(" and",style: FontConstant.smalllightpurpleText,),
                            Text("Terms &",style: TextStyle(color: Color(0xffB7A4B2),decoration: TextDecoration.underline,fontSize: 14,fontWeight: FontWeight.w400),),
                          ],
                        ),
                        Row(
                          children: [
                            Text("Conditions ",style: TextStyle(color: Color(0xffB7A4B2),decoration: TextDecoration.underline,fontSize: 14,fontWeight: FontWeight.w400),),
                          ],
                        ),
                        SizedBox(height: 30,)
                      ],
                    ),
                  ],
                ),
                ],
              ),





          ],
        ),
      ),

    );
  }
}
