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
                Primarytextfield(
                  text: "Blood group",
                  desc: "Enter kid’s blood group",
                  controller: bloodgroupController,
                ),
                // Column(
                //   crossAxisAlignment: CrossAxisAlignment.start,
                //   children: [
                //     Text(
                //       "Blood group",
                //       style: FontConstant.k16w500331FText,
                //     ),
                //     SizedBox(height: 5),
                //     textfield(context, "Enter kid’s blood group")
                //   ],
                // ),
                SizedBox(height: 4),
                Primarytextfield(
                  text: "Weight",
                  desc: "Enter kid’s weight in kg",
                  controller: bloodgroupController,
                ),

                SizedBox(height: 4),
                Primarytextfield(
                  text: "Height",
                  desc: "Enter kid’s height in ft",
                  controller: bloodgroupController,
                ),
                SizedBox(height: 4),
                // Column(
                //   crossAxisAlignment: CrossAxisAlignment.start,
                //   children: [
                //     Text(
                //       "Kid’s medical status",
                //       style: FontConstant.k16w500331FText,
                //     ),
                //     Container(
                //       padding: EdgeInsets.only(left: 20),
                //       height: 60.h,
                //       width: 1.sw,
                //       decoration: BoxDecoration(
                //           color: Color(0xffFFFFFF),
                //           borderRadius: BorderRadius.all(Radius.circular(30))),
                //       child: Center(
                //         child: DropdownButton<String>(
                //           alignment: Alignment.topRight,
                //           borderRadius: BorderRadius.circular(30),
                //           dropdownColor: Color(0xffffffff),
                //           hint: Text(
                //             "Select your gender".tr(),
                //           ),
                //           icon: Padding(
                //             padding: const EdgeInsets.only(right: 15.0),
                //             child: Image.asset(
                //               "assets/images/downarrow.png",
                //               height: 15,
                //               width: 15,
                //             ),
                //           ),
                //           elevation: 0,
                //           isExpanded: true,
                //           underline: SizedBox(),
                //           value: _selectedText,
                //           items: <String>['A', 'B', 'C'].map((String value) {
                //             return DropdownMenuItem<String>(
                //               value: value,
                //               child: Text(value),
                //             );
                //           }).toList(),
                //           onChanged: (String? val) {
                //             setState(() {
                //               _selectedText = val!;
                //             });
                //           },
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
                // Column(
                //   crossAxisAlignment: CrossAxisAlignment.start,
                //   children: [
                //     Text(
                //       "Any extra to take care",
                //       style: FontConstant.k16w500331FText,
                //     ),
                //     SizedBox(height: 5),
                //     // Container(
                //     //   height: 138.h,
                //     //   width: 382.w,
                //     //   child: TextFormField(
                //     //     style: FontConstant.k18w5008471Text,
                //     //     decoration: InputDecoration(
                //     //       contentPadding: EdgeInsets.all(14.0),
                //     //       enabledBorder: OutlineInputBorder(
                //     //           borderRadius:
                //     //               BorderRadius.all(Radius.circular(30.0)),
                //     //           borderSide:
                //     //               BorderSide(color: Colors.white, width: 1.0)),
                //     //       disabledBorder: OutlineInputBorder(
                //     //         borderSide:
                //     //             BorderSide(color: Colors.white, width: 1.0),
                //     //       ),
                //     //       focusedBorder: OutlineInputBorder(
                //     //         borderRadius:
                //     //             BorderRadius.all(Radius.circular(30.0)),
                //     //         borderSide: BorderSide(
                //     //             color: Color(0xffBE74AA), width: 1.0),
                //     //       ),
                //     //       isDense: true,
                //     //       hintText: "Write here....",
                //     //       filled: true,
                //     //       fillColor: Colors.white,
                //     //       hintStyle: FontConstant.k14w400lightText.copyWith(
                //     //           color: Color(0xffB7A4B2),
                //     //           fontSize: 16.0,
                //     //           fontWeight: FontWeight.w400),
                //     //     ),
                //     //     /*  controller: controller,*/
                //     //   ),
                //     // ),
                //   ],
                // ),
                SizedBox(height: 4),
                Primarytextfield(
                  text: "Kid’s medical status",
                  desc: "Enter occupation",
                  controller: bloodgroupController,
                ),
                SizedBox(height: 4),
                SizedBox(height: 4),
                // Column(
                //   crossAxisAlignment: CrossAxisAlignment.start,
                //   children: [
                //     Text(
                //       "Kid’s medical status",
                //       style: FontConstant.k16w500331FText,
                //     ),
                //     Container(
                //       padding: EdgeInsets.only(left: 20),
                //       height: 60.h,
                //       width: 1.sw,
                //       decoration: BoxDecoration(
                //           color: Color(0xffFFFFFF),
                //           borderRadius: BorderRadius.all(Radius.circular(30))),
                //       child: Center(
                //         child: DropdownButton<String>(
                //           alignment: Alignment.topRight,
                //           borderRadius: BorderRadius.circular(30),
                //           dropdownColor: Color(0xffffffff),
                //           hint: Text(
                //             "Select your gender".tr(),
                //           ),
                //           icon: Padding(
                //             padding: const EdgeInsets.only(right: 15.0),
                //             child: Image.asset(
                //               "assets/images/downarrow.png",
                //               height: 15,
                //               width: 15,
                //             ),
                //           ),
                //           elevation: 0,
                //           isExpanded: true,
                //           underline: SizedBox(),
                //           value: _selectedText,
                //           items: <String>['A', 'B', 'C'].map((String value) {
                //             return DropdownMenuItem<String>(
                //               value: value,
                //               child: Text(value),
                //             );
                //           }).toList(),
                //           onChanged: (String? val) {
                //             setState(() {
                //               _selectedText = val!;
                //             });
                //           },
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
                // Column(
                //   crossAxisAlignment: CrossAxisAlignment.start,
                //   children: [
                //     Text(
                //       "Any extra to take care",
                //       style: FontConstant.k16w500331FText,
                //     ),
                //     SizedBox(height: 5),
                //     // Container(
                //     //   height: 138.h,
                //     //   width: 382.w,
                //     //   child: TextFormField(
                //     //     style: FontConstant.k18w5008471Text,
                //     //     decoration: InputDecoration(
                //     //       contentPadding: EdgeInsets.all(14.0),
                //     //       enabledBorder: OutlineInputBorder(
                //     //           borderRadius:
                //     //               BorderRadius.all(Radius.circular(30.0)),
                //     //           borderSide:
                //     //               BorderSide(color: Colors.white, width: 1.0)),
                //     //       disabledBorder: OutlineInputBorder(
                //     //         borderSide:
                //     //             BorderSide(color: Colors.white, width: 1.0),
                //     //       ),
                //     //       focusedBorder: OutlineInputBorder(
                //     //         borderRadius:
                //     //             BorderRadius.all(Radius.circular(30.0)),
                //     //         borderSide: BorderSide(
                //     //             color: Color(0xffBE74AA), width: 1.0),
                //     //       ),
                //     //       isDense: true,
                //     //       hintText: "Write here....",
                //     //       filled: true,
                //     //       fillColor: Colors.white,
                //     //       hintStyle: FontConstant.k14w400lightText.copyWith(
                //     //           color: Color(0xffB7A4B2),
                //     //           fontSize: 16.0,
                //     //           fontWeight: FontWeight.w400),
                //     //     ),
                //     //     /*  controller: controller,*/
                //     //   ),
                //     // ),
                //   ],
                // ),
                SizedBox(height: 4),
                Primarytextfield(
                  text: "Father’s phone number",
                  desc: "Enter father’s phone number",
                  controller: bloodgroupController,
                ),
                SizedBox(height: 4),
                Primarytextfield(
                  text: "Father’s email",
                  desc: "Enter father’s email",
                  controller: bloodgroupController,
                ),
                SizedBox(height: 4),
                SizedBox(height: 4),
                Primarytextfield(
                  text: "Address",
                  desc: "Enter full address",
                  controller: bloodgroupController,
                ),

                SizedBox(height: 4),

                Texticonfield(
                    Icon: "assets/images/uploadicon.png",
                    title: "Profile Photo",
                    hinttext: "Upload primary photo"),

                // Column(
                //   crossAxisAlignment: CrossAxisAlignment.start,
                //   children: [
                //     Text(
                //       "You are",
                //       style: FontConstant.k16w500331FText,
                //     ),
                //     SizedBox(height: 5),
                //     ListTile(
                //       title: Text(
                //         'father',
                //         style: FontConstant.k16w4008471Text,
                //       ),
                //       leading: Radio<SingingCharacter>(
                //         activeColor: ThemeColor.primarycolor,
                //         value: SingingCharacter.father,
                //         groupValue: _character,
                //         onChanged: (SingingCharacter? value) {
                //           setState(() {
                //             _character = value;
                //           });
                //         },
                //       ),
                //     ),
                //     ListTile(
                //       title: Text(
                //         'mother',
                //         style: FontConstant.k16w4008471Text,
                //       ),
                //       leading: Radio<SingingCharacter>(
                //         activeColor: ThemeColor.primarycolor,
                //         value: SingingCharacter.mother,
                //         groupValue: _character,
                //         onChanged: (SingingCharacter? value) {
                //           setState(() {
                //             _character = value;
                //           });
                //         },
                //       ),
                //     ),
                //   ],
                // ),
                // Column(
                //   crossAxisAlignment: CrossAxisAlignment.start,
                //   children: [
                //     Text(
                //       "Profile Photo",
                //       style: FontConstant.k16w500331FText,
                //     ),
                //     SizedBox(height: 4),
                //     IconTextfield(
                //         Icon: "assets/images/uploadicon.png",
                //         title: "Upload primary photo")
                //   ],
                // ),
                SizedBox(height: 35),
                SizedBox(
                    height: 52.h,
                    width: 384.w,
                    child: MainButton(
                        onTap: () {},
                        title: "Continue",
                        textStyleColor: Colors.white,
                        backgroundColor: ThemeColor.primarycolor)),
                SizedBox(
                  height: 300,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
