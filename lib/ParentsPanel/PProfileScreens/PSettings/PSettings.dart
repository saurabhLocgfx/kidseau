import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kidseau/ParentsPanel/PProfileScreens/PSettings/PAboutus.dart';
import 'package:kidseau/ParentsPanel/PProfileScreens/PSettings/PNotificationSettings.dart';
import 'package:kidseau/ParentsPanel/PProfileScreens/PSettings/PPrivacyPolicy.dart';
import 'package:kidseau/ParentsPanel/PProfileScreens/PSettings/PVoucherCode.dart';
import 'package:kidseau/Theme.dart';

class PSettings extends StatefulWidget {
  PSettings({Key? key}) : super(key: key);

  @override
  State<PSettings> createState() => _PSettingsState();
}

class _PSettingsState extends State<PSettings> {
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
                      builder: (context) => PNotificationsettings(),
                    ),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Notification Settings",
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
                      builder: (context) => PVouchercode(),
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
                      builder: (context) => PPrivacypolicy(),
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
                      builder: (context) => PAboutus(),
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
