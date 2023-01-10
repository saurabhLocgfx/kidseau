import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kidseau/ParentsPanel/PHomeScreen/PLearningAlphabets.dart';
import 'package:kidseau/Theme.dart';
import 'package:kidseau/Widgets/buttons.dart';
import 'package:kidseau/api/Teacherpanelapi/teacher_profile_api/teacher_school_profile_api.dart';
import 'package:kidseau/api/models/teacher_profile_details_model/teacher_profile_details_model.dart';
import 'package:kidseau/api/models/teacher_profile_details_model/teacher_school_profile_detail_model.dart';

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
  _getData(){
    _isLoading = true;
    final resp = TeacherSchoolProfileApi().get();
    resp.then((value){
      try{
        setState(() {
          model = TeacherSchoolProfileDetailsModel.fromJson(value);
          _isLoading = false;
        });
      }catch(e){
        print('Teacher School profile $value');
        setState(() {
          _isLoading = false;
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
      body: _isLoading ? Center(child: CircularProgressIndicator(),) :Padding(
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
                            Text('${DateFormat.jm().format(DateFormat("hh:mm:ss").parse(model.schoolTime!.split('To').first.toString()))} to ${DateFormat.jm().format(DateFormat("hh:mm:ss").parse(model.schoolTime!.split('To').last.toString()))}',
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
              Text(
                "Phone number".tr(),
                style: FontConstant.k16w500331FText,
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
              Padding(
                padding: const EdgeInsets.only(right: 50),
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
                InkWell(
                  onTap: (){},
                  child: CircleAvatar(
                      radius: 24,
                      backgroundImage: AssetImage(
                        "assets/images/facebookicon.png",
                      )),
                ),
                InkWell(
                  onTap: (){},
                  child: CircleAvatar(
                      radius: 24,
                      backgroundImage: AssetImage(
                        "assets/images/Twittericon.png",
                      )),
                ),
                InkWell(
                  onTap: (){},
                  child: CircleAvatar(
                      radius: 24,
                      backgroundImage: AssetImage(
                        "assets/images/linkedicon.png",
                      )),
                ),
                InkWell(
                  onTap: (){},
                  child: CircleAvatar(
                      radius: 24,
                      backgroundImage: AssetImage(
                        "assets/images/instagramicon.png",
                      )),
                ),
              ],
            ),
            SizedBox(height: 32),
            TeacherCard(model: model,),
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
