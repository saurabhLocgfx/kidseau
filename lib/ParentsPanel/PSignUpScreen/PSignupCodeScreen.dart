import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kidseau/Theme.dart';
import 'package:kidseau/Widgets/buttons.dart';
import 'package:kidseau/Widgets/textfields.dart';
import 'package:kidseau/Widgets/widgets.dart';

class PSignupCode extends StatelessWidget {
  PSignupCode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 896.h,
      width: 414.w,
      child: Scaffold(
        backgroundColor: Color(0xfff7f6fa),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 80),
                mainlogo(),
                SizedBox(height: 08),
                Text(
                  "We offer a new way to track your children and watch them grow.",
                  style: FontConstant.k16w4008471Text,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 35),
                Text(
                  "Voucher’s code",
                  style: FontConstant.k16w500331FText,
                  textAlign: TextAlign.start,
                ),
                SizedBox(height: 5),
                SizedBox(
                  height: 56,
                  width: 382,
                  child: textfield(context, "Enter your Voucher’s code"),
                ),
                SizedBox(height: 04),
                Padding(
                  padding: const EdgeInsets.only(left: 14.0),
                  child: Text(
                    "Vouchers are given by kid’s school",
                    style: FontConstant.k14w400B7A4Text,
                  ),
                ),
                SizedBox(height: 25),
                Container(
                  height: 214,
                  width: 382,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
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
                  height: 40,
                ),
                SizedBox(
                  height: 52,
                  width: 382,
                  child: MainButton(
                      onTap: () {
                        // Navigator.push(
                        //   context,
                        // MaterialPageRoute(
                        //     builder: (context) => Informationfill()),
                        // );
                      },
                      title: "Continue",
                      textStyleColor: Colors.white,
                      backgroundColor: ThemeColor.primarycolor),
                ),
                SizedBox(height: 13.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
