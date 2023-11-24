import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kidseau/TeachersPanel/TSignupScreen/TPersonalDetails.dart';
import 'package:kidseau/TeachersPanel/TSignupScreen/TWaitingScreen.dart';
import 'package:kidseau/Theme.dart';
import 'package:kidseau/Widgets/buttons.dart';
import 'package:kidseau/api/Teacherpanelapi/teacher_login_apis/teacher_sch_code.dart';

class TSignupCode extends StatefulWidget {
  final bool isEmail;
  String mobileText;
  TSignupCode({Key? key, required this.isEmail, required this.mobileText})
      : super(key: key);

  @override
  State<TSignupCode> createState() => _TSignupCodeState();
}

class _TSignupCodeState extends State<TSignupCode> {
  final TextEditingController nurserycode = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 896,
      width: 1.sw,
      child: Scaffold(
        backgroundColor: Color(0xfff7f6fa),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Stack(children: [
                  Container(
                    height: 414,
                    width: 1.sw,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/postsbackground.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 199.0, left: 16, right: 16),
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/images/logo.png",
                          height: 172,
                          width: 173,
                        ),
                        Text(
                          'We offer a new way to mark the children and shape them for better future.'
                              .tr(),
                          style: FontConstant.k16w4008471Text,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  )
                ]),
                SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Nursery code".tr(),
                              style: FontConstant.k24w500brownText),
                          Text(
                            "The school code is provided by director.".tr(),
                            style: FontConstant.k16w400B7A4Text
                                .copyWith(fontSize: 15),
                            textAlign: TextAlign.start,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: [
                      SizedBox(height: 24),
                      TextFormField(
                        validator: (nurseryCode) {
                          if (nurseryCode == null || nurseryCode.isEmpty) {
                            return "Wrong nursery code".tr();
                          }
                          return null;
                        },
                        controller: nurserycode,
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
                          isDense: true,
                          hintText: "Enter your nursery code".tr(),
                          filled: true,
                          fillColor: Colors.white,
                          hintStyle: FontConstant.k14w400lightText.copyWith(
                              color: Color(0xffB7A4B2),
                              fontSize: 16.0,
                              fontWeight: FontWeight.w400),
                        ),
                        /*  controller: controller,*/
                      ),
                      SizedBox(height: 24),
                      SizedBox(
                        height: 52,
                        width: 1.sw,
                        child: loading
                            ? MaterialButton(
                                elevation: 1,
                                color: ThemeColor.primarycolor,
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30))),
                                onPressed: () {},
                                child: Center(
                                  child: SpinKitThreeBounce(
                                    color: Colors.white,
                                  ),
                                ),
                              )
                            : MainButton(
                                onTap: () {
                                  if (_formKey.currentState!.validate()) {
                                    final resp = TeacherSchCode()
                                        .get(code: nurserycode.text);
                                    resp.then((value) {
                                      print(value);
                                      if (value['status'] == 0) {
                                        Fluttertoast.showToast(
                                            msg: value['msg']);
                                      } else if (value['status'] == 2) {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    TWaitingScreen()));
                                      } else {
                                        // UserPrefs.setCookies(value['key']);
                                        print(widget.mobileText);
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    TPersonalDetails(
                                                        isEmail: widget.isEmail,
                                                        mobileText: widget
                                                            .mobileText)));
                                      }
                                    });
                                  }
                                  /*setState(() {
                                    loading = true;
                                  });
                                  Future.delayed(Duration(seconds: 3), () {
                                    setState(() {
                                      loading = false;
                                    });
                                    Navigator.of(context).push(MaterialPageRoute(
                                        builder: (context) =>
                                            TPersonalDetails()));
                                  });*/
                                },
                                title: "Continue".tr(),
                                textStyleColor: Colors.white,
                                backgroundColor: ThemeColor.primarycolor),
                      ),
                      SizedBox(height: 25),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool loading = false;
}
