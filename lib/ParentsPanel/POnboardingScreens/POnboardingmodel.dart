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
          "Track the activities and grades of your kid regularly at one portal."),
  PUnbordingContent(
      title: 'Create memories',
      image: 'assets/images/parentonboard2.png',
      discription:
          "Keep records of the sweetest memories of your kids at school in form of photos & videos."),
  PUnbordingContent(
      title: 'Chat with Teachers',
      image: 'assets/images/parenonboard3.png',
      discription:
          "Chat with teachers to regularly monitor the growth of your child."),
];
