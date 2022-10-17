
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:kidseau/Theme.dart';
import 'package:kidseau/Widgets/buttons.dart';
import 'package:kidseau/Widgets/widgets.dart';


class VoucherScreen extends StatelessWidget {

  VoucherScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff7f6fa),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height:Get.size.height * 0.08),
            Stack(
                children: [

                 mainlogo()

                ]
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                children: [
                  Column(crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: Text("We have sent you a verification main on",
                            style: FontConstant.k14w400lightpurpleText.copyWith
                              (fontSize: 16,fontWeight: FontWeight.w400)),
                      ),
                      Row(
                        children: [
                          Text("xyz@gmail.com.",
                              style: FontConstant.k14w400lightpurpleText.copyWith
                                (fontSize: 16,fontWeight: FontWeight.w500)),
                          Text("Please verify before 48 hours",
                              style: FontConstant.k14w400lightpurpleText.copyWith
                                (fontSize: 16,fontWeight: FontWeight.w400)),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 22.0),
                        child: Text("Voucher's code",style: FontConstant.k16blackboldText,),
                      ),
                      Padding(padding: EdgeInsets.only(top: 15)),
                      textfield(context, "Enter your Voucher's code"),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0,left:14),
                        child: Text("Voucher's are given by kid's school",style: FontConstant.k16w500purpleText.copyWith(
                          fontWeight: FontWeight.w400,color: Color(0xffB7A4B2),
                        )),
                      ),


                    ],

                  ),
                  SizedBox(height: Get.size.height * 0.06),
                  Container(
                    height: 214,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/images/laptopbackgroundplay.png",),
                            fit: BoxFit.cover)
                    ),
                  ),
                  SizedBox(height: Get.size.height * 0.05,),
                  materialButton(context, () {}, "Continue", ThemeColor.primarycolor, 52.0)
                ],
              ),
            ),














          ],
        ),
      ),

    );
  }




}
