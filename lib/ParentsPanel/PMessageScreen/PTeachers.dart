import 'dart:developer' as l;
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kidseau/ParentsPanel/PMessageScreen/PopenChats.dart';
import 'package:kidseau/Theme.dart';
import 'package:kidseau/api/models/parent_models/parent_message_model/parent_teacher_msg_model.dart';
import 'package:kidseau/api/parent_panel_apis/parent_messages_api/parent_get_teacher_msg_api.dart';

class PTeachers extends StatefulWidget {
  const PTeachers({Key? key}) : super(key: key);

  @override
  State<PTeachers> createState() => _PTeachersState();
}

class _PTeachersState extends State<PTeachers> {
  List<String> bird = [
    "assets/images/small bird2.png",
    "assets/images/bird2.png",
    "assets/images/birdpink.png",
    "assets/images/birdorange.png",
  ];
  List<String> name = [
    "Mohammad Umar",
    "Mohammad Umar",
    "Mohammad Umar",
    "Mohammad Umar",
  ];
  List<String> title = [
    "Director",
    "Director",
    "Class teacher",
    "Director",
  ];
  List<String> images = [
    "assets/images/teacher1.png",
    "assets/images/teacher2.png",
    "assets/images/teacher3.png",
    "assets/images/teacher4.png",
  ];

  @override
  void initState() {
    _getData();
    super.initState();
  }

  int getRandomInt() {
    return Random().nextInt(4);
  }

  ParentMsgTeacherModel model = ParentMsgTeacherModel();
  bool _isLoading = false;

  _getData() {
    _isLoading = true;
    final resp = ParentMsgTeacherApi().get();
    resp.then((value) {
      l.log(value.toString());
      if (value['status'] == 1) {
        setState(() {
          model = ParentMsgTeacherModel.fromJson(value);
          _isLoading = false;
        });
      } else {
        setState(() {
          _isLoading = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.separated(
              separatorBuilder: (ctx, ind) => SizedBox(
                    height: 16.h,
                  ),
              shrinkWrap: true,
              itemCount: model.allTeahcer!.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => POpenChats(
                              profilePic: model.allTeahcer![index].techProfile
                                  .toString(),
                              name: model.allTeahcer![index].fName.toString(),
                              language:
                                  model.allTeahcer![index].langId.toString(),
                              userId:
                                  model.allTeahcer![index].teacherId.toString(),
                              userType:
                                  model.allTeahcer![index].userType.toString(),
                            )));
                  },
                  child: Container(
                    //height: 150.h,
                    margin: EdgeInsets.symmetric(horizontal: 16),
                    // clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.transparent,
                        image: DecorationImage(
                            image: AssetImage("assets/images/purplecard.png"),
                            fit: BoxFit.fill)),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 16),
                    child: Stack(
                      children: [
                        Positioned(
                          right: 0,
                          bottom: 2,
                          child: SizedBox(
                            width: 60,
                            height: 60,
                            child: Image.asset(
                              bird[getRandomInt()],
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Row(
                          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 80,
                              width: 60,
                              clipBehavior: Clip.hardEdge,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8)),
                              child: Image.network(
                                model.allTeahcer![index].techProfile.toString(),
                                fit: BoxFit.fill,
                                errorBuilder: (q, w, e) =>
                                    Image.asset("assets/images/teacher1.png"),
                              ),
                            ),
                            SizedBox(
                              width: 12.w,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(model.allTeahcer![index].fName.toString(),
                                    style:
                                        FontConstant.k18w5008471Text.copyWith(
                                      color: Colors.white,
                                    )),
                                Text(
                                    model.allTeahcer![index].familyName
                                        .toString(),
                                    style: FontConstant.k14w4008471Text
                                        .copyWith(
                                            color: Colors.white
                                                .withOpacity(0.74))),
                                Text(model.allTeahcer![index].langId.toString(),
                                    style: FontConstant.k16w4008471Text
                                        .copyWith(
                                            color: Colors.white
                                                .withOpacity(0.80))),
                              ],
                            ),
                            /* Padding(
                          padding: const EdgeInsets.only(top: 30, bottom: 10),
                          child: Align(
                              alignment: Alignment.centerRight,
                              child: Image.asset(
                                bird[index],
                                fit: BoxFit.fill,
                              )),
                        ),*/
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              }),
    );
  }
}
