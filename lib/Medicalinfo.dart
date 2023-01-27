import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kidseau/Constants/decorations.dart';
import 'package:kidseau/ParentsPanel/PDashBoard.dart';
import 'package:kidseau/Theme.dart';
import 'package:kidseau/Widgets/textfields.dart';
import 'package:kidseau/api/parent_signup_apis/parent_medical_info.dart';

import 'Widgets/buttons.dart';

class MedicalInfo extends StatefulWidget {
  const MedicalInfo({Key? key}) : super(key: key);

  @override
  State<MedicalInfo> createState() => _MedicalInfoState();
}

enum SingingCharacter { father, mother }

class _MedicalInfoState extends State<MedicalInfo> {
  SingingCharacter? _character = SingingCharacter.father;

  String _selectedText = "A";

  bool _allVaccines = false;
  bool _fatherVaccines = false;
  bool _motherVaccines = false;
  bool _kidVaccines = false;

  bool _birth = false;
  bool _2months = false;
  bool _4months = false;
  bool _11months = false;
  bool _12months = false;
  bool _18months = false;
  bool _6years = false;
  TextEditingController bloodGroupController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController medicalStatusController = TextEditingController();
  TextEditingController extraDescController = TextEditingController();

  GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  bool _btnLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: ThemeColor.primarycolor.withOpacity(.06),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Form(
              key: _formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      "Medical Information".tr(),
                      style: FontConstant2.k24w500331Ftext,
                      textAlign: TextAlign.start,
                    ),
                  ),
                  SizedBox(height: 24),
                  Text(
                    "Blood group".tr(),
                    style: FontConstant.k16w500331FText,
                  ),
                  SizedBox(height: 4),
                  Container(
                    // height: 56.h,
                    width: 1.sw,
                    child: TextFormField(
                      validator: (address) {
                        if (address == null || address.isEmpty) {
                          return "This field cannot be empty".tr();
                        }
                        return null;
                      },
                      style: FontConstant.k18w5008471Text,
                      decoration: CustomInputDecoration(
                              hintText: "Enter kid’s blood group".tr())
                          .decoration(),
                      controller: bloodGroupController,
                      /*  controller: controller,*/
                    ),
                  ),
                  SizedBox(height: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Weight".tr(),
                        style: FontConstant.k16w500331FText,
                      ),
                      SizedBox(height: 4),
                      Container(
                        // height: 56.h,
                        width: 1.sw,
                        child: TextFormField(
                          validator: (address) {
                            if (address == null || address.isEmpty) {
                              return "This field cannot be empty".tr();
                            }
                            return null;
                          },
                          style: FontConstant.k18w5008471Text,
                          decoration: CustomInputDecoration(
                                  hintText: "Enter kid’s weight in kg".tr())
                              .decoration(),
                          controller: weightController,
                          /*  controller: controller,*/
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Height".tr(),
                        style: FontConstant.k16w500331FText,
                      ),
                      SizedBox(height: 4),
                      Container(
                        // height: 56.h,
                        width: 1.sw,
                        child: TextFormField(
                          validator: (address) {
                            if (address == null || address.isEmpty) {
                              return "This field cannot be empty".tr();
                            }
                            return null;
                          },
                          style: FontConstant.k18w5008471Text,
                          decoration: CustomInputDecoration(
                                  hintText: "Enter kid’s height in ft".tr())
                              .decoration(),
                          controller: heightController,
                          /*  controller: controller,*/
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Kid’s medical status".tr(),
                        style: FontConstant.k16w500331FText,
                      ),
                      SizedBox(height: 4),
                      Container(
                        // height: 56.h,
                        width: 1.sw,
                        child: TextFormField(
                          validator: (address) {
                            if (address == null || address.isEmpty) {
                              return "This field cannot be empty".tr();
                            }
                            return null;
                          },
                          style: FontConstant.k18w5008471Text,
                          decoration: CustomInputDecoration(
                                  hintText: "Select medical status".tr())
                              .decoration(),
                          controller: medicalStatusController,
                          /*  controller: controller,*/
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Any extra to take care".tr(),
                        style: FontConstant.k16w500331FText,
                      ),
                      SizedBox(height: 4),
                      Container(
                        // height: 56.h,
                        width: 1.sw,
                        child: TextFormField(
                          validator: (address) {
                            if (address == null || address.isEmpty) {
                              return "This field cannot be empty".tr();
                            }
                            return null;
                          },
                          style: FontConstant.k18w5008471Text,
                          maxLines: 5,
                          decoration: CustomInputDecoration(
                                  hintText: "Write here...".tr())
                              .decoration(),
                          controller: extraDescController,
                          /*  controller: controller,*/
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 16),
                  Text(
                    "Covid Vaccination".tr(),
                    style: FontConstant.k16w500331FText,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CheckboxListTile(
                    activeColor: Color(0xffBE74AA),
                    checkColor: Colors.white,
                    checkboxShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    title: Text(
                      'All'.tr(),
                      style: FontConstant.k16w500331FText,
                    ),
                    value: _allVaccines,
                    onChanged: (val) {
                      setState(() {
                        if (val == true) {
                          _allVaccines = true;
                          _fatherVaccines = true;
                          _motherVaccines = true;
                          _kidVaccines = true;
                        } else {
                          _allVaccines = false;
                          _fatherVaccines = false;
                          _motherVaccines = false;
                          _kidVaccines = false;
                        }
                      });
                    },
                    controlAffinity: ListTileControlAffinity.leading,
                  ),
                  CheckboxListTile(
                    activeColor: Color(0xffBE74AA),
                    checkColor: Colors.white,
                    checkboxShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    title: Text(
                      'Father'.tr(),
                      style: FontConstant.k16w500331FText,
                    ),
                    value: _fatherVaccines,
                    onChanged: (val) {
                      setState(() {
                        _fatherVaccines = !_fatherVaccines;
                      });
                    },
                    controlAffinity: ListTileControlAffinity.leading,
                  ),
                  CheckboxListTile(
                    activeColor: Color(0xffBE74AA),
                    checkColor: Colors.white,
                    checkboxShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    title: Text(
                      'Mother'.tr(),
                      style: FontConstant.k16w500331FText,
                    ),
                    value: _motherVaccines,
                    onChanged: (val) {
                      setState(() {
                        _motherVaccines = !_motherVaccines;
                      });
                    },
                    controlAffinity: ListTileControlAffinity.leading,
                  ),
                  CheckboxListTile(
                    activeColor: Color(0xffBE74AA),
                    checkColor: Colors.white,
                    checkboxShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    title: Text(
                      'Kid'.tr(),
                      style: FontConstant.k16w500331FText,
                    ),
                    value: _kidVaccines,
                    onChanged: (val) {
                      setState(() {
                        _kidVaccines = !_kidVaccines;
                      });
                    },
                    controlAffinity: ListTileControlAffinity.leading,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Other Vaccination".tr(),
                    style: FontConstant.k16w500331FText,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CheckboxListTile(
                    activeColor: Color(0xffBE74AA),
                    checkColor: Colors.white,
                    checkboxShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    title: Text(
                      'BCG/AVB'.tr(),
                      style: FontConstant.k16w500331FText,
                    ),
                    subtitle: Text(
                      'Birth'.tr(),
                      style: FontConstant.k16w500B7A4Text,
                    ),
                    value: _birth,
                    onChanged: (val) {
                      setState(() {
                        _birth = !_birth;
                      });
                    },
                    //controlAffinity: ListTileControlAffinity.leading,
                  ),
                  CheckboxListTile(
                    activeColor: Color(0xffBE74AA),
                    checkColor: Colors.white,
                    checkboxShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    title: Text(
                      'VPI-HVB'.tr(),
                      style: FontConstant.k16w500331FText,
                    ),
                    subtitle: Text(
                      '2 Months'.tr(),
                      style: FontConstant.k16w500B7A4Text,
                    ),
                    value: _2months,
                    onChanged: (val) {
                      setState(() {
                        _2months = !_2months;
                      });
                    },
                    // controlAffinity: ListTileControlAffinity.leading,
                  ),
                  CheckboxListTile(
                    activeColor: Color(0xffBE74AA),
                    checkColor: Colors.white,
                    checkboxShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    title: Text(
                      'VPI-AVB'.tr(),
                      style: FontConstant.k16w500331FText,
                    ),
                    subtitle: Text(
                      '4 Months'.tr(),
                      style: FontConstant.k16w500B7A4Text,
                    ),
                    value: _4months,
                    onChanged: (val) {
                      setState(() {
                        _4months = !_4months;
                      });
                    },
                    //controlAffinity: ListTileControlAffinity.leading,
                  ),
                  CheckboxListTile(
                    activeColor: Color(0xffBE74AA),
                    checkColor: Colors.white,
                    checkboxShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    title: Text(
                      'ROR'.tr(),
                      style: FontConstant.k16w500331FText,
                    ),
                    subtitle: Text(
                      '11 Months'.tr(),
                      style: FontConstant.k16w500B7A4Text,
                    ),
                    value: _11months,
                    onChanged: (val) {
                      setState(() {
                        _11months = !_11months;
                      });
                    },
                    // controlAffinity: ListTileControlAffinity.leading,
                  ),
                  CheckboxListTile(
                    activeColor: Color(0xffBE74AA),
                    checkColor: Colors.white,
                    checkboxShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    title: Text(
                      'VPI-HVB'.tr(),
                      style: FontConstant.k16w500331FText,
                    ),
                    subtitle: Text(
                      '12 Months'.tr(),
                      style: FontConstant.k16w500B7A4Text,
                    ),
                    value: _12months,
                    onChanged: (val) {
                      setState(() {
                        _12months = !_12months;
                      });
                    },
                    //  controlAffinity: ListTileControlAffinity.leading,
                  ),
                  CheckboxListTile(
                    activeColor: Color(0xffBE74AA),
                    checkColor: Colors.white,
                    checkboxShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    title: Text(
                      'ROR'.tr(),
                      style: FontConstant.k16w500331FText,
                    ),
                    subtitle: Text(
                      '18 Months'.tr(),
                      style: FontConstant.k16w500B7A4Text,
                    ),
                    value: _18months,
                    onChanged: (val) {
                      setState(() {
                        _18months = !_18months;
                      });
                    },
                    // controlAffinity: ListTileControlAffinity.leading,
                  ),
                  CheckboxListTile(
                    activeColor: Color(0xffBE74AA),
                    checkColor: Colors.white,
                    checkboxShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    title: Text(
                      'D-TCA'.tr(),
                      style: FontConstant.k16w500331FText,
                    ),
                    value: _6years,
                    subtitle: Text(
                      '6 years'.tr(),
                      style: FontConstant.k16w500B7A4Text,
                    ),
                    onChanged: (val) {
                      setState(() {
                        _6years = !_6years;
                      });
                    },
                    //controlAffinity: ListTileControlAffinity.leading,
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  SizedBox(
                      height: 52.h,
                      width: 1.sw,
                      child: _btnLoading
                          ? Center(
                              child: InkWell(
                                child: CircularProgressIndicator(),
                                onTap: () {
                                  setState(() {
                                    _btnLoading = false;
                                  });
                                },
                              ),
                            )
                          : MainButton(
                              onTap: () {
                                if (_formkey.currentState!.validate()) {
                                  setState(() {
                                    _btnLoading = true;
                                  });
                                  final resp = ParentMedicalInfo().get(
                                      bloodGrp: bloodGroupController.text,
                                      weight: weightController.text,
                                      height: heightController.text,
                                      medicalStatus:
                                          medicalStatusController.text,
                                      exCare: extraDescController.text,
                                      father: _fatherVaccines,
                                      mother: _motherVaccines,
                                      kid: _kidVaccines,
                                      birth: _birth,
                                      twoMonth: _2months,
                                      fourMonth: _4months,
                                      elevenMonth: _11months,
                                      twelveMonth: _12months,
                                      eighteenMonth: _18months,
                                      sixYears: _6years);
                                  resp.then((value) {
                                    log(value.toString());
                                    if (value['status'] == 1) {
                                      setState(() {
                                        _btnLoading = false;
                                      });
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (ctx) => PDashboard()));
                                    } else {
                                      setState(() {
                                        _btnLoading = false;
                                      });
                                      Fluttertoast.showToast(msg: value['msg']);
                                    }
                                  });
                                  /*
                              final resp = KidsSignupInfo().get(
                                kidName: kidNameController.text,
                                kidSection: selectedSection['id'],
                                kidAge: kidAgeController.text,
                                kidBirthday: kidBirthdayController.text,
                                kidGender: _selectedText,
                                pickedImage: _pickedImage,
                              );
                              resp.then((value) {
                                print(value);
                                if (value['status'] == 0) {
                                  Fluttertoast.showToast(msg: value['msg']);
                                  setState(() {
                                    _btnLoading = false;
                                  });
                                } else {
                                  setState(() {
                                    _btnLoading = false;
                                  });
                                  widget.onContinue();
                                }
                              });*/
                                }
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //       builder: (context) => ParentInfo()),
                                // );
                              },
                              title: "Continue",
                              textStyleColor: Colors.white,
                              backgroundColor: ThemeColor.primarycolor)),
                  SizedBox(height: 400),
                ],
              ),
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
