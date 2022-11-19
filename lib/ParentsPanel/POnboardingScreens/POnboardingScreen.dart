import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kidseau/ParentsPanel/PLoginScreen/PLoginScreen.dart';
import 'package:kidseau/ParentsPanel/POnboardingScreens/POnboardingmodel.dart';
import 'package:kidseau/Theme.dart';

class POnboardingScreen extends StatefulWidget {
  const POnboardingScreen({Key? key}) : super(key: key);

  @override
  State<POnboardingScreen> createState() => _POnboardingScreenState();
}

class _POnboardingScreenState extends State<POnboardingScreen> {
  int currentIndex = 0;
  final controller = PageController(initialPage: 0);

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  PageController _pageController = PageController(
    initialPage: 0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColor.primarycolor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 229,
            width: Get.size.width,
            decoration: BoxDecoration(
              color: ThemeColor.primarycolor,
            ),
            child: Image.asset(
              "assets/images/Artboard 1 1.png",
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Container(
              width: Get.size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24.0),
                  topRight: Radius.circular(24.0),
                ),
              ),
              child: Column(
                children: [
                  Expanded(
                    child: Stack(children: [
                      PageView.builder(
                        controller: controller,
                        itemCount: Pcontents.length,
                        onPageChanged: (int index) {
                          setState(() {
                            currentIndex = index;
                          });
                        },
                        itemBuilder: (_, i) {
                          return Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Column(
                              children: [
                                SizedBox(height: 34),
                                Image.asset(
                                  Pcontents[i].image,
                                  height: 290,
                                  width: 334,
                                ),
                                SizedBox(height: 25),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(Pcontents[i].title,
                                      style: FontConstant2.k32w500331Ftext),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: SizedBox(
                                    width: 200.w,
                                    child: Text(Pcontents[i].discription,
                                        maxLines: 2,
                                        textAlign: TextAlign.left,
                                        style: FontConstant.k16w4008471Text),
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        //alignment: Alignment.bottomCenter,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 16, top: 40),
                              child: Row(
                                children: List.generate(
                                  Pcontents.length,
                                  (index) => buildDot(index, context),
                                ),
                              ),
                            ),
                            Stack(
                              children: [
                                Positioned(
                                    child: Stack(
                                  children: [
                                    Image.asset(
                                      "assets/images/Vector (1) - Copy.png",
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 85.0, left: 28),
                                      child: MaterialButton(
                                        minWidth: 25,
                                        onPressed: () {
                                          if (currentIndex ==
                                              Pcontents.length - 1) {
                                            Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                builder: (_) => PLoginScreen(),
                                              ),
                                            );
                                          }
                                          controller.nextPage(
                                            duration:
                                                Duration(milliseconds: 300),
                                            curve: Curves.fastOutSlowIn,
                                          );
                                        },
                                        child: Icon(
                                          Icons.arrow_forward,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                )),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ]),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 4,
      width: currentIndex == index ? 20 : 9,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: currentIndex == index
              ? Color(0xffF0AD56)
              : Color(0xffF0AD56).withOpacity(.40)),
    );
  }
}
