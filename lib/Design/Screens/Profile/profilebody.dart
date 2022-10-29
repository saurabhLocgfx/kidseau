import 'package:flutter/material.dart';
import 'package:kidseau/Design/Screens/Profile/Fees.dart';
import 'package:kidseau/Design/Screens/Profile/Settings/Settings.dart';
import 'package:kidseau/Design/Screens/Profile/syllabus.dart';
import 'package:kidseau/Theme.dart';

class profilepopup extends StatelessWidget {
  const profilepopup({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        iconSize: 48,
        icon: ImageIcon(
          AssetImage(
            "assets/images/optionicon.png",
          ),
          color: ThemeColor.primarycolor,
        ),
        itemBuilder: (context) {
          return [
            PopupMenuItem(
              enabled: false,
              child: Container(
                height: 210,
                width: 135,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => Syllabus(),
                            ),
                          );
                        },
                        child: Row(
                          children: [
                            Image.asset(
                              "assets/images/syllabusicon.png",
                              height: 24,
                            ),
                            SizedBox(width: 15),
                            Text(
                              "Syllabus",
                              style: FontConstant.k18w5008471Text,
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => Fees(),
                            ),
                          );
                        },
                        child: Row(
                          children: [
                            Image.asset(
                              "assets/images/feesicon.png",
                              height: 24,
                            ),
                            SizedBox(width: 15),
                            Text(
                              "Fees",
                              style: FontConstant.k18w5008471Text,
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => settings(),
                            ),
                          );
                        },
                        child: Row(
                          children: [
                            Image.asset(
                              "assets/images/gearicon.png",
                              height: 24,
                            ),
                            SizedBox(width: 15),
                            Text(
                              "Setting",
                              style: FontConstant.k18w5008471Text,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ];
        });
  }
}
