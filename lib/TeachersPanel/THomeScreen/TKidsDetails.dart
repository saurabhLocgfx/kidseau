import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kidseau/Theme.dart';
import 'package:kidseau/api/Teacherpanelapi/Tkid_details_api/T_kid_details.dart';
import 'package:kidseau/api/models/kid_detail_model/kid_detail_model.dart';
import 'package:kidseau/shard_prefs/shared_prefs.dart';

class TKidsOverview extends StatefulWidget {
  final String kidId;
  const TKidsOverview({Key? key, required this.kidId}) : super(key: key);

  @override
  State<TKidsOverview> createState() => _TKidsOverviewState();
}

class _TKidsOverviewState extends State<TKidsOverview> {
  List<bool> isChecked = [false, false, false, false];
  List<String> time = ['Birth', '2 Months', '4 Months', '11 Months'];
  var parentcategory = [
    "Mother's name",
    "Occupation",
    "Email address",
    "Phone Number"
  ];
  var parentcategorydata = [
    "Lucy Bravo",
    "House Wife",
    "Ab@gmail.com",
    "9876543201"
  ];
  var kidscategory = ["Class", "Age", "Birthday", "Gender", "Address"];
  var kidscategorydata = [
    "Nursery",
    "years",
    "29/9/2022",
    "Female",
    "6391 Elgin St. Celina"
  ];
  var medicalcategory = ["Blood group", "Allergy", "Weight", "Height"];
  var medicalcategorydata = ["B", "Chocolate", "10kg", "2’3 ft"];

  @override
  void initState() {
    _isArabic = UserPrefs.getArbBool() ?? false;
    _getData();
    super.initState();
  }

  bool _isArabic = false;
  bool _isLoading = false;
  KidDetailModel model = KidDetailModel();
  _getData() {
    print(widget.kidId);
    _isLoading = true;
    final resp = TKidDetails().get(kidId: widget.kidId);
    resp.then((value) {
      print(value);
      if (value['status'] == 1) {
        setState(() {
          model = KidDetailModel.fromJson(value);
          _isLoading = false;
        });
      } else {
        setState(() {
          _isLoading = false;
        });
      }
    });
  }

  bool _showMore = false;
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
            "kid Profile".tr(),
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
        body: _isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Container(
                width: 1.sw,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      "assets/images/bg23.png",
                    ),
                    fit: BoxFit.fitWidth,
                    alignment: Alignment.topLeft,
                  ),
                ),
                child: Stack(
                  children: [
                    /*Image.asset(
                      "assets/images/postsbackground.png",
                      height: 414,
                      width: 1.sw,
                    ),*/
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 140),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Row(
                            children: [
                              if (model.image != null)
                                Container(
                                  clipBehavior: Clip.hardEdge,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  height: 128,
                                  width: 96,
                                  child: Image.network(
                                    model.image!.toString(),
                                    errorBuilder: (q, w, e) => Image.asset(
                                        "assets/images/profileperson.png"),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              SizedBox(width: 16),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    model.name.toString(),
                                    style: FontConstant.k24w500brownText,
                                  ),
                                  if (model.gender != null)
                                    Text(
                                        "${model.gender!.toLowerCase() == 'm' ? 'S/O ' : model.gender!.toLowerCase() == 'f' ? 'D/O ' : 'C/O '} - ${model.fatherName}",
                                        style: FontConstant.k16w5008471Text),
                                  Row(
                                    children: [
                                      Text(model.group.toString().tr(),
                                          style: FontConstant.k16w500B7A4Text),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 4.0),
                                        child: Icon(
                                          Icons.circle,
                                          size: 3,
                                          color: Color(0xffB7A4B2),
                                        ),
                                      ),
                                      Text(
                                          "${model.age.toString()} ${"years".tr()}",
                                          style: FontConstant.k16w500B7A4Text),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 32),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Kid".tr(),
                                style: FontConstant2.k22w5008471text,
                              ),
                              SizedBox(height: 8),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 104.w,
                                    child: Text(
                                      'Class'.tr(),
                                      style: FontConstant.k16w500331FText,
                                    ),
                                  ),
                                  SizedBox(width: 16.w),
                                  Text(
                                    model.group.toString(),
                                    style: FontConstant.k16w5008471Text,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 104.w,
                                    child: Text(
                                      'Age'.tr(),
                                      style: FontConstant.k16w500331FText,
                                    ),
                                  ),
                                  SizedBox(width: 16.w),
                                  Text(
                                    '${model.age} ${'years'.tr()}',
                                    style: FontConstant.k16w5008471Text,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 104.w,
                                    child: Text(
                                      'Birthday'.tr(),
                                      style: FontConstant.k16w500331FText,
                                    ),
                                  ),
                                  SizedBox(width: 16.w),
                                  Text(
                                    model.birthday.toString(),
                                    style: FontConstant.k16w5008471Text,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 104.w,
                                    child: Text(
                                      'Gender'.tr(),
                                      style: FontConstant.k16w500331FText,
                                    ),
                                  ),
                                  SizedBox(width: 16.w),
                                  Text(
                                    model.gender.toString() == 'M'
                                        ? 'Male'.tr()
                                        : 'Female'.tr(),
                                    style: FontConstant.k16w5008471Text,
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 104.w,
                                    child: Text(
                                      'Address'.tr(),
                                      style: FontConstant.k16w500331FText,
                                    ),
                                  ),
                                  SizedBox(width: 16.w),
                                  Expanded(
                                    child: Text(
                                      model.address.toString(),
                                      overflow: TextOverflow.visible,
                                      style: FontConstant.k16w5008471Text,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 32),
                        Stack(children: [
                          AnimatedContainer(
                            duration: Duration(milliseconds: 500),
                            curve: Curves.easeIn,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                image: DecorationImage(
                                    image: AssetImage(
                                      'assets/images/kidinfobg.png',
                                    ),
                                    alignment: Alignment.topLeft,
                                    fit: BoxFit.fitWidth)),
                            // height: 280,
                            width: 1.sw,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 16.0, right: 16, bottom: 16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 24),
                                  Text("Parent".tr(),
                                      style: FontConstant2.k22w5008471text),
                                  SizedBox(height: 10),
                                  Row(
                                    children: [
                                      Expanded(
                                        /*width: 104.w,
                                    height: 27.h,*/
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Mother\'s name'.tr(),
                                              style:
                                                  FontConstant.k16w500331FText,
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(width: 16.w),
                                      Expanded(
                                        flex: 2,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              model.motherName.toString(),
                                              style:
                                                  FontConstant.k16w5008471Text,
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        /*width: 104.w,
                                    height: 27.h,*/
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Occupation'.tr(),
                                              style:
                                                  FontConstant.k16w500331FText,
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(width: 16.w),
                                      Expanded(
                                        flex: 2,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              model.mOccupation.toString(),
                                              style:
                                                  FontConstant.k16w5008471Text,
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        /*width: 104.w,
                                    height: 27.h,*/
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Email Address'.tr(),
                                              style:
                                                  FontConstant.k16w500331FText,
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(width: 16.w),
                                      Expanded(
                                        flex: 2,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              model.motherEmail.toString(),
                                              style:
                                                  FontConstant.k16w5008471Text,
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        /*width: 104.w,
                                    height: 27.h,*/
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Phone Number'.tr(),
                                              style:
                                                  FontConstant.k16w500331FText,
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(width: 16.w),
                                      Expanded(
                                        flex: 2,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              model.motherPhone.toString(),
                                              style:
                                                  FontConstant.k16w5008471Text,
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  _showMore
                                      ? Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Expanded(
                                                  /*width: 104.w,
                                    height: 27.h,*/
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'Father\'s name'.tr(),
                                                        style: FontConstant
                                                            .k16w500331FText,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(width: 16.w),
                                                Expanded(
                                                  flex: 2,
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        model.fatherName
                                                            .toString(),
                                                        style: FontConstant
                                                            .k16w5008471Text,
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Expanded(
                                                  /*width: 104.w,
                                    height: 27.h,*/
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'Occupation'.tr(),
                                                        style: FontConstant
                                                            .k16w500331FText,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(width: 16.w),
                                                Expanded(
                                                  flex: 2,
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        model.fOccupation
                                                            .toString(),
                                                        style: FontConstant
                                                            .k16w5008471Text,
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Expanded(
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'Email Address'.tr(),
                                                        style: FontConstant
                                                            .k16w500331FText,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(width: 16.w),
                                                Expanded(
                                                  flex: 2,
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        model.fatherEmail
                                                            .toString(),
                                                        style: FontConstant
                                                            .k16w5008471Text,
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Expanded(
                                                  /*width: 104.w,
                                    height: 27.h,*/
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'Phone Number'.tr(),
                                                        style: FontConstant
                                                            .k16w500331FText,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(width: 16.w),
                                                Expanded(
                                                  flex: 2,
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        model.fatherPhone
                                                            .toString(),
                                                        style: FontConstant
                                                            .k16w5008471Text,
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        )
                                      : SizedBox.shrink(),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        _showMore = !_showMore;
                                      });
                                    },
                                    child: _showMore
                                        ? Padding(
                                            padding:
                                                const EdgeInsets.only(top: 30),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text("Close".tr(),
                                                    style: FontConstant2
                                                        .k24w5008267text
                                                        .copyWith(
                                                            fontSize: 18)),
                                                SizedBox(width: 10),
                                                Image.asset(
                                                  "assets/images/arrowup.png",
                                                  color: Colors.black,
                                                  height: 20,
                                                  width: 20,
                                                ),
                                              ],
                                            ),
                                          )
                                        : Padding(
                                            padding:
                                                const EdgeInsets.only(top: 30),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text("View father’s info".tr(),
                                                    style: FontConstant2
                                                        .k24w5008267text
                                                        .copyWith(
                                                            fontSize: 18)),
                                                SizedBox(width: 10),
                                                Image.asset(
                                                  "assets/images/arrowdown.png",
                                                  color: Colors.black,
                                                  height: 24,
                                                  width: 24,
                                                ),
                                              ],
                                            ),
                                          ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          /*_isArabic
                              ? SizedBox.shrink()
                              : */
                          Positioned(
                            right: -10,
                            top: 30,
                            child: Image.asset(
                              'assets/images/owl.png',
                              width: 166,
                              height: 154,
                            ),
                          ),
                        ]),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 24),
                              Text("Medical".tr(),
                                  style: FontConstant2.k22w5008471text),
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Blood group".tr(),
                                          style: FontConstant.k16w500331FText,
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: 16.w),
                                  Expanded(
                                    flex: 2,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          model.bloodGroup.toString(),
                                          style: FontConstant.k16w5008471Text,
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Allergy".tr(),
                                          style: FontConstant.k16w500331FText,
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: 16.w),
                                  Expanded(
                                    flex: 2,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'None',
                                          style: FontConstant.k16w5008471Text,
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Height".tr(),
                                          style: FontConstant.k16w500331FText,
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: 16.w),
                                  Expanded(
                                    flex: 2,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '${model.height} cm',
                                          style: FontConstant.k16w5008471Text,
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Weight".tr(),
                                          style: FontConstant.k16w500331FText,
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: 16.w),
                                  Expanded(
                                    flex: 2,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '${model.weight} kg',
                                          style: FontConstant.k16w5008471Text,
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 8),
                        Container(
                          color: Colors.transparent,
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Current treatment".tr(),
                                  style: FontConstant.k16w500331FText),
                              Text(
                                model.medicalstatus.toString(),
                                style: FontConstant.k16w5008471Text,
                              ),
                              SizedBox(height: 32),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Vaccinations".tr(),
                                      style: FontConstant2.k22w5008471text),
                                  SizedBox(height: 4),
                                  if (model.otherVaccination != null)
                                    for (int i = 0;
                                        i < model.otherVaccination!.length;
                                        i++)
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
                                                    model.otherVaccination![i],
                                                    style: FontConstant
                                                        .k16w500331FText,
                                                  ),
                                                  SizedBox(width: 16),
                                                  /*Text(time[i],
                                                    style: FontConstant
                                                        .k16w400B7A4Text
                                                        .copyWith(
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500)),*/
                                                ],
                                              ),
                                              Checkbox(
                                                activeColor: Color(0xffBE74AA),
                                                checkColor: Colors.white,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                ),
                                                value: true, // isChecked[i],
                                                onChanged: (bool? value) {
                                                  /*setState(() {
                                                  isChecked[i] = value!;
                                                });*/
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                  SizedBox(height: 20),
                                  /*  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.center,
                                    children: [
                                      GestureDetector(
                                        onTap: () {},
                                        child: Text("view all".tr(),
                                            style: FontConstant2
                                                .k24w5008267text
                                                .copyWith(fontSize: 18)),
                                      ),
                                      SizedBox(width: 10),
                                      Image.asset(
                                        "assets/images/arrowdown.png",
                                        height: 24,
                                        width: 24,
                                      ),
                                    ],
                                  ),*/
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
              )));
  }
}
