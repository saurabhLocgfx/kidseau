import 'package:flutter/material.dart';
import 'package:kidseau/Theme.dart';

class MyPostOptionsDialog extends StatelessWidget {
  const MyPostOptionsDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        iconSize: 40,
        icon: ImageIcon(
          AssetImage(
            "assets/images/dots.png",
          ),
        ),
        itemBuilder: (context) {
          return [
            PopupMenuItem(
              enabled: false,
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0, top: 16, bottom: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          "assets/images/edit.png",
                          height: 24,
                        ),
                        SizedBox(width: 24),
                        Text(
                          "Edit",
                          style: FontConstant.k18w5008471Text,
                        )
                      ],
                    ),
                    SizedBox(height: 26),
                    Row(
                      children: [
                        Image.asset(
                          "assets/images/eyelogo.png",
                          height: 24,
                        ),
                        SizedBox(width: 24),
                        Text(
                          "Hide",
                          style: FontConstant.k18w5008471Text,
                        )
                      ],
                    ),
                    SizedBox(height: 26),
                    Row(
                      children: [
                        Image.asset(
                          "assets/images/downloadicon.png",
                          height: 24,
                        ),
                        SizedBox(width: 24),
                        Text(
                          "Download",
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
                          color: Colors.redAccent,
                        ),
                        SizedBox(width: 24),
                        Text(
                          "Delete",
                          style: FontConstant.k18w500F970Text,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ];
        });
  }
}

class PostOptionsDialog extends StatelessWidget {
  const PostOptionsDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        iconSize: 40,
        icon: ImageIcon(
          AssetImage(
            "assets/images/dots.png",
          ),
        ),
        itemBuilder: (context) {
          return [
            PopupMenuItem(
              enabled: false,
              child: SizedBox(
                height: 160,
                child: Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            "assets/images/eyelogo.png",
                            height: 24,
                          ),
                          SizedBox(width: 24),
                          Text(
                            "Hide",
                            style: FontConstant.k18w5008471Text,
                          )
                        ],
                      ),
                      SizedBox(height: 26),
                      Row(
                        children: [
                          Image.asset(
                            "assets/images/reportlogo.png",
                            height: 24,
                          ),
                          SizedBox(width: 24),
                          Text(
                            "Report",
                            style: FontConstant.k18w5008471Text,
                          )
                        ],
                      ),
                      SizedBox(height: 26),
                      Row(
                        children: [
                          Image.asset(
                            "assets/images/downloadicon.png",
                            height: 24,
                          ),
                          SizedBox(width: 24),
                          Text(
                            "Download",
                            style: FontConstant.k18w5008471Text,
                          )
                        ],
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
                /*height: 160,
                width: 258,*/
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 32.0),
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

class kidsgallerydialog extends StatelessWidget {
  const kidsgallerydialog({
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
                height: 200,
                width: 135,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            "assets/images/eyelogo.png",
                            height: 20,
                          ),
                          SizedBox(width: 20),
                          Text(
                            "Hide",
                            style: FontConstant.k18w5008471Text,
                          )
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Image.asset(
                            "assets/images/reportlogo.png",
                            height: 24,
                          ),
                          SizedBox(width: 20),
                          Text(
                            "Report",
                            style: FontConstant.k18w5008471Text,
                          )
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Image.asset(
                            "assets/images/downloadicon.png",
                            height: 24,
                          ),
                          SizedBox(width: 20),
                          Text(
                            "Download",
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
