import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kidseau/Theme.dart';
import 'package:kidseau/Widgets/buttons.dart';
import 'package:kidseau/Widgets/textfields.dart';

class MedicalInfo extends StatefulWidget {
  const MedicalInfo({Key? key}) : super(key: key);

  @override
  State<MedicalInfo> createState() => _MedicalInfoState();
}

enum SingingCharacter { father, mother }

class _MedicalInfoState extends State<MedicalInfo> {
  SingingCharacter? _character = SingingCharacter.father;
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
                    "Medical Information",
                    style: FontConstant2.k24w500331Ftext,
                    textAlign: TextAlign.start,
                  ),
                ),
                SizedBox(height: 24),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Mother’s name",
                      style: FontConstant.k16w500331FText,
                    ),
                    SizedBox(height: 5),
                    textfield(context, "Enter kid’s mother name")
                  ],
                ),
                SizedBox(height: 4),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Mother’s Occupation",
                      style: FontConstant.k16w500331FText,
                    ),
                    SizedBox(height: 5),
                    textfield(context, "Enter occupation")
                  ],
                ),
                SizedBox(height: 4),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Mother’s email",
                      style: FontConstant.k16w500331FText,
                    ),
                    SizedBox(height: 5),
                    textfield(context, "Enter mother’s email")
                  ],
                ),
                SizedBox(height: 4),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Father’s name",
                      style: FontConstant.k16w500331FText,
                    ),
                    SizedBox(height: 5),
                    textfield(context, "Enter kid’s father name")
                  ],
                ),
                SizedBox(height: 4),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Father’s Occupation",
                      style: FontConstant.k16w500331FText,
                    ),
                    SizedBox(height: 5),
                    textfield(context, "Enter occupation")
                  ],
                ),
                SizedBox(height: 4),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Father’s phone number",
                      style: FontConstant.k16w500331FText,
                    ),
                    SizedBox(height: 5),
                    textfield(context, "Enter father’s phone number")
                  ],
                ),
                SizedBox(height: 4),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Father’s email",
                      style: FontConstant.k16w500331FText,
                    ),
                    SizedBox(height: 5),
                    textfield(context, "Enter father’s email")
                  ],
                ),
                SizedBox(height: 4),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Address",
                      style: FontConstant.k16w500331FText,
                    ),
                    SizedBox(height: 4),
                    textfield(context, "Enter full address")
                  ],
                ),
                SizedBox(height: 4),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "You are",
                      style: FontConstant.k16w500331FText,
                    ),
                    SizedBox(height: 5),
                    ListTile(
                      title: Text(
                        'father',
                        style: FontConstant.k16w4008471Text,
                      ),
                      leading: Radio<SingingCharacter>(
                        activeColor: ThemeColor.primarycolor,
                        value: SingingCharacter.father,
                        groupValue: _character,
                        onChanged: (SingingCharacter? value) {
                          setState(() {
                            _character = value;
                          });
                        },
                      ),
                    ),
                    ListTile(
                      title: Text(
                        'mother',
                        style: FontConstant.k16w4008471Text,
                      ),
                      leading: Radio<SingingCharacter>(
                        activeColor: ThemeColor.primarycolor,
                        value: SingingCharacter.mother,
                        groupValue: _character,
                        onChanged: (SingingCharacter? value) {
                          setState(() {
                            _character = value;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Profile Photo",
                      style: FontConstant.k16w500331FText,
                    ),
                    SizedBox(height: 4),
                    IconTextfield(
                        Icon: "assets/images/uploadicon.png",
                        title: "Upload primary photo")
                  ],
                ),
                SizedBox(height: 35),
                SizedBox(
                    height: 52,
                    width: 382,
                    child: MainButton(
                        onTap: () {},
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
