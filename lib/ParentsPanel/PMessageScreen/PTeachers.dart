import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kidseau/ParentsPanel/PMessageScreen/PopenChats.dart';
import 'package:kidseau/Theme.dart';

class PTeachers extends StatefulWidget {
  const PTeachers({Key? key}) : super(key: key);

  @override
  State<PTeachers> createState() => _PTeachersState();
}

class _PTeachersState extends State<PTeachers> {
  List<String> bird = [
    "assets/images/small bird2.png",
    "assets/images/bird2.png",
    "assets/images/birdpink.png",
    "assets/images/birdorange.png",
  ];
  List<String> name = [
    "Mohammad Umar",
    "Mohammad Umar",
    "Mohammad Umar",
    "Mohammad Umar",
  ];
  List<String> title = [
    "Director",
    "Director",
    "Class teacher",
    "Director",
  ];
  List<String> images = [
    "assets/images/teacher1.png",
    "assets/images/teacher2.png",
    "assets/images/teacher3.png",
    "assets/images/teacher4.png",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          shrinkWrap: true,
          itemCount: bird.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => POpenChats()));
              },
              child: Container(
                height: 128.h,
                margin: EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/purplecard.png"))),
                padding: const EdgeInsets.all(16),
                clipBehavior: Clip.hardEdge,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 90.h,
                      width: 60.w,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(images[index]))),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(name[index],
                            style: FontConstant.k18w5008471Text.copyWith(
                              color: Colors.white,
                            )),
                        Text(title[index],
                            style: FontConstant.k14w4008471Text.copyWith(
                                color: Colors.white.withOpacity(0.74))),
                        Text("English, French, Arabic",
                            style: FontConstant.k16w4008471Text.copyWith(
                                color: Colors.white.withOpacity(0.80))),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30, bottom: 10),
                      child: Align(
                          alignment: Alignment.centerRight,
                          child: Image.asset(
                            bird[index],
                            height: 100.h,
                            width: 70.w,
                          )),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
