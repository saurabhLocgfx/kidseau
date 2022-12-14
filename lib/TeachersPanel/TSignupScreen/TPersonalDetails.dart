import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kidseau/Theme.dart';
import 'package:kidseau/Widgets/buttons.dart';
import 'package:kidseau/api/Teacherpanelapi/teacher_lang_api/teacherlang.dart';
import 'package:kidseau/api/Teacherpanelapi/teacher_login_apis/teacher_info_fill.dart';

import 'TWaitingScreen.dart';

class TPersonalDetails extends StatefulWidget {
  final bool isEmail;
  String mobileText;
  TPersonalDetails({Key? key, required this.isEmail, required this.mobileText})
      : super(key: key);

  @override
  State<TPersonalDetails> createState() => _TPersonalDetailsState();
}

class _TPersonalDetailsState extends State<TPersonalDetails> {
  String _selectedText = "male";
  String _selectedlang = "";
  final TextEditingController firstName = TextEditingController();
  final TextEditingController familyName = TextEditingController();
  final TextEditingController emailAddress = TextEditingController();
  final TextEditingController phoneNumber = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController educationController = TextEditingController();
  final TextEditingController yearController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  List<String> languageList = [];
  List<String> langList = [];
  List<String> langListId = [];
  List<String> idList = [];
  List<Map<String, dynamic>> _map = [];
  //bool phoneEmail = isEmail;

  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(Duration.zero, () {
      getdata();
    });

    super.initState();
  }

  getdata() {
    final resp = TeacherLanguage().get();
    resp.then((value) {
      log(value.toString());
      setState(() {
        for (var v in value['teacher lang']) {
          langList.add(v['lang_name']);
          langListId.add(v['lang_id']);
          _map.add({'name': v['lang_name'], 'id': v['lang_id']});
        }
      });
      _selectedlang = langList[0];
      print(langList);
      print(_selectedText);
      // langList.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(height: 72.h),
                Image.asset(
                  "assets/images/logo without text.png",
                  height: 63,
                  width: 52,
                ),
                SizedBox(height: 30.h),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    "Personal details".tr(),
                    style: FontConstant2.k24w500331Ftext,
                    textAlign: TextAlign.start,
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "First name".tr(),
                      style: FontConstant.k16w500331FText,
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      validator: (name) {
                        if (name == null || name.isEmpty) {
                          return 'Enter first name';
                        }
                        return null;
                      },
                      controller: firstName,
                      style: FontConstant.k18w5008471Text,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(14.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30.0)),
                          borderSide:
                              BorderSide(color: Color(0xffBE74AA), width: 1.0),
                        ),

/*                        enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30.0)),
                            borderSide:
                                BorderSide(color: Colors.white, width: 1.0))*/
                        /*disabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.white, width: 1.0),
                        ),*/
                        /*focusedBorder: OutlineInputBorder(

                            */ /* borderRadius: BorderRadius.all(Radius.circular(30.0)),

                          borderSide:
                              BorderSide(color: Color(0xffBE74AA), width: 1.0),*/ /*
                            ),*/
                        hintText: "Enter your first name".tr(),
                        filled: true,
                        fillColor: Colors.white,
                        hintStyle: FontConstant.k14w400lightText.copyWith(
                            color: Color(0xffB7A4B2),
                            fontSize: 16.0,
                            fontWeight: FontWeight.w400),
                      ),
                      /*  controller: controller,*/
                    )
                  ],
                ),
                SizedBox(height: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Family name".tr(),
                      style: FontConstant.k16w500331FText,
                    ),
                    SizedBox(height: 4),
                    TextFormField(
                      validator: (familynames) {
                        if (familynames == null || familynames.isEmpty) {
                          return 'Enter your family name';
                        }
                      },
                      controller: familyName,
                      style: FontConstant.k18w5008471Text,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(14.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30.0)),
                          borderSide:
                              BorderSide(color: Color(0xffBE74AA), width: 1.0),
                        ),
                        /* enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30.0)),
                            borderSide:
                                BorderSide(color: Colors.white, width: 1.0)),
                        disabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.white, width: 1.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(30.0)),
                          borderSide: BorderSide(
                              color: Color(0xffBE74AA), width: 1.0),
                        ),*/
                        isDense: true,
                        hintText: "Enter your family name".tr(),
                        filled: true,
                        fillColor: Colors.white,
                        hintStyle: FontConstant.k14w400lightText.copyWith(
                            color: Color(0xffB7A4B2),
                            fontSize: 16.0,
                            fontWeight: FontWeight.w400),
                      ),
                      /*  controller: controller,*/
                    )
                  ],
                ),
                SizedBox(height: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    widget.isEmail
                        ? Text(
                            "Phone Number".tr(),
                            style: FontConstant.k16w500331FText,
                          )
                        : Text(
                            "Email address".tr(),
                            style: FontConstant.k16w500331FText,
                          ),
                    SizedBox(height: 4),
                    widget.isEmail
                        ? TextFormField(
                            validator: (emailadd) {
                              if (emailadd == null || emailadd.isEmpty) {
                                return "Enter phone number";
                              }
                              return null;
                            },
                            controller: phoneNumber,
                            style: FontConstant.k18w5008471Text,
                            decoration: InputDecoration(
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
                              /* enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30.0)),
                            borderSide:
                                BorderSide(color: Colors.white, width: 1.0)),
                        disabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.white, width: 1.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(30.0)),
                          borderSide: BorderSide(
                              color: Color(0xffBE74AA), width: 1.0),
                        ),*/
                              isDense: true,
                              hintText: "Enter your mobile number",
                              filled: true,
                              fillColor: Colors.white,
                              hintStyle: FontConstant.k14w400lightText.copyWith(
                                  color: Color(0xffB7A4B2),
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w400),
                            ),
                            /*  controller: controller,*/
                          )
                        : TextFormField(
                            validator: (emailadd) {
                              if (emailadd == null || emailadd.isEmpty) {
                                return "Enter email address";
                              }
                              return null;
                            },
                            controller: emailAddress,
                            style: FontConstant.k18w5008471Text,
                            decoration: InputDecoration(
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
                              /* enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30.0)),
                            borderSide:
                                BorderSide(color: Colors.white, width: 1.0)),
                        disabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.white, width: 1.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(30.0)),
                          borderSide: BorderSide(
                              color: Color(0xffBE74AA), width: 1.0),
                        ),*/
                              isDense: true,
                              hintText: "Enter your email address".tr(),
                              filled: true,
                              fillColor: Colors.white,
                              hintStyle: FontConstant.k14w400lightText.copyWith(
                                  color: Color(0xffB7A4B2),
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w400),
                            ),
                            /*  controller: controller,*/
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
                    SizedBox(height: 4),
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
                            dateController.text =
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
                      controller: dateController,
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
                                    DateFormat('yyyy-MM-dd').format(pickedDate);
                                print(
                                    formattedDate); //formatted date output using intl package =>  2021-03-16
                                //you can implement different kind of Date Format here according to your requirement

                                setState(() {
                                  dateController.text =
                                      formattedDate; //set output date to TextField value.
                                });
                              } else {
                                print("Date is not selected");
                              }
                            },
                            // onTap: () {
                            //   showDatePicker(
                            //       context: context,
                            //       initialDate: DateTime.now(),
                            //       firstDate: DateTime(1970),
                            //       lastDate: DateTime(2100));
                            // },
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
                          borderRadius: BorderRadius.all(Radius.circular(30.0)),
                          borderSide:
                              BorderSide(color: Color(0xffBE74AA), width: 1.0),
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
                    /*IconTextfield(
                        Icon: "assets/images/calendericon.png",
                        title: "dd/mm/yyyy")*/
                  ],
                ),
                SizedBox(height: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Education".tr(),
                      style: FontConstant.k16w500331FText,
                    ),
                    SizedBox(height: 4),
                    TextFormField(
                      validator: (edu) {
                        if (edu == null || edu.isEmpty) {
                          return "Enter your education";
                        }
                        return null;
                      },
                      controller: educationController,
                      style: FontConstant.k18w5008471Text,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(14.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30.0)),
                          borderSide:
                              BorderSide(color: Color(0xffBE74AA), width: 1.0),
                        ),
                        isDense: true,
                        hintText: "Enter your highest degree".tr(),
                        filled: true,
                        fillColor: Colors.white,
                        hintStyle: FontConstant.k14w400lightText.copyWith(
                            color: Color(0xffB7A4B2),
                            fontSize: 16.0,
                            fontWeight: FontWeight.w400),
                      ),
                      /*  controller: controller,*/
                    ),
                    //textfield(context, "Enter your highest degree")
                  ],
                ),
                SizedBox(height: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Year of experiance".tr(),
                      style: FontConstant.k16w500331FText,
                    ),
                    SizedBox(height: 4),
                    TextFormField(
                      validator: (year) {
                        if (year == null || year.isEmpty) {
                          return "Enter your education";
                        }
                        return null;
                      },
                      controller: yearController,
                      style: FontConstant.k18w5008471Text,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(14.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30.0)),
                          borderSide:
                              BorderSide(color: Color(0xffBE74AA), width: 1.0),
                        ),
                        isDense: true,
                        hintText: "Enter your highest degree".tr(),
                        filled: true,
                        fillColor: Colors.white,
                        hintStyle: FontConstant.k14w400lightText.copyWith(
                            color: Color(0xffB7A4B2),
                            fontSize: 16.0,
                            fontWeight: FontWeight.w400),
                      ),
                      /*  controller: controller,*/
                    )
                    //textfield(context, "Enter your highest degree")
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
                    SizedBox(height: 4),
                    Container(
                      padding: EdgeInsets.only(left: 20),
                      height: 60.h,
                      width: 1.sw,
                      decoration: BoxDecoration(
                          color: Color(0xffFFFFFF),
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      child: Center(
                        child: Container(
                          color: Colors.white,
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
                            items: <String>['male', 'female', 'other']
                                .map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
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
                    ),
                    /*  IconTextfield(
                        Icon: "assets/images/downarrow.png",
                        title: "Select your gender")*/
                  ],
                ),
                SizedBox(height: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Address".tr(),
                      style: FontConstant.k16w500331FText,
                    ),
                    SizedBox(height: 4),
                    TextFormField(
                      validator: (add) {
                        if (add == null || add.isEmpty) {
                          return "Enter your address";
                        }
                        return null;
                      },
                      controller: addressController,
                      style: FontConstant.k18w5008471Text,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(14.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30.0)),
                          borderSide:
                              BorderSide(color: Color(0xffBE74AA), width: 1.0),
                        ),
                        isDense: true,
                        hintText: "Enter your parmanent address".tr(),
                        filled: true,
                        fillColor: Colors.white,
                        hintStyle: FontConstant.k14w400lightText.copyWith(
                            color: Color(0xffB7A4B2),
                            fontSize: 16.0,
                            fontWeight: FontWeight.w400),
                      ),
                      /*  controller: controller,*/
                    ),
                    //textfield(context, "Enter your parmanent address")
                  ],
                ),
                SizedBox(height: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Languages",
                      style: FontConstant.k16w500331FText,
                    ),
                    SizedBox(height: 4),
                    Container(
                      padding: EdgeInsets.only(left: 20),
                      height: 62.h,
                      width: 1.sw,
                      decoration: BoxDecoration(
                          color: Color(0xffFFFFFF),
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      child: DropdownButton<String>(
                        alignment: Alignment.topCenter,
                        borderRadius: BorderRadius.circular(30),
                        dropdownColor: Color(0xffffffff),
                        isExpanded: true,
                        hint: Text(
                          "Choose Language",
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
                        value: _selectedlang,
                        items: langList.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? val) {
                          setState(() {
                            _selectedlang = val!;
                            if (languageList.contains(val)) {
                            } else {
                              languageList.add(val);
                            }
                            for (int i = 0; i <= _map.length - 1; i++) {
                              if (_selectedlang == _map[i]['name']) {
                                idList.add(langListId[i]);
                              }
                            }
                          });
                        },
                      ),
                    ),
                    /*  IconTextfield(
                        Icon: "assets/images/downarrow.png",
                        title: "Select your gender")*/
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 40,
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: languageList.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, i) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(40),
                                    border: Border.all(
                                        color: ThemeColor.primarycolor,
                                        width: 1)),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(languageList[i]),
                                    InkWell(
                                        onTap: () {
                                          setState(() {
                                            languageList.removeAt(i);
                                          });
                                        },
                                        child: Icon(Icons.close))
                                  ],
                                ),
                              ),
                            );
                          }),
                    ),
                  ],
                ),
                SizedBox(
                  height: 65.h,
                ),
                SizedBox(
                  height: 52,
                  width: 1.sw,
                  child: MainButton(
                      onTap: () {
                        print(langListId);
                        print(langList);
                        print(languageList);
                        print(idList);
                        print(widget.mobileText);
                        /*Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => TDashboard()));*/
                        if (_formKey.currentState!.validate()) {
                          final resp = TeacherInfoFill().get(
                            fname: firstName.text,
                            familyname: familyName.text,
                            email: widget.isEmail
                                ? widget.mobileText
                                : emailAddress.text,
                            phone: widget.isEmail
                                ? phoneNumber.text
                                : widget.mobileText,
                            dateofbirth: dateController.text,
                            education: educationController.text,
                            exp: yearController.text,
                            gender: _selectedText,
                            address: addressController.text,
                            language: idList,
                          );
                          resp.then((value) {
                            print(value);
                            if (value['status'] == 0) {
                              Fluttertoast.showToast(msg: value['msg']);
                            } else {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => TWaitingScreen()),
                              );
                            }
                          });
                        }
                      },
                      title: "Continue",
                      textStyleColor: Colors.white,
                      backgroundColor: ThemeColor.primarycolor),
                ),
                SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
