import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kidseau/TeachersPanel/THomeScreen/THomeScreen.dart';
import 'package:kidseau/Theme.dart';
import 'package:kidseau/Widgets/buttons.dart';
import 'package:kidseau/api/Teacherpanelapi/teacher_profile_api/teacher_profile.dart';
import 'package:kidseau/api/models/teacher_profile_details_model/teacher_profile_details_model.dart';

import '../../ParentsPanel/PProfileScreens/PSchoolProfile.dart';
import 'TEditProfile.dart';

class TParentProfile extends StatefulWidget {
  final TeacherProfileDetailsModel model;
  final Function onPop;
  const TParentProfile({Key? key, required this.model, required this.onPop}) : super(key: key);

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
  void initState() {
    //_getData();
    super.initState();
  }


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
                      /*
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  "assets/images/profileperson.png")))*/
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Image.network(widget.model.image.toString(),errorBuilder: (q,w,e)=> Text('Image not loaded'),fit: BoxFit.fitHeight,),
                    ),
                    SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                        widget.model.name.toString(),
                          style: FontConstant.k24w500brownText,
                        ),
                        Text(
                          widget.model.education.toString(),
                          style: FontConstant.k16w400B7A4Text,
                        ),
                        Text(widget.model.phoneNumber.toString(), style: FontConstant.k16w5008471Text),
                        Text(widget.model.email.toString(),
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
                child: SchoolCard(model: widget.model,),
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
                    Row(
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
                                    "First name".tr(),
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
                              widget.model.fristName.toString(),
                              style: FontConstant.k16w5008471Text,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
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
                                    "Family name".tr(),
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
                              widget.model.familyName.toString(),
                              style: FontConstant.k16w5008471Text,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
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
                                    "Gender".tr(),
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
                              widget.model.gender.toString(),
                              style: FontConstant.k16w5008471Text,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
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
                                    "Birthday".tr(),
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
                              widget.model.brithday.toString(),
                              style: FontConstant.k16w5008471Text,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
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
                                    "Year of experiance".tr(),
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
                              widget.model.yearOfExp.toString(),
                              style: FontConstant.k16w5008471Text,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
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
                                    "Address".tr(),
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
                              widget.model.address.toString(),
                              style: FontConstant.k16w5008471Text,
                            ),
                          ],
                        ),
                      ],
                    ),
                    /*SizedBox(
                      height: 260,
                      child: ListView.builder(
                        padding: EdgeInsets.zero,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: infocategory.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 16),
                            child:
                          );
                        },
                      ),
                    ),*/
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
                            builder: (_) => TEditProfileScreen(model: widget.model, onPop: (){
                              widget.onPop();
                            },),
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
