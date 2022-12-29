import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kidseau/Theme.dart';
import 'package:kidseau/Widgets/buttons.dart';
import 'package:kidseau/Widgets/textfields.dart';

class KidsDetails extends StatefulWidget {
  final Function onContinue;
  const KidsDetails({Key? key, required this.onContinue}) : super(key: key);

  @override
  State<KidsDetails> createState() => _KidsDetailsState();
}

class _KidsDetailsState extends State<KidsDetails> {
  final TextEditingController datepicker = TextEditingController();
  File _pickedImage = File('');
  final _picker = ImagePicker();
  // XFile? _image;
  String thumbnail = '';

  String _selectedText = "male";
  String _selectedgroup = "A";
  String _selectedsection = "A";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: ThemeColor.primarycolor.withOpacity(.06),
          width: 1.sw,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    "Kid’s Information",
                    style: FontConstant2.k24w500331Ftext,
                    textAlign: TextAlign.start,
                  ),
                ),
                SizedBox(height: 24),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Kid’s name",
                      style: FontConstant.k16w500331FText,
                    ),
                    Container(
                      height: 60.h,
                      width: 1.sw,
                      child: textfield(context, "Enter your Kid’s name"),
                    )
                  ],
                ),
                SizedBox(height: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Class Section",
                      style: FontConstant.k16w500331FText,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 20),
                      height: 60.h,
                      width: 1.sw,
                      decoration: BoxDecoration(
                          color: Color(0xffFFFFFF),
                          borderRadius: BorderRadius.all(Radius.circular(30))),
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
                          value: _selectedsection,
                          items: <String>['A', 'B', 'C'].map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String? val) {
                            setState(() {
                              _selectedsection = val!;
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
                      "Class group",
                      style: FontConstant.k16w500331FText,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 20),
                      height: 60.h,
                      width: 1.sw,
                      decoration: BoxDecoration(
                          color: Color(0xffFFFFFF),
                          borderRadius: BorderRadius.all(Radius.circular(30))),
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
                          value: _selectedgroup,
                          items: <String>['A', 'B', 'C'].map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String? val) {
                            setState(() {
                              _selectedgroup = val!;
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
                      "Age",
                      style: FontConstant.k16w500331FText,
                    ),
                    Container(
                        height: 60.h,
                        width: 1.sw,
                        child: textfield(context, "Enter your Kid’s age")),
                    SizedBox(height: 5),
                  ],
                ),
                SizedBox(height: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Birthday",
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
                            datepicker.text =
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
                      controller: datepicker,
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
                                  datepicker.text =
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
                  ],
                ),
                SizedBox(height: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Gender",
                      style: FontConstant.k16w500331FText,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 20),
                      height: 60.h,
                      width: 1.sw,
                      decoration: BoxDecoration(
                          color: Color(0xffFFFFFF),
                          borderRadius: BorderRadius.all(Radius.circular(30))),
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
                  ],
                ),
                SizedBox(height: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Profile Photo",
                      style: FontConstant.k16w500331FText,
                    ),
                    InkWell(
                      onTap: () async {
                        XFile? image = await _picker.pickImage(
                          source: ImageSource.gallery,
                        );
                        print(_pickedImage.path);
                        if (_pickedImage.isAbsolute) {
                          setState(() {
                            _pickedImage = File(image!.path);
                          });
                        }
                      },
                      child: Container(
                          height: 56.h,
                          width: 386.w,
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
                    ),
                  ],
                ),
                SizedBox(height: 35),
                SizedBox(
                    height: 52.h,
                    width: 384.w,
                    child: MainButton(
                        onTap: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //       builder: (context) => ParentInfo()),
                          // );
                          widget.onContinue();
                        },
                        title: "Continue",
                        textStyleColor: Colors.white,
                        backgroundColor: ThemeColor.primarycolor)),
                SizedBox(
                  height: 253,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
