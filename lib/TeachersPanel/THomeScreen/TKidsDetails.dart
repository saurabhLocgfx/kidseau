import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kidseau/TeachersPanel/THomeScreen/TActivityScreen.dart';
import 'package:kidseau/Theme.dart';

class TKidsOverview extends StatefulWidget {
  const TKidsOverview({Key? key}) : super(key: key);

  @override
  State<TKidsOverview> createState() => _TKidsOverviewState();
}

class _TKidsOverviewState extends State<TKidsOverview> {
  List<bool> isChecked = [false, false, false, false];
  List<String> time = ['Birth', '2 Months', '4 Months', '11 Months'];
  var parentcategory = [
    "Mother's name",
    "Occupation",
    "Email adress",
    "Phone Number"
  ];
  var parentcategorydata = [
    "Lucy Bravo",
    "House Wife",
    "Ab@gmail.com",
    "9876543201"
  ];
  var kidscategory = ["Class", "Age", "Birthday", "Gender", "Adress"];
  var kidscategorydata = [
    "Nursery",
    "4 years",
    "29/9/2022",
    "Female",
    "6391 Elgin St. Celina"
  ];
  var medicalcategory = ["Blood group", "Allergy", "Weight", "Height"];
  var medicalcategorydata = ["B", "Chocolate", "10kg", "2’3 ft"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
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
          statusBarColor: Color(0xff8267AC).withOpacity(0.16),
        ),
        backgroundColor: Color(0xff8267AC).withOpacity(0.16),
        centerTitle: false,
        title: Text(
          "Kid’s Profile",
          style: FontConstant.k18w5008471Text,
        ),
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
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Image.asset(
              "assets/images/postsbackground.png",
              height: 414,
              width: 414,
            ),
            Column(
              children: [
                SizedBox(height: 140),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
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
                        children: [
                          Text(
                            "Johnny Bravo",
                            style: FontConstant.k24w500brownText,
                          ),
                          Text("S/O - Bravo",
                              style: FontConstant.k16w5008471Text),
                          Row(
                            children: [
                              Text("Group B",
                                  style: FontConstant.k16w500B7A4Text),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 4.0),
                                child: Icon(
                                  Icons.circle,
                                  size: 3,
                                  color: Color(0xffB7A4B2),
                                ),
                              ),
                              Text("4 years",
                                  style: FontConstant.k16w500B7A4Text),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "kid",
                          style: FontConstant2.k22w5008471text,
                        ),
                      ),
                      SizedBox(height: 10),
                      SizedBox(
                        height: 100.h,
                        child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.zero,
                            itemCount: parentcategory.length,
                            shrinkWrap: true,
                            itemBuilder: (BuildContext context, int index) {
                              return Row(
                                children: [
                                  Container(
                                    width: 104.w,
                                    height: 27.h,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          kidscategory[index],
                                          style: FontConstant.k16w500331FText,
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: 16.w),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        kidscategorydata[index],
                                        style: FontConstant.k16w5008471Text,
                                      )
                                    ],
                                  ),
                                ],
                              );
                            }),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 32),
                Stack(children: [
                  Container(
                    height: 280,
                    width: 414,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                                "assets/images/kidsdetailsbackground.png"),
                            fit: BoxFit.cover)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 24),
                          Text("Parent", style: FontConstant2.k22w5008471text),
                          SizedBox(height: 10),
                          Expanded(
                            child: Container(
                              child: ListView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  padding: EdgeInsets.zero,
                                  itemCount: parentcategory.length,
                                  shrinkWrap: true,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Row(
                                      children: [
                                        Container(
                                          width: 104.w,
                                          height: 27.h,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                parentcategory[index],
                                                style: FontConstant
                                                    .k16w500331FText,
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(width: 16.w),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              parentcategorydata[index],
                                              style:
                                                  FontConstant.k16w5008471Text,
                                            )
                                          ],
                                        ),
                                      ],
                                    );
                                  }),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 220.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("View Father\'s info",
                            style: FontConstant2.k24w5008267text
                                .copyWith(fontSize: 18)),
                        SizedBox(width: 10),
                        Image.asset(
                          "assets/images/arrowdown.png",
                          height: 24,
                          width: 24,
                        ),
                      ],
                    ),
                  )
                ]),
                Container(
                  height: 210,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 24),
                        Text("Medical", style: FontConstant2.k22w5008471text),
                        SizedBox(height: 10),
                        Expanded(
                          child: Container(
                            child: ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                padding: EdgeInsets.zero,
                                itemCount: parentcategory.length,
                                shrinkWrap: true,
                                itemBuilder: (BuildContext context, int index) {
                                  return Row(
                                    children: [
                                      Container(
                                        width: 104.w,
                                        height: 27.h,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              medicalcategory[index],
                                              style:
                                                  FontConstant.k16w500331FText,
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(width: 16.w),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            medicalcategorydata[index],
                                            style: FontConstant.k16w5008471Text,
                                          )
                                        ],
                                      ),
                                    ],
                                  );
                                }),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Current treatment",
                          style: FontConstant.k16w500331FText),
                      SizedBox(height: 4),
                      Text(
                        "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit. Exercitation veniam consequat sunt nostrud amet.",
                        style: FontConstant.k16w5008471Text,
                      ),
                      SizedBox(height: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Vaccinations",
                              style: FontConstant2.k22w5008471text),
                          SizedBox(height: 4),
                          for (int i = 0; i < 4; i++)
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  isChecked[i] = !isChecked[i];
                                });
                              },
                              child: Container(
                                color: Colors.transparent,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          "Vaccine Name",
                                          style: FontConstant.k16w500331FText,
                                        ),
                                        SizedBox(width: 16),
                                        Text(time[i],
                                            style: FontConstant.k16w400B7A4Text
                                                .copyWith(
                                                    fontWeight:
                                                        FontWeight.w500)),
                                      ],
                                    ),
                                    Checkbox(
                                      activeColor: Color(0xffBE74AA),
                                      checkColor: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      value: isChecked[i],
                                      onChanged: (bool? value) {
                                        setState(() {
                                          isChecked[i] = value!;
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            TActivityScreen()),
                                  );
                                },
                                child: Text("view all",
                                    style: FontConstant2.k24w5008267text
                                        .copyWith(fontSize: 18)),
                              ),
                              SizedBox(width: 10),
                              Image.asset(
                                "assets/images/arrowdown.png",
                                height: 24,
                                width: 24,
                              ),
                            ],
                          ),
                          SizedBox(height: 40),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
