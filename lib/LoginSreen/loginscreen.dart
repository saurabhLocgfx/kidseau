import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:kidseau/Theme.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff7f6fa),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: Get.size.height *0.60,
              child: Column(
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
                    child: Column(
                      children: [
                        SizedBox(height: Get.size.height* 0.30),
                        Image.asset("assets/images/logowithtext.png",height: 150,),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Text("Email",style: FontConstant.headingText,),


                
              ],
            )
            

          ],
        ),
      ),

    );
  }
}
