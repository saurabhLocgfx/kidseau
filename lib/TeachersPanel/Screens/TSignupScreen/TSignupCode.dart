import 'package:flutter/material.dart';
import 'package:kidseau/TeachersPanel/Screens/TSignupScreen/TPersonalDetails.dart';
import 'package:kidseau/Theme.dart';
import 'package:kidseau/Widgets/buttons.dart';
import 'package:kidseau/Widgets/textfields.dart';

class TSignupCode extends StatefulWidget {
  const TSignupCode({Key? key}) : super(key: key);

  @override
  State<TSignupCode> createState() => _TSignupCodeState();
}

class _TSignupCodeState extends State<TSignupCode> {
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
                    image: DecorationImage(
                      image: AssetImage("assets/images/postsbackground.png"),
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
              SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("School code",
                            style: FontConstant.k24w500brownText),
                        Text(
                          "The school code is provided by director.",
                          style: FontConstant.k16w400B7A4Text
                              .copyWith(fontSize: 15),
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    SizedBox(height: 24),
                    textfield(context, "Enter your Voucher’s code"),
                    SizedBox(height: 24),
                    SizedBox(
                      height: 52,
                      width: 382,
                      child: MainButton(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => TPersonalDetails()));
                          },
                          title: "Continue",
                          textStyleColor: Colors.white,
                          backgroundColor: ThemeColor.primarycolor),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
