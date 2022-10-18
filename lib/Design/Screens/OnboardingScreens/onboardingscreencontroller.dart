import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:get/utils.dart';
import 'package:kidseau/Design/Screens/LoginSreen/loginscreen.dart';
import 'package:kidseau/Design/Screens/OnboardingScreens/onboardinginfo.dart';

class OnboardingController extends GetxController {
  var selectedPageIndex = 0.obs;
  bool get isLastPage => selectedPageIndex.value == onboardingPages.length - 1;
  var pageController = PageController();

  forwardAction() {
    if (isLastPage) {
      Get.to(() => LoginScreen());
    } else
      pageController.nextPage(duration: 300.milliseconds, curve: Curves.ease);
  }

  List<OnboardingInfo> onboardingPages = [
    OnboardingInfo('assets/images/bird reading.png', 'Watch your kid growing',
        'Know what your kid is doing in school and track their\nactivities'),
    OnboardingInfo('assets/images/birddrink.png', 'Create memories',
        'Know what your kid is doing in school and track their\nactivities'),
    OnboardingInfo('assets/images/birdph.png', 'Chat with teachers',
        'Know what your kid is doing in school and track their\nactivities')
  ];
}
