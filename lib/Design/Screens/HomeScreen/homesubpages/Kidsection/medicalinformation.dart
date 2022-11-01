import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kidseau/Theme.dart';
import 'package:kidseau/Widgets/buttons.dart';
import 'package:kidseau/Widgets/textfields.dart';

class MedicalInformation extends StatefulWidget {
  const MedicalInformation({Key? key}) : super(key: key);

  @override
  State<MedicalInformation> createState() => _MedicalInformationState();
}

class _MedicalInformationState extends State<MedicalInformation> {
  bool isChecked = false;
  bool isChecked2 = false;
  bool isChecked3 = false;
  bool isChecked4 = false;

  bool isChecked5 = false;
  bool isChecked6 = false;
  bool isChecked7 = false;
  bool isChecked8 = false;
  bool isChecked9 = false;
  bool isChecked10 = false;
  bool isChecked11 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Color(0xff8267AC).withOpacity(0.16),
        ),
        backgroundColor: Color(0xff8267AC).withOpacity(0.16),
        title: Text(
          "Back",
          style: FontConstant.k18w5008471Text,
        ),
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
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  "Medical Information",
                  style: FontConstant2.k24w500331Ftext,
                  textAlign: TextAlign.start,
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Blood group",
                    style: FontConstant.k16w500331FText,
                  ),
                  SizedBox(height: 4),
                  textfield(context, "Enter kid’s blood group")
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Weight",
                    style: FontConstant.k16w500331FText,
                  ),
                  SizedBox(height: 4),
                  textfield(context, "Enter kid’s weight in kg")
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Height",
                    style: FontConstant.k16w500331FText,
                  ),
                  SizedBox(height: 4),
                  textfield(context, "Enter kid’s height in ft")
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Select medical status",
                    style: FontConstant.k16w500331FText,
                  ),
                  SizedBox(height: 4),
                  SizedBox(
                    height: 56.h,
                    width: 382.w,
                    child: IconTextfield(
                        Icon: "assets/images/arrowdown.png",
                        title: "Select gender"),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Select medical status",
                    style: FontConstant.k16w500331FText,
                  ),
                  SizedBox(height: 4),
                  Container(
                    height: 138.h,
                    width: 382.w,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    child: TextFormField(
                      decoration: InputDecoration(
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
                              BorderSide(color: Colors.white, width: 1.0),
                        ),
                        isDense: true,
                        hintText: "Write here....",
                        filled: true,
                        fillColor: Colors.white,
                        hintStyle: FontConstant.k14w400lightText.copyWith(
                            color: Color(0xffB7A4B2),
                            fontSize: 16.0,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Covid Vaccination",
                    style: FontConstant.k16w500331FText,
                  ),
                  SizedBox(height: 4),
                  Row(
                    children: [
                      Checkbox(
                        activeColor: Color(0xffBE74AA),
                        checkColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        value: isChecked,
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked = value!;
                          });
                        },
                      ),
                      Text(
                        "All",
                        style: FontConstant.k16w4008471Text,
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(
                        activeColor: Color(0xffBE74AA),
                        checkColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        value: isChecked2,
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked2 = value!;
                          });
                        },
                      ),
                      Text(
                        "Father",
                        style: FontConstant.k16w4008471Text,
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(
                        activeColor: Color(0xffBE74AA),
                        checkColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        value: isChecked3,
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked3 = value!;
                          });
                        },
                      ),
                      Text(
                        "Mother",
                        style: FontConstant.k16w4008471Text,
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(
                        activeColor: Color(0xffBE74AA),
                        checkColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        value: isChecked4,
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked4 = value!;
                          });
                        },
                      ),
                      Text(
                        "Kid",
                        style: FontConstant.k16w4008471Text,
                      )
                    ],
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Other Vaccination",
                    style: FontConstant.k16w500331FText,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            "BCG/AVB",
                            style: FontConstant.k16w5008471Text,
                          ),
                          SizedBox(width: 16),
                          Text(
                            "Birth",
                            style: FontConstant.k16w500B7A4Text,
                          ),
                        ],
                      ),
                      Checkbox(
                        activeColor: Color(0xffBE74AA),
                        checkColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        value: isChecked5,
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked5 = value!;
                          });
                        },
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            "VPI-HVB",
                            style: FontConstant.k16w5008471Text,
                          ),
                          SizedBox(width: 16),
                          Text(
                            "2 Months",
                            style: FontConstant.k16w500B7A4Text,
                          ),
                        ],
                      ),
                      Checkbox(
                        activeColor: Color(0xffBE74AA),
                        checkColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        value: isChecked6,
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked6 = value!;
                          });
                        },
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            "VPI-AVB",
                            style: FontConstant.k16w5008471Text,
                          ),
                          SizedBox(width: 16),
                          Text(
                            "4 Months",
                            style: FontConstant.k16w500B7A4Text,
                          ),
                        ],
                      ),
                      Checkbox(
                        activeColor: Color(0xffBE74AA),
                        checkColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        value: isChecked7,
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked7 = value!;
                          });
                        },
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            "ROR",
                            style: FontConstant.k16w5008471Text,
                          ),
                          SizedBox(width: 16),
                          Text(
                            "11 Months",
                            style: FontConstant.k16w500B7A4Text,
                          ),
                        ],
                      ),
                      Checkbox(
                        activeColor: Color(0xffBE74AA),
                        checkColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        value: isChecked8,
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked8 = value!;
                          });
                        },
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            "VPI-HVB",
                            style: FontConstant.k16w5008471Text,
                          ),
                          SizedBox(width: 16),
                          Text(
                            "12 Months",
                            style: FontConstant.k16w500B7A4Text,
                          ),
                        ],
                      ),
                      Checkbox(
                        activeColor: Color(0xffBE74AA),
                        checkColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        value: isChecked9,
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked9 = value!;
                          });
                        },
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            "ROR",
                            style: FontConstant.k16w5008471Text,
                          ),
                          SizedBox(width: 16),
                          Text(
                            "18 Months",
                            style: FontConstant.k16w500B7A4Text,
                          ),
                        ],
                      ),
                      Checkbox(
                        activeColor: Color(0xffBE74AA),
                        checkColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        value: isChecked10,
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked10 = value!;
                          });
                        },
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            "D-TCA",
                            style: FontConstant.k16w5008471Text,
                          ),
                          SizedBox(width: 16),
                          Text(
                            "6 Years",
                            style: FontConstant.k16w500B7A4Text,
                          ),
                        ],
                      ),
                      Checkbox(
                        activeColor: Color(0xffBE74AA),
                        checkColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        value: isChecked11,
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked11 = value!;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              SizedBox(
                height: 52,
                width: 382,
                child: MainButton(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MedicalInformation()),
                      );
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
    );
  }
}
