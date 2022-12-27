import 'package:easy_localization/easy_localization.dart';

class UnbordingContent {
  String image;
  String title;
  String discription;

  UnbordingContent(
      {required this.image, required this.title, required this.discription});
}

List<UnbordingContent> contents = [
  UnbordingContent(
      title: 'kkm'.tr(),
      image: 'assets/images/owlreadingimage.png',
      discription:
          "Know what your kid is doing in school track their activities".tr()),
  UnbordingContent(
      title: 'Build the Future'.tr(),
      image: 'assets/images/owlcalculatorimage.png',
      discription: "Give the marks to the kid to help them grow faster.".tr()),
  UnbordingContent(
      title: 'Chat with Parents'.tr(),
      image: 'assets/images/owlmobileimage.png',
      discription: "Talk to the parents".tr()),
];
