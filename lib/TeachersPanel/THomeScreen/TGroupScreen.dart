import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kidseau/ParentsPanel/PHomeScreen/PHomeScreen.dart';
import 'package:kidseau/TeachersPanel/THomeScreen/TAllStudentsScreen.dart';
import 'package:kidseau/Theme.dart';
import 'package:kidseau/Widgets/buttons.dart';
import 'package:kidseau/api/Teacherpanelapi/Tmodel/TScheduleModel.dart';
import 'package:kidseau/api/Teacherpanelapi/Tschedule_api/schedule_api.dart';

class TGroupScreen extends StatefulWidget {
  TGroupScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<TGroupScreen> createState() => _TGroupScreenState();
}

class _TGroupScreenState extends State<TGroupScreen> {
  bool loading = true;
  @override
  void initState() {
    getSchedule();

    super.initState();
  }

  getSchedule() {
    final rsp = TScheduleApi().get();
    rsp.then((value) {
      print(value);
      try {
        _schedule = value as TScheduleModel;
        setState(() {
          loading = false;
        });
      } catch (e) {
        setState(() {
          loading = false;
        });
      }
      //print(_schedule.schedule!.length);
      print(_schedule.schedule!.length);
      print(_schedule.schedule![0].actTitle);
    });
  }

  TScheduleModel _schedule = TScheduleModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        centerTitle: false,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Color(0xff8267AC).withOpacity(0.16),
        ),
        backgroundColor: Color(0xff8267AC).withOpacity(0.16),
        title: Text(
          "Groups".tr(),
          /* AppLoaclizations.of(context)!.translate("Groups").toString(),*/
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              SizedBox(height: 30.h),
              ClipRRect(
                borderRadius: BorderRadius.circular(81),
                child: Container(
                  //width: 414,
                  height: 62.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),

                  /// borderRadius: BorderRadius.circular(81)),
                  child: ListView.builder(
                      shrinkWrap: true,
                      //  physics: const BouncingScrollPhysics(),
                      itemCount: items.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (ctx, index) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  current = index;
                                });
                              },
                              child: Container(
                                // curve: Curves.easeIn,
                                //duration: const Duration(milliseconds: 200),
                                margin: const EdgeInsets.all(5),
                                width: 72,
                                height: 43,
                                decoration: BoxDecoration(
                                  color: current == index
                                      ? Color(0xff8267AC).withOpacity(.08)
                                      : Colors.white,
                                  borderRadius: current == index
                                      ? BorderRadius.circular(69)
                                      : BorderRadius.circular(69),
                                  border: current == index
                                      ? Border.all(
                                          color: Color(0xff8267AC)
                                              .withOpacity(.08),
                                          width: 0)
                                      : null,
                                ),
                                child: Center(
                                  child: Text(
                                    items[index],
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: current == index
                                            ? Color(0xff8267AC)
                                            : Color(0xffB7A4B2)),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      }),
                ),
              ),
              // GroupTab(),
              SizedBox(height: 15.h),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Schedule".tr(),
                  /*AppLoaclizations.of(context)!
                      .translate("Schedule")
                      .toString(),*/
                  style: FontConstant2.baloothampifont,
                ),
              ),
              // Padding(
              //   padding: EdgeInsets.symmetric(horizontal: 16),
              //   child: loadingData
              //       ? CircularProgressIndicator()
              //       : SizedBox(
              //     // height: 300.h,
              //     width: 1.sw,
              //     child: ListView.separated(
              //         separatorBuilder: (ctx, ind) => SizedBox(
              //           height: 14.h,
              //         ),
              //         shrinkWrap: true,
              //         padding: EdgeInsets.zero,
              //         physics: NeverScrollableScrollPhysics(),
              //         itemCount: _name.schdule!.length,
              //         scrollDirection: Axis.vertical,
              //         itemBuilder: (BuildContext context, int index) {
              //           return InkWell(
              //             onTap: () {
              //               if (index == 0) {
              //                 Navigator.push(
              //                   context,
              //                   MaterialPageRoute(
              //                       builder: (context) =>
              //                       const TLearningAlphabets()),
              //                 );
              //               } else if (index == 1) {
              //               } else if (index == 2) {
              //               } else if (index == 3) {}
              //             },
              //             child: loadingData
              //                 ? CircularProgressIndicator()
              //                 : Container(
              //               height: 64,
              //               // width: Get.size.width * 0.93,
              //               //margin: EdgeInsets.symmetric(horizontal: 16),
              //               decoration: BoxDecoration(
              //                 color: Colors.white,
              //                 borderRadius:
              //                 BorderRadius.circular(16),
              //               ),
              //               child: Padding(
              //                 padding: const EdgeInsets.symmetric(
              //                     horizontal: 15.0),
              //                 child: Row(
              //                   crossAxisAlignment:
              //                   CrossAxisAlignment.center,
              //                   children: [
              //                     Image.asset(
              //                       _name.schdule![index].icon
              //                           .toString(),
              //                       errorBuilder: (q, w, e) {
              //                         return Text(
              //                             'Image not loaded');
              //                       },
              //                       height: 40,
              //                       width: 40,
              //                     ),
              //                     Padding(
              //                       padding: const EdgeInsets.only(
              //                           left: 15.0),
              //                       child: Column(
              //                         crossAxisAlignment:
              //                         CrossAxisAlignment.start,
              //                         mainAxisAlignment:
              //                         MainAxisAlignment.center,
              //                         children: [
              //                           Text(
              //                             _name
              //                                 .schdule![index].title
              //                                 .toString(),
              //                             style: FontConstant
              //                                 .k32w500blackText
              //                                 .copyWith(
              //                                 fontSize: 16),
              //                           ),
              //                           Row(
              //                             children: [
              //                               Text(
              //                                 "From ${DateFormat.jm().format(DateFormat("hh:mm:ss").parse('${_name.schdule![index].time}'))} ",
              //                                 // '${groups[index]} . ${time[index]}',
              //                                 style: FontConstant
              //                                     .k14w400lightpurpleText
              //                                     .copyWith(
              //                                     fontWeight:
              //                                     FontWeight
              //                                         .w400,
              //                                     fontSize: 14,
              //                                     color: Color(
              //                                         0xffB7A4B2)),
              //                               ),
              //                               Text(
              //                                 "To ${DateFormat.jm().format(DateFormat("hh:mm:ss").parse('${_name.schdule![index].time}'))} ",
              //                                 // '${groups[index]} . ${time[index]}',
              //                                 style: FontConstant
              //                                     .k14w400lightpurpleText
              //                                     .copyWith(
              //                                     fontWeight:
              //                                     FontWeight
              //                                         .w400,
              //                                     fontSize: 14,
              //                                     color: Color(
              //                                         0xffB7A4B2)),
              //                               ),
              //                             ],
              //                           )
              //                         ],
              //                       ),
              //                     ),
              //                   ],
              //                 ),
              //               ),
              //             ),
              //           );
              //         }),
              //   ),
              // ),
              // loading
              //     ? Center(child: CircularProgressIndicator())
              //     : Padding(
              //         padding: const EdgeInsets.symmetric(horizontal: 16),
              //         child: TActivity(
              //           schedule: _schedule,
              //         ),
              //       ),
              // Padding(
              //   padding: EdgeInsets.symmetric(horizontal: 16),
              //   // child: loadingData
              //   //     ? CircularProgressIndicator()
              //   //     :
              //   child: SizedBox(
              //     // height: 300.h,
              //     width: 1.sw,
              //     child: ListView.separated(
              //         separatorBuilder: (ctx, ind) => SizedBox(
              //               height: 14.h,
              //             ),
              //         shrinkWrap: true,
              //         padding: EdgeInsets.zero,
              //         physics: NeverScrollableScrollPhysics(),
              //         itemCount: _name.schdule!.length,
              //         scrollDirection: Axis.vertical,
              //         itemBuilder: (BuildContext context, int index) {
              //           return InkWell(
              //             onTap: () {
              //               if (index == 0) {
              //                 Navigator.push(
              //                   context,
              //                   MaterialPageRoute(
              //                       builder: (context) =>
              //                           const TLearningAlphabets()),
              //                 );
              //               } else if (index == 1) {
              //               } else if (index == 2) {
              //               } else if (index == 3) {}
              //             },
              //             child: loadingData
              //                 ? CircularProgressIndicator()
              //                 : Container(
              //                     height: 64,
              //                     // width: Get.size.width * 0.93,
              //                     //margin: EdgeInsets.symmetric(horizontal: 16),
              //                     decoration: BoxDecoration(
              //                       color: Colors.white,
              //                       borderRadius: BorderRadius.circular(16),
              //                     ),
              //                     child: Padding(
              //                       padding: const EdgeInsets.symmetric(
              //                           horizontal: 15.0),
              //                       child: Row(
              //                         crossAxisAlignment:
              //                             CrossAxisAlignment.center,
              //                         children: [
              //                           Image.asset(
              //                             _name.schdule![index].icon.toString(),
              //                             errorBuilder: (q, w, e) {
              //                               return Text('Image not loaded');
              //                             },
              //                             height: 40,
              //                             width: 40,
              //                           ),
              //                           Padding(
              //                             padding:
              //                                 const EdgeInsets.only(left: 15.0),
              //                             child: Column(
              //                               crossAxisAlignment:
              //                                   CrossAxisAlignment.start,
              //                               mainAxisAlignment:
              //                                   MainAxisAlignment.center,
              //                               children: [
              //                                 Text(
              //                                   _name.schdule![index].title
              //                                       .toString(),
              //                                   style: FontConstant
              //                                       .k32w500blackText
              //                                       .copyWith(fontSize: 16),
              //                                 ),
              //                                 Row(
              //                                   children: [
              //                                     Text(
              //                                       "From ${DateFormat.jm().format(DateFormat("hh:mm:ss").parse('${_name.schdule![index].time}'))} ",
              //                                       // '${groups[index]} . ${time[index]}',
              //                                       style: FontConstant
              //                                           .k14w400lightpurpleText
              //                                           .copyWith(
              //                                               fontWeight:
              //                                                   FontWeight.w400,
              //                                               fontSize: 14,
              //                                               color: Color(
              //                                                   0xffB7A4B2)),
              //                                     ),
              //                                     Text(
              //                                       "To ${DateFormat.jm().format(DateFormat("hh:mm:ss").parse('${_name.schdule![index].time}'))} ",
              //                                       // '${groups[index]} . ${time[index]}',
              //                                       style: FontConstant
              //                                           .k14w400lightpurpleText
              //                                           .copyWith(
              //                                               fontWeight:
              //                                                   FontWeight.w400,
              //                                               fontSize: 14,
              //                                               color: Color(
              //                                                   0xffB7A4B2)),
              //                                     ),
              //                                   ],
              //                                 )
              //                               ],
              //                             ),
              //                           ),
              //                         ],
              //                       ),
              //                     ),
              //                   ),
              //           );
              //         }),
              //   ),
              // ),
              SizedBox(
                height: 5.h,
              ),
              /* TActivity(),*/
              SizedBox(
                height: 32,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Students ",
                  style: FontConstant2.baloothampifont,
                ),
              ),
              SizedBox(height: 8),
              ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 3,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: SizedBox(
                          height: 128, width: 382, child: Studentcard()),
                    );
                  }),
              SizedBox(height: 32),
              SizedBox(
                height: 52.h,
                width: 382.w,
                child: MainButton(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => TAllStudents()),
                      );
                    },
                    title: "View all students".tr(),
                    /*AppLoaclizations.of(context)!
                        .translate("View all students")
                        .toString(),*/
                    textStyleColor: Colors.white,
                    backgroundColor: ThemeColor.primarycolor),
              ),
              SizedBox(height: 52),
            ],
          ),
        ),
      ),
    );
  }

  List<String> items = [
    "Group A",
    "Group B",
    "Group C",
    "Group D",
    "Group E",
  ];
  int current = 0;

  Container GroupTab() {
    return Container(
      //width: 414,
      height: 62.h,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(81)),
      child: ListView.builder(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemCount: items.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (ctx, index) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      current = index;
                    });
                  },
                  child: AnimatedContainer(
                    curve: Curves.easeIn,
                    duration: const Duration(milliseconds: 200),
                    margin: const EdgeInsets.all(5),
                    width: 72,
                    height: 43,
                    decoration: BoxDecoration(
                      color: current == index
                          ? Color(0xff8267AC).withOpacity(.08)
                          : Colors.white,
                      borderRadius: current == index
                          ? BorderRadius.circular(69)
                          : BorderRadius.circular(69),
                      border: current == index
                          ? Border.all(
                              color: Color(0xff8267AC).withOpacity(.08),
                              width: 0)
                          : null,
                    ),
                    child: Center(
                      child: Text(
                        items[index],
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: current == index
                                ? Color(0xff8267AC)
                                : Color(0xffB7A4B2)),
                      ),
                    ),
                  ),
                ),
              ],
            );
          }),
    );
  }
}
