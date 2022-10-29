import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kidseau/Design/Screens/HomeScreen/homescreen.dart';
import 'package:kidseau/Design/Screens/Profile/kidsprofile.dart';
import 'package:kidseau/Design/Screens/Profile/profilebody.dart';
import 'package:kidseau/Theme.dart';
import 'package:kidseau/Widgets/buttons.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  var infocategory = [
    "Mother’s name",
    "Occupation",
    "Email address",
    "Phone number",
    "Address",
  ];

  var infocategorydata = [
    "Lucy Bravo",
    "House Wife",
    "Ab@gmail.com",
    "9876543210",
    "6391 Elgin St. Celina,"
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1006.h,
      width: 414.w,
      child: Scaffold(
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
                  child: Text("Profile",
                      style: FontConstant2.k32w5008267text
                          .copyWith(fontSize: 28)))),
          actions: [profilepopup()],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(children: [
                Container(
                  height: 414.h,
                  width: 414.w,
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
                          image:
                              AssetImage("assets/images/postsbackground.png"))),
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 144.0),
                      child: Customtabs(),
                    ),
                    SizedBox(height: 24),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 128.h,
                            width: 96.2.w,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        "assets/images/profileperson.png"))),
                          ),
                          SizedBox(width: 24),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Johnny Bravo",
                                style: FontConstant.k24w500brownText,
                              ),
                              Text(
                                "Occupation",
                                style: FontConstant.k16w400B7A4Text,
                              ),
                              Text("9876543210",
                                  style: FontConstant.k16w5008471Text),
                              Text("xyz@gmail.com",
                                  style: FontConstant.k16w5008471Text),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 35),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => Kidsprofile(),
                          ),
                        );
                      },
                      child: Container(
                        height: 132,
                        width: 414,
                        child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0),
                                child: Studentcard(),
                              ),
                              Studentcard()
                            ]),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "info",
                            style: FontConstant2.k22w5008471text,
                          ),
                          Container(
                            height: 150,
                            child: ListView.builder(
                              padding: EdgeInsets.zero,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: infocategory.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Row(
                                  children: [
                                    Container(
                                      height: 27,
                                      width: 104,
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Column(
                                          children: [
                                            Text(
                                              infocategory[index],
                                              style:
                                                  FontConstant.k16w500331FText,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 16),
                                    Column(
                                      children: [
                                        Text(
                                          infocategorydata[index],
                                          style: FontConstant.k16w5008471Text,
                                        ),
                                      ],
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 32),
                    SizedBox(
                      height: 52,
                      width: 382,
                      child: MainButton(
                          onTap: () {},
                          title: "Edit",
                          textStyleColor: Colors.white,
                          backgroundColor: ThemeColor.primarycolor),
                    ),
                    SizedBox(
                      height: 100,
                    )
                  ],
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}

class Customtabs extends StatefulWidget {
  // final String txt;
  // final String image;
  const Customtabs({
    Key? key,
    // required this.txt,
    // required this.image,
  }) : super(key: key);

  @override
  State<Customtabs> createState() => _CustomtabsState();
}

class _CustomtabsState extends State<Customtabs> {
  var category = ['Parents', 'School'];
  List<String> categoryicon = [
    "assets/images/profile-2user.png",
    "assets/images/buildings.png",
  ];

  int current = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      width: 248,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(76)),
      child: Container(
        child: ListView.builder(
            itemCount: 2,
            scrollDirection: Axis.horizontal,
            itemBuilder: (ctx, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      current = index;
                    });
                  },
                  child: Container(
                    height: 56,
                    width: 108,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Stack(children: [
                              Visibility(
                                visible: current == index,
                                child: Container(
                                  width: 40,
                                  height: 40,
                                  decoration: const BoxDecoration(
                                      color: Color(0xffEBE6F2),
                                      shape: BoxShape.circle),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset(
                                  categoryicon[index],
                                  height: 24,
                                  width: 24,
                                  color: current == index
                                      ? Color(0xff8267AC)
                                      : Color(0xffB7A4B2),
                                ),
                              ),
                            ]),
                            SizedBox(width: 8),
                            Text(
                              category[index],
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                color: current == index
                                    ? Color(0xff8267AC)
                                    : Color(0xffB7A4B2),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
