import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kidseau/Widgets/custom_snack_bar.dart';
import 'package:kidseau/api/parent_panel_apis/parent_profile_apis/parent_change_voucher_code.dart';

import '../../../Theme.dart';
import '../../../Widgets/buttons.dart';
import '../../../Widgets/textfields.dart';

class PChangeVoucherScreen extends StatefulWidget {
  final String kidId;
  final Function onPop;
  PChangeVoucherScreen({Key? key, required this.kidId, required this.onPop})
      : super(key: key);

  @override
  State<PChangeVoucherScreen> createState() => _PChangeVoucherScreenState();
}

class _PChangeVoucherScreenState extends State<PChangeVoucherScreen> {
  final TextEditingController voucherCodeText = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
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
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Color(0xff8267AC).withOpacity(0.16),
        ),
        backgroundColor: Color(0xff8267AC).withOpacity(0.16),
        title: Text(
          "Voucher Code".tr(),
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
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 110),
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
              Text(
                "Voucher’s code".tr(),
                style: FontConstant.k16w500331FText,
                textAlign: TextAlign.start,
              ),
              SizedBox(height: 5),
              Form(
                key: _formKey,
                child: Container(
                  //height: 56.h,
                  width: 1.sw,
                  child: TextFormField(
                    validator: (voucherCode) {
                      if (voucherCode == null || voucherCode.isEmpty) {
                        return 'Enter Voucher code'.tr();
                      }
                      return null;
                    },
                    controller: voucherCodeText,
                    style: FontConstant.k18w5008471Text,
                    decoration: CustomInputDecoration(
                            hintText: "Enter your Voucher’s code".tr())
                        .decoration(),
                    /*  controller: controller,*/
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Vouchers are given by kid’s school".tr(),
                style: FontConstant.k14w400B7A4Text,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 52.h,
        width: 1.sw,
        margin: EdgeInsets.only(left: 16, right: 16, bottom: 16),
        child: MainButton(
            onTap: () {
              if (_formKey.currentState!.validate()) {
                final resp = ParentChangeVoucherCode().get(
                    voucherCode: voucherCodeText.text, kidId: widget.kidId);
                resp.then((value) {
                  print(value);
                  if (value['status'] == 0) {
                    Fluttertoast.showToast(msg: value['msg']);
                  } else {
                    Navigator.of(context).pop();
                    CustomSnackBar.customSnackBar(
                        context, "Voucher updated successfully");
                    widget.onPop();
                  }
                });
                // print(voucherCodeText.text);
              }
            },
            title: "Continue".tr(),
            textStyleColor: Colors.white,
            backgroundColor: ThemeColor.primarycolor),
      ),
    );
  }
}
