import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kidseau/Design/Screens/Notifications/notifications.dart';
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
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => NotificationScreen()));
            },
            child: Text("Posts",
                style: FontConstant.k32w5008267Text.copyWith(fontSize: 25)),
          ),
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
      body: Container(
        height: 414,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                "assets/images/backgroundaddschool.png",
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
                  Text(
                    "Abc School",
                    style: FontConstant2.k24w5008267text,
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
    );
  }
}
