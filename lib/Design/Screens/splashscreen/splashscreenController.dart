
import 'package:get/get.dart';
import 'package:kidseau/Design/Screens/StartScreen/startscreen.dart';


class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Future.delayed(const Duration(seconds: 03), () {
      Get.to(()=>StartScreen());

    });
  }
}
