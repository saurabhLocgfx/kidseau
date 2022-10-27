import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kidseau/Design/Screens/Messages/OpenMessages.dart';
import 'package:kidseau/Theme.dart';

class Teachers extends StatefulWidget {
  const Teachers({Key? key}) : super(key: key);

  @override
  State<Teachers> createState() => _TeachersState();
}

class _TeachersState extends State<Teachers> {
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
            return Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => OpenMessages()));
                },
                child: Container(
                  height: 128.h,
                  width: 382.w,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/purplecard.png"))),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Row(
                      children: [
                        Container(
                          height: 96.h,
                          width: 72.w,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(images[index]))),
                        ),
                        SizedBox(width: 12.w),
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
                          padding: const EdgeInsets.only(
                              top: 28.0, right: 11, left: 12),
                          child: Align(
                              alignment: Alignment.centerRight,
                              child: Image.asset(
                                bird[index],
                                height: 100.h,
                                width: 70.w,
                              )),
                        ),
                        SizedBox(
                          height: 60.h,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
