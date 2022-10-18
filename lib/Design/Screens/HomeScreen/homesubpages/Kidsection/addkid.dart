import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kidseau/Design/Screens/HomeScreen/homesubpages/Kidsection/kidsinformation.dart';
import 'package:kidseau/Theme.dart';
import 'package:kidseau/Widgets/buttons.dart';
import 'package:kidseau/Widgets/textfields.dart';

class Addkid extends StatefulWidget {
  const Addkid({Key? key}) : super(key: key);

  @override
  State<Addkid> createState() => _AddkidState();
}

class _AddkidState extends State<Addkid> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.size.height,
      decoration: BoxDecoration(
        color: Color.fromRGBO(190, 116, 170, 0.08),
      ),
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(70.0), // here the desired height
          child: Column(
            children: [
              AppBar(
                backgroundColor: Color(0x2a8267ac),
                automaticallyImplyLeading: false,
                elevation: 0,
                title: Row(
                  children: [
                    GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Image.asset(
                          "assets/images/arrow-left.png",
                          height: 24,
                          width: 24,
                        )),
                    Padding(
                      padding: const EdgeInsets.only(left: 17.93),
                      child: Text("Good Morning",
                          style: FontConstant.k14w400lightpurpleText.copyWith(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff84717F))),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 40),
                Center(
                    child: Image.asset(
                  "assets/images/logo without text.png",
                  height: 53,
                  width: 63,
                )),
                SizedBox(height: 40),
                Text(
                  "Add Kid",
                  style: FontConstant.k16w500brownText.copyWith(fontSize: 24),
                ),
                SizedBox(height: 24),
                Text(
                  "Voucher's code",
                  style: FontConstant.k16w500brownText.copyWith(fontSize: 16),
                ),
                SizedBox(height: 08),
                textfield(context, "Enter your Voucher’s code"),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Text(
                    "Vouchers are given by kid’s school",
                    style: FontConstant.k14w400lightpurpleText,
                  ),
                ),
                SizedBox(height: 40),
                Stack(children: [
                  Container(
                    height: 214,
                    width: 382,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                                "assets/images/Rectangle 2713 card add kid.png"))),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 80.0),
                    child: Center(
                        child: Image.asset(
                      "assets/images/playicon.png",
                      height: 56,
                      width: 56,
                    )),
                  ),
                ]),
                SizedBox(height: 70),
                materialButton(context, () {
                  Get.to(() => KidsInformation());
                }, "Continue", ThemeColor.primarycolor, 52.0),
                SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
