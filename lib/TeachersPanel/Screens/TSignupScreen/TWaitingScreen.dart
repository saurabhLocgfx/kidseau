import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kidseau/TeachersPanel/Screens/OnboardingScreens/TLoginScreen/TLoginScreen.dart';
import 'package:kidseau/Theme.dart';
import 'package:kidseau/Widgets/buttons.dart';
import 'package:kidseau/Widgets/widgets.dart';

class TWaitingScreen extends StatefulWidget {
  const TWaitingScreen({Key? key}) : super(key: key);

  @override
  State<TWaitingScreen> createState() => _TWaitingScreenState();
}

class _TWaitingScreenState extends State<TWaitingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            SizedBox(height: 111),
            SizedBox(height: 160, child: mainlogo()),
            SizedBox(height: 32),
            Image.asset(
              "assets/images/owlwithbook.png",
              height: 188.h,
              width: 286.w,
            ),
            SizedBox(height: 20.h),
            Text(
              "Wait for director’s approval",
              style: FontConstant2.k32w5008267text.copyWith(fontSize: 28),
            ),
            Text(
              "Thank you for your patience",
              style: FontConstant.k16w5008471Text,
            ),
            SizedBox(height: 70.h),
            SizedBox(
              height: 52,
              width: 382,
              child: MainButton(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TLoginScreen()),
                    );
                  },
                  title: "Close",
                  textStyleColor: Colors.white,
                  backgroundColor: ThemeColor.primarycolor),
            ),
          ],
        ),
      ),
    );
  }
}
