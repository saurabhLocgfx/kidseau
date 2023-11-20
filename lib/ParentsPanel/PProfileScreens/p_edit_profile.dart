import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kidseau/Constants/colors.dart';
import 'package:kidseau/Widgets/buttons.dart';
import 'package:kidseau/Widgets/custom_snack_bar.dart';
import 'package:kidseau/Widgets/screen_loader.dart';
import 'package:kidseau/api/models/parent_models/parent_profile_models/parent_profile_model.dart';
import 'package:kidseau/api/parent_panel_apis/parent_profile_apis/parent_update_number_email_api.dart';
import 'package:kidseau/api/parent_panel_apis/parent_profile_apis/parent_update_profile_api.dart';
import 'package:kidseau/api/parent_panel_apis/parent_profile_apis/update_field_otp_api.dart';
import 'package:kidseau/api/parent_panel_apis/parent_profile_apis/update_parent_profile_pic.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../Theme.dart';

class PEditProfileScreen extends StatefulWidget {
  final ParentProfileModel model;
  final Function onPop;
  const PEditProfileScreen({Key? key, required this.onPop, required this.model})
      : super(key: key);

  @override
  State<PEditProfileScreen> createState() => _PEditProfileScreenState();
}

class _PEditProfileScreenState extends State<PEditProfileScreen> {
  /*
  String _birthday = '';
  String _gender = '';*/
  final TextEditingController _fatherNameController = TextEditingController();
  final TextEditingController _fatherOccupationController =
      TextEditingController();
  final TextEditingController _fatherEmailController = TextEditingController();
  final TextEditingController _fatherNumberController = TextEditingController();
  final TextEditingController _motherNameController = TextEditingController();
  final TextEditingController _motherOccupationController =
      TextEditingController();
  final TextEditingController _motherEmailController = TextEditingController();
  final TextEditingController _motherNumberController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  @override
  void initState() {
    _fatherNameController.text = widget.model.fatherName.toString();
    _fatherOccupationController.text = widget.model.foccupation.toString();
    _fatherEmailController.text = widget.model.email.toString();
    _fatherNumberController.text = widget.model.number.toString();
    _motherNameController.text = widget.model.motherName.toString();
    _motherOccupationController.text = widget.model.mOccupation.toString();
    _motherEmailController.text = widget.model.motherEmail.toString();
    _motherNumberController.text = widget.model.motherPhoneNumber.toString();
    _addressController.text = widget.model.parentAddress.toString();
    profileImageUrl = widget.model.parentImage.toString();
    if (widget.model.info.toString().toLowerCase() == 'father') {
      _isFather = true;
    } else {
      _isMother = true;
    }
    /*_educationController.text = widget.model.education ?? '';
    _yearController.text = widget.model.yearOfExp ?? '';
    _addressController.text = widget.model.address ?? '';
    _birthday = widget.model.brithday ?? 'dd/mm/yyyy';

    profileImageUrl = widget.model.image ?? '';
    if (widget.model.gender!.toLowerCase() == 'm') {
      _gender = 'Male'.tr();
    } else if (widget.model.gender!.toLowerCase() == 'f') {
      _gender = 'Female'.tr();
    } else {}
    _eduFocus.addListener(() {
      setState(() {});
    });
    _expFocus.addListener(() {
      setState(() {});
    });
    _addressFocus.addListener(() {
      setState(() {});
    });*/
    _fatherNameFocus.addListener(() {
      setState(() {});
    });
    _fatherOccupationFocus.addListener(() {
      setState(() {});
    });
    _fatherEmailFocus.addListener(() {
      setState(() {});
    });
    _fatherNumberFocus.addListener(() {
      setState(() {});
    });
    _motherNameFocus.addListener(() {
      setState(() {});
    });
    _motherOccupationFocus.addListener(() {
      setState(() {});
    });
    _motherEmailFocus.addListener(() {
      setState(() {});
    });
    _motherNumberFocus.addListener(() {
      setState(() {});
    });
    _addressFocus.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  String profileImageUrl = '';

  DateTime? _pickedDate;
  final _picker = ImagePicker();
  File _pickedFile = File('');

  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  Widget _showBottomSheet() {
    return StatefulBuilder(builder: (context, sheetState) {
      return ParentBottomSheetWidget(
        onPop: (val, val2, val3) {
          setState(() {
            if (val3) {
              _motherEmailController.text = val;
              _motherNumberController.text = val2;
            } else {
              _fatherEmailController.text = val;
              _fatherNumberController.text = val2;
            }
          });
        },
        email: _isFather
            ? _fatherEmailController.text
            : _motherEmailController.text,
        number: _isFather
            ? _fatherNumberController.text
            : _motherNumberController.text,
        isFather: _isFather,
        /* model: widget.model,
        onPop: (val, val2) {
          widget.model.email = val;
          widget.model.phoneNumber = val2;
        },*/
      );
    });
  }

  FocusNode _fatherNameFocus = FocusNode();
  FocusNode _fatherOccupationFocus = FocusNode();
  FocusNode _fatherEmailFocus = FocusNode();
  FocusNode _fatherNumberFocus = FocusNode();
  FocusNode _motherNameFocus = FocusNode();
  FocusNode _motherOccupationFocus = FocusNode();
  FocusNode _motherEmailFocus = FocusNode();
  FocusNode _motherNumberFocus = FocusNode();
  FocusNode _addressFocus = FocusNode();

  bool _isFather = false;
  bool _isMother = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1.sh,
      width: 1.sw,
      child: Scaffold(
        // backgroundColor: AppColors().bgColor,
        appBar: AppBar(
          toolbarHeight: 70.0,
          flexibleSpace: ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                color: Colors.transparent,
              ),
            ),
          ),
          automaticallyImplyLeading: false,
          elevation: 0,
          centerTitle: false,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Color(0xff8267AC).withOpacity(0.16),
          ),
          backgroundColor: Color(0xff8267AC).withOpacity(0.16),
          leading: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Image.asset(
                    "assets/images/backarrow.png",
                    height: 24,
                    width: 24,
                  ),
                ),
              ),
            ],
          ),
          title: Text(
            "Edit Profile".tr(),
            style: FontConstant.k18w5008471Text,
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            // height: 414,
            decoration: BoxDecoration(
                image: DecorationImage(
                    alignment: Alignment.topCenter,
                    image: AssetImage(
                      "assets/images/Group8270.png",
                    ),
                    fit: BoxFit.fitWidth)),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xffF8F6FA).withOpacity(0.7),
                    Color(0xffF8F6FA),
                    Color(0xffF8F6FA)
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0.3, 0.6, 0.9],
                ),
              ),
              child: Stack(
                children: [
                  SizedBox(
                    width: 1.sw,
                    /* child: Image.asset(
                  "assets/images/Group8270.png",
                  fit: BoxFit.fitWidth,
                ),*/
                  ),
                  Container(
                    width: 1.sw,
                    height: 455,
                    /* decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.white.withOpacity(0.7),
                      Colors.white,
                      Colors.white
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0.3, 0.6, 0.9],
                  ),
                ),*/
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 40),
                        Center(
                          child: Container(
                            width: 96,
                            height: 128,
                            clipBehavior: Clip.hardEdge,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Image.network(
                              profileImageUrl,
                              fit: BoxFit.fitHeight,
                              loadingBuilder: (q, w, e) {
                                if (e == null) {
                                  return w;
                                } else {
                                  return SpinKitThreeBounce(
                                    size: 30,
                                    color: Colors.grey,
                                  );
                                }
                              },
                              errorBuilder: (q, w, e) => Image.asset(
                                  'assets/images/profileperson.png'),
                            ),
                          ),
                        ),
                        SizedBox(height: 12.5),
                        GestureDetector(
                          onTap: () async {
                            XFile? image = await _picker.pickImage(
                                source: ImageSource.gallery, imageQuality: 50);
                            if (image != null) {
                              _pickedFile = File(image.path);
                              final resp = UpdateParentProfilePic()
                                  .get(pickedImg: _pickedFile);
                              resp.then((value) {
                                log(value.toString());
                                if (value['status'] == 1) {
                                  setState(() {
                                    profileImageUrl = value['image'];
                                  });
                                  CustomSnackBar.customSnackBar(
                                      context, value['msg']);
                                  widget.onPop();
                                } else {
                                  setState(() {
                                    profileImageUrl =
                                        widget.model.parentImage.toString();
                                  });
                                  CustomSnackBar.customErrorSnackBar(
                                      context, value['msg']);
                                }
                              });
                            }
                          },
                          child: Container(
                            color: Colors.transparent,
                            padding: EdgeInsets.symmetric(
                                horizontal: 50, vertical: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 25,
                                  child: Image.asset('assets/images/edit.png'),
                                ),
                                SizedBox(width: 16),
                                Text(
                                  'Change Profile Photo'.tr(),
                                  style: FontConstant.k16w5008471Text,
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 40),
                        Text('You are'.tr(),
                            style: FontConstant2.k24w5008471text),
                        SizedBox(height: 8),
                        CheckboxListTile(
                            controlAffinity: ListTileControlAffinity.leading,
                            activeColor: Color(0xffBE74AA),
                            checkColor: Colors.white,
                            checkboxShape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            title: Text("Father".tr()),
                            value: _isFather,
                            onChanged: (val) {
                              /*setState(() {
                                _isMother = false;
                                _isFather = true;
                              });*/
                            }),
                        CheckboxListTile(
                            controlAffinity: ListTileControlAffinity.leading,
                            activeColor: Color(0xffBE74AA),
                            checkColor: Colors.white,
                            checkboxShape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            title: Text("Mother".tr()),
                            value: _isMother,
                            onChanged: (val) {
                              /* setState(() {
                                _isMother = true;
                                _isFather = false;
                              });*/
                            }),
                        SizedBox(
                          height: 25,
                        ),
                        Text("Kid's father".tr(),
                            style: FontConstant2.k24w5008471text),
                        SizedBox(height: 24),
                        Text("Father's name".tr(),
                            style: _fatherNameFocus.hasFocus
                                ? FontConstant.k16w5008471Text
                                : FontConstant.k16w500331FText),
                        SizedBox(height: 4),
                        TextFormField(
                          style: _fatherNameFocus.hasFocus
                              ? FontConstant.k18w5008471Text2
                              : FontConstant.k18w5008471Text,
                          focusNode: _fatherNameFocus,
                          controller: _fatherNameController,
                          decoration: TextFieldDecoration()
                              .curvedWhiteDecoration(
                                  label: 'Enter your Full name'.tr(),
                                  curved: true),
                        ),
                        SizedBox(height: 16),
                        Text('Occupation'.tr(),
                            style: _fatherOccupationFocus.hasFocus
                                ? FontConstant.k16w5008471Text
                                : FontConstant.k16w500331FText),
                        SizedBox(height: 4),
                        TextFormField(
                          style: _fatherOccupationFocus.hasFocus
                              ? FontConstant.k18w5008471Text2
                              : FontConstant.k18w5008471Text,
                          focusNode: _fatherOccupationFocus,
                          controller: _fatherOccupationController,
                          decoration: TextFieldDecoration()
                              .curvedWhiteDecoration(
                                  label: 'Enter your occupation'.tr(),
                                  curved: true),
                        ),
                        SizedBox(height: 16),
                        Text('Email address'.tr(),
                            style: _fatherEmailFocus.hasFocus
                                ? FontConstant.k16w5008471Text
                                : FontConstant.k16w500331FText),
                        SizedBox(height: 4),
                        TextFormField(
                          enabled: false,
                          style: _fatherEmailFocus.hasFocus
                              ? FontConstant.k18w5008471Text2
                              : FontConstant.k18w5008471Text,
                          focusNode: _fatherEmailFocus,
                          controller: _fatherEmailController,
                          decoration: TextFieldDecoration()
                              .curvedWhiteDecoration(
                                  label: 'Enter your email address'.tr(),
                                  curved: true),
                        ),
                        SizedBox(height: 16),
                        Text('Phone number'.tr(),
                            style: _fatherNumberFocus.hasFocus
                                ? FontConstant.k16w5008471Text
                                : FontConstant.k16w500331FText),
                        SizedBox(height: 4),
                        TextFormField(
                          enabled: false,
                          style: _fatherNumberFocus.hasFocus
                              ? FontConstant.k18w5008471Text2
                              : FontConstant.k18w5008471Text,
                          focusNode: _fatherNumberFocus,
                          controller: _fatherNumberController,
                          decoration: TextFieldDecoration()
                              .curvedWhiteDecoration(
                                  label: 'Enter your mobile number'.tr(),
                                  curved: true),
                        ),
                        SizedBox(height: 16),
                        Text("Kid's mother".tr(),
                            style: FontConstant2.k24w5008471text),
                        SizedBox(height: 24),
                        Text("Mother's name".tr(),
                            style: _motherNameFocus.hasFocus
                                ? FontConstant.k16w5008471Text
                                : FontConstant.k16w500331FText),
                        SizedBox(height: 4),
                        TextFormField(
                          style: _motherNameFocus.hasFocus
                              ? FontConstant.k18w5008471Text2
                              : FontConstant.k18w5008471Text,
                          focusNode: _motherNameFocus,
                          controller: _motherNameController,
                          decoration: TextFieldDecoration()
                              .curvedWhiteDecoration(
                                  label: 'Enter your full name'.tr(),
                                  curved: true),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Text('Occupation'.tr(),
                            style: _motherOccupationFocus.hasFocus
                                ? FontConstant.k16w5008471Text
                                : FontConstant.k16w500331FText),
                        SizedBox(height: 4),
                        TextFormField(
                          style: _motherOccupationFocus.hasFocus
                              ? FontConstant.k18w5008471Text2
                              : FontConstant.k18w5008471Text,
                          focusNode: _motherOccupationFocus,
                          controller: _motherOccupationController,
                          decoration: TextFieldDecoration()
                              .curvedWhiteDecoration(
                                  label: 'Enter your occupation'.tr(),
                                  curved: true),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Text('Email address'.tr(),
                            style: _motherEmailFocus.hasFocus
                                ? FontConstant.k16w5008471Text
                                : FontConstant.k16w500331FText),
                        SizedBox(height: 4),
                        TextFormField(
                          enabled: false,
                          style: _motherEmailFocus.hasFocus
                              ? FontConstant.k18w5008471Text2
                              : FontConstant.k18w5008471Text,
                          focusNode: _motherEmailFocus,
                          controller: _motherEmailController,
                          decoration: TextFieldDecoration()
                              .curvedWhiteDecoration(
                                  label: 'Enter your email address'.tr(),
                                  curved: true),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Text('Phone number'.tr(),
                            style: _motherNumberFocus.hasFocus
                                ? FontConstant.k16w5008471Text
                                : FontConstant.k16w500331FText),
                        SizedBox(height: 4),
                        TextFormField(
                          enabled: false,
                          style: _motherNumberFocus.hasFocus
                              ? FontConstant.k18w5008471Text2
                              : FontConstant.k18w5008471Text,
                          focusNode: _motherNumberFocus,
                          controller: _motherNumberController,
                          decoration: TextFieldDecoration()
                              .curvedWhiteDecoration(
                                  label: 'Enter your phone number'.tr(),
                                  curved: true),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Text('Address'.tr(),
                            style: _addressFocus.hasFocus
                                ? FontConstant.k16w5008471Text
                                : FontConstant.k16w500331FText),
                        SizedBox(height: 4),
                        TextFormField(
                          style: _addressFocus.hasFocus
                              ? FontConstant.k18w5008471Text2
                              : FontConstant.k18w5008471Text,
                          focusNode: _addressFocus,
                          controller: _addressController,
                          decoration: TextFieldDecoration()
                              .curvedWhiteDecoration(
                                  label: 'Enter your address'.tr(),
                                  curved: true),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        InkWell(
                          onTap: () {
                            showModalBottomSheet(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(24),
                                        topRight: Radius.circular(24))),
                                context: context,
                                isScrollControlled: true,
                                builder: (ctx) {
                                  return _showBottomSheet();
                                }).then((value) {});
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 5),
                            color: Colors.transparent,
                            child: Text(
                              'Change email / phone number'.tr(),
                              style: FontConstant.k16w5008471,
                            ),
                          ),
                        ),
                        SizedBox(height: 32),
                        materialButton(
                          context,
                          () {
                            ScreenLoader().onLoading(context);
                            final resp = ParentUpdateApi().get(
                                mName: _motherNameController.text.trim(),
                                mOccupation:
                                    _motherOccupationController.text.trim(),
                                fName: _fatherNameController.text.trim(),
                                fOccupation:
                                    _fatherOccupationController.text.trim(),
                                address: _addressController.text);
                            resp.then((value) {
                              log(value.toString());
                              if (value['status'] == 1) {
                                setState(() {
                                  CustomSnackBar.customSnackBar(
                                      context, "Updated Successfully");
                                  Navigator.of(context).pop();
                                  Navigator.of(context).pop();
                                  widget.onPop();
                                });
                              } else {
                                CustomSnackBar.customErrorSnackBar(
                                    context, value['msg']);
                                Navigator.of(context).pop();
                              }
                            });
                          },
                          "Save".tr(),
                          ThemeColor.primarycolor,
                          52.0,
                        ),
                        SizedBox(height: 30),
                      ],
                    ),
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

class ParentBottomSheetWidget extends StatefulWidget {
  /*final TeacherProfileDetailsModel model;
  final Function(String, String) onPop;*/
  final Function(String, String, bool) onPop;
  final String email;
  final String number;
  final bool isFather;
  const ParentBottomSheetWidget(
      {Key? key,
      required this.isFather,
      required this.number,
      required this.email,
      required this.onPop})
      : super(key: key);

  @override
  State<ParentBottomSheetWidget> createState() =>
      _ParentBottomSheetWidgetState();
}

class _ParentBottomSheetWidgetState extends State<ParentBottomSheetWidget> {
  Timer? _timer;
  int _start = 59;
  bool _emailTimer = false;
  bool _numberTimer = false;
  bool _showField = false;

  final TextEditingController pinTextController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  String val = '';
  String val2 = '';
  @override
  void initState() {
    _emailController.text = widget.email ?? '';
    _numberController.text = widget.number ?? '';
    _isMother = widget.isFather ? false : true;
    _emailNode.addListener(() {
      setState(() {});
    });
    _phoneNode.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _emailNode.removeListener(() {});
    _phoneNode.removeListener(() {});
    super.dispose();
  }

  FocusNode _emailNode = FocusNode();
  FocusNode _phoneNode = FocusNode();
  _startTimer() {
    //log(_start.toString());
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        //log(_start.toString());
        if (_start == 0) {
          setState(() {
            timer.cancel();
            _emailTimer = false;
            _numberTimer = false;
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  bool _isMother = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Container(
          padding: EdgeInsets.only(top: 32, left: 16, right: 16, bottom: 24),
          decoration: BoxDecoration(color: AppColors().bgColor),
          child: Form(
            key: _key,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Updated details will be your login credentials'.tr(),
                  style: FontConstant.k16w400F97070,
                ),
                SizedBox(
                  height: 20,
                ),
                Text('Email address'.tr(),
                    style: _emailNode.hasFocus
                        ? FontConstant.k16w5008471Text
                        : FontConstant.k16w500331FText),
                SizedBox(height: 4),
                TextFormField(
                  style: _emailNode.hasFocus
                      ? FontConstant.k18w5008471Text2
                      : FontConstant.k18w5008471Text,
                  focusNode: _emailNode,
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (val) {
                    setState(() {});
                  },
                  controller: _emailController,
                  validator: (val) {
                    if (_emailController.text.isEmpty) {
                      return 'This field cannot be empty'.tr();
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    hintText: 'Enter your email'.tr(),
                    suffix: InkWell(
                      onTap: _emailController.text == widget.email
                          ? () {}
                          : () {
                              if (_key.currentState!.validate()) {
                                final resp = ParentUpdateNumberEmailApi().get(
                                    email: _emailController.text == widget.email
                                        ? ""
                                        : _emailController.text,
                                    phone:
                                        _numberController.text == widget.number
                                            ? ""
                                            : _numberController.text,
                                    isMother: _isMother);
                                resp.then((value) {
                                  log(value.toString());
                                  if (value['status'] == 1) {
                                    setState(() {
                                      _start = 59;
                                      _numberTimer = true;
                                      _showField = true;
                                    });
                                    _startTimer();
                                  } else {
                                    Navigator.of(context).pop();
                                    CustomSnackBar.customErrorSnackBar(
                                        context, value['msg']);
                                  }
                                });
                              }
                              /*var value;
                          if(value['success'] == true){

                          }else{
                            CustomSnackBar.customErrorSnackBar(context, '${value['message']}');
                            print(value);
                          }*/
                            },
                      child: Container(
                        //color: Colors.black,
                        //padding: EdgeInsets.all(16),
                        child: Text(
                          _emailTimer ? _start.toString() : 'Verify'.tr(),
                          style: _emailNode.hasFocus
                              ? FontConstant.k18w500Primary
                              : FontConstant.k18w500B7A4B2,
                        ),
                      ),
                    ),
                    // isCollapsed: true,
                    hintStyle: FontConstant.k16w400B7A4Text,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(90),
                      borderSide: BorderSide(color: Colors.white, width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(90),
                      borderSide: BorderSide(color: Colors.white, width: 1),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(90),
                      borderSide: BorderSide(color: Colors.redAccent, width: 1),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(90),
                      borderSide: BorderSide(color: Colors.white, width: 1),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(90),
                      borderSide: BorderSide(color: Colors.white, width: 1),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Text('Phone number'.tr(),
                    style: _phoneNode.hasFocus
                        ? FontConstant.k16w5008471Text
                        : FontConstant.k16w500331FText),
                SizedBox(height: 4),
                TextFormField(
                  style: _phoneNode.hasFocus
                      ? FontConstant.k18w5008471Text2
                      : FontConstant.k18w5008471Text,
                  focusNode: _phoneNode,
                  onChanged: (val) {
                    setState(() {});
                  },
                  keyboardType: TextInputType.phone,
                  controller: _numberController,
                  validator: (val) {
                    if (_numberController.text.isEmpty) {
                      return 'This field cannot be empty';
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    hintText: 'Enter your number'.tr(),
                    suffix: InkWell(
                      onTap: _numberController.text == widget.number
                          ? () {}
                          : () {
                              if (_key.currentState!.validate()) {
                                final resp = ParentUpdateNumberEmailApi().get(
                                    email: _emailController.text == widget.email
                                        ? ""
                                        : _emailController.text,
                                    phone:
                                        _numberController.text == widget.number
                                            ? ""
                                            : _numberController.text,
                                    isMother: _isMother);
                                resp.then((value) {
                                  log(value.toString());
                                  if (value['status'] == 1) {
                                    setState(() {
                                      _start = 59;
                                      _numberTimer = true;
                                      _showField = true;
                                    });
                                    _startTimer();
                                  } else {
                                    Navigator.of(context).pop();
                                    CustomSnackBar.customErrorSnackBar(
                                        context, value['msg']);
                                  }
                                });
                              }
                            },
                      child: Container(
                        //color: Colors.black,
                        //padding: EdgeInsets.all(16),
                        child: Text(
                          _numberTimer ? _start.toString() : 'Verify'.tr(),
                          style: _phoneNode.hasFocus
                              ? FontConstant.k18w500Primary
                              : FontConstant.k18w500B7A4B2,
                        ),
                      ),
                    ),
                    // isCollapsed: true,
                    hintStyle: FontConstant.k16w400B7A4Text,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(90),
                      borderSide: BorderSide(color: Colors.white, width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(90),
                      borderSide: BorderSide(color: Colors.white, width: 1),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(90),
                      borderSide: BorderSide(color: Colors.redAccent, width: 1),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(90),
                      borderSide: BorderSide(color: Colors.white, width: 1),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(90),
                      borderSide: BorderSide(color: Colors.white, width: 1),
                    ),
                  ),
                ),
                if (_showField) SizedBox(height: 32),
                _showField
                    ? Padding(
                        padding: EdgeInsets.symmetric(horizontal: 32),
                        child: PinCodeTextField(
                          controller: pinTextController,
                          keyboardType: TextInputType.number,
                          cursorColor: AppColors().k8267AC,
                          //enableActiveFill: true,
                          appContext: context,
                          length: 4,
                          onChanged: (val) {},
                          pinTheme: PinTheme(
                            inactiveColor: AppColors().k8267AC,
                            //activeFillColor: kECF0F8,
                            fieldOuterPadding: EdgeInsets.all(0),
                            //selectedFillColor: kECF0F8,
                            selectedColor: AppColors().k8267AC,
                            borderWidth: 0,
                            fieldWidth: 45.w,
                            fieldHeight: 50.h,
                            borderRadius: BorderRadius.circular(8),
                            //inactiveFillColor: kECF0F8,
                            activeColor: AppColors().k8267AC,
                            shape: PinCodeFieldShape.underline,
                          ),
                        ),
                      )
                    : Container(),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24),
                  child: Row(
                    children: [
                      Checkbox(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          value: _isMother,
                          activeColor: Color(0xffBE74AA),
                          checkColor: Colors.white,
                          onChanged: (val) {
                            if (_showField) {
                              Fluttertoast.showToast(
                                  msg:
                                      'OTP already sent. You cannot change now.');
                            } else {
                              setState(() {
                                _isMother = !_isMother;
                              });
                            }
                          }),
                      Expanded(
                        child: Text(
                          "Changed email/phone number belongs to Mother".tr(),
                          maxLines: 2,
                          style: FontConstant.k16w4008471Text,
                        ),
                      ),
                    ],
                  ),
                ),
                /*CheckboxListTile(
                    controlAffinity: ListTileControlAffinity.leading,
                    activeColor: Color(0xffBE74AA),
                    checkColor: Colors.white,
                    checkboxShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    value: _isMother,
                    onChanged: (val) {
                      if (_showField) {
                        Fluttertoast.showToast(
                            msg: 'OTP already sent. You cannot change now.');
                      } else {
                        setState(() {
                          _isMother = !_isMother;
                        });
                      }
                    }),*/
                //SizedBox(height: 24),
                SizedBox(
                  height: 52,
                  width: 1.sw,
                  child: MainButton(
                      onTap: _showField
                          ? () {
                              final resp = UpdateFieldOTP()
                                  .get(otp: pinTextController.text);
                              resp.then((value) {
                                Navigator.of(context).pop();
                                if (value['status'] == 1) {
                                  CustomSnackBar.customSnackBar(
                                      context, 'Updated successfully');
                                  val = _emailController.text;
                                  val2 = _numberController.text;
                                  widget.onPop(val, val2, _isMother);
                                } else {
                                  CustomSnackBar.customErrorSnackBar(
                                      context, value['msg']);
                                }
                              });
                            }
                          : () {},
                      title: "Save".tr(),
                      textStyleColor: Colors.white,
                      backgroundColor: ThemeColor.primarycolor),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
