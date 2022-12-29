import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kidseau/Kidsdetails.dart';
import 'package:kidseau/Medicalinfo.dart';
import 'package:kidseau/Parentinfo.dart';
import 'package:kidseau/Theme.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class Parentinfodashboard extends StatefulWidget {
  const Parentinfodashboard({Key? key}) : super(key: key);

  @override
  State<Parentinfodashboard> createState() => _ParentinfodashboardState();
}

class _ParentinfodashboardState extends State<Parentinfodashboard> {
  final PageController _pageController = PageController(
    initialPage: 0,
  );
  int pageIndex = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: ThemeColor.primarycolor.withOpacity(.06),
        child: SingleChildScrollView(
          //physics: NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              SizedBox(height: 72.h),
              Center(
                child: Image.asset(
                  "assets/images/logo without text.png",
                  height: 63,
                  width: 52,
                ),
              ),
              SizedBox(height: 40),
              dottab(),
              SizedBox(height: 40),
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
                    ParentInfo(
                      onContinue: () {
                        _pageController.animateToPage(
                          1,
                          duration: Duration(milliseconds: 300),
                          curve: Curves.fastOutSlowIn,
                        );
                      },
                    ),
                    KidsDetails(
                      onContinue: () {
                        _pageController.animateToPage(
                          2,
                          duration: Duration(milliseconds: 300),
                          curve: Curves.fastOutSlowIn,
                        );
                      },
                    ),
                    MedicalInfo()
                  ],
                ),
              ),
            ],
          ),
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
                    isCompleted: pageIndex != 0 && pageIndex != 1,
                    isCurrent: pageIndex == 1,
                    // text: 'kids info',
                  )),
              Expanded(
                child: LinearPercentIndicator(
                  padding: EdgeInsets.zero,
                  lineHeight: 4.0,
                  percent: pageIndex == 0
                      ? 0
                      : pageIndex == 1
                          ? 0.3
                          : 1,
                  backgroundColor: ThemeColor.primarycolor.withOpacity(0.16),
                  progressColor: ThemeColor.primarycolor,
                ),
              ),
              GestureDetector(
                  onTap: () {},
                  child: DotCircleTab(
                    isCompleted: false,
                    isCurrent: pageIndex == 2,
                    // text: 'Medical info',
                  )),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Parent info", style: FontConstant.k14w5008267AC),
              Text("Kids info",
                  style: FontConstant.k14w5008267AC.copyWith(
                      color: pageIndex == 1 || pageIndex == 2
                          ? ThemeColor.primarycolor
                          : ThemeColor.b7A4B2)),
              Text("Medical",
                  style: FontConstant.k14w500B7A4Text.copyWith(
                      color: pageIndex == 2
                          ? ThemeColor.primarycolor
                          : ThemeColor.b7A4B2)),
            ],
          ),
        ],
      ),
    );
  }
}

class DotCircleTab extends StatelessWidget {
  final bool isCurrent;
  final bool isCompleted;
  // final String text;
  const DotCircleTab({
    Key? key,
    required this.isCurrent,
    required this.isCompleted,
    // required this.text
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(8),
          height: 40,
          width: 40,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              // borderRadius: BorderRadius.circular(93),
              color: isCompleted
                  ? ThemeColor.primarycolor
                  : ThemeColor.be74aa.withOpacity(0.16)),
          child: isCompleted
              ? Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.white),
                    shape: BoxShape.circle,
                    color: ThemeColor.f0e0ec,
                  ),
                )
              : Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.white),
                    shape: BoxShape.circle,
                    color: isCurrent
                        ? ThemeColor.primarycolor
                        : ThemeColor.primarycolor.withOpacity(0.4),
                  ),
                ),
        ),
      ],
    );
  }
}