import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kidseau/Design/Screens/OnboardingScreens/onboardingscreencontroller.dart';
import 'package:kidseau/Theme.dart';

class Onboarding1Screen extends StatelessWidget {
  final _controller = OnboardingController();
  Onboarding1Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff8267ac),
      body: Container(
        height: 896.h,
        width: 414.w,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 229,
                width: Get.size.width,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                ),
                child: Image.asset(
                  "assets/images/Artboard 1 1.png",
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                height: 498.h,
                width: Get.size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                    topLeft: const Radius.circular(24.0),
                    topRight: const Radius.circular(24.0),
                  ),
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: Stack(
                        children: [
                          PageView.builder(
                              controller: _controller.pageController,
                              onPageChanged: _controller.selectedPageIndex,
                              itemCount: _controller.onboardingPages.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  child: Column(
                                    children: [
                                      SizedBox(height: Get.size.height * 0.03),
                                      Image.asset(
                                        _controller
                                            .onboardingPages[index].imageAsset,
                                        height: 320,
                                      ),
                                      SizedBox(height: 10),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 15),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  _controller
                                                      .onboardingPages[index]
                                                      .title,
                                                  style: FontConstant
                                                      .k32w500blackText,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          _controller
                                                              .onboardingPages[
                                                                  index]
                                                              .description,
                                                          textAlign:
                                                              TextAlign.start,
                                                          style: FontConstant
                                                              .k14w400lightText,
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              }),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 15.0),
                                  child: Row(
                                    children: List.generate(
                                      _controller.onboardingPages.length,
                                      (index) => Obx(() {
                                        return Container(
                                          margin: const EdgeInsets.all(4),
                                          width: 16,
                                          height: 12,
                                          decoration: BoxDecoration(
                                              color: _controller
                                                          .selectedPageIndex
                                                          .value ==
                                                      index
                                                  ? Color(0xfff0ad56)
                                                  : Color(0xfffbebd6),
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                        );
                                      }),
                                    ),
                                  ),
                                ),
                                Stack(
                                  children: [
                                    Positioned(
                                        child: Stack(
                                      children: [
                                        Image.asset(
                                            "assets/images/Vector (1) - Copy.png"),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 85.0, left: 28),
                                          child: MaterialButton(
                                            minWidth: 25,
                                            onPressed:
                                                _controller.forwardAction,
                                            child: Icon(
                                              _controller.isLastPage
                                                  ? Icons.arrow_forward_outlined
                                                  : Icons
                                                      .arrow_forward_outlined,
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
    );
  }
}
