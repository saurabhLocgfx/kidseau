class PUnbordingContent {
  String image;
  String title;
  String discription;

  PUnbordingContent(
      {required this.image, required this.title, required this.discription});
}

List<PUnbordingContent> Pcontents = [
  PUnbordingContent(
      title: "Watch Your kid grow",
      image: 'assets/images/parentonboard1.png',
      discription:
          "Know what your kid is doing in school and track their activities"),
  PUnbordingContent(
      title: 'Create memories',
      image: 'assets/images/parentonboard2.png',
      discription: "Save all photos of your kid and save memories."),
  PUnbordingContent(
      title: 'Chat with Teachers',
      image: 'assets/images/parenonboard3.png',
      discription:
          "Know what your kid is doing in school and track their activities"),
];
