import 'package:flutter/material.dart';
import 'package:kidseau/Theme.dart';
import 'package:kidseau/Widgets/dialogs.dart';

class PKidsGallery extends StatefulWidget {
  const PKidsGallery({Key? key}) : super(key: key);

  @override
  State<PKidsGallery> createState() => _PKidsGalleryState();
}

class _PKidsGalleryState extends State<PKidsGallery> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: 5,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 10.0, top: 10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              "assets/images/person2.png",
                              height: 40,
                              width: 40,
                            ),
                            SizedBox(
                              width: 08,
                            ),
                            Text(
                              "Mohammad Umar",
                              style: FontConstant2.k16w5008267text,
                            ),
                          ],
                        ),
                        Stack(children: [
                          Image.asset(
                            "assets/images/dots.png",
                            height: 40,
                          ),
                          kidsgallerydialog()
                        ]),
                      ],
                    ),
                    SizedBox(height: 08),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Today we had small music activity with all kids and teachers. ",
                            style: FontConstant.k16w4008471Text,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        SizedBox(height: 6),
                        Row(
                          children: [
                            Expanded(
                                child: Image.asset(
                                    "assets/images/childrenposts.png")),
                            /* Container(
                            height: 213.h,
                            width: 379.w,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        "assets/images/childrenposts.png"))),
                          ),*/
                          ],
                        ),
                        /*Container(
                            height: 214,
                            width: 382,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        "assets/images/childrenposts.png"))),
                          ),*/
                        SizedBox(
                          height: 16.5,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0, right: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    "assets/images/heart2.png",
                                    height: 24,
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    "2.4k likes",
                                    style: FontConstant.k16w4008471Text,
                                  ),
                                ],
                              ),
                              Text("2 min ago",
                                  style: FontConstant.k16w4008471Text
                                      .copyWith(fontSize: 14))
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
