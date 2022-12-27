import 'package:easy_localization/easy_localization.dart';

class PUnbordingContent {
  String image;
  String title;
  String discription;

  PUnbordingContent(
      {required this.image, required this.title, required this.discription});
}

List<PUnbordingContent> Pcontents = [
  PUnbordingContent(
      title: "Watch Your kid grow".tr(),
      image: 'assets/images/parentonboard1.png'.tr(),
      discription:
          "Know what your kid is doing in school track their activities".tr()),
  PUnbordingContent(
      title: 'Create memories'.tr(),
      image: 'assets/images/parentonboard2.png',
      discription: "Save all photos of your kid and save memories.".tr()),
  PUnbordingContent(
      title: 'Chat with Teachers'.tr(),
      image: 'assets/images/parenonboard3.png',
      discription:
          "Know what your kid is doing in school track their activities".tr()),
];
