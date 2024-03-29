import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kidseau/Widgets/custom_snack_bar.dart';
import 'package:kidseau/api/models/parent_models/parent_profile_models/kid_school_detail_model.dart';
import 'package:kidseau/api/parent_panel_apis/parent_profile_apis/nursery_data_api.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../TeachersPanel/THomeScreen/TActivityScreen.dart';
import '../../Theme.dart';
import '../../Widgets/buttons.dart';

class PParentNurseryWidget extends StatefulWidget {
  const PParentNurseryWidget({Key? key}) : super(key: key);

  @override
  State<PParentNurseryWidget> createState() => _PParentNurseryWidgetState();
}

class _PParentNurseryWidgetState extends State<PParentNurseryWidget> {
  @override
  void initState() {
    _getData();
    super.initState();
  }

  List<PKidSchoolDetailModel> dataList = [];
  bool _isLoading = false;
  _getData() {
    _isLoading = true;
    final resp = NurseryData().get();
    resp.then((value) {
      // log(value.length.toString());
      if (mounted) {
        setState(() {
          for (var v in value) {
            dataList.add(PKidSchoolDetailModel.fromJson(v));
          }
          /*for (var w in dataList) {
            dataList.removeWhere((element) => element.schoolId == w.schoolId);
          }*/
          _isLoading = false;
        });
      }
    });
  }

  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CarouselSlider.builder(
                      itemCount: dataList.toSet().toList().length,
                      itemBuilder: (ctx, index, realInd) {
                        return Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 128,
                              width: 96,
                              clipBehavior: Clip.hardEdge,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8)),
                              child: Image.network(
                                dataList
                                    .toSet()
                                    .toList()[index]
                                    .schoolImage
                                    .toString(),
                                fit: BoxFit.cover,
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
                                    dataList
                                        .toSet()
                                        .toList()[index]
                                        .schoolName
                                        .toString(),
                                    style: FontConstant.k22w500brownText,
                                  ),
                                  Row(
                                    children: [
                                      Image.asset(
                                        "assets/images/clockicon.png",
                                        height: 24,
                                      ),
                                      SizedBox(width: 4),
                                      Row(
                                        children: [
                                          Text(
                                            "${"From".tr()} ${DateFormat.jm().format(DateFormat("hh:mm:ss").parse(dataList.toSet().toList()[index].schoolTime.toString().split('.').first))}",
                                            style: FontConstant.k16w5008471Text,
                                          ),
                                          /*Text(
                                      "${"To".tr()} ${DateFormat.jm().format(DateFormat("hh:mm:ss").parse(dataList[index].schoolTime.toString().split('.').first))}",
                                      style: FontConstant.k14w400White,
                                    ),*/
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                      options: CarouselOptions(
                        height: 150,
                        onPageChanged: (index, reason) {
                          setState(() {
                            currentIndex = index;
                          });
                        },
                        viewportFraction: 1,
                        //enlargeCenterPage: true,
                        padEnds: false,
                        //pageSnapping: false,
                        enableInfiniteScroll: false,
                      ),
                    ),
                    if (dataList.toSet().toList().length > 1)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          dataList.toSet().toList().length,
                          (index) {
                            return Container(
                              height: 4,
                              width: currentIndex == index ? 20 : 9,
                              margin: EdgeInsets.only(right: 5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: currentIndex == index
                                      ? Color(0xffF0AD56)
                                      : Color(0xffF0AD56).withOpacity(.40)),
                            );
                          },
                        ),
                      ),
                    SizedBox(height: 15),
                    Text(
                      "Reception Info".tr(),
                      style: FontConstant2.k22w5008471text,
                    ),
                    SizedBox(height: 6),
                    Row(
                      children: [
                        SizedBox(
                          width: 130,
                          child: Text(
                            'Email address'.tr(),
                            style: FontConstant2.k16w5008267text,
                          ),
                        ),
                        SizedBox(width: 16),
                        Text(
                          dataList[currentIndex].schoolEmail.toString(),
                          style: FontConstant.k16w5008471Text,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 130,
                          child: Text(
                            'Phone number'.tr(),
                            style: FontConstant2.k16w5008267text,
                          ),
                        ),
                        SizedBox(width: 16),
                        Text(
                          dataList[currentIndex].schoolPhone.toString(),
                          style: FontConstant.k16w5008471Text,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 130,
                          child: Text(
                            'Address'.tr(),
                            style: FontConstant2.k16w5008267text,
                          ),
                        ),
                        SizedBox(width: 16),
                        Text(
                          dataList[currentIndex].schoolAddress.toString(),
                          style: FontConstant.k16w5008471Text,
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () {
                            // log(dataList[currentIndex]
                            //     .socialMedia!
                            //     .facebook
                            //     .toString());
                            if (dataList[currentIndex]
                                    .socialMedia!
                                    .facebook
                                    .toString() ==
                                "null") {
                              CustomSnackBar.customErrorSnackBar(
                                  context,
                                  "School does not have this social media"
                                      .tr());
                            } else {
                              launchUrl(Uri.parse(dataList[currentIndex]
                                  .socialMedia!
                                  .facebook
                                  .toString()));
                            }
                          },
                          child: CircleAvatar(
                              radius: 24,
                              backgroundImage: AssetImage(
                                "assets/images/facebookicon.png",
                              )),
                        ),
                        InkWell(
                          onTap: () {
                            if (dataList[currentIndex]
                                    .socialMedia!
                                    .twitter
                                    .toString() ==
                                "null") {
                              CustomSnackBar.customErrorSnackBar(
                                  context,
                                  "School does not have this social media"
                                      .tr());
                            } else {
                              launchUrl(Uri.parse(dataList[currentIndex]
                                  .socialMedia!
                                  .twitter
                                  .toString()));
                            }
                          },
                          child: CircleAvatar(
                              radius: 24,
                              backgroundImage: AssetImage(
                                "assets/images/Twittericon.png",
                              )),
                        ),
                        InkWell(
                          onTap: () {
                            if (dataList[currentIndex]
                                    .socialMedia!
                                    .linkedIn
                                    .toString() ==
                                "null") {
                              CustomSnackBar.customErrorSnackBar(
                                  context,
                                  "School does not have this social media"
                                      .tr());
                            } else {
                              launchUrl(Uri.parse(dataList[currentIndex]
                                  .socialMedia!
                                  .linkedIn
                                  .toString()));
                            }
                          },
                          child: CircleAvatar(
                              radius: 24,
                              backgroundImage: AssetImage(
                                "assets/images/linkedicon.png",
                              )),
                        ),
                        InkWell(
                          onTap: () {
                            if (dataList[currentIndex]
                                    .socialMedia!
                                    .instagram
                                    .toString() ==
                                "null") {
                              CustomSnackBar.customErrorSnackBar(
                                  context,
                                  "School does not have this social media"
                                      .tr());
                            } else {
                              launchUrl(Uri.parse(dataList[currentIndex]
                                  .socialMedia!
                                  .instagram
                                  .toString()));
                            }
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
                    TeacherCard(list: dataList, index: currentIndex),
                    SizedBox(height: 38),
                    SizedBox(
                      height: 52,
                      width: 1.sw,
                      child: MainButton(
                          onTap: () async {
                            String url =
                                'https://www.google.com/maps/search/?api=1&query=${dataList[currentIndex].socialMedia!.mapLocation!.split(",").first.toString()},${dataList[currentIndex].socialMedia!.mapLocation!.split(",").last.toString()}';
                            if (await canLaunchUrl(Uri.parse(url))) {
                              await launchUrl(Uri.parse(url));
                            } else {
                              Fluttertoast.showToast(
                                  msg: 'Could not open the map.');
                            }
                          },
                          title: "Locate us".tr(),
                          textStyleColor: Colors.white,
                          backgroundColor: ThemeColor.primarycolor),
                    ),
                    SizedBox(height: 90),
                  ],
                ),
              ),
            ),
    );
  }
}
