import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../../Kidsdetails.dart';
import '../../../Medicalinfo.dart';
import '../../../Theme.dart';
import '../../PSignUpScreen/Parentinfodashboard.dart';

class ParentAddNewKidDetail extends StatefulWidget {
  final bool newKid;
  const ParentAddNewKidDetail({Key? key, required this.newKid})
      : super(key: key);

  @override
  State<ParentAddNewKidDetail> createState() => _ParentAddNewKidDetailState();
}

class _ParentAddNewKidDetailState extends State<ParentAddNewKidDetail> {
  final PageController _pageController = PageController();
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: ThemeColor.primarycolor.withOpacity(.06),
              height: 100,
            ),
            Container(
              child: dottab(),
              color: ThemeColor.primarycolor.withOpacity(.06),
            ),
            Container(
              color: ThemeColor.primarycolor.withOpacity(.06),
              height: 20,
            ),
            SizedBox(
              height: 1.sh,
              child: PageView(
                physics: NeverScrollableScrollPhysics(),
                controller: _pageController,
                onPageChanged: (page) {
                  setState(
                    () {
                      pageIndex = page;
                    },
                  );
                },
                children: <Widget>[
                  KidsDetails(
                    onContinue: () {
                      _pageController.animateToPage(
                        1,
                        duration: Duration(milliseconds: 300),
                        curve: Curves.fastOutSlowIn,
                      );
                    },
                  ),
                  MedicalInfo(
                    newKid: widget.newKid,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget dottab() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 60.w),
      child: Column(
        children: [
          Row(
            children: [
              GestureDetector(
                  onTap: () {},
                  child: Column(
                    children: [
                      DotCircleTab(
                        isCompleted: pageIndex != 0,
                        isCurrent: pageIndex == 0,
                        // text: "parents' info",
                      ),
                    ],
                  )),
              Expanded(
                child: LinearPercentIndicator(
                  padding: EdgeInsets.zero,
                  lineHeight: 4.0,
                  percent: pageIndex == 0 ? 0.3 : 1,
                  backgroundColor: ThemeColor.primarycolor.withOpacity(0.16),
                  progressColor: ThemeColor.primarycolor,
                ),
              ),
              GestureDetector(
                  onTap: () {},
                  child: DotCircleTab(
                    isCompleted: false,
                    isCurrent: pageIndex == 1,
                    // text: 'Medical info',
                  )),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Kid info".tr(), style: FontConstant.k14w5008267AC),
              Text("Medical".tr(),
                  style: FontConstant.k14w500B7A4Text.copyWith(
                      color: pageIndex == 1
                          ? ThemeColor.primarycolor
                          : ThemeColor.b7A4B2)),
            ],
          ),
        ],
      ),
    );
  }
}
