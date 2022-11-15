import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:kidseau/TeachersPanel/TNotificationScreen/TNotificationScreen.dart';
import 'package:kidseau/Theme.dart';
import 'package:kidseau/Widgets/Calender/calendermodel.dart';

import '../TReminder/TReminderScreen.dart';
import 'TStudentDetailScreen.dart';

class TStudentScreen extends StatefulWidget {
  const TStudentScreen({Key? key}) : super(key: key);

  @override
  State<TStudentScreen> createState() => _TStudentScreenState();
}

class _TStudentScreenState extends State<TStudentScreen> {
  bool toggle1 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        backgroundColor: Color(0xff8267AC).withAlpha(16),
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Row(
          children: [
            GestureDetector(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Text("Students",
                    style:
                        FontConstant2.k32w5008267text.copyWith(fontSize: 25)),
              ),
            ),
          ],
        ),
        actions: [
          Container(
            width: 144,
            child: Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(
                    "assets/images/Languageicon.png",
                    height: 24,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => TReminderScreen(),
                        ),
                      );
                    },
                    child: Image.asset(
                      "assets/images/clockicon.png",
                      height: 24,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TNotificationScreen()),
                      );
                    },
                    child: Image.asset(
                      "assets/images/iconbell.png",
                      height: 24,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              SizedBox(height: 40),
              GroupTab(),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Activity A",
                    style: FontConstant2.k24w5008267text,
                  ),
                  GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (_) => CalendarPage2(),
                      );
                    },
                    child: Container(
                      color: Colors.transparent,
                      child: Row(
                        children: [
                          Image.asset(
                            "assets/images/calendericon.png",
                            height: 16,
                          ),
                          SizedBox(width: 8),
                          Text(
                            "Today",
                            style: FontConstant.k16w500B7A4Text,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TStudentDetailScreen()));
                },
                child: Container(
                  width: 1.sw,
                  height: 151,
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.white,
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage(
                        'assets/images/sp.png',
                      ),
                    ),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 80,
                        height: 105,
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Image.asset('assets/images/Rectangle 2715.png'),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Child Name',
                                        style: FontConstant.k18w500331FText,
                                      ),
                                      SizedBox(height: 4),
                                      Text(
                                        'S/O - Father Name',
                                        style: FontConstant.k16w4008471Text,
                                      ),
                                    ],
                                  ),
                                ),
                                FlutterSwitch(
                                  width: 56.w,
                                  height: 32.w,
                                  toggleSize: 30,
                                  inactiveColor: ThemeColor.b7A4B2,
                                  activeColor: ThemeColor.primarycolor,
                                  inactiveIcon:
                                      Image.asset('assets/images/sf.png'),
                                  activeIcon:
                                      Image.asset('assets/images/baby.png'),
                                  value: toggle1,
                                  onToggle: (v) {
                                    setState(() {
                                      toggle1 = v;
                                    });
                                  },
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                for (int i = 0; i < 5; i++)
                                  GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                      padding: EdgeInsets.all(5),
                                      color: Colors.transparent,
                                      child: Text(
                                        '${i + 1}',
                                        style: FontConstant.k14w400B7A4Text,
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                            Stack(
                              clipBehavior: Clip.none,
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  width: 1.sw,
                                  height: 10,
                                  decoration: BoxDecoration(
                                    color: ThemeColor.ebe6F2,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                Positioned(
                                  left: 0,
                                  child: Stack(
                                    alignment: Alignment.centerRight,
                                    children: [
                                      AnimatedContainer(
                                        duration: Duration(milliseconds: 300),
                                        curve: Curves.fastOutSlowIn,
                                        width: 1.sw / 5.5,
                                        height: 10,
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: [
                                              Color(0xFFF5C88E),
                                              Color(0xFFF0AD56),
                                            ],
                                            begin: Alignment.centerLeft,
                                            end: Alignment.centerRight,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                      ),
                                      Container(
                                        width: 24,
                                        height: 24,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFF0AD56),
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container GroupTab() {
    List<String> items = [
      "Group A",
      "Group B",
      "Group C",
      "Group D",
      "Group E",
    ];

    int current = 0;
    return Container(
      width: 414,
      height: 62,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(81)),
      child: ListView.builder(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemCount: items.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (ctx, index) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      current = index;
                    });
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    margin: const EdgeInsets.all(5),
                    width: 72,
                    height: 43,
                    decoration: BoxDecoration(
                      color: current == index
                          ? Color(0xff8267AC).withOpacity(.08)
                          : Colors.white,
                      borderRadius: current == index
                          ? BorderRadius.circular(69)
                          : BorderRadius.circular(69),
                      border: current == index
                          ? Border.all(
                              color: Color(0xff8267AC).withOpacity(.08),
                              width: 0)
                          : null,
                    ),
                    child: Center(
                      child: Text(
                        items[index],
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: current == index
                                ? Color(0xff8267AC)
                                : Color(0xffB7A4B2)),
                      ),
                    ),
                  ),
                ),
              ],
            );
          }),
    );
  }
}
