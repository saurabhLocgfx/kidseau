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
import 'package:kidseau/api/Teacherpanelapi/teacher_profile_api/teacher_update_profile.dart';
import 'package:kidseau/api/Teacherpanelapi/teacher_profile_api/teacher_update_profile_picture.dart';

import '../../Theme.dart';
import '../../api/models/teacher_profile_details_model/teacher_profile_details_model.dart';

class TEditProfileScreen extends StatefulWidget {
  final TeacherProfileDetailsModel model;
  final Function onPop;
  const TEditProfileScreen({Key? key, required this.model, required this.onPop}) : super(key: key);

  @override
  State<TEditProfileScreen> createState() => _TEditProfileScreenState();
}

class _TEditProfileScreenState extends State<TEditProfileScreen> {

  final TextEditingController _educationController = TextEditingController();
  final TextEditingController _yearController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  String _birthday = '';
  String _gender = '';
  @override
  void initState() {
    _educationController.text = widget.model.education ?? '';
    _yearController.text = widget.model.yearOfExp ?? '';
    _addressController.text = widget.model.address ?? '';
    _birthday = widget.model.brithday ?? 'dd/mm/yyyy';
    profileImageUrl = widget.model.image??'';
    if(widget.model.gender!.toLowerCase() == 'm'){
      _gender = 'male';
    }else if(widget.model.gender!.toLowerCase() == 'f'){
      _gender ='female';
    }else{
      _gender = 'other';
    }

    super.initState();
  }

  @override
  void dispose() {
    widget.onPop();
    super.dispose();
  }
  String profileImageUrl = '';

  DateTime? _pickedDate;
  final _picker = ImagePicker();
  File _pickedFile = File('');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            color: AppColors().bgColor,
              image: DecorationImage(
                  image: AssetImage(
                    "assets/images/Group8270.png",
                  ),
                  fit: BoxFit.cover)),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.white.withOpacity(0.5),
                  Colors.white.withOpacity(0.7),
                  Colors.grey.shade100.withOpacity(0.9),
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
                          child: Image.network(profileImageUrl,
                            fit: BoxFit.fitHeight,
                            loadingBuilder: (q,w,e){
                              if (e == null){ return w;}else{
                                return SpinKitThreeBounce(size: 30,color: Colors.grey,);}
                            },
                            errorBuilder: (q,w,e)=> Image.asset('assets/images/profileperson.png'),),
                        ),
                      ),
                      SizedBox(height: 12.5),
                      GestureDetector(
                        onTap: () async{
                          XFile? image = await _picker.pickImage(source: ImageSource.gallery);
                          if(image != null){
                              _pickedFile = File(image.path);
                              final resp = TeacherUpdateProfilePicture().get(pickedImage: _pickedFile);
                              resp.then((value){
                                log(value.toString());
                                if(value['status'] ==1){
                                  setState(() {
                                    profileImageUrl = value['imgLocation'];
                                  });
                                  CustomSnackBar.customSnackBar(context, value['msg']);
                                }
                                else{
                                  setState(() {
                                    profileImageUrl = widget.model.image.toString();
                                  });
                                  CustomSnackBar.customErrorSnackBar(context, value['msg']);
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
                          style: FontConstant.k16w500331FText),
                      SizedBox(height: 4),
                      TextFormField(
                        controller: _educationController,
                        decoration: TextFieldDecoration().curvedWhiteDecoration(
                            label: 'Enter your highest degree'.tr(), curved: true),
                      ),
                      SizedBox(height: 16),
                      Text('Birthday'.tr(), style: FontConstant.k16w500331FText),
                      SizedBox(height: 4),
                      InkWell(
                        onTap: () async{
                        _pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1960),
                              lastDate: DateTime(2100));
                        if(_pickedDate == null){
                          return;
                        }else{
                          _birthday = DateFormat('yyyy-MM-dd').format(_pickedDate!);
                        }
                        },
                        child: Container(
                          width: 1.sw,
                          height: 56.h,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(90),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 18),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(_birthday,
                              //    style: FontConstant.k16w400B7A4Text
                              ),
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
                      Text('Gender'.tr(), style: FontConstant.k16w500331FText),
                      SizedBox(height: 4),
                      Center(
                        child: Container(
                          height: 54,
                            padding: EdgeInsets.only(left: 16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(90)
                          ),
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
                            items: <String>['male', 'female', 'other']
                                .map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
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
                      SizedBox(height: 16),
                      Text('Year Of Experience'.tr(),
                          style: FontConstant.k16w500331FText),
                      SizedBox(height: 4),
                      TextFormField(
                        controller: _yearController,
                        decoration: TextFieldDecoration().curvedWhiteDecoration(
                            label: 'Enter your years of experience'.tr(),
                            curved: true),
                      ),
                      SizedBox(height: 16),
                      Text('Address'.tr(), style: FontConstant.k16w500331FText),
                      SizedBox(height: 4),
                      TextFormField(
                        controller: _addressController,
                        decoration: TextFieldDecoration().curvedWhiteDecoration(
                            label: 'Enter your address'.tr(), curved: true),
                      ),
                      SizedBox(height: 16,),
                      InkWell(onTap:(){

                      },child: Container(padding:EdgeInsets.symmetric(vertical: 5),color: Colors.transparent,child: Text('Change email & phone number', style: FontConstant.k16w5008471Text,))),
                      SizedBox(height: 32),
                      materialButton(
                        context,
                        () {
                          ScreenLoader().onLoading(context);
                          final resp = TeacherUpdateProfile().update(dob: _birthday, education: _educationController.text, experience: _yearController.text, gender: _gender, address: _addressController.text);
                          resp.then((value){
                            if(value['status'] == 1){
                              Navigator.of(context).pop();
                              CustomSnackBar.customSnackBar(context, value['msg']);
                            }else{
                              Navigator.of(context).pop();
                              CustomSnackBar.customErrorSnackBar(context, value['msg']);
                            }
                          });
                        },
                        "Save".tr(),
                        //AppLoaclizations.of(context)!.translate("Save").toString(),
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
    );
  }
}
