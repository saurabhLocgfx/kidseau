import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kidseau/Theme.dart';
import 'package:kidseau/Widgets/buttons.dart';

class PVouchercode extends StatefulWidget {
  PVouchercode({Key? key}) : super(key: key);

  @override
  State<PVouchercode> createState() => _PVouchercodeState();
}

class _PVouchercodeState extends State<PVouchercode> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 896.h,
      width: 414.w,
      child: Scaffold(
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
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                SizedBox(height: 110),
                Container(
                  height: 93.h,
                  width: 1.sw,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          image: AssetImage("assets/images/vouchercard.png"),
                          fit: BoxFit.cover)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Current Code".tr(),
                                style: FontConstant.k16w4008471Text
                                    .copyWith(color: Colors.white)),
                            Text("Valid till".tr(),
                                style: FontConstant.k16w4008471Text
                                    .copyWith(color: Colors.white)),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "JKAHDIUWCE",
                              style: FontConstant2.k24w5008267text
                                  .copyWith(color: Colors.white),
                            ),
                            Text(
                              "JKAHDIUWCE",
                              style: FontConstant.k18w500331FText
                                  .copyWith(color: Colors.white),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Issued by".tr(),
                      style: FontConstant.k16w400331FText,
                    ),
                    Text(
                      "ABC Nursery School".tr(),
                      style: FontConstant.k16w4008471Text,
                    ),
                  ],
                ),
                SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Issued date".tr(),
                      style: FontConstant.k16w400331FText,
                    ),
                    Text(
                      "January 2022",
                      style: FontConstant.k16w4008471Text,
                    ),
                  ],
                ),
                SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Issued by".tr(),
                      style: FontConstant.k16w400331FText,
                    ),
                    Text(
                      "Nobita",
                      style: FontConstant.k16w4008471Text,
                    ),
                  ],
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                      height: 52,
                      width: 382,
                      child: MainButton(
                          onTap: () {
                            // Navigator.of(context).push(
                            //   MaterialPageRoute(
                            //     builder: (context) => changevouchercode(),
                            //   ),
                            // );
                          },
                          title: "Change Voucher Code".tr(),
                          textStyleColor: Colors.white,
                          backgroundColor: ThemeColor.primarycolor),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                )
              ],
            ),
          )),
    );
  }
}
