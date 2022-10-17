import 'package:flutter/material.dart';
import 'package:kidseau/Theme.dart';

class Tutorials extends StatefulWidget {
  const Tutorials({Key? key}) : super(key: key);

  @override
  State<Tutorials> createState() => _TutorialsState();
}

class _TutorialsState extends State<Tutorials> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [

            tutorialWidget(image: "assets/images/tutorial1.png", title: "How to add a new kid ", press: () {},
                minutes: "16 mins", hours: "2 hours ago"),
            tutorialWidget(image: "assets/images/Rectangle 2713.png", title: "How to add a new kid ", press: () {},
                minutes: "16 mins", hours: "2 hours ago"),
          ],
        ),
      ),
    );
  }
}

class tutorialWidget extends StatefulWidget {


  const tutorialWidget({
    Key? key,
    required this.image,
    required this.title,
    required this.press,
    required this.minutes,
    required this.hours,

  }) : super(key: key);
  final String image;
  final String title;
  final String minutes;
  final String hours;
  final Function press;


  @override
  State<tutorialWidget> createState() => _tutorialWidgetState();
}

class _tutorialWidgetState extends State<tutorialWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(

      child: Padding(
        padding: const EdgeInsets.only(left: 15),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 148,
              width: 349,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(image: AssetImage(widget.image))
              ),
            ),
            Text(widget.title,style: FontConstant.k16w500brownText,),
            Row(
              children: [
                Image.asset("assets/images/clock.png",height: 13,width: 13,),
                Padding(
                  padding: const EdgeInsets.only(left: 06.0),
                  child: Text(widget.minutes,style: FontConstant.k14w400lightpurpleText,),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 4.0),
                  child: Text(widget.hours,style: FontConstant.k14w400lightpurpleText,),
                )
                
              ],
            )
          ],
        ),
      ),
    );
  }
}
