import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kidseau/Theme.dart';
import 'package:kidseau/Widgets/buttons.dart';
import 'package:kidseau/Widgets/textfields.dart';

class changevouchercode extends StatefulWidget {
  changevouchercode({Key? key}) : super(key: key);

  @override
  State<changevouchercode> createState() => _changevouchercodeState();
}

class _changevouchercodeState extends State<changevouchercode> {
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
              "Change Voucher code",
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
                  height: 214,
                  width: 382,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                          image:
                              AssetImage("assets/images/laptopbackground.png"),
                          fit: BoxFit.cover)),
                ),
                SizedBox(height: 30),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Voucher’s code",
                      style: FontConstant.k16w500331FText,
                    ),
                    SizedBox(height: 10),
                    textfield(context, "Enter your Voucher’s code"),
                    Text(
                      "Vouchers are given by kid’s school",
                      style: FontConstant.k16w400B7A4Text,
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
                          onTap: () {},
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
