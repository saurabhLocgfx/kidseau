import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kidseau/Theme.dart';

class PFees extends StatefulWidget {
  const PFees({Key? key}) : super(key: key);

  @override
  State<PFees> createState() => _PFeesState();
}

class _PFeesState extends State<PFees> {
  var feeimage = [
    "assets/images/feesimage1.png",
    "assets/images/feesimage2.png",
    "assets/images/feesimage1.png",
    "assets/images/feesimage2.png"
  ];
  var feeschool = ["ABC School", "XYZ School", "ABC School", "XYZ School"];

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
          "Fees".tr(),
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
      body: Stack(
        children: [
          Image.asset(
            "assets/images/postsbackground.png",
            height: 414,
            width: 414,
            color: Color(0xffD9D9D9),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 110),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Remaining fees",
                      style: FontConstant.k24w500brownText,
                    ),
                    Text(
                      "\$249",
                      style: FontConstant.k24w500brownText,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Total Paid fees",
                      style: FontConstant.k16w4008471Text,
                    ),
                    SizedBox(height: 16),
                    Text(
                      "\$500",
                      style: FontConstant.k16w4008471Text,
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "View Fees Structure".tr(),
                    style: FontConstant.k18w5008267Text,
                  ),
                ),
                SizedBox(height: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Previous Payment",
                      style:
                          FontConstant.k22w5008471Text.copyWith(fontSize: 22),
                    ),
                    SizedBox(
                      width: 382.w,
                      height: 400.h,
                      child: ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          itemCount: 4,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: Row(
                                children: [
                                  Container(
                                    height: 67,
                                    width: 50,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        image: DecorationImage(
                                            image: AssetImage(
                                                "assets/images/feesimage1.png"))),
                                  ),
                                  SizedBox(width: 16),
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Paid to",
                                              style:
                                                  FontConstant.k16w400B7A4Text,
                                            ),
                                            Text(
                                              "Paid to",
                                              style:
                                                  FontConstant.k18w500331FText,
                                            ),
                                          ],
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Text(
                                              "24/09/2022",
                                              style:
                                                  FontConstant.k16w400B7A4Text,
                                            ),
                                            Text(
                                              "\$98",
                                              style:
                                                  FontConstant.k18w500331FText,
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
