import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kidseau/Design/Screens/Profile/kidsprofile.dart';
import 'package:kidseau/Theme.dart';
import 'package:kidseau/Widgets/buttons.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  var infocategory = [
    "Mother’s name",
    "Occupation",
    "Email address",
    "Phone number",
    "Address",
  ];

  var intonames = [
    "Lucy Bravo",
    "House Wife",
    "Ab@gmail.com",
    "9876543210",
    "6391 Elgin St. Celina, Delaware 10299"
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
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Image.asset(
                "assets/images/optionicon.png",
                height: 40,
                width: 40,
              ),
            ),
          ],
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
                    Container(
                      height: 130,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 2,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => Kidsprofile()));
                              },
                              child: Container(
                                height: 128,
                                width: 283,
                                decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color(0xffAD9CC9),
                                        spreadRadius: 1,
                                        blurRadius: 8,
                                        offset: Offset(
                                            0, 3), // changes position of shadow
                                      ),
                                    ],
                                    borderRadius: BorderRadius.circular(16),
                                    image: DecorationImage(
                                        image: AssetImage(
                                            "assets/images/Student_Card-remove.png"))),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20.0),
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 96,
                                        width: 72,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    "assets/images/Rectangle 2715.png"))),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 16.0, top: 10),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Nobite",
                                              style:
                                                  FontConstant.k18w500whiteText,
                                            ),
                                            Text("Nursary sec A",
                                                style: FontConstant
                                                    .k18w500whiteText
                                                    .copyWith(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: Colors.white
                                                            .withOpacity(0.5))),
                                            Text("08:00 am to 01:00 pm",
                                                style: FontConstant
                                                    .k18w500whiteText
                                                    .copyWith(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: Colors.white
                                                            .withOpacity(0.5))),
                                            Text("2nd rank",
                                                style: FontConstant
                                                    .k18w500whiteText
                                                    .copyWith(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: Colors.white
                                                            .withOpacity(0.5))),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "info",
                              style: FontConstant2.k22w5008471text,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Container(
                      height: 150,
                      child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: infocategory.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            children: [
                              Text(
                                infocategory[index],
                                style: FontConstant.k16w500331FText,
                              ),
                            ],
                          );
                        },
                      ),
                    ),

                    // ListView.builder(
                    //     shrinkWrap: true,
                    //     physics: NeverScrollableScrollPhysics(),
                    //     itemCount: infocategory.length,
                    //     itemBuilder: (BuildContext context, int index) {
                    //       return Container(
                    //         child: Text(
                    //           infocategory[index],
                    //           style: FontConstant.k16w500331FText,
                    //         ),
                    //       );
                    //     }),
                    SizedBox(
                      height: 52,
                      width: 382,
                      child: MainButton(
                          onTap: () {},
                          title: "Edit",
                          textStyleColor: Colors.white,
                          backgroundColor: ThemeColor.primarycolor),
                    ),
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
