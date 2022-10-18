import 'package:flutter/material.dart';
import 'package:kidseau/Theme.dart';

class MainButton extends StatelessWidget {
  // final MaterialStateProperty<Color> backgroundColor;
  final Color textStyleColor;
  final Color backgroundColor;
  final Function onTap;
  final String title;
  const MainButton({
    Key? key,
    // required this.backgroundColor,
    required this.onTap,
    required this.title,
    required this.textStyleColor,
    required this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: backgroundColor,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30))),
      onPressed: () {
        onTap();
      },
      child: Center(
        child: Text(
          title,
          style: FontConstant.k18w500materialbuttonText,
        ),
      ),
    );
  }
}

materialButton(context, onpressed, txt, c, h) {
  return MaterialButton(
    onPressed: onpressed,
    enableFeedback: true,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(30))),
    height: h,
    minWidth: MediaQuery.of(context).size.width * 0.92,
    elevation: 0.5,
    color: c,
    child: Text(
      txt,
      style: FontConstant.k18w500materialbuttonText,
    ),
  );
}
