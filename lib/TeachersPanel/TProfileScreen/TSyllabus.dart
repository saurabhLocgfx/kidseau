import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kidseau/Constants/colors.dart';
import 'package:kidseau/ParentsPanel/PHomeScreen/PHomebody.dart';
import 'package:kidseau/Theme.dart';

class TSyllabus extends StatefulWidget {
  const TSyllabus({Key? key}) : super(key: key);

  @override
  State<TSyllabus> createState() => _TSyllabusState();
}

class _TSyllabusState extends State<TSyllabus> {
  List<String> items = [
    "Group A",
    "Group B",
    "Group C",
    "Group D",
    "Group E",
  ];

  String selected = 'Today';

  int current = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: false,
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
          "Syllabus",
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
      body: Container(
        color: AppColors().k8267AC.withOpacity(0.06),
        child: Stack(
          children: [
            Image.asset(
              "assets/images/postsbackground.png",
              height: 414,
              width: 1.sw,
              fit: BoxFit.fitWidth,
            ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0.0),
                child: Column(
                  children: [
                    SizedBox(height: 130),
                    GroupTab(),
                    SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 150,
                          child: DropdownButton<String>(
                            dropdownColor: Colors.white,
                            isExpanded: true,
                            icon: Image.asset(
                              "assets/images/arrowdown.png",
                              width: 24,
                              height: 24,
                              color: Color(0xff84717F),
                            ),
                            hint: Text(selected),
                            items: <String>[
                              'Today',
                              'Sunday',
                              'Monday',
                              'Tuesday',
                              'Wednesday',
                              'Thursday',
                            ].map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (val) {
                              setState(() {
                                selected = val!;
                              });
                            },
                          ),
                        ),
                        /*Text(
                          "Today",
                          style: FontConstant.k18w5008471Text,
                        ),
                        Image.asset(
                          "assets/images/arrowdown.png",
                          width: 24,
                          height: 24,
                          color: Color(0xff84717F),
                        )*/
                      ],
                    ),
                    SizedBox(height: 20),
                    Activity(),
                  ],
                ))
          ],
        ),
      ),
    );
  }

  Container GroupTab() {
    return Container(
      width: 414,
      height: 62,
      margin: const EdgeInsets.all(10),
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
