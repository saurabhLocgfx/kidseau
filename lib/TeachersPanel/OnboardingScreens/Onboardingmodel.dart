class UnbordingContent {
  String image;
  String title;
  String discription;

  UnbordingContent(
      {required this.image, required this.title, required this.discription});
}

List<UnbordingContent> contents = [
  UnbordingContent(
      title: 'kkm',
      image: 'assets/images/owlreadingimage.png',
      discription:
          "Know what your kid is doing in school and track their activities"),
  UnbordingContent(
      title: 'Build the Future',
      image: 'assets/images/owlcalculatorimage.png',
      discription: "Give the marks to the kid to help them grow faster."),
  UnbordingContent(
      title: 'Chat with Parents',
      image: 'assets/images/owlmobileimage.png',
      discription: "Talk to the parents"),
];
