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
    if (_isMother && enteredVal.contains('@')) {
      motherEmailController.text = enteredVal;
    } else if (_isMother && !enteredVal.contains('@')) {
      motherContactController.text = enteredVal;
    } else if (!_isMother && enteredVal.contains('@')) {
      fatherEmailController.text = enteredVal;
    } else if (!_isMother && !enteredVal.contains('@')) {
      fatherPhoneController.text = enteredVal;
    } else {}

    addressNode.addListener(() {
      setState(() {});
    });
    fatherNode.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  String enteredVal = '';
  bool _isMother = false;
  bool _isFather = false;

  bool _btnLoading = false;

  final FocusNode addressNode = FocusNode();
  final FocusNode fatherNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Container(
          color: ThemeColor.primarycolor.withOpacity(.06),
          width: 1.sw,
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                      decoration:
                          CustomInputDecoration(hintText: "Enter mother's name")
                              .decoration(),
                      controller: motherNameController,
                    ),
                  ),
                  SizedBox(height: 4),
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
                  ),
                  SizedBox(height: 4),
                  Text(
                    "Mother’s Phone number",
                    style: FontConstant.k16w500331FText,
                  ),
                  SizedBox(height: 5),
                  Container(
                    // height: 56.h,
                    width: 1.sw,
                    child: TextFormField(
                        keyboardType: TextInputType.number,
                        enabled: _isMother && !enteredVal.contains('@')
                            ? false
                            : true,
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
                  SizedBox(height: 4),
                  Text(
                    "Mother’s email",
                    style: FontConstant.k16w500331FText,
                  ),
                  SizedBox(height: 5),
                  Container(
                    // height: 56.h,
                    width: 1.sw,
                    child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        enabled: _isMother && enteredVal.contains('@')
                            ? false
                            : true,
                        validator: (motherEmail) {
                          if (motherEmail == null || motherEmail.isEmpty) {
                            return 'Enter mother email';
                          }
                          return null;
                        },
                        style: FontConstant.k18w5008471Text,
                        // keyboardType: TextInputType.emailAddress,
                        decoration: CustomInputDecoration(
                                hintText: "Enter mother's email")
                            .decoration(),
                        controller: motherEmailController),
                  ),
                  SizedBox(height: 4),
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
                      decoration:
                          CustomInputDecoration(hintText: "Enter father's name")
                              .decoration(),
                      controller: fatherNameController,
                      /*  controller: controller,*/
                    ),
                  ),
                  SizedBox(height: 4),
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
                  ),
                  SizedBox(height: 4),
                  Text(
                    "Father’s phone number",
                    style: FontConstant.k16w500331FText,
                  ),
                  SizedBox(height: 5),
                  Container(
                    // height: 56.h,
                    width: 1.sw,
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      enabled: !_isMother && !enteredVal.contains('@')
                          ? false
                          : true,
                      validator: (fatherPhoneNumber) {
                        if (fatherPhoneNumber == null ||
                            fatherPhoneNumber.isEmpty) {
                          return 'Enter father phone number';
                        }
                        return null;
                      },
                      style: FontConstant.k18w5008471Text,
                      decoration: CustomInputDecoration(
                              hintText: "Enter father's phone number")
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
                      focusNode: fatherNode,
                      keyboardType: TextInputType.emailAddress,
                      enabled:
                          !_isMother && enteredVal.contains('@') ? false : true,
                      validator: (fatherEmail) {
                        if (fatherEmail == null || fatherEmail.isEmpty) {
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
                  Text(
                    "Address",
                    style: FontConstant.k16w500331FText,
                  ),
                  SizedBox(height: 4),
                  Container(
                    // height: 56.h,
                    width: 1.sw,
                    child: TextFormField(
                      focusNode: addressNode,
                      validator: (address) {
                        if (address == null || address.isEmpty) {
                          return "This field cannot be empty".tr();
                        }
                        return null;
                      },
                      style: FontConstant.k18w5008471Text,
                      decoration: CustomInputDecoration(
                              hintText: "Enter your address".tr())
                          .decoration(),
                      controller: addressController,
                      /*  controller: controller,*/
                    ),
                  ),
                  SizedBox(height: 4),
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
                          borderRadius: BorderRadius.all(Radius.circular(30.0)),
                          color: Color(0xffFFFFFF),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Text(
                                _pickedImage.path == ""
                                    ? "Upload primary photo"
                                    : "1 image selected",
                                overflow: TextOverflow.ellipsis,
                                style: FontConstant.k14w400lightText.copyWith(
                                    color: Color(0xffB7A4B2),
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: ImageIcon(
                                AssetImage("assets/images/uploadicon.png"),
                                size: 21,
                              ),
                            ),
                          ],
                        )),
                  ),
                  SizedBox(height: 35),
                  Container(
                      height: 52.h,
                      width: 1.sw,
                      child: _btnLoading
                          ? Center(
                              child: CircularProgressIndicator(),
                            )
                          : MainButton(
                              onTap: () {
                                if (_formKey.currentState!.validate()) {
                                  log('message');
                                  setState(() {
                                    _btnLoading = true;
                                  });
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
                                      setState(() {
                                        _btnLoading = false;
                                      });
                                    } else {
                                      //navigate to
                                      //UserPrefs.setCookies(value['key']);
                                      setState(() {
                                        _btnLoading = false;
                                      });
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
                  AnimatedContainer(
                      height: fatherNode.hasFocus ? 400 : 0,
                      duration: Duration(milliseconds: 100)),
                  AnimatedContainer(
                      height: addressNode.hasFocus ? 400 : 0,
                      duration: Duration(milliseconds: 100)),
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
