import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' as local;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
import 'package:kidseau/api/models/parent_models/parent_home_models/parent_activity_home_model.dart';

import '../../Theme.dart';
import 'PLearningAlphabets.dart';

class PScheduleScreen extends StatefulWidget {
  final ParentActivityHomeModel model;
  const PScheduleScreen({Key? key, required this.model}) : super(key: key);

  @override
  State<PScheduleScreen> createState() => _PScheduleScreenState();
}

class _PScheduleScreenState extends State<PScheduleScreen> {
  @override
  void initState() {
    super.initState();
  }

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
          local.tr("Back"),
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
        child: Container(
          height: 1.sh,
          color: Color(0xff8267AC).withOpacity(.06),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            //  mainAxisSize: MainAxisSize.max,
            children: [
              Row(),
              SizedBox(height: 24),
              Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  local.tr('Schedule'),
                  style: FontConstant2.baloothampifont,
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                width: 1.sw,
                child: ListView.separated(
                    separatorBuilder: (ctx, ind) => SizedBox(
                          height: 14.h,
                        ),
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: widget.model.kidAndActivity!.length,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PLearningAplphabets(
                                      selectedDay: "",
                                      actId: widget
                                          .model.kidAndActivity![index].actId
                                          .toString(),
                                      dayId: widget
                                          .model.kidAndActivity![index].dayId
                                          .toString(),
                                    )),
                          );
                          // Get.to(
                          //   () => PLearningAplphabets(
                          //     selectedDay: "",
                          //     actId: widget.model.kidAndActivity![index].actId
                          //         .toString(),
                          //     dayId: widget.model.kidAndActivity![index].dayId
                          //         .toString(),
                          //   ),
                          // );
                        },
                        child: Container(
                          height: 64,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 15.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.network(
                                  widget.model.kidAndActivity![index].actIcon
                                      .toString(),
                                  errorBuilder: (q, w, e) {
                                    return Image.asset(
                                      "assets/images/book 1.png",
                                      height: 40,
                                      width: 40,
                                    );
                                  },
                                  height: 40,
                                  width: 40,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 15.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        widget.model.kidAndActivity![index]
                                            .actTitle
                                            .toString(),
                                        style: FontConstant.k32w500blackText
                                            .copyWith(fontSize: 16),
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            widget.model.kidAndActivity![index]
                                                .timing
                                                .toString(),
                                            style: FontConstant
                                                .k14w400lightpurpleText
                                                .copyWith(
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 14,
                                                    color: Color(0xffB7A4B2)),
                                          ),
                                          /*SizedBox(
                                width: 5,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                " ${widget.model.kidAndActivity![index].timing!.split('-').first} ",
                                style: FontConstant.k14w400lightpurpleText
                                    .copyWith(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                        color: Color(0xffB7A4B2)),
                              ),
                              Text(
                                " ${widget.model.kidAndActivity![index].timing!.split('-').last}",
                                style: FontConstant.k14w400lightpurpleText
                                    .copyWith(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                        color: Color(0xffB7A4B2)),
                              ),*/
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
