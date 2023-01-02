import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kidseau/Theme.dart';
import 'package:kidseau/Widgets/buttons.dart';

import 'api/parent_signup_apis/parent_signup_info_api.dart';

class ParentInfo extends StatefulWidget {
  final Function onContinue;
  const ParentInfo({Key? key, required this.onContinue}) : super(key: key);

  @override
  State<ParentInfo> createState() => _ParentInfoState();
}

enum SingingCharacter { father, mother }

class _ParentInfoState extends State<ParentInfo> {
  SingingCharacter? _character = SingingCharacter.father;
  // String parent = '';

  TextEditingController motherNameController = TextEditingController();
  TextEditingController motherOccupation = TextEditingController();
  TextEditingController motherContactController = TextEditingController();
  TextEditingController motherEmailController = TextEditingController();
  TextEditingController fatherNameController = TextEditingController();
  TextEditingController fatherOccupationController = TextEditingController();
  TextEditingController fatherPhoneController = TextEditingController();
  TextEditingController fatherEmailController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _picker = ImagePicker();
  XFile? _image;
  File _pickedImage = File('');
  String thumbnail = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: ThemeColor.primarycolor.withOpacity(.06),
          width: 1.sw,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      "Parent’s Information",
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
                      Container(
                        height: 56.h,
                        width: 382.w,
                        child: TextFormField(
                          validator: (motherName) {
                            if (motherName == null || motherName.isEmpty) {
                              return 'Enter mother name';
                            }
                          },
                          style: FontConstant.k18w5008471Text,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(14.0),
                            enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30.0)),
                                borderSide: BorderSide(
                                    color: Colors.white, width: 1.0)),
                            disabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.white, width: 1.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30.0)),
                              borderSide: BorderSide(
                                  color: Color(0xffBE74AA), width: 1.0),
                            ),
                            isDense: true,
                            hintText: "Enter kid’s mother name",
                            filled: true,
                            fillColor: Colors.white,
                            hintStyle: FontConstant.k14w400lightText.copyWith(
                                color: Color(0xffB7A4B2),
                                fontSize: 16.0,
                                fontWeight: FontWeight.w400),
                          ),
                          controller: motherNameController,
                        ),
                      )
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
                      Container(
                        height: 56.h,
                        width: 382.w,
                        child: TextFormField(
                            validator: (occupation) {
                              if (occupation == null || occupation.isEmpty) {
                                return 'Enter Mother Occupation';
                              }
                              return null;
                            },
                            style: FontConstant.k18w5008471Text,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(14.0),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30.0)),
                                  borderSide: BorderSide(
                                      color: Colors.white, width: 1.0)),
                              disabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.white, width: 1.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30.0)),
                                borderSide: BorderSide(
                                    color: Color(0xffBE74AA), width: 1.0),
                              ),
                              isDense: true,
                              hintText: "Enter occupation",
                              filled: true,
                              fillColor: Colors.white,
                              hintStyle: FontConstant.k14w400lightText.copyWith(
                                  color: Color(0xffB7A4B2),
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w400),
                            ),
                            controller: motherOccupation),
                      )
                    ],
                  ),
                  SizedBox(height: 4),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Mother’s Phone number",
                        style: FontConstant.k16w500331FText,
                      ),
                      SizedBox(height: 5),
                      Container(
                        height: 56.h,
                        width: 382.w,
                        child: TextFormField(
                            validator: (phoneNumberMother) {
                              if (phoneNumberMother == null ||
                                  phoneNumberMother.isEmpty) {
                                return 'Enter Mother Phone number';
                              }
                              return null;
                            },
                            style: FontConstant.k18w5008471Text,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(14.0),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30.0)),
                                  borderSide: BorderSide(
                                      color: Colors.white, width: 1.0)),
                              disabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.white, width: 1.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30.0)),
                                borderSide: BorderSide(
                                    color: Color(0xffBE74AA), width: 1.0),
                              ),
                              isDense: true,
                              hintText: "Enter mother's phone number",
                              filled: true,
                              fillColor: Colors.white,
                              hintStyle: FontConstant.k14w400lightText.copyWith(
                                  color: Color(0xffB7A4B2),
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w400),
                            ),
                            controller: motherContactController),
                      )
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
                      Container(
                        height: 56.h,
                        width: 382.w,
                        child: TextFormField(
                            validator: (motherEmail) {
                              if (motherEmail == null || motherEmail.isEmpty) {
                                return 'Enter mother email';
                              }
                              return null;
                            },
                            style: FontConstant.k18w5008471Text,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(14.0),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30.0)),
                                  borderSide: BorderSide(
                                      color: Colors.white, width: 1.0)),
                              disabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.white, width: 1.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30.0)),
                                borderSide: BorderSide(
                                    color: Color(0xffBE74AA), width: 1.0),
                              ),
                              isDense: true,
                              hintText: "Enter mother’s email",
                              filled: true,
                              fillColor: Colors.white,
                              hintStyle: FontConstant.k14w400lightText.copyWith(
                                  color: Color(0xffB7A4B2),
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w400),
                            ),
                            controller: motherEmailController),
                      )
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
                      Container(
                        height: 56.h,
                        width: 382.w,
                        child: TextFormField(
                          validator: (fatherName) {
                            if (fatherName == null || fatherName.isEmpty) {
                              return 'Enter father name';
                            }
                            return null;
                          },
                          style: FontConstant.k18w5008471Text,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(14.0),
                            enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30.0)),
                                borderSide: BorderSide(
                                    color: Colors.white, width: 1.0)),
                            disabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.white, width: 1.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30.0)),
                              borderSide: BorderSide(
                                  color: Color(0xffBE74AA), width: 1.0),
                            ),
                            isDense: true,
                            hintText: "Enter kid’s father name",
                            filled: true,
                            fillColor: Colors.white,
                            hintStyle: FontConstant.k14w400lightText.copyWith(
                                color: Color(0xffB7A4B2),
                                fontSize: 16.0,
                                fontWeight: FontWeight.w400),
                          ),
                          controller: fatherNameController,
                          /*  controller: controller,*/
                        ),
                      )
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
                      Container(
                        height: 56.h,
                        width: 382.w,
                        child: TextFormField(
                            validator: (fatherOccupation) {
                              if (fatherOccupation == null ||
                                  fatherOccupation.isEmpty) {
                                return 'Enter father occupation';
                              }
                              return null;
                            },
                            style: FontConstant.k18w5008471Text,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(14.0),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30.0)),
                                  borderSide: BorderSide(
                                      color: Colors.white, width: 1.0)),
                              disabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.white, width: 1.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30.0)),
                                borderSide: BorderSide(
                                    color: Color(0xffBE74AA), width: 1.0),
                              ),
                              isDense: true,
                              hintText: "Enter occupation",
                              filled: true,
                              fillColor: Colors.white,
                              hintStyle: FontConstant.k14w400lightText.copyWith(
                                  color: Color(0xffB7A4B2),
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w400),
                            ),
                            controller: fatherOccupationController),
                      )
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
                      Container(
                        height: 56.h,
                        width: 382.w,
                        child: TextFormField(
                          validator: (fatherPhoneNumber) {
                            if (fatherPhoneNumber == null ||
                                fatherPhoneNumber.isEmpty) {
                              return 'Enter father phone number';
                            }
                            return null;
                          },
                          style: FontConstant.k18w5008471Text,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(14.0),
                            enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30.0)),
                                borderSide: BorderSide(
                                    color: Colors.white, width: 1.0)),
                            disabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.white, width: 1.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30.0)),
                              borderSide: BorderSide(
                                  color: Color(0xffBE74AA), width: 1.0),
                            ),
                            isDense: true,
                            hintText: "Enter father’s phone number",
                            filled: true,
                            fillColor: Colors.white,
                            hintStyle: FontConstant.k14w400lightText.copyWith(
                                color: Color(0xffB7A4B2),
                                fontSize: 16.0,
                                fontWeight: FontWeight.w400),
                          ),
                          controller: fatherPhoneController,

                          /*  controller: controller,*/
                        ),
                      )
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
                      Container(
                        height: 56.h,
                        width: 382.w,
                        child: TextFormField(
                          validator: (fatherEmail) {
                            if (fatherEmail == null || fatherEmail.isEmpty) {
                              return 'Enter father email';
                            }
                            return null;
                          },
                          style: FontConstant.k18w5008471Text,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(14.0),
                            enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30.0)),
                                borderSide: BorderSide(
                                    color: Colors.white, width: 1.0)),
                            disabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.white, width: 1.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30.0)),
                              borderSide: BorderSide(
                                  color: Color(0xffBE74AA), width: 1.0),
                            ),
                            isDense: true,
                            hintText: "Enter father’s email",
                            filled: true,
                            fillColor: Colors.white,
                            hintStyle: FontConstant.k14w400lightText.copyWith(
                                color: Color(0xffB7A4B2),
                                fontSize: 16.0,
                                fontWeight: FontWeight.w400),
                          ),
                          controller: fatherEmailController,
                          /*  controller: controller,*/
                        ),
                      ),
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
                      Container(
                        height: 56.h,
                        width: 382.w,
                        child: TextFormField(
                          validator: (address) {
                            if (address == null || address.isEmpty) {
                              return "Enter Address";
                            }
                            return null;
                          },
                          style: FontConstant.k18w5008471Text,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(14.0),
                            enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30.0)),
                                borderSide: BorderSide(
                                    color: Colors.white, width: 1.0)),
                            disabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.white, width: 1.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30.0)),
                              borderSide: BorderSide(
                                  color: Color(0xffBE74AA), width: 1.0),
                            ),
                            isDense: true,
                            hintText: "Enter full address",
                            filled: true,
                            fillColor: Colors.white,
                            hintStyle: FontConstant.k14w400lightText.copyWith(
                                color: Color(0xffB7A4B2),
                                fontSize: 16.0,
                                fontWeight: FontWeight.w400),
                          ),
                          controller: addressController,
                          /*  controller: controller,*/
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 4),
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
                  //             if (value == true) {
                  //               parent = 'Mother';
                  //             } else {
                  //               parent = 'Father';
                  //             }
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
                  //             if (value == true) {
                  //               parent = 'Mother';
                  //             } else {
                  //               parent = 'Father';
                  //             }
                  //           });
                  //         },
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Profile Photo",
                        style: FontConstant.k16w500331FText,
                      ),
                      SizedBox(height: 4),
                      InkWell(
                        onTap: () async {
                          XFile? image = await _picker.pickImage(
                            source: ImageSource.gallery,
                            //imageQuality: 75,
                          );
                          print('tyuio');
                          print('tyuio');
                          print(_pickedImage.path);
                          /*if (_pickedImage.isAbsolute) {*/
                          setState(() {
                            _pickedImage = File(image!.path);
                          });
                          /*}*/
                          print(_pickedImage.path);
                        },
                        child: Container(
                            height: 56.h,
                            width: 382.w,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30.0)),
                              color: Color(0xffFFFFFF),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: Text(
                                    "Upload primary photo",
                                    style: FontConstant.k14w400lightText
                                        .copyWith(
                                            color: Color(0xffB7A4B2),
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.w400),
                                  ),
                                ),
                                SizedBox(
                                  width: 120,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: ImageIcon(
                                    AssetImage("assets/images/uploadicon.png"),
                                    size: 21,
                                  ),
                                ),
                              ],
                            )

                            /*suffixIconColor: Color(0xffB7A4B2),
                            contentPadding: EdgeInsets.all(14.0),
                            enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30.0)),
                                borderSide:
                                    BorderSide(color: Colors.white, width: 1.0)),
                            disabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.white, width: 1.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(30.0)),
                              borderSide:
                                  BorderSide(color: Color(0xffBE74AA), width: 1.0),
                            ),
                            isDense: true,
                            hintText: "Upload primary photo",
                            filled: true,
                            fillColor: Colors.white,
                            hintStyle: FontConstant.k14w400lightText.copyWith(
                                color: Color(0xffB7A4B2),
                                fontSize: 16.0,
                                fontWeight: FontWeight.w400),
                          ),
                        )*/
                            ),
                      )
                    ],
                  ),
                  SizedBox(height: 35),
                  SizedBox(
                      height: 52.h,
                      width: 382.w,
                      child: MainButton(
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              final resp = ParentSignUpInfo().get(
                                motherName: motherNameController.text,
                                motherOccupation: motherOccupation.text,
                                motherContact: motherContactController.text,
                                motherEmail: motherEmailController.text,
                                fatherName: fatherNameController.text,
                                fatherOccupation:
                                    fatherOccupationController.text,
                                fatherContact: fatherPhoneController.text,
                                fatherEmail: fatherEmailController.text,
                                address: addressController.text,
                                // parents: parent,
                                pickedImage: _pickedImage.path,
                              );
                              resp.then((value) {
                                print(value);
                                if (value['status'] == 0) {
                                  Fluttertoast.showToast(msg: value['msg']);
                                } else {
                                  //navigate to
                                  //UserPrefs.setCookies(value['key']);
                                  widget.onContinue();
                                  /*Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => KidsDetails()));*/
                                }
                              });
                              /*Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => KidsDetails()));*/
                            }
                          },
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
      ),
    );
  }
}
