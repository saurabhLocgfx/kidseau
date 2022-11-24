import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kidseau/Constants/colors.dart';

import '../../Theme.dart';
import '../../Widgets/Calender/calendermodel.dart';
import '../../Widgets/buttons.dart';

class TStudentDetailScreen extends StatefulWidget {
  const TStudentDetailScreen({Key? key}) : super(key: key);

  @override
  State<TStudentDetailScreen> createState() => _TStudentDetailScreenState();
}

class _TStudentDetailScreenState extends State<TStudentDetailScreen> {
  List<String> imageicon = [
    "assets/images/iconprofile.png",
    "assets/images/galleryicon.png",
  ];

  List<String> items = [
    "Overview",
    "Gallery",
  ];
  // final List screen = [Messagebody(),];
  int selectedIndex = 0;

  final controller = PageController(initialPage: 1);

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  final PageController _pageController = PageController(
    initialPage: 0,
  );

  int pageIndex = 0;
  var shortnames = ["PG", "RS", "Re", "LA", "VP"];
  var fullnames = [
    "Playing Games",
    "Recognizing Sound",
    "Resting",
    "Learning Alphabets",
    "VP",
    "Voice Practice"
  ];

  List<String> imageicon2 = [
    "assets/images/iconprofile.png",
    "assets/images/galleryicon.png",
  ];

  List<String> items2 = [
    "Overview",
    "Gallery",
  ];
  // final List screen = [Messagebody(),];
  final now = DateTime.now();
  int current = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xffF8F6FA),
      ),
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 70.0,
          flexibleSpace: ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                color: Colors.transparent,
              ),
            ),
          ),
          automaticallyImplyLeading: false,
          elevation: 0,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: ThemeColor.lightpurple.withOpacity(0.06),
          ),
          backgroundColor: Color(0xff8267AC).withOpacity(0.06),
          centerTitle: false,
          leading: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Image.asset(
                    "assets/images/backarrow.png",
                    height: 24,
                    width: 24,
                  ),
                ),
              ),
            ],
          ),
          title: GestureDetector(
            onTap: () {},
            child: Text(
              "Kid’s Profile",
              style: FontConstant.k18w5008471Text,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Stack(
            children: [
              SizedBox(
                width: 1.sw,
                child: Image.asset(
                  'assets/images/topbackground.png',
                  fit: BoxFit.fitWidth,
                ),
              ),
              Container(
                width: 1.sw,
                height: 455,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xffF8F6FA).withOpacity(0.6),
                      Color(0xffF8F6FA)
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0.01, 1.0],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    SizedBox(height: 30),
                    Row(
                      children: [
                        Container(
                          height: 128.h,
                          width: 96.w,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      "assets/images/profileperson.png"))),
                        ),
                        SizedBox(width: 24),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Nobita",
                              style: FontConstant2.k32w500331Ftext,
                            ),
                            Text(
                              "S/O -  Akbar",
                              style: FontConstant.k16w5008471Text,
                            ),
                            Text("xyz@gmail.com",
                                style: FontConstant.k16w5008471Text),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Info",
                                  style: FontConstant2.k22w5008471text,
                                ),
                                Stack(
                                  children: [
                                    Positioned(
                                      bottom: 0,
                                      right: 0,
                                      child: SizedBox(
                                        width: 134,
                                        child: Image.asset(
                                            'assets/images/birds.png'),
                                      ),
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Class Section",
                                              style:
                                                  FontConstant.k16w500331FText,
                                            ),
                                            SizedBox(height: 16),
                                            Text(
                                              "Group",
                                              style:
                                                  FontConstant.k16w500331FText,
                                            ),
                                            SizedBox(height: 16),
                                            Text(
                                              "Age",
                                              style:
                                                  FontConstant.k16w500331FText,
                                            ),
                                            SizedBox(height: 16),
                                            Text(
                                              "Birthday",
                                              style:
                                                  FontConstant.k16w500331FText,
                                            ),
                                            SizedBox(height: 16),
                                            Text(
                                              "Gender",
                                              style:
                                                  FontConstant.k16w500331FText,
                                            ),
                                          ],
                                        ),
                                        SizedBox(width: 16),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Nursery Sec A",
                                              style:
                                                  FontConstant.k16w5008471Text,
                                            ),
                                            SizedBox(height: 16),
                                            Text(
                                              "Group A",
                                              style:
                                                  FontConstant.k16w5008471Text,
                                            ),
                                            SizedBox(height: 16),
                                            Text(
                                              "4 years old",
                                              style:
                                                  FontConstant.k16w5008471Text,
                                            ),
                                            SizedBox(height: 16),
                                            Text(
                                              "29/09/2020",
                                              style:
                                                  FontConstant.k16w5008471Text,
                                            ),
                                            SizedBox(height: 16),
                                            Text(
                                              "Male",
                                              style:
                                                  FontConstant.k16w5008471Text,
                                            )
                                          ],
                                        ),
                                        //Spacer(),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Performance",
                              style: FontConstant2.k22w5008471text,
                            ),
                            SizedBox(height: 16),
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    height: 116,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(16)),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Growth Rank",
                                                style: FontConstant
                                                    .k16w5008471Text,
                                              ),
                                              Image.asset(
                                                "assets/images/batchicon.png",
                                                height: 24,
                                              )
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                "2",
                                                style: FontConstant2
                                                    .k32w5008267text,
                                              ),
                                              Text(
                                                "nd Place",
                                                style: FontConstant
                                                    .k16w400B7A4Text,
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 16),
                                Expanded(
                                  child: Container(
                                    height: 116,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(16)),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16.0, vertical: 4),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            flex: 2,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Attendance",
                                                  style: FontConstant
                                                      .k14w5008471Text,
                                                ),
                                                SizedBox(
                                                  height: 5.h,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Container(
                                                      width: 6,
                                                      height: 44,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(18),
                                                        color:
                                                            AppColors().k8267AC,
                                                      ),
                                                    ),
                                                    Container(
                                                      width: 6,
                                                      height: 44,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(18),
                                                        color:
                                                            AppColors().k8267AC,
                                                      ),
                                                    ),
                                                    Container(
                                                      width: 6,
                                                      height: 24,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(18),
                                                        color: AppColors()
                                                            .k8267AC
                                                            .withOpacity(0.2),
                                                      ),
                                                    ),
                                                    Container(
                                                      width: 6,
                                                      height: 44,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(18),
                                                        color:
                                                            AppColors().k8267AC,
                                                      ),
                                                    ),
                                                    Container(
                                                      width: 6,
                                                      height: 24,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(18),
                                                        color: AppColors()
                                                            .k8267AC
                                                            .withOpacity(0.2),
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            width: 3,
                                          ),
                                          Expanded(
                                            child: Column(
                                              /*mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,*/
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Image.asset(
                                                      "assets/images/bars1.png",
                                                      height: 24,
                                                    )
                                                  ],
                                                ),
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "3/5",
                                                      style: FontConstant2
                                                          .k24w4008267text,
                                                    ),
                                                    Text(
                                                      "days",
                                                      style: FontConstant2
                                                          .k16w400B7A4text,
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 16),
                        Container(
                          /*height: 190.h,
                          width: 392.w,*/
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 5),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Activity Tracker",
                                      style: FontConstant.k16w5008471Text,
                                    ),
                                    Image.asset(
                                      "assets/images/bar3.png",
                                      height: 24,
                                    )
                                  ],
                                ),
                                SizedBox(height: 15),
                                Row(
                                  children: [
                                    Image.asset(
                                      "assets/images/bar4.png",
                                      height: 130,
                                    ),
                                    SizedBox(width: 8),
                                    Expanded(
                                      child: SizedBox(
                                        // height: 140,
                                        child: ListView.builder(
                                            shrinkWrap: true,
                                            padding: EdgeInsets.zero,
                                            physics:
                                                NeverScrollableScrollPhysics(),
                                            itemCount: shortnames.length,
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              return Row(
                                                children: [
                                                  Text(shortnames[index],
                                                      style: FontConstant
                                                          .k14w4008471Text
                                                          .copyWith(
                                                              color: Color(
                                                                  0xff331F2D))),
                                                  SizedBox(width: 5),
                                                  Icon(
                                                    Icons.circle,
                                                    size: 4,
                                                    color: Color(0xff84717F),
                                                  ),
                                                  SizedBox(width: 5),
                                                  Text(fullnames[index],
                                                      style: FontConstant
                                                          .k12w5008471Text),
                                                ],
                                              );
                                            }),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Attendance",
                              style: FontConstant2.k22w5008471text,
                            ),
                            SizedBox(height: 10),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "Working Days",
                                      style: FontConstant.k16w500331FText,
                                    ),
                                    SizedBox(width: 16),
                                    Text(
                                      "70 days",
                                      style: FontConstant.k16w5008471Text,
                                    )
                                  ],
                                ),
                                SizedBox(height: 10),
                                Row(
                                  children: [
                                    Text(
                                      "Attended days",
                                      style: FontConstant.k16w500331FText,
                                    ),
                                    SizedBox(width: 16),
                                    Text(
                                      "54 days",
                                      style: FontConstant.k16w5008471Text,
                                    )
                                  ],
                                ),
                                SizedBox(height: 10),
                                Row(
                                  children: [
                                    Text(
                                      "Working Days",
                                      style: FontConstant.k16w500331FText,
                                    ),
                                    SizedBox(width: 16),
                                    Text(
                                      "4 days",
                                      style: FontConstant.k16w5008471Text,
                                    )
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                        SizedBox(height: 16),
                        SizedBox(
                          height: 52,
                          width: 382,
                          child: MaterialButton(
                            elevation: 0,
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30))),
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (_) => CalendarPage2(),
                              );
                            },
                            child: Center(
                              child: Text(
                                "Open Calendar",
                                style: FontConstant.k18w500materialbuttonText
                                    .copyWith(color: ThemeColor.primarycolor),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 32),
                        SizedBox(
                            height: 52,
                            width: 382,
                            child: MainButton(
                                onTap: () {},
                                title: "Talk to class teacher",
                                textStyleColor: Colors.white,
                                backgroundColor: ThemeColor.primarycolor)),
                        SizedBox(
                          height: 52,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
