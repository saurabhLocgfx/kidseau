import 'dart:developer';
import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kidseau/ParentsPanel/PHomeScreen/PLearningAlphabets.dart';
import 'package:kidseau/Theme.dart';
import 'package:kidseau/Widgets/buttons.dart';
import 'package:kidseau/api/Teacherpanelapi/teacher_profile_api/teacher_school_profile_api.dart';
import 'package:kidseau/api/models/teacher_profile_details_model/teacher_school_profile_detail_model.dart';
import 'package:url_launcher/url_launcher.dart';

import '../PMessageScreen/PChats.dart';

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
  void initState() {
    _getData();
    super.initState();
  }

  bool _isLoading = false;

  TeacherSchoolProfileDetailsModel model = TeacherSchoolProfileDetailsModel();

  static Future<void> openMap(String latitude, String longitude) async {
    String googleUrl =
        'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
    if (await canLaunchUrl(Uri.parse(googleUrl))) {
      await launchUrl(Uri.parse(googleUrl));
    } else {
      throw 'Could not open the map.';
    }
  }

  bool _noDataFound = false;
  _getData() {
    _isLoading = true;
    final resp = TeacherSchoolProfileApi().get();
    resp.then((value) {
      log(value.toString());
      try {
        if (value['status'] == '1') {
          setState(() {
            model = TeacherSchoolProfileDetailsModel.fromJson(value);
            _isLoading = false;
          });
        } else {
          setState(() {
            _isLoading = false;
            _noDataFound = true;
          });
        }
      } catch (e) {
        print('Teacher School profile $value');
        setState(() {
          _isLoading = false;
          _noDataFound = true;
        });
      }
    });
  }

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
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Padding(
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
                            clipBehavior: Clip.hardEdge,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12)),
                            child: Image.network(
                              model.schoolImage.toString(),
                              fit: BoxFit.fill,
                              errorBuilder: (q, w, e) => Image.asset(
                                  "assets/images/profileperson.png"),
                            ),
                          ),
                          SizedBox(width: 16),
                          Align(
                            alignment: Alignment.center,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  model.schoolName.toString(),
                                  style: FontConstant.k24w500brownText,
                                ),
                                Row(
                                  children: [
                                    Image.asset(
                                      "assets/images/clockicon.png",
                                      height: 24,
                                    ),
                                    SizedBox(width: 10),
                                    Text(
                                        '${DateFormat.jm().format(DateFormat("hh:mm:ss").parse(model.schoolTime!.split('To').first.toString()))} to ${DateFormat.jm().format(DateFormat("hh:mm:ss").parse(model.schoolTime!.split('To').last.toString()))}',
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
                      style: FontConstant2.k22w5008471text,
                    ),
                    SizedBox(height: 6),
                    Row(children: [
                      SizedBox(
                        width: 150,
                        child: Text(
                          "Email id".tr(),
                          style: FontConstant.k16w500331FText,
                        ),
                      ),
                      SizedBox(
                        width: 24,
                      ),
                      Text(
                        model.schoolEmail.toString(),
                        style: FontConstant.k16w5008471Text,
                      )
                    ]),
                    SizedBox(
                      height: 16,
                    ),
                    Row(children: [
                      SizedBox(
                        width: 150,
                        child: Text(
                          "Phone number".tr(),
                          style: FontConstant.k16w500331FText,
                        ),
                      ),
                      SizedBox(
                        width: 24,
                      ),
                      Text(
                        model.schoolPhone.toString(),
                        style: FontConstant.k16w5008471Text,
                      )
                    ]),
                    SizedBox(
                      height: 16,
                    ),
                    Row(children: [
                      SizedBox(
                        width: 150,
                        child: Text(
                          "Address".tr(),
                          style: FontConstant.k16w500331FText,
                        ),
                      ),
                      SizedBox(
                        width: 24,
                      ),
                      Expanded(
                        child: Text(
                          model.schoolAddress.toString(),
                          style: FontConstant.k16w5008471Text,
                        ),
                      )
                    ]),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () {
                            launchUrl(Uri.parse(
                                model.socialMedia!.facebook.toString()));
                          },
                          child: CircleAvatar(
                              radius: 24,
                              backgroundImage: AssetImage(
                                "assets/images/facebookicon.png",
                              )),
                        ),
                        InkWell(
                          onTap: () {
                            launchUrl(Uri.parse(
                                model.socialMedia!.twitter.toString()));
                          },
                          child: CircleAvatar(
                              radius: 24,
                              backgroundImage: AssetImage(
                                "assets/images/Twittericon.png",
                              )),
                        ),
                        InkWell(
                          onTap: () {
                            launchUrl(Uri.parse(
                                model.socialMedia!.linkedIn.toString()));
                          },
                          child: CircleAvatar(
                              radius: 24,
                              backgroundImage: AssetImage(
                                "assets/images/linkedicon.png",
                              )),
                        ),
                        InkWell(
                          onTap: () {
                            launchUrl(Uri.parse(
                                model.socialMedia!.instagram.toString()));
                          },
                          child: CircleAvatar(
                              radius: 24,
                              backgroundImage: AssetImage(
                                "assets/images/instagramicon.png",
                              )),
                        ),
                      ],
                    ),
                    SizedBox(height: 32),
                    ParentCard(
                      model: model,
                    ),
                    SizedBox(height: 32),
                    SizedBox(
                      height: 56,
                      width: 1.sw,
                      child: MainButton(
                          onTap: () {
                            openMap(
                                model.socialMedia!.mapLocation!
                                    .split(",")
                                    .first
                                    .toString(),
                                model.socialMedia!.mapLocation!
                                    .split(",")
                                    .last);
                          },
                          title: "Locate us".tr(),
                          textStyleColor: Colors.white,
                          backgroundColor: ThemeColor.primarycolor),
                    ),
                    SizedBox(height: 25),
                  ],
                ),
              ),
            ),
    );
  }
}

class ParentCard extends StatelessWidget {
  final TeacherSchoolProfileDetailsModel model;
  ParentCard({Key? key, required this.model}) : super(key: key);

  final birds = <String>[
    "assets/images/small bird2.png",
    "assets/images/bird2.png",
    "assets/images/birdpink.png",
    "assets/images/birdorange.png",
  ];
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (ctx) => PChats(
                userId: model.schoolId.toString(),
                onPop: () {},
                userType: model.userType.toString(),
                profilePic: model.directorImage.toString(),
                name: model.directorName.toString(),
                language: '')));
      },
      child: Container(
        //height: 150.h,
        //margin: EdgeInsets.symmetric(horizontal: 16),
        // clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            //color: Colors.blue,
            image: DecorationImage(
                image: AssetImage("assets/images/purplecard.png"),
                fit: BoxFit.fill)),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Stack(
          children: [
            Positioned(
              right: 0,
              bottom: 2,
              child: SizedBox(
                width: 60,
                height: 60,
                child: Image.asset(
                  birds[0],
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Row(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 80,
                  width: 60,
                  clipBehavior: Clip.hardEdge,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(8)),
                  child: Image.network(
                    model.directorImage.toString(),
                    errorBuilder: (q, w, e) => Text('Image not loaded'),
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(
                  width: 12.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(model.directorName.toString(),
                        style: FontConstant.k18w5008471Text.copyWith(
                          color: Colors.white,
                        )),
                    Text('Director',
                        style: FontConstant.k14w4008471Text
                            .copyWith(color: Colors.white.withOpacity(0.74))),
                    Text(model.directorPhone.toString(),
                        style: FontConstant.k16w4008471Text
                            .copyWith(color: Colors.white.withOpacity(0.80))),
                  ],
                ),
                /* Padding(
                            padding: const EdgeInsets.only(top: 30, bottom: 10),
                            child: Align(
                                alignment: Alignment.centerRight,
                                child: Image.asset(
                                  bird[index],
                                  fit: BoxFit.fill,
                                )),
                          ),*/
              ],
            ),
          ],
        ),
      ),
    );
  }
}
