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
      title: 'Keeping track of kids progress'.tr(),
      image: 'assets/images/owlreadingimage.png',
      discription:
          "You can maintain all the academic records of a student at one portal so that can be checked easily whenever required"
              .tr()),
  UnbordingContent(
      title: 'Build the future'.tr(),
      image: 'assets/images/owlcalculatorimage.png',
      discription:
          "Provide kids the opportunity to learn from best-in-class teachers along with the attest academic curriculum."
              .tr()),
  UnbordingContent(
      title: 'Chat with Parents'.tr(),
      image: 'assets/images/owlmobileimage.png',
      discription:
          "You can keep the parents updated about every possible step related to their kid directly using this application."
              .tr()),
];
