import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kidseau/TeachersPanel/OnboardingScreens/Onboardingmodel.dart';
import 'package:kidseau/TeachersPanel/TLoginScreen/TLoginScreen.dart';
import 'package:kidseau/Theme.dart';

class TOnboardingScreen extends StatefulWidget {
  const TOnboardingScreen({Key? key}) : super(key: key);

  @override
  State<TOnboardingScreen> createState() => _TOnboardingScreenState();
}

class _TOnboardingScreenState extends State<TOnboardingScreen> {
  int currentIndex = 0;
  final controller = PageController(initialPage: 0);

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

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
                    child: Stack(
                      children: [
                        PageView.builder(
                          controller: controller,
                          itemCount: contents.length,
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 34),
                                  Image.asset(
                                    contents[i].image,
                                    height: 290,
                                    width: 334,
                                  ),
                                  SizedBox(height: 10),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(contents[i].title,
                                        style: FontConstant2.k32w500331Ftext),
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: SizedBox(
                                      width: 200.w,
                                      child: Text(contents[i].discription,
                                          maxLines: 2,
                                          style: FontConstant.k16w4008471Text),
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 16, top: 10),
                                child: Row(
                                  children: List.generate(
                                    contents.length,
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
                                                  contents.length - 1) {
                                                Navigator.pushReplacement(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (_) =>
                                                        TLoginScreen(),
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
      height: 10,
      width: currentIndex == index ? 25 : 10,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: currentIndex == index
              ? Color(0xffF0AD56)
              : Color(0xffF0AD56).withOpacity(.40)),
    );
  }
}
