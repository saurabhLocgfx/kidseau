import 'package:flutter/material.dart';
import 'package:kidseau/Theme.dart';

class TPostsScreen extends StatefulWidget {
  const TPostsScreen({Key? key}) : super(key: key);

  @override
  State<TPostsScreen> createState() => _TPostsScreenState();
}

class _TPostsScreenState extends State<TPostsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16),
              child: Column(
                children: [
                  SizedBox(height: 13),
                  SizedBox(height: 38),
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
                      Image.asset(
                        "assets/images/dots.png",
                        height: 40,
                      ),
                    ],
                  ),
                  SizedBox(height: 08),
                  Text(
                    "Today we had small music activity with all kids and teachers. ",
                    style: FontConstant.k16w4008471Text,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Column(
                children: [
                  SizedBox(height: 6),
                  Container(
                    height: 214,
                    width: 382,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image:
                                AssetImage("assets/images/childrenposts.png"))),
                  ),
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
                  SizedBox(height: 38),
                  Container(
                    height: 393,
                    width: 382,
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
                            Image.asset(
                              "assets/images/dots.png",
                              height: 40,
                            ),
                          ],
                        ),
                        SizedBox(height: 08),
                        Text(
                          "Today we had small music activity with all kids and teachers. ",
                          style: FontConstant.k16w4008471Text,
                        ),
                        SizedBox(height: 6),
                        Container(
                          height: 214,
                          width: 382,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      "assets/images/childrenposts.png"))),
                        ),
                        SizedBox(
                          height: 16.5,
                        ),
                        Row(
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
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 80,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
