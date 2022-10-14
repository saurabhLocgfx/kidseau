
import 'package:get/get.dart';
import 'package:kidseau/StartScreen/startscreen.dart';


class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Future.delayed(const Duration(seconds: 03), () {
      Get.to(()=>StartScreen());

    });
  }
}
