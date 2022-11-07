import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kidseau/TeachersPanel/TSignupScreen/TWaitingScreen.dart';
import 'package:kidseau/Theme.dart';
import 'package:kidseau/Widgets/buttons.dart';
import 'package:kidseau/Widgets/textfields.dart';

class TPersonalDetails extends StatelessWidget {
  const TPersonalDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              SizedBox(height: 72.h),
              Image.asset(
                "assets/images/logo without text.png",
                height: 63,
                width: 52,
              ),
              SizedBox(height: 30.h),
              Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  "Personal details",
                  style: FontConstant2.k24w500331Ftext,
                  textAlign: TextAlign.start,
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "First name",
                    style: FontConstant.k16w500331FText,
                  ),
                  SizedBox(height: 4),
                  textfield(context, "Enter your first name")
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Family name",
                    style: FontConstant.k16w500331FText,
                  ),
                  SizedBox(height: 4),
                  textfield(context, "Enter your family name")
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Email address",
                    style: FontConstant.k16w500331FText,
                  ),
                  SizedBox(height: 4),
                  textfield(context, "Enter your email address")
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Birthday",
                    style: FontConstant.k16w500331FText,
                  ),
                  SizedBox(height: 4),
                  IconTextfield(
                      Icon: "assets/images/calendericon.png",
                      title: "dd/mm/yyyy")
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Education",
                    style: FontConstant.k16w500331FText,
                  ),
                  SizedBox(height: 4),
                  textfield(context, "Enter your highest degree")
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Year of experiance",
                    style: FontConstant.k16w500331FText,
                  ),
                  SizedBox(height: 4),
                  textfield(context, "Enter your highest degree")
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Gender",
                    style: FontConstant.k16w500331FText,
                  ),
                  SizedBox(height: 4),
                  IconTextfield(
                      Icon: "assets/images/downarrow.png",
                      title: "Select your gender")
                ],
              ),
              SizedBox(height: 32),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Address",
                    style: FontConstant.k16w500331FText,
                  ),
                  SizedBox(height: 4),
                  textfield(context, "Enter your parmanent address")
                ],
              ),
              SizedBox(
                height: 52,
                width: 382,
                child: MainButton(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TWaitingScreen()),
                      );
                    },
                    title: "Continue",
                    textStyleColor: Colors.white,
                    backgroundColor: ThemeColor.primarycolor),
              ),
              SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
