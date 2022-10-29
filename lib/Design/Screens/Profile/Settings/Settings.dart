import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kidseau/Design/Screens/Profile/Settings/aboutus.dart';
import 'package:kidseau/Design/Screens/Profile/Settings/privacypolicy.dart';
import 'package:kidseau/Design/Screens/Profile/Settings/vouchercode.dart';
import 'package:kidseau/Design/Screens/Profile/notificationsettings.dart';
import 'package:kidseau/Theme.dart';

class settings extends StatefulWidget {
  settings({Key? key}) : super(key: key);

  @override
  State<settings> createState() => _settingsState();
}

class _settingsState extends State<settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Color(0xff8267AC).withOpacity(0.16),
          ),
          backgroundColor: Color(0xff8267AC).withOpacity(0.16),
          title: Text(
            "Settings",
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
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => notificationsettings(),
                    ),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 30,
                      width: 156,
                      child: Text(
                        "Notification Setting",
                        style: FontConstant.k18w500331FText,
                      ),
                    ),
                    Image.asset(
                      "assets/images/rightarrow.png",
                      height: 20,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => vouchercode(),
                    ),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Voucher Code",
                      style: FontConstant.k18w500331FText,
                    ),
                    Image.asset(
                      "assets/images/rightarrow.png",
                      height: 20,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => privacypolicy(),
                    ),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Privacy Policy",
                      style: FontConstant.k18w500331FText,
                    ),
                    Image.asset(
                      "assets/images/rightarrow.png",
                      height: 20,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => aboutus(),
                    ),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "About Us",
                      style: FontConstant.k18w500331FText,
                    ),
                    Image.asset(
                      "assets/images/rightarrow.png",
                      height: 20,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
