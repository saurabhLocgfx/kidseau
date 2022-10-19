import 'package:flutter/material.dart';
import 'package:kidseau/Theme.dart';
import 'package:kidseau/Widgets/buttons.dart';
import 'package:kidseau/Widgets/textfields.dart';

class LoginOtp extends StatelessWidget {
  const LoginOtp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 896,
      width: 414,
      child: Scaffold(
        backgroundColor: Color(0xfff7f6fa),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(children: [
                Container(
                  height: 414,
                  width: 414,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xffD9D9D9).withOpacity(0.99),
                        Color(0xffD9D9D9).withOpacity(0.0)
                      ],
                    ),
                    image: DecorationImage(
                      image: AssetImage("assets/images/backgrounddesigns.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 199.0),
                  child: Container(
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/images/logo.png",
                          height: 172,
                          width: 173,
                        ),
                        Text(
                          "We offers a new way to track your children and watch them grow.",
                          style: FontConstant.k16w4008471Text,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                )
              ]),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 1.0),
                      child: Text("OTP verification",
                          style: FontConstant.k24w500brownText),
                    ),
                    Text(
                      "A OTP has been sent to “9876543210”. Please enter the OTP here.",
                      style: FontConstant.k16w400B7A4Text,
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(height: 43),
                    Container(
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            height: 19,
                            width: 60,
                            child: Otpfield(
                              onTap: () {},
                              title: "",
                              underlinecolor1: ThemeColor.primarycolor,
                              underlinecolor2: ThemeColor.primarycolor,
                            ),
                          ),
                          SizedBox(
                            height: 19,
                            width: 60,
                            child: Otpfield(
                              onTap: () {},
                              title: "",
                              underlinecolor1: ThemeColor.primarycolor,
                              underlinecolor2: ThemeColor.primarycolor,
                            ),
                          ),
                          SizedBox(
                            height: 19,
                            width: 60,
                            child: Otpfield(
                              onTap: () {},
                              title: "",
                              underlinecolor1: ThemeColor.primarycolor,
                              underlinecolor2: ThemeColor.primarycolor,
                            ),
                          ),
                          SizedBox(
                            height: 19,
                            width: 60,
                            child: Otpfield(
                              onTap: () {},
                              title: "",
                              underlinecolor1: ThemeColor.primarycolor,
                              underlinecolor2: ThemeColor.primarycolor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 32),
                    SizedBox(
                      height: 52,
                      width: 382,
                      child: MainButton(
                          onTap: () {
                            // Navigator.of(context).push(MaterialPageRoute(
                            // builder: (context) => OtpScreen()));
                          },
                          title: "Continue",
                          textStyleColor: Colors.white,
                          backgroundColor: ThemeColor.primarycolor),
                    ),
                    SizedBox(height: 40),
                    Text(
                      "By proceeding you agree to our Privacy Policy an& Terms and Conditions",
                      style: FontConstant.k14w500B7A4Text,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 26),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
