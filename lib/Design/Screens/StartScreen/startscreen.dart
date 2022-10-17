import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kidseau/Design/Screens/OnboardingScreens/onboardingscreen1.dart';
import 'package:kidseau/Theme.dart';
import 'package:kidseau/Widgets/buttons.dart';
import 'package:kidseau/Widgets/widgets.dart';



class StartScreen extends StatelessWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff8267ac),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Image.asset("images/Artboard 1 1.png"),
            Container(
              height: 229,
              width: Get.size.width,
              decoration: BoxDecoration(
                color: Colors.transparent,),
              child: Image.asset("assets/images/Artboard 1 1.png",fit: BoxFit.cover,),
            ),
            Container(
              height: Get.size.height * 6.07,
              width: Get.size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                  borderRadius: new BorderRadius.only(
                    topLeft: const Radius.circular(24.0),
                    topRight: const Radius.circular(24.0),
                  ),
              ),
              child: Column(
                children: [
                  SizedBox(height: 59,),
                  mainlogo(),
                  SizedBox(height: Get.size.height * 0.05,),
                  materialButton(context, () {}, "i'm a Teacher", ThemeColor.primaryorange,56.0),
                  SizedBox(height: Get.size.height * 0.02,),
                  materialButton(context, () {
                    Get.to(()=>Onboarding1Screen());
                  }, "i'm a Parent", ThemeColor.primarycolor,56.0),
                  SizedBox(height: Get.size.height * 0.18,),
                  Image.asset("assets/images/Made with ❤️ Locgfx.png")

                  
                ],
              ),

            ),
          
        ],
        ),
      ),
    );
  }
}
