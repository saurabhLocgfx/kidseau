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
  final bool takeKidInfo;
  const ParentInfo({
    Key? key,
    required this.onContinue,
    required this.takeKidInfo,
  }) : super(key: key);

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
  FocusNode addressNode = FocusNode();
  FocusNode fEmail = FocusNode();
  FocusNode oNode = FocusNode();
  final _formKey = GlobalKey<FormState>();
  final _picker = ImagePicker();
  XFile? _image;
  File _pickedImage = File('');
  String thumbnail = '';

  @override
  void initState() {
    addressNode.addListener(() {
      setState(() {});
    });
    fEmail.addListener(() {
      setState(() {});
    });
    oNode.addListener(() {
      setState(() {});
    });
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

    super.initState();
  }

  String enteredVal = '';
  bool _isMother = false;
  bool _isFather = false;

  bool _btnLoading = false;

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
                  SizedBox(height: 40),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      "Parent’s Information".tr(),
                      style: FontConstant2.k24w500331Ftext,
                      textAlign: TextAlign.start,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    "Mother’s name".tr(),
                    style: FontConstant.k16w500331FText,
                  ),
                  SizedBox(height: 5),
                  Container(
                    //height: 64.h,
                    width: 1.sw,
                    child: TextFormField(
                      validator: (motherName) {
                        if (motherName == null || motherName.isEmpty) {
                          return 'Enter mother name'.tr();
                        }
                      },
                      style: FontConstant.k18w5008471Text,
                      decoration: CustomInputDecoration(
                              hintText: "Enter mother's name".tr())
                          .decoration(),
                      controller: motherNameController,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "Mother’s Occupation".tr(),
                    style: FontConstant.k16w500331FText,
                  ),
                  SizedBox(height: 5),
                  Container(
                    // height: 56.h,
                    width: 1.sw,
                    child: TextFormField(
                        validator: (occupation) {
                          if (occupation == null || occupation.isEmpty) {
                            return 'Enter Mother Occupation'.tr();
                          }
                          return null;
                        },
                        style: FontConstant.k18w5008471Text,
                        decoration: CustomInputDecoration(
                                hintText: "Enter mother's occupation".tr())
                            .decoration(),
                        controller: motherOccupation),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "Mother’s Phone number".tr(),
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
                            return 'Enter Mother Phone number'.tr();
                          }
                          return null;
                        },
                        style: FontConstant.k18w5008471Text,
                        decoration: CustomInputDecoration(
                                hintText: "Enter mother's phone number".tr())
                            .decoration(),
                        controller: motherContactController),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "Mother’s email".tr(),
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
                            return 'Enter mother email'.tr();
                          } else if (!motherEmail.contains('@') ||
                              !motherEmail.contains('.')) {
                            return 'Enter a valid email'.tr();
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
                    "Father’s name".tr(),
                    style: FontConstant.k16w500331FText,
                  ),
                  SizedBox(height: 5),
                  Container(
                    // height: 56.h,
                    width: 1.sw,
                    child: TextFormField(
                      validator: (fatherName) {
                        if (fatherName == null || fatherName.isEmpty) {
                          return 'Enter father name'.tr();
                        }
                        return null;
                      },
                      style: FontConstant.k18w5008471Text,
                      decoration: CustomInputDecoration(
                              hintText: "Enter father's name".tr())
                          .decoration(),
                      controller: fatherNameController,
                      /*  controller: controller,*/
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "Father’s Occupation".tr(),
                    style: FontConstant.k16w500331FText,
                  ),
                  SizedBox(height: 5),
                  Container(
                    // height: 56.h,
                    width: 1.sw,
                    child: TextFormField(
                        focusNode: oNode,
                        validator: (fatherOccupation) {
                          if (fatherOccupation == null ||
                              fatherOccupation.isEmpty) {
                            return 'Enter father occupation'.tr();
                          }
                          return null;
                        },
                        style: FontConstant.k18w5008471Text,
                        decoration: CustomInputDecoration(
                                hintText: "Enter father's occupation".tr())
                            .decoration(),
                        controller: fatherOccupationController),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "Father’s phone number".tr(),
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
                          return 'Enter father phone number'.tr();
                        }
                        return null;
                      },
                      style: FontConstant.k18w5008471Text,
                      decoration: CustomInputDecoration(
                              hintText: "Enter father's phone number".tr())
                          .decoration(),
                      controller: fatherPhoneController,

                      /*  controller: controller,*/
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "Father’s email".tr(),
                    style: FontConstant.k16w500331FText,
                  ),
                  SizedBox(height: 5),
                  Container(
                    // height: 56.h,
                    width: 1.sw,
                    child: TextFormField(
                      focusNode: fEmail,
                      keyboardType: TextInputType.emailAddress,
                      enabled:
                          !_isMother && enteredVal.contains('@') ? false : true,
                      validator: (fatherEmail) {
                        if (fatherEmail == null || fatherEmail.isEmpty) {
                          return 'Enter father email'.tr();
                        } else if (!fatherEmail.contains('@') ||
                            !fatherEmail.contains('.')) {
                          return 'Enter a valid email'.tr();
                        }
                        return null;
                      },
                      style: FontConstant.k18w5008471Text,
                      decoration: CustomInputDecoration(
                              hintText: "Enter father's email".tr())
                          .decoration(),
                      controller: fatherEmailController,
                      /*  controller: controller,*/
                    ),
                  ),
                  Text(
                    "Address".tr(),
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
                    "Profile Photo".tr(),
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
                                    ? "Upload primary photo".tr()
                                    : "1 image selected".tr(),
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
                  SizedBox(
                      height: 56,
                      width: 1.sw,
                      child: _btnLoading
                          ? Center(
                              child: CircularProgressIndicator(),
                            )
                          : MainButton(
                              onTap: () {
                                // if (_formKey.currentState!.validate()) {
                                /*if (_pickedImage.path == '') {
                                  CustomSnackBar.customErrorSnackBar(
                                      context, "Select an image first");
                                  return;
                                }*/
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
                                //}
                              },
                              title: "Continue".tr(),
                              textStyleColor: Colors.white,
                              backgroundColor: ThemeColor.primarycolor)),
                  AnimatedContainer(
                    duration: Duration(milliseconds: 500),
                    curve: Curves.fastOutSlowIn,
                    height: addressNode.hasFocus ||
                            fEmail.hasFocus ||
                            oNode.hasFocus
                        ? 700
                        : 320,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
