import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kidseau/Design/Screens/Notifications/notifications.dart';
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
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: ThemeColor.lightpurple.withOpacity(0.16),
        ),
        backgroundColor: Color(0xff8267AC).withOpacity(0.16),
        title: Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => NotificationScreen()));
            },
            child: Text("Post",
                style: FontConstant.k32w5008267Text.copyWith(fontSize: 25)),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0, top: 15),
            child: Container(
              width: 124,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(
                    "assets/images/appbaricon1.png",
                    height: 48,
                  ),
                  Image.asset(
                    "assets/images/appbarclock.png",
                    height: 24,
                    width: 24,
                  ),
                  SizedBox(width: 2),
                  Image.asset(
                    "assets/images/iconbell.png",
                    height: 24,
                    width: 24,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 375,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xffD9D9D9).withOpacity(.100),
                    Color(0xffD9D9D9).withOpacity(.0),
                  ],
                ),
                image: DecorationImage(
                    image: AssetImage(
                      "assets/images/postsbackground.png",
                    ),
                    fit: BoxFit.cover),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16),
                child: Column(
                  children: [
                    SizedBox(
                      height: 144,
                    ),
                    Image.asset(
                      "assets/images/School.png",
                      height: 40,
                      width: 40,
                    ),
                    SizedBox(height: 13),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/images/arrleft.png",
                          height: 24,
                          width: 24,
                        ),
                        SizedBox(width: 18),
                        Text(
                          "Abc School",
                          style: FontConstant2.k24w5008267text,
                        ),
                        SizedBox(width: 18),
                        Image.asset(
                          "assets/images/arrright.png",
                          height: 24,
                          width: 24,
                        ),
                      ],
                    ),
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
