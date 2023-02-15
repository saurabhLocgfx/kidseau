class UnbordingContent {
  String image;
  String title;
  String discription;

  UnbordingContent(
      {required this.image, required this.title, required this.discription});
}

List<UnbordingContent> contents = [
  UnbordingContent(
      title: 'Keep track of student progress',
      image: 'assets/images/owlreadingimage.png',
      discription:
          "You can maintain all the academic records of a student at one portal so that can be checked easily whenever required."),
  UnbordingContent(
      title: 'Build the Future',
      image: 'assets/images/owlcalculatorimage.png',
      discription:
          "Provide students the opportunity to learn from best-in-class teachers along with the attest academic curriculum."),
  UnbordingContent(
      title: 'Chat with Parents',
      image: 'assets/images/owlmobileimage.png',
      discription:
          "You can keep the parents updated about every possible step related to their kid directly using this application."),
];
