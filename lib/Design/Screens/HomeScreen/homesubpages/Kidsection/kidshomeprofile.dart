import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:kidseau/Design/Screens/HomeScreen/homesubpages/Kidsection/kidsinformation.dart';
import 'package:kidseau/Theme.dart';
import 'package:kidseau/Widgets/buttons.dart';
import 'package:kidseau/Widgets/textfields.dart';

class KidsHomeProfile extends StatefulWidget {
  const KidsHomeProfile({Key? key}) : super(key: key);

  @override
  State<KidsHomeProfile> createState() => _KidsHomeProfileState();
}

class _KidsHomeProfileState extends State<KidsHomeProfile> {
  final controller = PageController(initialPage: 1);

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  PageController _pageController = PageController(
    initialPage: 0,
  );
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.size.height,
      decoration: BoxDecoration(
        color: Color.fromRGBO(190, 116, 170, 0.08),
      ),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Color(0xff8267AC).withOpacity(0.16),
          ),
          backgroundColor: Color(0xff8267AC).withOpacity(0.16),
          title: Text(
            "Add Kid",
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
