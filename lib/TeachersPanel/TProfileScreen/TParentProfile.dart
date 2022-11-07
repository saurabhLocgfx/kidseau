import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kidseau/TeachersPanel/THomeScreen/THomeScreen.dart';
import 'package:kidseau/Theme.dart';
import 'package:kidseau/Widgets/buttons.dart';

class TParentProfile extends StatefulWidget {
  const TParentProfile({Key? key}) : super(key: key);

  @override
  State<TParentProfile> createState() => _TParentProfileState();
}

class _TParentProfileState extends State<TParentProfile> {
  var infocategory = [
    "First name",
    "Family name",
    "Gender",
    "Birthday",
    "Year of exp.",
    "Address",
  ];

  var infocategorydata = [
    "Lucy Bravo",
    "House Wife",
    "Ab@gmail.com",
    "9876543210",
    "9876543210",
    "6391 Elgin St. Celina,"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
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
                            image:
                                AssetImage("assets/images/profileperson.png"))),
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
                        "Graduated",
                        style: FontConstant.k16w400B7A4Text,
                      ),
                      Text("9876543210", style: FontConstant.k16w5008471Text),
                      Text("xyz@gmail.com",
                          style: FontConstant.k16w5008471Text),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 24),
            GestureDetector(
                onTap: () {
                  // Navigator.of(context).push(
                  //   MaterialPageRoute(
                  //     builder: (context) => Kidsprofile(),
                  //   ),
                  // );
                },
                child: Attendancecard(
                  image: 'assets/images/groupcard2.png',
                )),
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
                    height: 160,
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
                                      style: FontConstant.k16w500331FText,
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
            SizedBox(height: 50),
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
              height: 128,
            )
          ],
        ),
      ),
    );
  }
}
