import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kidseau/Theme.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff8267AC).withOpacity(.06),
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
                  // Navigator.of(context).push(MaterialPageRoute(
                  //     builder: (context) => NotificationScreen()));
                },
                child: Text("Profile", style: FontConstant2.k32w5008267text))),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Image.asset(
              "assets/images/optionicon.png",
              height: 44,
              width: 44,
            ),
          ),
        ],
      ),
    );
  }
}
