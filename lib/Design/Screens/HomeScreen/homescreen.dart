import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kidseau/Design/Screens/HomeScreen/homebody/activity.dart';
import 'package:kidseau/Design/Screens/HomeScreen/homebody/tutorials.dart';
import 'package:kidseau/Design/Screens/HomeScreen/homesubpages/Kidsection/kidshomeprofile.dart';
import 'package:kidseau/Design/Screens/HomeScreen/homesubpages/Kidsection/kidsoverviewandgallery.dart';
import 'package:kidseau/Design/Screens/Posts/posts.dart';
import 'package:kidseau/Theme.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1110,
      width: 414,
      decoration: BoxDecoration(
        color: Color(0xff8267AC).withOpacity(.06),
      ),
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 45.0,
          backgroundColor: Color(0x2a8267ac),
          automaticallyImplyLeading: false,
          elevation: 0,
          title: Row(
            children: [
              GestureDetector(
                onTap: () {
                  Get.to(() => Posts());
                },
                child: Text("Good Morning",
                    style: FontConstant.k14w400lightpurpleText
                        .copyWith(fontSize: 25)),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 30.h),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      Kidsoverviewandgallery()),
                            );
                          },
                          child: Studentcard()),
                      GestureDetector(
                        onTap: () {
                          Get.to(() => KidsHomeProfile());
                        },
                        child: Container(
                          height: 128,
                          width: 83,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              image: DecorationImage(
                                  image: AssetImage(
                                      "assets/images/Rectangle 2716.png"))),
                          child: Column(
                            children: [
                              SizedBox(
                                height: Get.size.height * 0.05,
                              ),
                              Icon(
                                Icons.add,
                                size: 25,
                                color: Colors.white,
                              ),
                              Text("Add",
                                  style: FontConstant.k18w500whiteText
                                      .copyWith(fontSize: 16)),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: Get.size.height * 0.01),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Activity",
                          style: FontConstant2.baloothampifont,
                        ),
                        Activity(),
                        Center(
                          child: Text("see more",
                              style: FontConstant.k16w500purpleText.copyWith(
                                fontSize: 18,
                              )),
                        ),
                        Text(
                          "Tutorials",
                          style: FontConstant2.baloothampifont,
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Tutorials(),
              //Tutorials card

              SizedBox(
                height: 124,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Studentcard extends StatelessWidget {
  const Studentcard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 128,
      width: 283,
      decoration: BoxDecoration(
          color: Colors.transparent,
          boxShadow: [
            BoxShadow(
              color: Color(0xffAD9CC9),
              spreadRadius: 1,
              blurRadius: 8,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
          borderRadius: BorderRadius.circular(16),
          image: DecorationImage(
              image: AssetImage("assets/images/Student_Card-remove.png"))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Row(
          children: [
            Container(
              height: 96,
              width: 72,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/Rectangle 2715.png"))),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Nobite",
                    style: FontConstant.k18w500whiteText,
                  ),
                  Text("Nursary sec A",
                      style: FontConstant.k18w500whiteText.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.white.withOpacity(0.5))),
                  Text("08:00 am to 01:00 pm",
                      style: FontConstant.k18w500whiteText.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.white.withOpacity(0.5))),
                  Text("2nd rank",
                      style: FontConstant.k18w500whiteText.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.white.withOpacity(0.5))),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
//
