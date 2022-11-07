import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kidseau/Theme.dart';
import 'package:kidseau/Widgets/Calender/calendermodel.dart';
import 'package:kidseau/Widgets/buttons.dart';

class PKidsOverview extends StatefulWidget {
  const PKidsOverview({Key? key}) : super(key: key);

  @override
  State<PKidsOverview> createState() => _PKidsOverviewState();
}

class _PKidsOverviewState extends State<PKidsOverview> {
  var shortnames = ["PG", "RS", "Re", "LA", "VP"];
  var fullnames = [
    "Playing Games",
    "Recognizing Sound",
    "Resting",
    "Learning Alphabets",
    "VP",
    "Voice Practice"
  ];

  List<String> imageicon = [
    "assets/images/iconprofile.png",
    "assets/images/galleryicon.png",
  ];

  List<String> items = [
    "Overview",
    "Gallery",
  ];
  // final List screen = [Messagebody(),];
  final now = DateTime.now();
  int current = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Class Section",
                          style: FontConstant.k16w500331FText,
                        ),
                        Text(
                          "Nursery Sec A",
                          style: FontConstant.k16w5008471Text,
                        )
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Group",
                          style: FontConstant.k16w500331FText,
                        ),
                        Text(
                          "Group A",
                          style: FontConstant.k16w5008471Text,
                        )
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Age",
                          style: FontConstant.k16w500331FText,
                        ),
                        Text(
                          "4 years old",
                          style: FontConstant.k16w5008471Text,
                        )
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Birthday",
                          style: FontConstant.k16w500331FText,
                        ),
                        Text(
                          "29/09/2020",
                          style: FontConstant.k16w5008471Text,
                        )
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Gender",
                          style: FontConstant.k16w500331FText,
                        ),
                        Text(
                          "Male",
                          style: FontConstant.k16w5008471Text,
                        )
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Material(
                      elevation: 1,
                      borderRadius: BorderRadius.circular(16),
                      child: Container(
                        height: 116,
                        width: 175,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Growth Rank",
                                    style: FontConstant.k16w5008471Text,
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
                                    style: FontConstant2.k32w5008267text,
                                  ),
                                  Text(
                                    "nd Place",
                                    style: FontConstant.k16w400B7A4Text,
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Material(
                      elevation: 1,
                      borderRadius: BorderRadius.circular(16),
                      child: Container(
                        height: 116,
                        width: 175,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Attendance",
                                    style: FontConstant.k16w5008471Text,
                                  ),
                                  Image.asset(
                                    "assets/images/bars1.png",
                                    height: 24,
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Image.asset(
                                    "assets/images/bars2.png",
                                    height: 24,
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        "3/5",
                                        style: FontConstant2.k24w4008267text,
                                      ),
                                      Text(
                                        "days",
                                        style: FontConstant2.k16w400B7A4text,
                                      ),
                                    ],
                                  )
                                ],
                              )
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
              height: 190.h,
              width: 392.w,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(16)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          "assets/images/bar4.png",
                          height: 130,
                        ),
                        Container(
                          height: 140,
                          width: 159,
                          child: ListView.builder(
                              padding: EdgeInsets.zero,
                              itemCount: shortnames.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Row(
                                  children: [
                                    Column(
                                      children: [
                                        Text(shortnames[index],
                                            style: FontConstant.k14w4008471Text
                                                .copyWith(
                                                    color: Color(0xff331F2D))),
                                      ],
                                    ),
                                    SizedBox(width: 10),
                                    Icon(
                                      Icons.circle,
                                      size: 4,
                                      color: Color(0xff84717F),
                                    ),
                                    SizedBox(width: 10),
                                    Column(
                                      children: [
                                        Text(fullnames[index],
                                            style:
                                                FontConstant.k14w5008471Text),
                                      ],
                                    ),
                                  ],
                                );
                              }),
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
                elevation: 1,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CalendarPage2()),
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
      ),
    );
  }
}
