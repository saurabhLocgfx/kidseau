import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kidseau/Constants/decorations.dart';
import 'package:kidseau/Theme.dart';

class MedicalInfo extends StatefulWidget {
  const MedicalInfo({Key? key}) : super(key: key);

  @override
  State<MedicalInfo> createState() => _MedicalInfoState();
}

enum SingingCharacter { father, mother }

class _MedicalInfoState extends State<MedicalInfo> {
  SingingCharacter? _character = SingingCharacter.father;

  String _selectedText = "A";

  TextEditingController bloodgroupController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: ThemeColor.primarycolor.withOpacity(.06),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    "Medical Information",
                    style: FontConstant2.k24w500331Ftext,
                    textAlign: TextAlign.start,
                  ),
                ),
                SizedBox(height: 24),
                CustomField(
                  text: "Blood Group",
                  child: TextFormField(
                      style: FontConstant.k18w5008471Text,
                      decoration:
                          FieldDecoration(hintText: "Enter kid’s blood group")
                              .baseInputDecoration()
                      /*  controller: controller,*/
                      ),
                ),
                SizedBox(height: 10),
                CustomField(
                  text: "Weight",
                  child: TextFormField(
                      style: FontConstant.k18w5008471Text,
                      decoration:
                          FieldDecoration(hintText: "Enter kid’s weight in kg")
                              .baseInputDecoration()
                      /*  controller: controller,*/
                      ),
                ),
                SizedBox(height: 16),
                CustomField(
                  text: "Height",
                  child: TextFormField(
                      style: FontConstant.k18w5008471Text,
                      decoration:
                          FieldDecoration(hintText: "Enter kid’s height in ft")
                              .baseInputDecoration()
                      /*  controller: controller,*/
                      ),
                ),
                SizedBox(height: 16),
                CustomField(
                  text: "Kid’s medical status",
                  child: TextFormField(
                      style: FontConstant.k18w5008471Text,
                      decoration: FieldDecoration(
                              hintText: "Select medical status",
                              imagePath: "assets/images/arrowdown.png")
                          .baseInputIconDecoration()

                      /*  controller: controller,*/
                      ),
                ),
                SizedBox(height: 16),
                // Container(
                //   height: 138.h,
                //   child: TextFormField(
                //     style: FontConstant.k18w5008471Text,
                //     decoration: InputDecoration(
                //       enabledBorder: OutlineInputBorder(
                //           borderRadius: BorderRadius.all(Radius.circular(30.0)),
                //           borderSide:
                //               BorderSide(color: Colors.white, width: 1.0)),
                //       disabledBorder: OutlineInputBorder(
                //         borderSide: BorderSide(color: Colors.white, width: 1.0),
                //       ),
                //       focusedBorder: OutlineInputBorder(
                //         borderRadius: BorderRadius.all(Radius.circular(30.0)),
                //         borderSide:
                //             BorderSide(color: Color(0xffBE74AA), width: 1.0),
                //       ),
                //       isDense: true,
                //       hintText: "Any extra to take care",
                //       filled: true,
                //       fillColor: Colors.white,
                //       hintStyle: FontConstant.k14w400lightText.copyWith(
                //           color: Color(0xffB7A4B2),
                //           fontSize: 16.0,
                //           fontWeight: FontWeight.w400),
                //     ),
                //     /*  controller: controller,*/
                //   ),
                // ),
                SizedBox(height: 400),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomField extends StatelessWidget {
  const CustomField({
    Key? key,
    required this.text,
    required this.child,
  }) : super(key: key);
  final String text;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: FontConstant.k16w500331FText,
        ),
        SizedBox(height: 4),
        Container(
          height: 56.h,
          child: child,
        ),
      ],
    );
  }
}
