import 'dart:developer';
import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kidseau/Theme.dart';
import 'package:kidseau/Widgets/buttons.dart';
import 'package:kidseau/Widgets/textfields.dart';
import 'package:kidseau/shard_prefs/shared_prefs.dart';

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
  void initState() {
    log(UserPrefs.getIsMother().toString());
    log(UserPrefs.getIsFather().toString());
    enteredVal = UserPrefs.getEnteredVal() ?? "";
    _isMother = UserPrefs.getIsMother() ?? false;
    _isFather = UserPrefs.getIsFather() ?? false;
    super.initState();
  }

  String enteredVal = '';
  bool _isMother = false;
  bool _isFather = false;

  Widget _motherWidget() {
    if (_isMother) {
      if (UserPrefs.getEnteredVal().toString().contains('@')) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Mother’s Phone number",
              style: FontConstant.k16w500331FText,
            ),
            SizedBox(height: 5),
            Container(
              // height: 56.h,
              width: 1.sw,
              child: TextFormField(
                  validator: (phoneNumberMother) {
                    if (phoneNumberMother == null ||
                        phoneNumberMother.isEmpty) {
                      return 'Enter Mother Phone number';
                    }
                    return null;
                  },
                  style: FontConstant.k18w5008471Text,
                  decoration: CustomInputDecoration(
                          hintText: "Enter mother's phone number")
                      .decoration(),
                  controller: motherContactController),
            ),
            /*SizedBox(height: 5),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Mother’s email",
                  style: FontConstant.k16w500331FText,
                ),
                SizedBox(height: 5),
                Container(
                  // height: 56.h,
                  width: 1.sw,
                  child: TextFormField(
                      validator: (motherEmail) {
                        if (motherEmail == null ||
                            motherEmail.isEmpty) {
                          return 'Enter mother email';
                        }
                        return null;
                      },
                      style: FontConstant.k18w5008471Text,
                      keyboardType: TextInputType.emailAddress,
                      decoration: CustomInputDecoration(
                          hintText: "Enter mother's email")
                          .decoration(),
                      controller: motherEmailController),
                )
              ],
            )*/
          ],
        );
      } else {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Mother’s Phone number",
              style: FontConstant.k16w500331FText,
            ),
            SizedBox(height: 5),
            Container(
              // height: 56.h,
              width: 1.sw,
              child: TextFormField(
                  validator: (phoneNumberMother) {
                    if (phoneNumberMother == null ||
                        phoneNumberMother.isEmpty) {
                      return 'Enter Mother Phone number';
                    }
                    return null;
                  },
                  style: FontConstant.k18w5008471Text,
                  decoration: CustomInputDecoration(
                          hintText: "Enter mother's phone number")
                      .decoration(),
                  controller: motherContactController),
            ),
            SizedBox(height: 5),
            Text(
              "Mother’s email",
              style: FontConstant.k16w500331FText,
            ),
            SizedBox(height: 5),
            Container(
              // height: 56.h,
              width: 1.sw,
              child: TextFormField(
                  validator: (motherEmail) {
                    if (motherEmail == null || motherEmail.isEmpty) {
                      return 'Enter mother email';
                    }
                    return null;
                  },
                  style: FontConstant.k18w5008471Text,
                  keyboardType: TextInputType.emailAddress,
                  decoration:
                      CustomInputDecoration(hintText: "Enter mother's email")
                          .decoration(),
                  controller: motherEmailController),
            )
          ],
        );
      }
    } else {
      return SizedBox.shrink();
    }
  }

  Widget _fatherWidget() {
    if (_isFather) {
      if (UserPrefs.getEnteredVal().toString().contains('@')) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Father’s phone number",
              style: FontConstant.k16w500331FText,
            ),
            SizedBox(height: 5),
            Container(
              // height: 56.h,
              width: 1.sw,
              child: TextFormField(
                validator: (fatherPhoneNumber) {
                  if (fatherPhoneNumber == null || fatherPhoneNumber.isEmpty) {
                    return 'Enter father phone number';
                  }
                  return null;
                },
                style: FontConstant.k18w5008471Text,
                decoration: CustomInputDecoration(
                        hintText: "Enter mother's phone number")
                    .decoration(),
                controller: fatherPhoneController,

                /*  controller: controller,*/
              ),
            )
          ],
        );
      } else {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Father’s phone number",
              style: FontConstant.k16w500331FText,
            ),
            SizedBox(height: 5),
            Container(
              // height: 56.h,
              width: 1.sw,
              child: TextFormField(
                validator: (fatherPhoneNumber) {
                  if (fatherPhoneNumber == null || fatherPhoneNumber.isEmpty) {
                    return 'Enter father phone number';
                  }
                  return null;
                },
                style: FontConstant.k18w5008471Text,
                decoration: CustomInputDecoration(
                        hintText: "Enter mother's phone number")
                    .decoration(),
                controller: fatherPhoneController,

                /*  controller: controller,*/
              ),
            ),
            SizedBox(height: 5),
            Text(
              "Father’s email",
              style: FontConstant.k16w500331FText,
            ),
            SizedBox(height: 5),
            Container(
              // height: 56.h,
              width: 1.sw,
              child: TextFormField(
                validator: (fatherEmail) {
                  if (fatherEmail == null || fatherEmail.isEmpty) {
                    return 'Enter father email';
                  }
                  return null;
                },
                style: FontConstant.k18w5008471Text,
                decoration:
                    CustomInputDecoration(hintText: "Enter father's email")
                        .decoration(),
                controller: fatherEmailController,
                /*  controller: controller,*/
              ),
            ),
          ],
        );
      }
    } else {
      return SizedBox.shrink();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: SingleChildScrollView(
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
                          //height: 64.h,
                          width: 1.sw,
                          child: TextFormField(
                            validator: (motherName) {
                              if (motherName == null || motherName.isEmpty) {
                                return 'Enter mother name';
                              }
                            },
                            style: FontConstant.k18w5008471Text,
                            decoration: CustomInputDecoration(
                                    hintText: "Enter mother's name")
                                .decoration(),
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
                          // height: 56.h,
                          width: 1.sw,
                          child: TextFormField(
                              validator: (occupation) {
                                if (occupation == null || occupation.isEmpty) {
                                  return 'Enter Mother Occupation';
                                }
                                return null;
                              },
                              style: FontConstant.k18w5008471Text,
                              decoration: CustomInputDecoration(
                                      hintText: "Enter mother's occupation")
                                  .decoration(),
                              controller: motherOccupation),
                        )
                      ],
                    ),
                    SizedBox(height: 4),
                    if (_isMother)
                      if (enteredVal.contains('@'))
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Mother’s Phone number",
                              style: FontConstant.k16w500331FText,
                            ),
                            SizedBox(height: 5),
                            Container(
                              // height: 56.h,
                              width: 1.sw,
                              child: TextFormField(
                                  validator: (phoneNumberMother) {
                                    if (phoneNumberMother == null ||
                                        phoneNumberMother.isEmpty) {
                                      return 'Enter Mother Phone number';
                                    }
                                    return null;
                                  },
                                  style: FontConstant.k18w5008471Text,
                                  decoration: CustomInputDecoration(
                                          hintText:
                                              "Enter mother's phone number")
                                      .decoration(),
                                  controller: motherContactController),
                            )
                          ],
                        ),
                    SizedBox(height: 4),
                    if (_isMother)
                      if (!enteredVal.contains('@'))
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Mother’s email",
                              style: FontConstant.k16w500331FText,
                            ),
                            SizedBox(height: 5),
                            Container(
                              // height: 56.h,
                              width: 1.sw,
                              child: TextFormField(
                                  validator: (motherEmail) {
                                    if (motherEmail == null ||
                                        motherEmail.isEmpty) {
                                      return 'Enter mother email';
                                    }
                                    return null;
                                  },
                                  style: FontConstant.k18w5008471Text,
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: CustomInputDecoration(
                                          hintText: "Enter mother's email")
                                      .decoration(),
                                  controller: motherEmailController),
                            )
                          ],
                        ),
                    // _motherWidget(),
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
                          // height: 56.h,
                          width: 1.sw,
                          child: TextFormField(
                            validator: (fatherName) {
                              if (fatherName == null || fatherName.isEmpty) {
                                return 'Enter father name';
                              }
                              return null;
                            },
                            style: FontConstant.k18w5008471Text,
                            decoration: CustomInputDecoration(
                                    hintText: "Enter father's name")
                                .decoration(),
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
                          // height: 56.h,
                          width: 1.sw,
                          child: TextFormField(
                              validator: (fatherOccupation) {
                                if (fatherOccupation == null ||
                                    fatherOccupation.isEmpty) {
                                  return 'Enter father occupation';
                                }
                                return null;
                              },
                              style: FontConstant.k18w5008471Text,
                              decoration: CustomInputDecoration(
                                      hintText: "Enter father's occupation")
                                  .decoration(),
                              controller: fatherOccupationController),
                        )
                      ],
                    ),
                    SizedBox(height: 4),
                    if (!_isMother)
                      if (enteredVal.contains('@'))
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Father’s phone number",
                              style: FontConstant.k16w500331FText,
                            ),
                            SizedBox(height: 5),
                            Container(
                              // height: 56.h,
                              width: 1.sw,
                              child: TextFormField(
                                validator: (fatherPhoneNumber) {
                                  if (fatherPhoneNumber == null ||
                                      fatherPhoneNumber.isEmpty) {
                                    return 'Enter father phone number';
                                  }
                                  return null;
                                },
                                style: FontConstant.k18w5008471Text,
                                decoration: CustomInputDecoration(
                                        hintText: "Enter mother's phone number")
                                    .decoration(),
                                controller: fatherPhoneController,

                                /*  controller: controller,*/
                              ),
                            ),
                          ],
                        ),
                    if (!_isMother)
                      if (!enteredVal.contains('@'))
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 5),
                            Text(
                              "Father’s email",
                              style: FontConstant.k16w500331FText,
                            ),
                            SizedBox(height: 5),
                            Container(
                              // height: 56.h,
                              width: 1.sw,
                              child: TextFormField(
                                validator: (fatherEmail) {
                                  if (fatherEmail == null ||
                                      fatherEmail.isEmpty) {
                                    return 'Enter father email';
                                  }
                                  return null;
                                },
                                style: FontConstant.k18w5008471Text,
                                decoration: CustomInputDecoration(
                                        hintText: "Enter father's email")
                                    .decoration(),
                                controller: fatherEmailController,
                                /*  controller: controller,*/
                              ),
                            ),
                          ],
                        ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Address",
                          style: FontConstant.k16w500331FText,
                        ),
                        SizedBox(height: 4),
                        Container(
                          // height: 56.h,
                          width: 1.sw,
                          child: TextFormField(
                            validator: (address) {
                              if (address == null || address.isEmpty) {
                                return "Enter Address";
                              }
                              return null;
                            },
                            style: FontConstant.k18w5008471Text,
                            decoration: CustomInputDecoration(
                                    hintText: "Enter your address")
                                .decoration(),
                            controller: addressController,
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
                            //print(_pickedImage.path);
                            //if (_pickedImage.isAbsolute) {
                            setState(() {
                              _pickedImage = File(image!.path);
                            });
                            // }
                            // print(_pickedImage.path);
                          },
                          child: Container(
                              height: 64.h,
                              width: 1.sw,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30.0)),
                                color: Color(0xffFFFFFF),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: Text(
                                      _pickedImage.path == ""
                                          ? "Upload primary photo"
                                          : "1 image selected",
                                      overflow: TextOverflow.ellipsis,
                                      style: FontConstant.k14w400lightText
                                          .copyWith(
                                              color: Color(0xffB7A4B2),
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: ImageIcon(
                                      AssetImage(
                                          "assets/images/uploadicon.png"),
                                      size: 21,
                                    ),
                                  ),
                                ],
                              )),
                        )
                      ],
                    ),
                    SizedBox(height: 35),
                    Container(
                        height: 52.h,
                        width: 1.sw,
                        child: MainButton(
                            onTap: () {
                              if (_formKey.currentState!.validate()) {
                                log('message');
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
                                  pickedImage: _pickedImage,
                                );
                                resp.then((value) {
                                  log(value.toString());
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
      ),
    );
  }
}
