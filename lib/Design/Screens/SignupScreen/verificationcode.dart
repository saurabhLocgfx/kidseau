import 'package:flutter/material.dart';
import 'package:kidseau/Theme.dart';
import 'package:kidseau/Widgets/buttons.dart';
import 'package:kidseau/Widgets/textfields.dart';
import 'package:kidseau/Widgets/widgets.dart';

class VerificationcodeScreen extends StatelessWidget {
  VerificationcodeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 896,
      width: 414,
      child: Scaffold(
        backgroundColor: Color(0xfff7f6fa),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 84),
                mainlogo(),
                SizedBox(height: 10),
                Text(
                  "We have sent you a verification mail on “xyz@gmail.com”. Please verify before 48 hours.",
                  style: FontConstant.k16w5008267Text,
                ),
                SizedBox(height: 24),
                Text(
                  "Voucher’s code",
                  style: FontConstant.k16w500331FText,
                  textAlign: TextAlign.start,
                ),
                SizedBox(
                  height: 08,
                ),
                SizedBox(
                  height: 56,
                  width: 382,
                  child: textfield(context, "Enter your Voucher’s code"),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 14.0),
                  child: Text(
                    "Vouchers are given by kid’s school",
                    style: FontConstant.k14w400B7A4Text,
                  ),
                ),
                SizedBox(height: 40),
                Container(
                  height: 214,
                  width: 382,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                            "assets/images/laptopbackgroundplay.png",
                          ),
                          fit: BoxFit.cover)),
                  child: Center(
                      child: Image.asset(
                    "assets/images/playicon.png",
                    height: 46,
                    width: 46,
                  )),
                ),
                SizedBox(
                  height: 64,
                ),
                SizedBox(
                  height: 52,
                  width: 382,
                  child: MainButton(
                      onTap: () {},
                      title: "Continue",
                      textStyleColor: Colors.white,
                      backgroundColor: ThemeColor.primarycolor),
                ),
                SizedBox(
                  height: 45,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
