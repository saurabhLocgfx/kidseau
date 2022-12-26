import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kidseau/TeachersPanel/THomeScreen/THomeScreen.dart';
import 'package:kidseau/Theme.dart';
import 'package:kidseau/Widgets/buttons.dart';

import '../../ParentsPanel/PProfileScreens/PSchoolProfile.dart';
import 'TEditProfile.dart';

class TParentProfile extends StatefulWidget {
  const TParentProfile({Key? key}) : super(key: key);

  @override
  State<TParentProfile> createState() => _TParentProfileState();
}

class _TParentProfileState extends State<TParentProfile> {
  var infocategory = [
    "First name".tr(),
    "Family name".tr(),
    "Gender".tr(),
    "Birthday".tr(),
    "Year of experiance".tr(),
    "Address".tr(),
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
    return SingleChildScrollView(
      child: Stack(
        children: [
          SizedBox(
              width: 1.sw,
              height: 400,
              child: Stack(
                children: [
                  /*SizedBox(
                    width: 1.sw,
                    child: Image.asset(
                      'assets/images/topbackground.png',
                      fit: BoxFit.fitWidth,
                    ),
                  ),*/
                  Container(
                    width: 1.sw,
                    height: 410,
                    /*decoration: BoxDecoration(
                      gradient: LinearGradient(
                         colors: [Colors.white.withOpacity(0.6), Colors.white],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: [0.01, 1.0],
                      ),
                    ),*/
                  ),
                ],
              )),
          Column(
            children: [
              SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 128,
                      width: 96.2,
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
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => PSchoolProfile(),
                    ),
                  );
                },
                child: SchoolCard(),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "info".tr(),
                      style: FontConstant2.k22w5008471text,
                    ),
                    SizedBox(height: 16),
                    SizedBox(
                      height: 260,
                      child: ListView.builder(
                        padding: EdgeInsets.zero,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: infocategory.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 16),
                            child: Row(
                              children: [
                                Container(
                                  height: 32,
                                  width: 104,
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Column(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            infocategory[index],
                                            style: FontConstant.k16w500331FText,
                                          ),
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
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: SizedBox(
                  height: 52.h,
                  width: 382.w,
                  child: MainButton(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => TEditProfileScreen(),
                          ),
                        );
                      },
                      title: "Edit".tr(),
                      textStyleColor: Colors.white,
                      backgroundColor: ThemeColor.primarycolor),
                ),
              ),
              SizedBox(
                height: 128,
              )
            ],
          ),
        ],
      ),
    );
  }
}
