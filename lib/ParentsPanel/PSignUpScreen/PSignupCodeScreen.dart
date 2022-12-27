import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kidseau/Theme.dart';
import 'package:kidseau/Widgets/buttons.dart';
import 'package:kidseau/Widgets/widgets.dart';
import 'package:kidseau/api/parent_signup_apis/voucher_code_api.dart';

import '../../Parentinfo.dart';

class PSignupCode extends StatelessWidget {
  PSignupCode({Key? key}) : super(key: key);

  final TextEditingController voucherCodeText = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 896.h,
      width: 414.w,
      child: Scaffold(
        backgroundColor: Color(0xfff7f6fa),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Form(
              key: _formKey,
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 80),
                    mainlogo(),
                    SizedBox(height: 08),
                    Text(
                      "We offer a new way to track your children and watch them grow"
                          .tr(),
                      style: FontConstant.k16w4008471Text,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 35),
                    Text(
                      "Voucher’s code".tr(),
                      style: FontConstant.k16w500331FText,
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(height: 5),
                    Container(
                      height: 56.h,
                      width: 382.w,
                      child: TextFormField(
                        validator: (voucherCode) {
                          if (voucherCode == null || voucherCode.isEmpty) {
                            return 'Enter Voucher code'.tr();
                          }
                          return null;
                        },
                        controller: voucherCodeText,
                        style: FontConstant.k18w5008471Text,
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
                            borderRadius:
                                BorderRadius.all(Radius.circular(30.0)),
                            borderSide: BorderSide(
                                color: Color(0xffBE74AA), width: 1.0),
                          ),
                          isDense: true,
                          hintText: "Enter your Voucher’s code".tr(),
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
                    SizedBox(height: 04),
                    Padding(
                      padding: const EdgeInsets.only(left: 14.0),
                      child: Text(
                        "Vouchers are given by kid’s school".tr(),
                        style: FontConstant.k14w400B7A4Text,
                      ),
                    ),
                    SizedBox(height: 25),
                    Container(
                      height: 214.h,
                      width: 382.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          image: DecorationImage(
                              image: AssetImage(
                                "assets/images/laptopbackgroundplay.png",
                              ),
                              fit: BoxFit.cover)),
                      child: Center(
                          child: Image.asset(
                        "assets/images/playicon.png",
                        height: 46,
                        width: 46,
                      )),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    SizedBox(
                      height: 52.h,
                      width: 382.w,
                      child: MainButton(
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              final resp = VoucherCode()
                                  .get(Vouchercode: voucherCodeText.text);
                              resp.then((value) {
                                print(value);
                                if (value['status'] == 0) {
                                  Fluttertoast.showToast(msg: value['msg']);
                                } else {
                                  //navigate to
                                  //UserPrefs.setCookies(value['key']);
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => ParentInfo()));
                                  /* Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => PDashboard()),
                                );*/
                                  /*Fluttertoast.showToast(
                                    msg: 'Your OTP is ${value['voucher']}');*/
                                }
                              });
                              print(voucherCodeText.text);
                            }
                          }
                          // Navigator.push(
                          //   context,
                          // MaterialPageRoute(
                          //     builder: (context) => Informationfill()),
                          // );
                          ,
                          title: "Continue".tr(),
                          textStyleColor: Colors.white,
                          backgroundColor: ThemeColor.primarycolor),
                    ),
                    SizedBox(height: 13.h),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
