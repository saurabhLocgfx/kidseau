import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'dart:ui';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kidseau/Constants/colors.dart';
import 'package:kidseau/Widgets/buttons.dart';
import 'package:kidseau/Widgets/custom_snack_bar.dart';
import 'package:kidseau/Widgets/screen_loader.dart';
import 'package:kidseau/api/Teacherpanelapi/teacher_profile_api/teacher_update_email_number_api.dart';
import 'package:kidseau/api/Teacherpanelapi/teacher_profile_api/teacher_update_profile.dart';
import 'package:kidseau/api/Teacherpanelapi/teacher_profile_api/teacher_update_profile_picture.dart';
import 'package:kidseau/api/Teacherpanelapi/teacher_profile_api/teacher_verify_update_otp.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../Theme.dart';
import '../../api/models/teacher_profile_details_model/teacher_profile_details_model.dart';

class TEditProfileScreen extends StatefulWidget {
  final TeacherProfileDetailsModel model;
  final Function onPop;
  const TEditProfileScreen({Key? key, required this.model, required this.onPop})
      : super(key: key);

  @override
  State<TEditProfileScreen> createState() => _TEditProfileScreenState();
}

class _TEditProfileScreenState extends State<TEditProfileScreen> {
  final TextEditingController _educationController = TextEditingController();
  final TextEditingController _yearController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  /* final TextEditingController _emailController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();*/
  String _birthday = '';
  String _gender = '';

  @override
  void initState() {
    _educationController.text = widget.model.education ?? '';
    _yearController.text = widget.model.yearOfExp ?? '';
    _addressController.text = widget.model.address ?? '';
    _birthday = widget.model.brithday ?? 'dd/mm/yyyy';

    profileImageUrl = widget.model.image ?? '';
    if (widget.model.gender!.toLowerCase() == 'm') {
      _gender = 'male';
    } else if (widget.model.gender!.toLowerCase() == 'f') {
      _gender = 'female';
    } else {}
    _eduFocus.addListener(() {
      setState(() {});
    });
    _expFocus.addListener(() {
      setState(() {});
    });
    _addressFocus.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    widget.onPop();
    _eduFocus.removeListener(() {});
    _expFocus.removeListener(() {});
    _addressFocus.removeListener(() {});
    // _timer?.cancel();
    super.dispose();
  }

  String profileImageUrl = '';

  DateTime? _pickedDate;
  final _picker = ImagePicker();
  File _pickedFile = File('');

  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  Widget _showBottomSheet() {
    return StatefulBuilder(builder: (context, sheetState) {
      return BottomSheetWidget(
        model: widget.model,
        onPop: (val, val2) {
          widget.model.email = val;
          widget.model.phoneNumber = val2;
        },
      );
    });
  }

  FocusNode _eduFocus = FocusNode();
  FocusNode _expFocus = FocusNode();
  FocusNode _addressFocus = FocusNode();

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
                                source: ImageSource.gallery);
                            if (image != null) {
                              _pickedFile = File(image.path);
                              final resp = TeacherUpdateProfilePicture()
                                  .get(pickedImage: _pickedFile);
                              resp.then((value) {
                                log(value.toString());
                                if (value['status'] == 1) {
                                  setState(() {
                                    profileImageUrl = value['imgLocation'];
                                  });
                                  CustomSnackBar.customSnackBar(
                                      context, value['msg']);
                                } else {
                                  setState(() {
                                    profileImageUrl =
                                        widget.model.image.toString();
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
                                  'Change Profile'.tr(),
                                  style: FontConstant.k16w5008471Text,
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 40),
                        Text('Personal Details'.tr(),
                            style: FontConstant2.k24w5008471text),
                        SizedBox(height: 24),
                        Text('Education'.tr(),
                            style: _eduFocus.hasFocus
                                ? FontConstant.k16w5008471Text
                                : FontConstant.k16w500331FText),
                        SizedBox(height: 4),
                        TextFormField(
                          style: _eduFocus.hasFocus
                              ? FontConstant.k18w5008471Text2
                              : FontConstant.k18w5008471Text,
                          focusNode: _eduFocus,
                          controller: _educationController,
                          decoration: TextFieldDecoration()
                              .curvedWhiteDecoration(
                                  label: 'Enter your highest degree'.tr(),
                                  curved: true),
                        ),
                        SizedBox(height: 16),
                        Text('Birthday'.tr(),
                            style: FontConstant.k16w500331FText),
                        SizedBox(height: 4),
                        InkWell(
                          onTap: () async {
                            _pickedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1960),
                                lastDate: DateTime(2100));
                            if (_pickedDate == null) {
                              return;
                            } else {
                              setState(() {
                                _birthday = DateFormat('yyyy-MM-dd')
                                    .format(_pickedDate!);
                              });
                            }
                          },
                          child: Container(
                            width: 1.sw,
                            height: 64.h,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(90),
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 18),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(_birthday,
                                    style: FontConstant.k18w5008471Text),
                                SizedBox(
                                  width: 30,
                                  child: Image.asset(
                                    'assets/images/calendericon.png',
                                    color: ThemeColor.b7A4B2,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 16),
                        Text('Gender'.tr(),
                            style: FontConstant.k16w500331FText),
                        SizedBox(height: 4),
                        Center(
                          child: Container(
                            height: 64,
                            padding: EdgeInsets.only(left: 16),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(90)),
                            child: Center(
                              child: DropdownButton<String>(
                                alignment: Alignment.topRight,
                                borderRadius: BorderRadius.circular(30),
                                dropdownColor: Color(0xffffffff),
                                hint: Text(
                                  "Select your gender".tr(),
                                ),
                                icon: Padding(
                                  padding: const EdgeInsets.only(right: 15.0),
                                  child: Image.asset(
                                    "assets/images/downarrow.png",
                                    height: 15,
                                    width: 15,
                                  ),
                                ),
                                elevation: 0,
                                isExpanded: true,
                                underline: SizedBox(),
                                value: _gender,
                                items: <String>['male', 'female']
                                    .map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(
                                      value,
                                      style: FontConstant.k18w5008471Text,
                                    ),
                                  );
                                }).toList(),
                                onChanged: (String? val) {
                                  setState(() {
                                    _gender = val!;
                                  });
                                },
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 16),
                        Text('Year Of Experience'.tr(),
                            style: _expFocus.hasFocus
                                ? FontConstant.k16w5008471Text
                                : FontConstant.k16w500331FText),
                        SizedBox(height: 4),
                        TextFormField(
                          style: _expFocus.hasFocus
                              ? FontConstant.k18w5008471Text2
                              : FontConstant.k18w5008471Text,
                          focusNode: _expFocus,
                          controller: _yearController,
                          decoration: TextFieldDecoration()
                              .curvedWhiteDecoration(
                                  label: 'Enter your years of experience'.tr(),
                                  curved: true),
                        ),
                        SizedBox(height: 16),
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
                              'Change email & phone number',
                              style: FontConstant.k16w5008471,
                            ),
                          ),
                        ),
                        SizedBox(height: 32),
                        materialButton(
                          context,
                          () {
                            ScreenLoader().onLoading(context);
                            final resp = TeacherUpdateProfile().update(
                                dob: _birthday,
                                education: _educationController.text,
                                experience: _yearController.text,
                                gender: _gender,
                                address: _addressController.text);
                            resp.then((value) {
                              if (value['status'] == 1) {
                                Navigator.of(context).pop();
                                CustomSnackBar.customSnackBar(
                                    context, value['msg']);
                              } else {
                                Navigator.of(context).pop();
                                CustomSnackBar.customErrorSnackBar(
                                    context, value['msg']);
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

class BottomSheetWidget extends StatefulWidget {
  final TeacherProfileDetailsModel model;
  final Function(String, String) onPop;
  const BottomSheetWidget({Key? key, required this.model, required this.onPop})
      : super(key: key);

  @override
  State<BottomSheetWidget> createState() => _BottomSheetWidgetState();
}

class _BottomSheetWidgetState extends State<BottomSheetWidget> {
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
    _emailController.text = widget.model.email ?? '';
    _numberController.text = widget.model.phoneNumber ?? '';
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

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Container(
          padding: EdgeInsets.only(top: 32, left: 16, right: 16, bottom: 56),
          decoration: BoxDecoration(color: AppColors().bgColor),
          child: Form(
            key: _key,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Email'.tr(),
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
                  controller: _emailController,
                  validator: (val) {
                    if (_emailController.text.isEmpty) {
                      return 'This field cannot be empty';
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    hintText: 'Enter your email'.tr(),
                    suffix: InkWell(
                      onTap: _numberTimer
                          ? () {}
                          : () {
                              if (_key.currentState!.validate()) {
                                final resp = TeacherUpdateEmailNumberApi()
                                    .get(field: _emailController.text);
                                resp.then((value) {
                                  log(value.toString());
                                  if (value['status'] == 1) {
                                    setState(() {
                                      _start = 59;
                                      _emailTimer = true;
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
                          _emailTimer ? _start.toString() : 'Verify',
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
                      onTap: _emailTimer
                          ? () {}
                          : () {
                              if (_key.currentState!.validate()) {
                                final resp = TeacherUpdateEmailNumberApi()
                                    .get(field: _numberController.text);
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
                          _numberTimer ? _start.toString() : 'Verify',
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
                SizedBox(height: 32),
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
                    : SizedBox.shrink(),
                SizedBox(height: 32),
                SizedBox(
                  height: 52,
                  width: 1.sw,
                  child: MainButton(
                      onTap: _showField
                          ? () {
                              final resp = TeacherVerifyUpdateOTP()
                                  .get(otp: pinTextController.text);
                              resp.then((value) {
                                Navigator.of(context).pop();
                                if (value['status'] == 1) {
                                  CustomSnackBar.customSnackBar(
                                      context, 'Updated successfully');
                                  val = _emailController.text;
                                  val2 = _numberController.text;
                                  widget.onPop(val, val2);
                                } else {
                                  CustomSnackBar.customErrorSnackBar(
                                      context, value['msg']);
                                }
                              });
                            }
                          : () {},
                      title: "Save",
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
