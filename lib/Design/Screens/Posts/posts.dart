import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kidseau/Theme.dart';

class Posts extends StatefulWidget {
  const Posts({Key? key}) : super(key: key);

  @override
  State<Posts> createState() => _PostsState();
}

class _PostsState extends State<Posts> {
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
          padding: const EdgeInsets.only(top: 0.0),
          child: Text("Posts",
              style: FontConstant.k32w5008267Text.copyWith(fontSize: 25)),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Row(
                children: [
                  Image.asset(
                    "assets/images/appbaricon1.png",
                    height: 48,
                    width: 48,
                  ),
                  Image.asset(
                    "assets/images/appbarclock.png",
                    height: 24,
                    width: 24,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            height: 414,
            width: 414,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  "assets/images/backgroundaddschool.png",
                ),
              ),
            ),
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
                    Text(
                      "Abc School",
                      style: FontConstant2.k24w5008267text,
                    ),
                  ],
                ),
                SizedBox(height: 38),
                Row(
                  children: [
                    Image.asset(
                      "assets/images/person2.png",
                      height: 40,
                      width: 40,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
