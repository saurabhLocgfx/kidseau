import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kidseau/TeachersPanel/Widgets/Tpopup.dart';
import 'package:kidseau/Theme.dart';

import '../../api/Teacherpanelapi/teacher_profile_api/teacher_profile.dart';
import '../../api/models/teacher_profile_details_model/teacher_profile_details_model.dart';
import 'TParentProfile.dart';

class TProfileDashBoard extends StatefulWidget {
  const TProfileDashBoard({Key? key}) : super(key: key);

  @override
  State<TProfileDashBoard> createState() => _TProfileDashBoardState();
}

class _TProfileDashBoardState extends State<TProfileDashBoard> {
  final controller = PageController(initialPage: 1);

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  final PageController _pageController = PageController(
    initialPage: 0,
  );
  int pageIndex = 0;
  int selectedIndex = 0;

  bool _isLoading = false;
  @override
  void initState() {
    _getData();
    super.initState();
  }

  TeacherProfileDetailsModel _model = TeacherProfileDetailsModel();
  _getData() {
    _isLoading = true;
    final resp = TeacherProfileApi().get();
    resp.then((value) {
      setState(() {
        try {
          _model = TeacherProfileDetailsModel.fromJson(value);
          _isLoading = false;
        } catch (e) {
          print('Teacher profile detail $value');
          setState(() {
            _isLoading = false;
          });
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1.sh,
      width: 1.sw,
      decoration: BoxDecoration(
          /*gradient: LinearGradient(colors: [
          Color(0xffFFFFFF),
          Color(0xff8267AC).withOpacity(0.6),
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter),*/
          ),
      child: Scaffold(
        // backgroundColor: Colors.black,
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
          backgroundColor: Color(0xff8267AC).withAlpha(16),
          automaticallyImplyLeading: false,
          elevation: 0,
          title: Row(
            children: [
              GestureDetector(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Text("Profile".tr(),
                      style:
                          FontConstant2.k32w5008267text.copyWith(fontSize: 25)),
                ),
              ),
            ],
          ),
          actions: [TProfilepopup()],
        ),
        backgroundColor: Color(0xffF8F6FA),
        body: _isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                            "assets/images/Group8270.png",
                          ),
                          fit: BoxFit.fitWidth,
                          alignment: Alignment.topLeft)),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(0xffF8F6FA).withOpacity(0.7),
                          Color(0xffF8F6FA),
                          Color(0xffF8F6FA)
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: [0.3, 0.6, 0.9],
                      ),
                    ),
                    child: Column(
                      children: [
                        /*Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [SizedBox(height: 40), pageViewTabProfile()],
              ),
              SizedBox(height: 24.h),*/
                        TParentProfile(
                          model: _model,
                          onPop: () {
                            _getData();
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
      ),
    );
  }

  Container pageViewTabProfile() {
    return Container(
      height: 56.h,
      width: 248.w,
      decoration: BoxDecoration(
        //  color: Colors.white,
        borderRadius: BorderRadius.circular(76),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: () {
              selectedIndex = pageIndex = 0;
              _pageController.animateToPage(
                pageIndex,
                duration: Duration(milliseconds: 100),
                curve: Curves.linear,
              );
              pageIndex = 0;
              setState(() {});
            },
            child: Row(
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(93),
                      color: pageIndex == 0 ? Color(0xffEBE6F2) : Colors.white),
                  child: Center(
                    child: Image.asset(
                        pageIndex == 0
                            ? "assets/images/person2iconfill.png"
                            : "assets/images/person2icon.png",
                        height: 24),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 4.0),
                  child: Text("Parents",
                      style: FontConstant.k14w500B7A4Text.copyWith(
                          color: pageIndex == 0
                              ? Color(0xff8267AC)
                              : Color(0xffB7A4B2))),
                ),
              ],
            ),
          ),
          SizedBox(width: 10),
          GestureDetector(
            onTap: () {
              selectedIndex = pageIndex = 1;
              _pageController.animateToPage(
                pageIndex,
                duration: Duration(milliseconds: 100),
                curve: Curves.linear,
              );
              pageIndex = 1;
              setState(() {});
            },
            child: Row(
              children: [
                Text("School",
                    style: FontConstant.k14w500B7A4Text.copyWith(
                        color: pageIndex == 1
                            ? Color(0xff8267AC)
                            : Color(0xffB7A4B2))),
                Padding(
                  padding: const EdgeInsets.only(left: 4.0),
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(93),
                        color:
                            pageIndex == 1 ? Color(0xffEBE6F2) : Colors.white),
                    child: Center(
                      child: Image.asset(
                          pageIndex == 1
                              ? "assets/images/schooliconfill.png"
                              : "assets/images/schoolicon.png",
                          height: 24),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
// Container(
//   height: 56,
//   width: 248,
//   decoration: BoxDecoration(
//       color: Colors.white,
//       borderRadius: BorderRadius.circular(76)),
//   child: Container(
//     child: ListView.builder(
//         itemCount: items.length,
//         scrollDirection: Axis.horizontal,
//         itemBuilder: (ctx, index) {
//           return Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: GestureDetector(
//               onTap: () {
//                 setState(() {
//                   current = index;
//                 });
//               },
//               child: Container(
//                 height: 56,
//                 width: 108,
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     Row(
//                       children: [
//                         Stack(children: [
//                           Visibility(
//                             visible: current == index,
//                             child: Container(
//                               width: 40,
//                               height: 40,
//                               decoration: const BoxDecoration(
//                                   color: Color(0xffEBE6F2),
//                                   shape: BoxShape.circle),
//                             ),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Image.asset(
//                               imageicon[index],
//                               height: 24,
//                               width: 24,
//                               color: current == index
//                                   ? Color(0xff8267AC)
//                                   : Color(0xffB7A4B2),
//                             ),
//                           ),
//                         ]),
//                         SizedBox(width: 8),
//                         Text(
//                           items[index],
//                           style: TextStyle(
//                             fontWeight: FontWeight.w500,
//                             fontSize: 14,
//                             color: current == index
//                                 ? Color(0xff8267AC)
//                                 : Color(0xffB7A4B2),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           );
//         }),
//   ),
// ),
