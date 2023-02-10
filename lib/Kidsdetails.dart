import 'dart:developer';
import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kidseau/Theme.dart';
import 'package:kidseau/Widgets/buttons.dart';
import 'package:kidseau/api/models/group_resp.dart';
import 'package:kidseau/api/models/section_resp.dart';
import 'package:kidseau/api/parent_signup_apis/get_sections.dart';
import 'package:kidseau/api/parent_signup_apis/parent_signup_kidinfo_api.dart';

import 'Widgets/textfields.dart';

class KidsDetails extends StatefulWidget {
  final Function onContinue;
  const KidsDetails({Key? key, required this.onContinue}) : super(key: key);

  @override
  State<KidsDetails> createState() => _KidsDetailsState();
}

class _KidsDetailsState extends State<KidsDetails> {
  TextEditingController kidNameController = TextEditingController();
  TextEditingController kidAgeController = TextEditingController();
  TextEditingController datepicker = TextEditingController();
  TextEditingController kidBirthdayController = TextEditingController();
  // TextEditingController kidGenderController = TextEditingController();

  File _pickedImage = File('');
  final _picker = ImagePicker();
  XFile? _image;
  String thumbnail = '';

  String groupid = '';
  // String sectionid = '';
  String _selectedText = 'Male';
  String _selectedgroup = '';
  String _selectedsection = '';

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _getSections();
    super.initState();
  }

  String _selectedSection = "";
  List<String> sectionList = [];
  List<Map<String, dynamic>> _map = [];
  Map<String, dynamic> selectedSection = {};
  Map<String, dynamic> selectedGroup = {};
  String _selectedGroup = '';
  List<String> groupList = [];
  List<Map<String, dynamic>> _groupMap = [];

  SectionResponse resp = SectionResponse(status: 0, sections: []);
  GroupResponse gresp = GroupResponse(Status: '0', Group: []);

  String _selectedsectionId = '';
  /* getSections() {
    try {
      .then((value) {
        setState(() {
          resp = value;
          _selectedsection = resp.sections.first.secName.toString();
          _selectedsectionId = resp.sections.first.secId.toString();
        });
      }).then((value) {
    _getGroups(_map[0]['id']);
      });
    } catch (e) {
      print(e);
    }
  }*/

  bool _grpLoading = false;
  /*_getGroups() {
    .then((value) {
      setState(() {
        gresp = value;
        _selectedgroup = gresp.Group.first.grpName.toString();
        groupid = gresp.Group.first.grpId.toString();
        _grpLoading = false;
      });
    });
  }*/

  _getSections() {
    log('api called');
    final resp = GetSections().get();
    resp.then((value) {
      log(value.toString());
      if (value['status'] == 1) {
        setState(() {
          for (var v in value['allSection']) {
            sectionList.add(v['sec_name']);
            //langListId.add(v['sec_id']);
            _map.add({'name': v['sec_name'], 'id': v['sec_id']});
          }
          _selectedSection = sectionList[0];
          selectedSection = {'name': _map[0]['name'], 'id': _map[0]['id']};
        });
      } else {}
    }).then((value) {
      _getGroups(_map[0]['id']);
    });
  }

  // bool _isLoading = false;

  _getGroups(String secId) {
    // log('message');
    setState(() {
      _grpLoading = true;
    });
    final resp = GetSections().getGroups(sectionId: secId);
    resp.then((value) {
      log(value.toString());
      groupList.clear();
      _groupMap.clear();
      _selectedGroup = '';
      setState(() {
        for (var v in value['allGroup']) {
          groupList.add(v['grp_name']);
          _groupMap.add({'name': v['group_name'], 'id': v['group_id']});
          selectedGroup = {'name': _map[0]['name'], 'id': _map[0]['id']};
        }
        _selectedGroup = groupList[0] ?? '';
        _grpLoading = false;
      });
    });
  }

  bool _btnLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
            color: ThemeColor.primarycolor.withOpacity(.06),
            width: 1.sw,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      "Kid’s Information".tr(),
                      style: FontConstant2.k24w500331Ftext,
                      textAlign: TextAlign.start,
                    ),
                  ),
                  SizedBox(height: 24),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "kid's name".tr(),
                        style: FontConstant.k16w500331FText,
                      ),
                      SizedBox(height: 5),
                      Container(
                        //height: 64.h,
                        width: 1.sw,
                        child: TextFormField(
                          validator: (motherName) {
                            if (motherName == null || motherName.isEmpty) {
                              return "This field cannot be empty".tr();
                            }
                          },
                          style: FontConstant.k18w5008471Text,
                          decoration: CustomInputDecoration(
                                  hintText: "Enter your kid's name".tr())
                              .decoration(),
                          controller: kidNameController,
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 10),
                  Text("Choose section".tr(),
                      style: FontConstant.k16w500331FText),
                  SizedBox(height: 4),
                  Container(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    height: 54.h,
                    width: 1.sw,
                    decoration: BoxDecoration(
                        color: Color(0xffFFFFFF),
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    child: DropdownButton<String>(
                      alignment: Alignment.centerLeft,
                      borderRadius: BorderRadius.circular(30),
                      dropdownColor: Color(0xffffffff),
                      isExpanded: true,
                      hint: Text(
                        "Select section".tr(),
                      ),
                      icon: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 16.0),
                          child: Image.asset(
                            "assets/images/downarrow.png",
                            height: 15,
                            width: 15,
                          ),
                        ),
                      ),
                      elevation: 0,
                      underline: SizedBox(),
                      value: _selectedSection,
                      items: sectionList.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? val) {
                        setState(() {
                          _selectedSection = val!;
                          for (int i = 0; i <= _map.length - 1; i++) {
                            if (_selectedSection == _map[i]['name']) {
                              selectedSection = {
                                'name': _map[i]['name'],
                                'id': _map[i]['id']
                              };
                            }
                          }
                          //log('Selected sections: $selectedSection');
                          /* if (languageList.contains(val)) {
                              } else {
                                languageList.add(val);
                              }
                              for (int i = 0; i <= _map.length - 1; i++) {
                                if (_selectedlang == _map[i]['name']) {
                                  idList.add(langListId[i]);
                                }
                              }*/
                        });
                        _getGroups(selectedSection['id']);
                      },
                    ),
                  ),
                  /* InkWell(
                        onTap: (){

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
                              Text('timeString',
                                  style: TextStyle(
                                    color: Colors.grey,
                                  )),
                              SizedBox(
                                width: 30,
                                child: Image.asset(
                                  "assets/images/downarrow.png",
                                  height: 15,
                                  width: 15,
                                )
                              ),
                            ],
                          ),
                        ),
                      ),*/
                  SizedBox(height: 16),
                  Text("Choose group".tr(),
                      style: FontConstant.k16w500331FText),
                  SizedBox(height: 4),
                  Container(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    height: 54.h,
                    width: 1.sw,
                    decoration: BoxDecoration(
                        color: Color(0xffFFFFFF),
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    child: _grpLoading
                        ? SizedBox.shrink()
                        : DropdownButton<String>(
                            alignment: Alignment.centerLeft,
                            borderRadius: BorderRadius.circular(30),
                            dropdownColor: Color(0xffffffff),
                            isExpanded: true,
                            hint: Text(
                              "Select group",
                            ),
                            icon: Center(
                              child: Padding(
                                padding: const EdgeInsets.only(right: 16.0),
                                child: Image.asset(
                                  "assets/images/downarrow.png",
                                  height: 15,
                                  width: 15,
                                ),
                              ),
                            ),
                            elevation: 0,
                            underline: SizedBox(),
                            value: _selectedGroup,
                            items: groupList.map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (String? val) {
                              //log('message on changed');
                              setState(() {
                                _selectedGroup = val!;
                                for (int i = 0;
                                    i <= _groupMap.length - 1;
                                    i++) {
                                  if (_selectedGroup == _groupMap[i]['name']) {
                                    selectedGroup = {
                                      'name': _map[i]['name'],
                                      'id': _map[i]['id']
                                    };
                                  }
                                }
                                /*for (var v in groupList){
                                if(_selectedGroup == v){
                                  selectedGroup = {
                                    'name': v['name'],
                                    'id': v['id']
                                  };
                                }
                              }*/
                                /*for (var v in selectedSection.values){
                                if(_selectedSection == v['name']){
                                  _getGroups(v['id']);
                                }
                              }*/
                              });
                            },
                          ),
                  ),
                  SizedBox(height: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Age".tr(),
                        style: FontConstant.k16w500331FText,
                      ),
                      SizedBox(height: 5),
                      Container(
                        //height: 64.h,
                        width: 1.sw,
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          validator: (motherName) {
                            if (motherName == null || motherName.isEmpty) {
                              return "This field cannot be empty".tr();
                            } else {
                              return null;
                            }
                          },
                          style: FontConstant.k18w5008471Text,
                          decoration: CustomInputDecoration(
                                  hintText: "Enter your kid's age")
                              .decoration(),
                          controller: kidAgeController,
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Birthday".tr(),
                        style: FontConstant.k16w500331FText,
                      ),
                      SizedBox(height: 5),
                      TextFormField(
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1970),
                              lastDate: DateTime(2100));

                          if (pickedDate != null) {
                            print(
                                pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                            String formattedDate =
                                DateFormat('yyyy-MM-dd').format(pickedDate);
                            print(
                                formattedDate); //formatted date output using intl package =>  2021-03-16
                            //you can implement different kind of Date Format here according to your requirement

                            setState(() {
                              kidBirthdayController.text =
                                  formattedDate; //set output date to TextField value.
                            });
                          } else {
                            print("Date is not selected");
                          }
                        },
                        readOnly: true,
                        validator: (birth) {
                          if (birth == null || birth.isEmpty) {
                            return 'Enter date of birth';
                          }
                          return null;
                        },
                        controller: kidBirthdayController,
                        style: FontConstant.k18w5008471Text,
                        decoration: InputDecoration(
                          suffixIconConstraints:
                              BoxConstraints(minHeight: 21, minWidth: 21),
                          suffixIcon: Padding(
                            padding: const EdgeInsets.only(right: 15),
                            child: GestureDetector(
                              onTap: () async {
                                DateTime? pickedDate = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(1970),
                                    lastDate: DateTime(2100));

                                if (pickedDate != null) {
                                  print(
                                      pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                                  String formattedDate =
                                      DateFormat('yyyy-MM-dd')
                                          .format(pickedDate);
                                  print(
                                      formattedDate); //formatted date output using intl package =>  2021-03-16
                                  //you can implement different kind of Date Format here according to your requirement
                                  setState(() {
                                    kidBirthdayController.text =
                                        formattedDate; //set output date to TextField value.
                                  });
                                } else {
                                  print("Date is not selected");
                                }

                                // showDialog(
                                //   context: context,
                                //   builder: (_) => AlertDialog(
                                //     content: CupertinoDatePicker(
                                //       mode: CupertinoDatePickerMode.date,
                                //       onDateTimeChanged: (v) {},
                                //       initialDateTime: DateTime.now(),
                                //       minimumYear: 1990,
                                //       maximumYear: 2023,
                                //     ),
                                //   ),
                                // );
                              },
                              child: ImageIcon(
                                AssetImage("assets/images/calendericon.png"),
                                size: 21,
                              ),
                            ),
                          ),
                          suffixIconColor: Color(0xffB7A4B2),
                          contentPadding: EdgeInsets.all(14.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30.0)),
                            borderSide: BorderSide(
                                color: Color(0xffBE74AA), width: 1.0),
                          ),
                          isDense: true,
                          hintText: "yyyy/mm/dd".tr(),
                          filled: true,
                          fillColor: Colors.white,
                          hintStyle: FontConstant.k14w400lightText.copyWith(
                              color: Color(0xffB7A4B2),
                              fontSize: 16.0,
                              fontWeight: FontWeight.w400),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Gender".tr(),
                        style: FontConstant.k16w500331FText,
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 20),
                        height: 60.h,
                        width: 1.sw,
                        decoration: BoxDecoration(
                            color: Color(0xffFFFFFF),
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
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
                            value: _selectedText,
                            items: <String>[
                              'Male'.tr(),
                              'Female'.tr(),
                            ].map((String value) {
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
                                _selectedText = val!;
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Profile Photo".tr(),
                        style: FontConstant.k16w500331FText,
                      ),
                      InkWell(
                        onTap: () async {
                          XFile? image = await _picker.pickImage(
                            source: ImageSource.gallery,
                          );
                          print(_pickedImage.path);
                          setState(() {
                            _pickedImage = File(image!.path);
                          });
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: Text(
                                  _pickedImage.path == ""
                                      ? "Upload primary photo".tr()
                                      : "1 image selected".tr(),
                                  style: FontConstant.k14w400lightText.copyWith(
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
                          ),
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
                      ),
                    ],
                  ),
                  SizedBox(height: 35),
                  SizedBox(
                      height: 52.h,
                      width: 1.sw,
                      child: _btnLoading
                          ? Center(
                              child: CircularProgressIndicator(),
                            )
                          : MainButton(
                              onTap: () {
                                if (_formKey.currentState!.validate()) {
                                  setState(() {
                                    _btnLoading = true;
                                  });
                                  final resp = KidsSignupInfo().get(
                                    kidName: kidNameController.text,
                                    kidSection: selectedSection['id'],
                                    kidGroup: selectedGroup['id'],
                                    kidAge: kidAgeController.text,
                                    kidBirthday: kidBirthdayController.text,
                                    kidGender: _selectedText,
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
                                      setState(() {
                                        _btnLoading = false;
                                      });
                                      widget.onContinue();
                                    }
                                  });
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
                  /* AnimatedContainer(
                      height: fatherNode.hasFocus ? 400 : 0,
                      duration: Duration(milliseconds: 100)),
                  AnimatedContainer(
                      height: addressNode.hasFocus ? 400 : 0,
                      duration: Duration(milliseconds: 100)),*/
                  SizedBox(
                    height: 300.h,
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

class CustomTextfield extends StatelessWidget {
  const CustomTextfield({
    Key? key,
    required this.text,
    required this.desc,
    required this.controller,
  }) : super(key: key);

  final String text;
  final String desc;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: FontConstant.k16w500331FText,
        ),
        Container(
          height: 60.h,
          width: 1.sw,
          child: Container(
            height: 56.h,
            width: 382.w,
            child: TextFormField(
              controller: controller,
              style: FontConstant.k18w5008471Text,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(14.0),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    borderSide: BorderSide(color: Colors.white, width: 1.0)),
                disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white, width: 1.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  borderSide: BorderSide(color: Color(0xffBE74AA), width: 1.0),
                ),
                isDense: true,
                hintText: desc,
                filled: true,
                fillColor: Colors.white,
                hintStyle: FontConstant.k14w400lightText.copyWith(
                    color: Color(0xffB7A4B2),
                    fontSize: 16.0,
                    fontWeight: FontWeight.w400),
              ),
              /*  controller: controller,*/
            ),
          ),
        ),
      ],
    );
  }
}
