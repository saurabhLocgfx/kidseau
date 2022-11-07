import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kidseau/Theme.dart';
import 'package:kidseau/Widgets/buttons.dart';
import 'package:kidseau/Widgets/textfields.dart';

class KidsDetails extends StatefulWidget {
  const KidsDetails({Key? key}) : super(key: key);

  @override
  State<KidsDetails> createState() => _KidsDetailsState();
}

class _KidsDetailsState extends State<KidsDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: ThemeColor.primarycolor.withOpacity(.06),
          width: 414.h,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                SizedBox(height: 72.h),
                Center(
                    child: Image.asset(
                  "assets/images/onlylogo.png",
                  height: 53,
                  width: 63,
                )),
                SizedBox(height: 40),
                Image.asset(
                  "assets/images/3dotprogression.png",
                  height: 68,
                  width: 332,
                ),
                SizedBox(height: 40),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    "Kid’s Information",
                    style: FontConstant2.k24w500331Ftext,
                    textAlign: TextAlign.start,
                  ),
                ),
                SizedBox(height: 24),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Kid’s name",
                      style: FontConstant.k16w500331FText,
                    ),
                    SizedBox(height: 5),
                    textfield(context, "Enter your Kid’s name")
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Class Section",
                      style: FontConstant.k16w500331FText,
                    ),
                    SizedBox(height: 5),
                    IconTextfield(
                        Icon: "assets/images/arrowdown.png",
                        title: "Select class section")
                  ],
                ),
                SizedBox(height: 4),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Age",
                      style: FontConstant.k16w500331FText,
                    ),
                    SizedBox(height: 5),
                    textfield(context, "Enter your Kid’s age")
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Birthday",
                      style: FontConstant.k16w500331FText,
                    ),
                    SizedBox(height: 5),
                    IconTextfield(
                        Icon: "assets/images/calendericon.png",
                        title: "dd/mm/yyyy")
                  ],
                ),
                SizedBox(height: 4),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Gender",
                      style: FontConstant.k16w500331FText,
                    ),
                    SizedBox(height: 5),
                    IconTextfield(
                        Icon: "assets/images/arrowdown.png",
                        title: "Select gender")
                  ],
                ),
                SizedBox(height: 4),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Profile photo",
                      style: FontConstant.k16w500331FText,
                    ),
                    SizedBox(height: 5),
                    IconTextfield(
                        Icon: "assets/images/uploadicon.png",
                        title: "Upload kid’s photo")
                  ],
                ),
                SizedBox(height: 35),
                SizedBox(
                    height: 52,
                    width: 382,
                    child: MainButton(
                        onTap: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //       builder: (context) => ParentInfo()),
                          // );
                        },
                        title: "Continue",
                        textStyleColor: Colors.white,
                        backgroundColor: ThemeColor.primarycolor)),
                SizedBox(
                  height: 53,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
