import 'dart:developer' as l;
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kidseau/Theme.dart';
import 'package:kidseau/api/message_apis/teacher_apis/teacher_get_parent_api.dart';
import 'package:kidseau/api/models/message_models/teacher_message_parents_model.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

import '../../ParentsPanel/PMessageScreen/PChats.dart';

class TParents extends StatefulWidget {
  const TParents({Key? key}) : super(key: key);

  @override
  State<TParents> createState() => _TParentsState();
}

class _TParentsState extends State<TParents> {
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
    "F/O - Azharr",
    "F/O - Azhar",
    "F/O - Azhar",
    "F/O - Azhar",
  ];
  List<String> images = [
    "assets/images/teacher1.png",
    "assets/images/teacher2.png",
    "assets/images/teacher3.png",
    "assets/images/teacher4.png",
  ];

  int getRandomInt() {
    return Random().nextInt(4);
  }

  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    /* _scrollController.addListener(() {
      if (_scrollController.position.maxScrollExtent ==
          _scrollController.offset) {
        _getReloadedData();
      }
    });*/
    _getData();
    super.initState();
  }

  bool _isLoading = false;
  int _scroll = 0;

  List<TeacherMessageParentsModel> modelList = [];

  _getReloadedData() {
    _scroll++;
    final resp = TeacherGetParentApi().get(scroll: '$_scroll');
    resp.then((value) {
      l.log(value.toString());
      if (value['status'] == 1) {
        setState(() {
          chatCount = value["paretntInfo"].length;
          for (var v in value['paretntInfo']) {
            modelList.add(TeacherMessageParentsModel.fromJson(v));
          }
          //_isLoading = false;
        });
      } else {}
    });
  }

  int chatCount = 0;
  _getData() {
    _isLoading = true;
    final resp = TeacherGetParentApi().get(scroll: '0');
    resp.then((value) {
      l.log(value.toString());
      if (value['status'] == 1) {
        setState(() {
          chatCount = value["paretntInfo"].length;
          for (var v in value['paretntInfo']) {
            modelList.add(TeacherMessageParentsModel.fromJson(v));
          }
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
          : LazyLoadScrollView(
              onEndOfPage: () {
                l.log("message");
                if (chatCount >= 20) {
                  _getReloadedData();
                }
              },
              child: ListView.separated(
                  //controller: _scrollController,
                  separatorBuilder: (ctx, ind) => SizedBox(
                        height: 16.h,
                      ),
                  shrinkWrap: true,
                  // physics: NeverScrollableScrollPhysics(),
                  itemCount: modelList.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => PChats(
                                onPop: () {},
                                userId: modelList[index].parentId.toString(),
                                userType: 'parent',
                                profilePic:
                                    modelList[index].profilePhoto.toString(),
                                name: modelList[index].fatherName.toString(),
                                language: '')));
                      },
                      child: Container(
                        //height: 150.h,
                        margin: EdgeInsets.symmetric(horizontal: 16),
                        // clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            //color: Colors.blue,
                            image: DecorationImage(
                                image:
                                    AssetImage("assets/images/purplecard.png"),
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
                                    modelList[index].profilePhoto.toString(),
                                    fit: BoxFit.fill,
                                    errorBuilder: (q, w, e) => Image.asset(
                                        "assets/images/teacher1.png"),
                                  ),
                                ),
                                SizedBox(
                                  width: 12,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(modelList[index].fatherName.toString(),
                                        style: FontConstant.k18w5008471Text
                                            .copyWith(
                                          color: Colors.white,
                                        )),
                                    Text(
                                        "F/O ${modelList[index].name.toString()}",
                                        style: FontConstant.k14w4008471Text
                                            .copyWith(
                                                color: Colors.white
                                                    .withOpacity(0.74))),
                                    /*Text("English, French, Arabic",
                                      style: FontConstant.k16w4008471Text
                                          .copyWith(
                                              color: Colors.white
                                                  .withOpacity(0.80))),*/
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
            ),
    );
  }
}
