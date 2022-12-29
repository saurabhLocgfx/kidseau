import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kidseau/ParentsPanel/PHomeScreen/PLearningAlphabets.dart';
import 'package:kidseau/Theme.dart';
import 'package:kidseau/Widgets/buttons.dart';

class PSchoolProfile extends StatefulWidget {
  const PSchoolProfile({Key? key}) : super(key: key);

  @override
  State<PSchoolProfile> createState() => _PSchoolProfileState();
}

class _PSchoolProfileState extends State<PSchoolProfile> {
  var receptioninfo = ["Email id", "Phone number", "Address"];
  var receptioninfodata = [
    "Xyz@gmail.com",
    "9876543210",
    "6391 Elgin St. Celina,"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   toolbarHeight: 70.0,
      //   flexibleSpace: ClipRect(
      //     child: BackdropFilter(
      //       filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
      //       child: Container(
      //         color: Colors.transparent,
      //       ),
      //     ),
      //   ),
      //   automaticallyImplyLeading: false,
      //   elevation: 0,
      //   centerTitle: false,
      //   systemOverlayStyle: SystemUiOverlayStyle(
      //     statusBarColor: Color(0xff8267AC).withOpacity(0.16),
      //   ),
      //   backgroundColor: Color(0xff8267AC).withOpacity(0.16),
      //   title: Text(
      //     "School",
      //     style: FontConstant.k18w5008471Text,
      //   ),
      //   leading: Row(
      //     children: [
      //       Padding(
      //         padding: const EdgeInsets.only(left: 16.0),
      //         child: GestureDetector(
      //           onTap: () {
      //             Navigator.pop(context);
      //           },
      //           child: Image.asset(
      //             "assets/images/backarrow.png",
      //             height: 24,
      //             width: 24,
      //           ),
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 128,
                    width: 96,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image:
                                AssetImage("assets/images/profileperson.png"))),
                  ),
                  SizedBox(width: 16),
                  Align(
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "ABC Nursery School",
                          style: FontConstant.k24w500brownText,
                        ),
                        Row(
                          children: [
                            Image.asset(
                              "assets/images/clockicon.png",
                              height: 24,
                            ),
                            SizedBox(width: 10),
                            Text("08:00 am to 02:00 pm",
                                style: FontConstant.k16w5008471Text),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15),
            Text(
              "Reception Info".tr(),
              /*AppLoaclizations.of(context)!
                  .translate("Reception Info")
                  .toString(),*/
              style: FontConstant2.k22w5008471text,
            ),
            SizedBox(height: 6),
            Row(children: [
              Padding(
                padding: const EdgeInsets.only(right: 50),
                child: Text(
                  "Email id",
                  style: FontConstant.k16w500331FText,
                ),
              ),
              SizedBox(
                width: 24,
              ),
              Text(
                "Xyz@gmail.com",
                style: FontConstant.k16w5008471Text,
              )
            ]),
            SizedBox(
              height: 16,
            ),
            Row(children: [
              Text(
                "Phone number",
                style: FontConstant.k16w500331FText,
              ),
              SizedBox(
                width: 24,
              ),
              Text(
                "9876543210",
                style: FontConstant.k16w5008471Text,
              )
            ]),
            SizedBox(
              height: 16,
            ),
            Row(children: [
              Padding(
                padding: const EdgeInsets.only(right: 50),
                child: Text(
                  "Address",
                  style: FontConstant.k16w500331FText,
                ),
              ),
              SizedBox(
                width: 24,
              ),
              Expanded(
                child: Text(
                  "6391 Elgin St. Celina, Delaware 10299",
                  style: FontConstant.k16w5008471Text,
                ),
              )
            ]),
            /*Container(
              height: 180,
              child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.zero,
                  itemCount: receptioninfo.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return Row(
                      children: [
                        Container(
                          width: 104,
                          height: 70,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 4.0),
                                child: Text(
                                  receptioninfo[index],
                                  style: FontConstant.k16w500331FText,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              receptioninfodata[index],
                              style: FontConstant.k16w5008471Text,
                            )
                          ],
                        ),
                      ],
                    );
                  }),
            ),*/
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircleAvatar(
                    radius: 24,
                    backgroundImage: AssetImage(
                      "assets/images/facebookicon.png",
                    )),
                CircleAvatar(
                    radius: 24,
                    backgroundImage: AssetImage(
                      "assets/images/Twittericon.png",
                    )),
                CircleAvatar(
                    radius: 24,
                    backgroundImage: AssetImage(
                      "assets/images/linkedicon.png",
                    )),
                CircleAvatar(
                    radius: 24,
                    backgroundImage: AssetImage(
                      "assets/images/instagramicon.png",
                    )),
              ],
            ),
            SizedBox(height: 32),
            TeacherCard(),
            SizedBox(height: 68),
            SizedBox(
              height: 52.h,
              width: 382.w,
              child: MainButton(
                  onTap: () {},
                  title: "Locate us".tr(),
                  /* AppLoaclizations.of(context)!
                      .translate("Locate us")
                      .toString(),*/
                  textStyleColor: Colors.white,
                  backgroundColor: ThemeColor.primarycolor),
            ),
          ],
        ),
      ),
    );
  }
}
