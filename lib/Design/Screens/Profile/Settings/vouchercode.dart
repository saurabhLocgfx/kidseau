import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kidseau/Design/Screens/Profile/Settings/changevouchercode.dart';
import 'package:kidseau/Theme.dart';
import 'package:kidseau/Widgets/buttons.dart';

class vouchercode extends StatefulWidget {
  vouchercode({Key? key}) : super(key: key);

  @override
  State<vouchercode> createState() => _vouchercodeState();
}

class _vouchercodeState extends State<vouchercode> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 896.h,
      width: 414.w,
      child: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            elevation: 0,
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Color(0xff8267AC).withOpacity(0.16),
            ),
            backgroundColor: Color(0xff8267AC).withOpacity(0.16),
            title: Text(
              "Voucher Code",
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
                  height: 93,
                  width: 382,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/vouchercard.png"),
                          fit: BoxFit.contain)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Current Code",
                                style: FontConstant.k16w4008471Text
                                    .copyWith(color: Colors.white)),
                            Text("Valid till",
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
                      "Issued by ",
                      style: FontConstant.k16w400331FText,
                    ),
                    Text(
                      "ABC Nursery School",
                      style: FontConstant.k16w4008471Text,
                    ),
                  ],
                ),
                SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Issued date ",
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
                      "Issued by ",
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
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => changevouchercode(),
                              ),
                            );
                          },
                          title: "Change Voucher Code",
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
