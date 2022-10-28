import 'package:flutter/material.dart';
import 'package:kidseau/Theme.dart';

class messageoptiondialog extends StatelessWidget {
  const messageoptiondialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        iconSize: 10,
        icon: ImageIcon(
          AssetImage(
            "assets/images/dots2.png",
          ),
        ),
        itemBuilder: (context) {
          return [
            PopupMenuItem(
              enabled: false,
              child: Container(
                height: 160,
                width: 258,
                child: Padding(
                  padding: const EdgeInsets.only(left: 32.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            "assets/images/markicon.png",
                            height: 24,
                          ),
                          SizedBox(width: 24),
                          Text(
                            "Mark as unread",
                            style: FontConstant.k18w5008471Text,
                          )
                        ],
                      ),
                      SizedBox(height: 26),
                      Row(
                        children: [
                          Image.asset(
                            "assets/images/trashicon.png",
                            height: 24,
                          ),
                          SizedBox(width: 24),
                          Text(
                            "Delete chat",
                            style: FontConstant.k18w5008471Text,
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ];
        });
  }
}
