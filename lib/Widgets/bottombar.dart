import 'package:flutter/material.dart';
import 'package:kidseau/Theme.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 32.0),
      child: Container(
        width: double.infinity,
        height: 80,
        padding: const EdgeInsets.symmetric(
          vertical: 5,
          horizontal: 10,
        ),
        color: Colors.transparent,
        child: GestureDetector(
          onTap: () {},
          child: Container(
            width: double.infinity,
            height: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  blurRadius: 20,
                  color: Colors.grey.shade300,
                )
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BottomBarData(
                    text: "Home",
                    image: "assets/images/profileicon.png",
                    selected: true,
                    onPressed: () {}),
                BottomBarData(
                    text: "Home",
                    image: "assets/images/profileicon.png",
                    selected: true,
                    onPressed: () {}),
                BottomBarData(
                    text: "Home",
                    image: "assets/images/profileicon.png",
                    selected: true,
                    onPressed: () {}),
                BottomBarData(
                    text: "Home",
                    image: "assets/images/profileicon.png",
                    selected: true,
                    onPressed: () {}),
                BottomBarData(
                    text: "Home",
                    image: "assets/images/profileicon.png",
                    selected: true,
                    onPressed: () {}),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BottomBarData extends StatelessWidget {
  const BottomBarData(
      {Key? key,
      required this.text,
      required this.image,
      required this.selected,
      required this.onPressed})
      : super(key: key);
  final String text;
  final String image;
  final bool selected;
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(image,
                height: 20,
                color: selected ? ThemeColor.primarycolor : Colors.grey),
            Text(
              text,
              style: TextStyle(
                  fontSize: 12,
                  height: 2,
                  color: selected ? ThemeColor.primarycolor : Colors.grey),
            )
          ],
        ),
      ),
    );
  }
}
