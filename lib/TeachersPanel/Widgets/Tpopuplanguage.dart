import 'package:flutter/material.dart';
import 'package:kidseau/TeachersPanel/TProfileScreen/TSettings.dart';
import 'package:kidseau/Theme.dart';

class TLanguagepopup extends StatelessWidget {
  const TLanguagepopup({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        iconSize: 48,
        icon: ImageIcon(
          AssetImage(
            "assets/images/Languageicon.png",
          ),
          color: ThemeColor.darkpurple,
        ),
        itemBuilder: (context) {
          return [
            PopupMenuItem(
              enabled: false,
              child: Padding(
                padding: const EdgeInsets.only(left: 15.0, top: 15, bottom: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        /*Navigator.pop(context);
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => TSyllabus()),
                        );*/
                      },
                      child: Row(
                        children: [
                          Text(
                            ("English"),
                            style: FontConstant.k18w5008471Text,
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                        // Navigator.of(context).push(
                        //   MaterialPageRoute(
                        //     builder: (context) => Fees(),
                        //   ),
                        // );
                      },
                      child: Row(
                        children: [
                          SizedBox(width: 15),
                          Text(
                            ("Arabic"),
                            style: FontConstant.k18w5008471Text,
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => TSettings(),
                          ),
                        );
                      },
                      child: Row(
                        children: [
                          SizedBox(width: 15),
                          Text(
                            ("Freach"),
                            style: FontConstant.k18w5008471Text,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ];
        });
  }
}
