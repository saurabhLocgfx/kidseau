import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kidseau/Design/Screens/ReminderScreens/ReminderScreen.dart';
import 'package:kidseau/Theme.dart';

class TNotificationsettings extends StatefulWidget {
  TNotificationsettings({Key? key}) : super(key: key);

  @override
  State<TNotificationsettings> createState() => _TNotificationsettingsState();
}

class _TNotificationsettingsState extends State<TNotificationsettings> {
  bool val1 = false;

  bool val2 = false;

  bool val3 = false;
  bool val4 = false;

  onChangedFunction1(bool newvalue1) {
    setState(() {
      val1 = newvalue1;
    });
  }

  onChangedFunction2(bool newvalue2) {
    setState(() {
      val2 = newvalue2;
    });
  }

  onChangedFunction3(bool newvalue3) {
    setState(() {
      val3 = newvalue3;
    });
  }

  onChangedFunction4(bool newvalue4) {
    setState(() {
      val4 = newvalue4;
    });
  }

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
            "Notification setting",
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
              SizedBox(height: 140),
              GestureDetector(
                onTap: () {},
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
                    customSwitch(val1, onChangedFunction1)
                  ],
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.circle, size: 6, color: Color(0xff331F2D)),
                      SizedBox(width: 10),
                      Text(
                        "New Post",
                        style: FontConstant.k18w500331FText,
                      ),
                    ],
                  ),
                  customSwitch(val2, onChangedFunction2)
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.circle, size: 6, color: Color(0xff331F2D)),
                      SizedBox(width: 10),
                      Text(
                        "New Activity",
                        style: FontConstant.k18w500331FText,
                      ),
                    ],
                  ),
                  customSwitch(val3, onChangedFunction3)
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.circle, size: 6, color: Color(0xff331F2D)),
                      SizedBox(width: 10),
                      Text(
                        "New Message ",
                        style: FontConstant.k18w500331FText,
                      ),
                    ],
                  ),
                  customSwitch(val4, onChangedFunction4)
                ],
              ),
            ],
          ),
        ));
  }
}
