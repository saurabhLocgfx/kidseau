import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kidseau/ParentsPanel/PMessageScreen/PopenChats.dart';
import 'package:kidseau/Theme.dart';
import 'package:kidseau/Widgets/dialogs.dart';
import 'package:kidseau/api/message_apis/delete_chat_api.dart';
import 'package:kidseau/api/message_apis/recent_chat_api.dart';
import 'package:kidseau/api/models/message_models/recent_chat_model.dart';

import '../../ParentsPanel/PMessageScreen/PChats.dart';

class TMessages extends StatefulWidget {
  const TMessages({Key? key}) : super(key: key);

  @override
  State<TMessages> createState() => _TMessagesState();
}

class _TMessagesState extends State<TMessages> {
  List<String> images = [
    "assets/images/messageperson1.png",
    "assets/images/messageperson2.png",
    "assets/images/messageperson3.png",
    "assets/images/messageperson4.png",
    "assets/images/messageperson5.png",
    "assets/images/messageperson6.png",
  ];
  List<String> txt = [
    "Mohammad Umar",
    "Mohammad Umar",
    "Monish",
    "Mohammad Ali",
    "Mohammad Umar",
    "Mohammad Umar",
  ];
  List<String> name = [
    "Mohammad Umar",
    "Mohammad Umar",
    "Monish",
    "Mohammad Ali",
    "Mohammad Umar",
    "Mohammad Umar",
  ];
  List<String> title = [
    "Class teacher",
    "Director",
    "Class teacher",
    "Class teacher",
    "Class teacher",
    "Class teacher",
  ];

  bool _isVisible = false;
  void showToast() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  @override
  void initState() {
    _getData();
    super.initState();
  }

  List<RecentMessageModel> modelList = [];
  bool _isLoading = false;
  _getData() {
    _isLoading = true;
    final resp = RecentChatApi().get();
    resp.then((value) {
      log(value.toString());
      modelList.clear();
      setState(() {
        for (var v in value) {
          modelList.add(RecentMessageModel.fromJson(v));
        }
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : modelList.isEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        "assets/images/empty_message.png",
                        width: 300,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'No messages',
                        style: FontConstant.k18w500Primary,
                      )
                    ],
                  ),
                )
              : ListView.builder(
                  itemCount: modelList.length,
                  physics: AlwaysScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => PChats(
                              onPop: () {
                                _getData();
                              },
                              profilePic:
                                  modelList[index].userProfile.toString(),
                              name: modelList[index].userName.toString(),
                              language: '',
                              userId: modelList[index].userId.toString(),
                              userType: modelList[index].userType.toString(),
                            ),
                          ),
                        );
                      },
                      child: Container(
                          height: 90,
                          width: 1.sw,
                          color: Colors.transparent,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 16, right: 16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      height: 70,
                                      width: 50,
                                      clipBehavior: Clip.hardEdge,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      child: Image.network(
                                        modelList[index].userProfile.toString(),
                                        fit: BoxFit.fitHeight,
                                        errorBuilder: (q, w, e) => Image.asset(
                                            "assets/images/messageperson1.png"),
                                      ),
                                    ),
                                    SizedBox(width: 16),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              modelList[index]
                                                  .userName
                                                  .toString(),
                                              style: FontConstant
                                                  .k18w5008471Text
                                                  .copyWith(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Color(0xff331F2D)),
                                            ),
                                          ],
                                        ),
                                        Text(
                                            modelList[index]
                                                .userType
                                                .toString(),
                                            style:
                                                FontConstant.k14w4008471Text),
                                        Text(
                                            "${"last message".tr()} - ${DateFormat.yMMM().format(DateTime.parse(modelList[index].messageTime.toString()))}",
                                            style:
                                                FontConstant.k12w4008267Text),
                                      ],
                                    ),
                                  ],
                                ),
                                Container(
                                  child: Stack(children: [
                                    Image.asset(
                                      "assets/images/dots2.png",
                                      height: 48.h,
                                      width: 48.w,
                                    ),
                                    PopupMenuButton(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(16)),
                                        iconSize: 10,
                                        icon: ImageIcon(
                                          AssetImage(
                                            "assets/images/dots2.png",
                                          ),
                                        ),
                                        itemBuilder: (context) {
                                          return [
                                            PopupMenuItem(
                                              enabled: false,
                                              child: InkWell(
                                                onTap: () {
                                                  final resp = DeleteChat().get(
                                                      userId: modelList[index]
                                                          .userId
                                                          .toString(),
                                                      userType: modelList[index]
                                                          .userType
                                                          .toString());
                                                  resp.then((value) {
                                                    log(value.toString());
                                                    if (value['status'] == 1) {
                                                      setState(() {
                                                        modelList
                                                            .removeAt(index);
                                                      });
                                                    }
                                                    Navigator.of(context).pop();
                                                  });
                                                },
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      vertical: 32.0),
                                                  child: Row(
                                                    children: [
                                                      Image.asset(
                                                        "assets/images/trashicon.png",
                                                        height: 24,
                                                      ),
                                                      SizedBox(width: 24),
                                                      Text(
                                                        "Delete chat".tr(),
                                                        style: FontConstant
                                                            .k18w5008471Text,
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ];
                                        })
                                  ]),
                                ),
                              ],
                            ),
                          )),
                    );
                  }),
    );
  }
}
