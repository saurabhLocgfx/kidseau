import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kidseau/Design/Screens/SignupScreen/Medicalinfo.dart';
import 'package:kidseau/Design/Screens/SignupScreen/Parentinfo.dart';
import 'package:kidseau/Theme.dart';

class Informationfill extends StatefulWidget {
  const Informationfill({Key? key}) : super(key: key);

  @override
  State<Informationfill> createState() => _InformationfillState();
}

class _InformationfillState extends State<Informationfill> {
  PageController _pageController = PageController(
    initialPage: 0,
  );
  int currentIndex = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: ThemeColor.primarycolor.withOpacity(.06),
          width: 414.h,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                SizedBox(height: 72.h),
                Center(
                    child: Image.asset(
                  "assets/images/onlylogo.png",
                  height: 53,
                  width: 63,
                )),
                Container(
                  height: 64,
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: 3,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return Row(
                          children: [
                            CircleAvatar(
                              radius: 30,
                              backgroundColor:
                                  Color(0xffBE74AA).withOpacity(0.16),
                            ),
                          ],
                        );
                      }),
                ),
                SizedBox(height: 10),
                Container(
                  height: 2000,
                  child: PageView(
                    controller: _pageController,
                    onPageChanged: (page) {
                      setState(
                        () {
                          currentIndex = page;
                        },
                      );
                    },
                    children: <Widget>[
                      ParentInfo(),
                      MedicalInfo(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
