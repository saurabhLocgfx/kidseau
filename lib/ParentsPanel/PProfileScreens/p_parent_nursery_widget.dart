import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kidseau/api/models/parent_models/parent_profile_models/kid_school_detail_model.dart';
import 'package:kidseau/api/parent_panel_apis/parent_profile_apis/nursery_data_api.dart';

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
      setState(() {
        for (var v in value) {
          dataList.add(PKidSchoolDetailModel.fromJson(v));
        }
        _isLoading = false;
      });
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
                      itemCount: dataList.length,
                      itemBuilder: (ctx, index, realInd) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 40),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 128,
                                width: 96,
                                child: Image.network(
                                  dataList[index].schoolImage.toString(),
                                  errorBuilder: (q, w, e) => Image.asset(
                                      "assets/images/profileperson.png"),
                                ),
                              ),
                              SizedBox(width: 25),
                              Align(
                                alignment: Alignment.center,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      dataList[index].schoolName.toString(),
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
                                              "${"From".tr()} ${DateFormat.jm().format(DateFormat("hh:mm:ss").parse(dataList[index].schoolTime.toString().split('.').first))}",
                                              style:
                                                  FontConstant.k16w5008471Text,
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
                          ),
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
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        dataList.length,
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
                          width: 200,
                          child: Text(
                            'Email'.tr(),
                            style: FontConstant2.k16w5008267text,
                          ),
                        ),
                        Text(
                          dataList[currentIndex].schoolEmail.toString(),
                          style: FontConstant.k16w5008471Text,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 200,
                          child: Text(
                            'Phone number'.tr(),
                            style: FontConstant2.k16w5008267text,
                          ),
                        ),
                        Text(
                          dataList[currentIndex].schoolPhone.toString(),
                          style: FontConstant.k16w5008471Text,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 200,
                          child: Text(
                            'Address'.tr(),
                            style: FontConstant2.k16w5008267text,
                          ),
                        ),
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
                    TeacherCard(list: dataList, index: currentIndex),
                    SizedBox(height: 38),
                    SizedBox(
                      height: 52,
                      width: 1.sw,
                      child: MainButton(
                          onTap: () {},
                          title: "Locate us".tr(),
                          textStyleColor: Colors.white,
                          backgroundColor: ThemeColor.primarycolor),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
