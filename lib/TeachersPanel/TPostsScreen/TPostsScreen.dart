import 'dart:developer';
import 'dart:math';
import 'dart:typed_data';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_downloader/image_downloader.dart';
import 'package:kidseau/Theme.dart';
import 'package:kidseau/Widgets/custom_snack_bar.dart';
import 'package:kidseau/Widgets/dialogs.dart';
import 'package:kidseau/api/Teacherpanelapi/teacher_post_api/post_apis/teacher_hide_post_api.dart';
import 'package:kidseau/api/Teacherpanelapi/teacher_post_api/teacher_all_post_api.dart';
import 'package:kidseau/api/Teacherpanelapi/teacher_post_api/teacher_like_post.dart';
import 'package:kidseau/api/models/Tschool_post_model/teacher_school_post_model.dart'
    as model;
import 'package:kidseau/api/report_post_api/report_post_api.dart';

import '../../enlarged_image_screen.dart';
import 'TEditPostScreen.dart';

class TPostsScreen extends StatefulWidget {
  const TPostsScreen({Key? key}) : super(key: key);

  @override
  State<TPostsScreen> createState() => _TPostsScreenState();
}

class _TPostsScreenState extends State<TPostsScreen> {
  final ScrollController _scrollController = ScrollController();
  bool _onBottom = false;
  @override
  void initState() {
    _scrollController.addListener(() {
      if (_scrollController.position.maxScrollExtent ==
          _scrollController.offset) {
        if (_postCount >= 10) {
          _getReloadedData();
        }
        setState(() {
          _onBottom = true;
        });
      } else {
        setState(() {
          _onBottom = false;
        });
      }
    });
    _getData();
    super.initState();
  }

  int _scroll = 0;
  int _postCount = 0;

  bool _isLoading = false;

  List<model.SchoolAllPost> _postList = [];

  _getReloadedData() {
    _scroll++;
    final resp = TeacherAllPostApi().get(scroll: _scroll);
    resp.then((value) {
      try {
        if (value.status == 1) {
          setState(() {
            _postCount = value.schoolAllPost!.length;
            for (var v in value.schoolAllPost!) {
              _postList.add(v);
            }
          });
        } else {
          setState(() {
            reloadedVal = 'no_post_found';
            _isLoading = false;
          });
        }
      } catch (e) {
        setState(() {
          _isLoading = false;
        });
      }
    });
  }

  _getData() {
    _isLoading = true;
    final resp = TeacherAllPostApi().get(scroll: 0);
    resp.then((value) {
      // log(value.status.toString());
      try {
        if (value.status == 1) {
          setState(() {
            _postList = value.schoolAllPost!;
            _isLoading = false;
          });
        } else {
          setState(() {
            reloadedVal = 'no_post_found';
            _isLoading = false;
          });
        }
        // setState(() {
        //   _schoolPostModel = value;
        //   _isLoading = false;
        // });
      } catch (e) {
        setState(() {
          _isLoading = false;
        });
      }
    });
  }

  final postTag = 'postTag';
  String reloadedVal = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading
          ? SizedBox(
              height: 1.sh,
              child: Center(
                child: CircularProgressIndicator(),
              ))
          : SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                children: [
                  _postList.isEmpty
                      ? Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 150,
                              ),
                              Image.asset(
                                'assets/images/emptypost.png',
                                width: 200,
                                height: 200,
                              ),
                              Text(
                                "No Post available".tr(),
                                style: FontConstant.k16w4008471Text,
                              )
                            ],
                          ),
                        )
                      : ListView.separated(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            if (index < _postList.length) {
                              return Container(
                                margin: EdgeInsets.only(top: 10),
                                padding: const EdgeInsets.only(
                                    left: 16.0, right: 16),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Image.network(
                                              _postList[index]
                                                  .techProfile
                                                  .toString(),
                                              errorBuilder: (q, w, e) =>
                                                  Image.asset(
                                                "assets/images/person2.png",
                                                height: 40,
                                                width: 40,
                                              ),
                                              height: 40,
                                              width: 40,
                                            ),
                                            SizedBox(
                                              width: 08,
                                            ),
                                            Text(
                                              _postList[index].fName.toString(),
                                              style:
                                                  FontConstant2.k16w5008267text,
                                            ),
                                          ],
                                        ),
                                        PopupMenuButton(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(16)),
                                            iconSize: 40,
                                            icon: ImageIcon(
                                              AssetImage(
                                                "assets/images/dots2.png",
                                              ),
                                            ),
                                            itemBuilder: (context) {
                                              if (_postList[index]
                                                      .teacherPost! ==
                                                  0) {
                                                return [
                                                  PopupMenuItem(
                                                      enabled: false,
                                                      child: InkWell(
                                                        onTap: () {
                                                          final resp =
                                                              TeacherHidePostApi().get(
                                                                  postId: _postList[
                                                                          index]
                                                                      .postId
                                                                      .toString());
                                                          resp.then((value) {
                                                            if (value[
                                                                    'status'] ==
                                                                1) {
                                                              setState(() {
                                                                _postList
                                                                    .removeAt(
                                                                        index);
                                                                Navigator.of(
                                                                        context)
                                                                    .pop();
                                                              });
                                                            }
                                                          });
                                                        },
                                                        child: Row(
                                                          children: [
                                                            Image.asset(
                                                              "assets/images/eyelogo.png",
                                                              height: 24,
                                                            ),
                                                            SizedBox(width: 24),
                                                            Text(
                                                              "Hide".tr(),
                                                              style: FontConstant
                                                                  .k18w5008471Text,
                                                            )
                                                          ],
                                                        ),
                                                      )),
                                                  PopupMenuItem(
                                                    enabled: false,
                                                    child: InkWell(
                                                      onTap: () {
                                                        showModalBottomSheet(
                                                            shape: RoundedRectangleBorder(
                                                                borderRadius: BorderRadius.only(
                                                                    topLeft: const Radius
                                                                            .circular(
                                                                        20.0),
                                                                    topRight: const Radius
                                                                            .circular(
                                                                        20.0))),
                                                            context: context,
                                                            isScrollControlled:
                                                                true,
                                                            builder: (builder) {
                                                              return SingleChildScrollView(
                                                                child: Container(
                                                                    decoration: BoxDecoration(
                                                                        // color: Colors.transparent,
                                                                        borderRadius: BorderRadius.only(topLeft: const Radius.circular(20.0), topRight: const Radius.circular(20.0))),
                                                                    child: Padding(
                                                                      padding: const EdgeInsets
                                                                              .only(
                                                                          left:
                                                                              16),
                                                                      child:
                                                                          Column(
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          SizedBox(
                                                                            height:
                                                                                10,
                                                                          ),
                                                                          Text(
                                                                            "Report".tr(),
                                                                            style:
                                                                                FontConstant.k24w50084717FText,
                                                                          ),
                                                                          SizedBox(
                                                                            height:
                                                                                34,
                                                                          ),
                                                                          ListTile(
                                                                            onTap:
                                                                                () {
                                                                              final resp = ReportPostApi().get(postId: _postList[index].postId.toString(), reportDesc: "I don’t like this".tr());
                                                                              resp.then((value) {
                                                                                print(value);
                                                                                if (value['status'] == 1) {
                                                                                  Navigator.of(context).pop();
                                                                                  CustomSnackBar.customSnackBar(context, 'Reported successfully');
                                                                                } else {
                                                                                  Navigator.of(context).pop();
                                                                                  CustomSnackBar.customErrorSnackBar(context, 'Report failed');
                                                                                }
                                                                              });
                                                                            },
                                                                            title:
                                                                                Text(
                                                                              "I don’t like this".tr(),
                                                                              style: FontConstant.k16w500331FText,
                                                                            ),
                                                                          ),
                                                                          ListTile(
                                                                            onTap:
                                                                                () {
                                                                              final resp = ReportPostApi().get(postId: _postList[index].postId.toString(), reportDesc: "Not from the same group".tr());
                                                                              resp.then((value) {
                                                                                if (value['status'] == 1) {
                                                                                  Navigator.of(context).pop();
                                                                                  CustomSnackBar.customSnackBar(context, 'Reported successfully');
                                                                                } else {
                                                                                  Navigator.of(context).pop();
                                                                                  CustomSnackBar.customErrorSnackBar(context, 'Report failed');
                                                                                }
                                                                              });
                                                                            },
                                                                            title:
                                                                                Text(
                                                                              "Not from the same group".tr(),
                                                                              style: FontConstant.k16w500331FText,
                                                                            ),
                                                                          ),
                                                                          ListTile(
                                                                            onTap:
                                                                                () {
                                                                              final resp = ReportPostApi().get(postId: _postList[index].postId.toString(), reportDesc: "Inappropriate content".tr());
                                                                              resp.then((value) {
                                                                                if (value['status'] == 1) {
                                                                                  Navigator.of(context).pop();
                                                                                  CustomSnackBar.customSnackBar(context, 'Reported successfully');
                                                                                } else {
                                                                                  Navigator.of(context).pop();
                                                                                  CustomSnackBar.customErrorSnackBar(context, 'Report failed');
                                                                                }
                                                                              });
                                                                            },
                                                                            title:
                                                                                Text(
                                                                              "Inappropriate content".tr(),
                                                                              style: FontConstant.k16w500331FText,
                                                                            ),
                                                                          ),
                                                                          SizedBox(
                                                                            height:
                                                                                50,
                                                                          )
                                                                        ],
                                                                      ),
                                                                    )),
                                                              );
                                                            });
                                                      },
                                                      child: Row(
                                                        children: [
                                                          Image.asset(
                                                            "assets/images/reportlogo.png",
                                                            height: 24,
                                                          ),
                                                          SizedBox(width: 24),
                                                          Text(
                                                            "Report".tr(),
                                                            style: FontConstant
                                                                .k18w5008471Text,
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  PopupMenuItem(
                                                    enabled: false,
                                                    child: InkWell(
                                                      onTap: () async {
                                                        for (var url
                                                            in _postList[index]
                                                                .image!) {
                                                          try {
                                                            var imageId =
                                                                await ImageDownloader
                                                                    .downloadImage(url
                                                                        .fileName
                                                                        .toString());
                                                            var path =
                                                                await ImageDownloader
                                                                    .findPath(
                                                                        imageId!);
                                                          } catch (error) {
                                                            print(error);
                                                          }
                                                        }
                                                        Fluttertoast.showToast(
                                                            msg:
                                                                'Download complete');
                                                      },
                                                      child: Container(
                                                        color:
                                                            Colors.transparent,
                                                        child: Row(
                                                          children: [
                                                            Image.asset(
                                                              "assets/images/downloadicon.png",
                                                              height: 24,
                                                            ),
                                                            SizedBox(width: 24),
                                                            Text(
                                                              "Download".tr(),
                                                              style: FontConstant
                                                                  .k18w5008471Text,
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ];
                                              } else {
                                                return [
                                                  PopupMenuItem(
                                                    enabled: false,
                                                    child: InkWell(
                                                      onTap: () {
                                                        showModalBottomSheet(
                                                            shape: RoundedRectangleBorder(
                                                                borderRadius: BorderRadius.only(
                                                                    topLeft: const Radius
                                                                            .circular(
                                                                        20.0),
                                                                    topRight: const Radius
                                                                            .circular(
                                                                        20.0))),
                                                            context: context,
                                                            isScrollControlled:
                                                                true,
                                                            builder: (builder) {
                                                              return SingleChildScrollView(
                                                                child: Container(
                                                                    decoration: BoxDecoration(
                                                                        // color: Colors.transparent,
                                                                        borderRadius: BorderRadius.only(topLeft: const Radius.circular(20.0), topRight: const Radius.circular(20.0))),
                                                                    child: Padding(
                                                                      padding: const EdgeInsets
                                                                              .only(
                                                                          left:
                                                                              16),
                                                                      child:
                                                                          Column(
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          SizedBox(
                                                                            height:
                                                                                10,
                                                                          ),
                                                                          Text(
                                                                            "Report".tr(),
                                                                            style:
                                                                                FontConstant.k24w50084717FText,
                                                                          ),
                                                                          SizedBox(
                                                                            height:
                                                                                34,
                                                                          ),
                                                                          ListTile(
                                                                            onTap:
                                                                                () {
                                                                              final resp = ReportPostApi().get(postId: _postList[index].postId.toString(), reportDesc: "I don’t like this".tr());
                                                                              resp.then((value) {
                                                                                print(value);
                                                                                if (value['status'] == 1) {
                                                                                  Navigator.of(context).pop();
                                                                                  CustomSnackBar.customSnackBar(context, 'Reported successfully');
                                                                                } else {
                                                                                  Navigator.of(context).pop();
                                                                                  CustomSnackBar.customErrorSnackBar(context, 'Report failed');
                                                                                }
                                                                              });
                                                                            },
                                                                            title:
                                                                                Text(
                                                                              "I don’t like this".tr(),
                                                                              style: FontConstant.k16w500331FText,
                                                                            ),
                                                                          ),
                                                                          ListTile(
                                                                            onTap:
                                                                                () {
                                                                              final resp = ReportPostApi().get(postId: _postList[index].postId.toString(), reportDesc: "Not from the same group".tr());
                                                                              resp.then((value) {
                                                                                if (value['status'] == 1) {
                                                                                  Navigator.of(context).pop();
                                                                                  CustomSnackBar.customSnackBar(context, 'Reported successfully');
                                                                                } else {
                                                                                  Navigator.of(context).pop();
                                                                                  CustomSnackBar.customErrorSnackBar(context, 'Report failed');
                                                                                }
                                                                              });
                                                                            },
                                                                            title:
                                                                                Text(
                                                                              "Not from the same group".tr(),
                                                                              style: FontConstant.k16w500331FText,
                                                                            ),
                                                                          ),
                                                                          ListTile(
                                                                            onTap:
                                                                                () {
                                                                              final resp = ReportPostApi().get(postId: _postList[index].postId.toString(), reportDesc: "Inappropriate content".tr());
                                                                              resp.then((value) {
                                                                                if (value['status'] == 1) {
                                                                                  Navigator.of(context).pop();
                                                                                  CustomSnackBar.customSnackBar(context, 'Reported successfully');
                                                                                } else {
                                                                                  Navigator.of(context).pop();
                                                                                  CustomSnackBar.customErrorSnackBar(context, 'Report failed');
                                                                                }
                                                                              });
                                                                            },
                                                                            title:
                                                                                Text(
                                                                              "Inappropriate content".tr(),
                                                                              style: FontConstant.k16w500331FText,
                                                                            ),
                                                                          ),
                                                                          SizedBox(
                                                                            height:
                                                                                50,
                                                                          )
                                                                        ],
                                                                      ),
                                                                    )),
                                                              );
                                                            });
                                                      },
                                                      child: Row(
                                                        children: [
                                                          Image.asset(
                                                            "assets/images/reportlogo.png",
                                                            height: 24,
                                                          ),
                                                          SizedBox(width: 24),
                                                          Text(
                                                            "Report".tr(),
                                                            style: FontConstant
                                                                .k18w5008471Text,
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  PopupMenuItem(
                                                    enabled: false,
                                                    child: InkWell(
                                                      onTap: () async {
                                                        for (var url
                                                            in _postList[index]
                                                                .image!) {
                                                          try {
                                                            var imageId =
                                                                await ImageDownloader
                                                                    .downloadImage(url
                                                                        .fileName
                                                                        .toString());
                                                            var path =
                                                                await ImageDownloader
                                                                    .findPath(
                                                                        imageId!);
                                                          } catch (error) {
                                                            print(error);
                                                          }
                                                        }
                                                        Fluttertoast.showToast(
                                                            msg:
                                                                'Download complete');
                                                      },
                                                      child: Container(
                                                        color:
                                                            Colors.transparent,
                                                        child: Row(
                                                          children: [
                                                            Image.asset(
                                                              "assets/images/downloadicon.png",
                                                              height: 24,
                                                            ),
                                                            SizedBox(width: 24),
                                                            Text(
                                                              "Download".tr(),
                                                              style: FontConstant
                                                                  .k18w5008471Text,
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ];
                                              }
                                            }),
                                        // PostOptionsDialog(),
                                        /*GestureDetector(
                          onTap: () {},
                          child: Container(
                            color: Colors.transparent,
                            child: Image.asset(
                              "assets/images/dots.png",
                              height: 40,
                            ),
                          ),
                        ),*/
                                      ],
                                    ),
                                    SizedBox(height: 08),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            _postList[index]
                                                .captions
                                                .toString(),
                                            style: FontConstant.k16w4008471Text,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 6),
                                    SizedBox(
                                      // decoration: BoxDecoration(
                                      //   borderRadius: BorderRadius.circular(100),
                                      //   color: Colors.black54,
                                      // ),
                                      height: 300,
                                      //width: 1.sw,
                                      child: PageView.builder(
                                          itemCount:
                                              _postList[index].image!.length,
                                          onPageChanged: (currentIndex) {
                                            // log(_postList[index].image![currentIndex].fileName.toString());
                                          },
                                          itemBuilder: (ctx, indexx) {
                                            return ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8)),
                                                child: InkWell(
                                                  onDoubleTap: () {
                                                    /*final resp = TeacherLikePost().get(
                                                    postId: int.parse(
                                                        _postList[index].postId.toString()));
                                                resp.then((value) {
                                                  print(value);
                                                  if (value['msg'] == 'post is like') {
                                                    setState(() {
                                                      print('Liked');
                                                      _isLiked = 1;
                                                      _voteCount++;
                                                      //_voteCount = min(0, _voteCount++);
                                                    });
                                                  } else {
                                                    setState(() {
                                                      print('Un liked');
                                                      _isLiked = 0;
                                                      _voteCount--;
                                                      //_voteCount = min(0, _voteCount--);
                                                    });
                                                  }
                                                });*/
                                                  },
                                                  onTap: () {
                                                    Navigator.of(context).push(MaterialPageRoute(
                                                        builder: (ctx) =>
                                                            ShowEnlargedPictureScreen(
                                                                imageUrl: _postList[
                                                                        index]
                                                                    .image![
                                                                        indexx]
                                                                    .fileName
                                                                    .toString(),
                                                                tag: postTag)));
                                                  },
                                                  child: Hero(
                                                    tag: postTag,
                                                    child: Image.network(
                                                      _postList[index]
                                                          .image![indexx]
                                                          .fileName
                                                          .toString(),
                                                      fit: BoxFit.fitWidth,
                                                      loadingBuilder:
                                                          (q, w, e) {
                                                        if (e == null) {
                                                          return w;
                                                        } else {
                                                          return SpinKitThreeBounce(
                                                            size: 30,
                                                            color: Colors.grey,
                                                          );
                                                        }
                                                      },
                                                      errorBuilder: (q, w, e) =>
                                                          SizedBox(
                                                              width: 1.sw,
                                                              child: Center(
                                                                  child: Text(
                                                                      'No image found'))),
                                                      width: 1.sw,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            );
                                          }),
                                      // ListView.separated(
                                      //   itemBuilder: (ctx, indexx){
                                      //   return Image.network(
                                      //     'https://d2dupazv4z3oi6.cloudfront.net/i/nic/abp_live.jpg', errorBuilder: (q, w, e) =>
                                      //       SizedBox(width: 1.sw,child: Text('No image found')),width: 1.sw,);
                                      // }, separatorBuilder: (ctx, ind)=> SizedBox.shrink(),
                                      //   itemCount: _postList[index].image!.length,
                                      //   shrinkWrap: true,
                                      //   scrollDirection: Axis.horizontal,)
                                    ),
                                    SizedBox(
                                      height: 16.5,
                                    ),
                                    PostInteraction(
                                      index: index,
                                      postList: _postList,
                                    ),
                                    SizedBox(height: 16),
                                    Container(
                                      width: 1.sw,
                                      height: 3,
                                      color: Colors.white,
                                    ),
                                    SizedBox(height: 5),
                                  ],
                                ),
                              );
                            } else if (reloadedVal == 'no_post_found') {
                              return Center(child: Text('No Posts found.'));
                            } else if (_onBottom && _postCount >= 10) {
                              return Center(child: CircularProgressIndicator());
                            } else {
                              return SizedBox.shrink();
                            }
                          },
                          separatorBuilder: (ctx, ind) => SizedBox(),
                          itemCount: _postList.length + 1),
                  // for (int i = 0; i < 8; i++)
                  //   Container(
                  //     margin: EdgeInsets.only(top: 10),
                  //     padding: const EdgeInsets.only(left: 16.0, right: 16),
                  //     child: Column(
                  //       children: [
                  //         Row(
                  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //           children: [
                  //             Row(
                  //               mainAxisAlignment: MainAxisAlignment.start,
                  //               children: [
                  //                 Image.asset(
                  //                   "assets/images/person2.png",
                  //                   height: 40,
                  //                   width: 40,
                  //                 ),
                  //                 SizedBox(
                  //                   width: 08,
                  //                 ),
                  //                 Text(
                  //                   "Mohammad Umar",
                  //                   style: FontConstant2.k16w5008267text,
                  //                 ),
                  //               ],
                  //             ),
                  //             PostOptionsDialog(),
                  //             /*GestureDetector(
                  //               onTap: () {},
                  //               child: Container(
                  //                 color: Colors.transparent,
                  //                 child: Image.asset(
                  //                   "assets/images/dots.png",
                  //                   height: 40,
                  //                 ),
                  //               ),
                  //             ),*/
                  //           ],
                  //         ),
                  //         SizedBox(height: 08),
                  //         Row(
                  //           children: [
                  //             Expanded(
                  //               child: Text(
                  //                 "Today we had small music activity with all kids and teachers. ",
                  //                 style: FontConstant.k16w4008471Text,
                  //               ),
                  //             ),
                  //           ],
                  //         ),
                  //         SizedBox(height: 6),
                  //         Row(
                  //           children: [
                  //             Expanded(
                  //                 child:
                  //                     Image.asset("assets/images/childrenposts.png")),
                  //             /* Container(
                  //               height: 213.h,
                  //               width: 379.w,
                  //               decoration: BoxDecoration(
                  //                   image: DecorationImage(
                  //                       image: AssetImage(
                  //                           "assets/images/childrenposts.png"))),
                  //             ),*/
                  //           ],
                  //         ),
                  //         SizedBox(
                  //           height: 16.5,
                  //         ),
                  //         Padding(
                  //           padding: const EdgeInsets.only(left: 8.0, right: 8),
                  //           child: Row(
                  //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //             children: [
                  //               Row(
                  //                 children: [
                  //                   Image.asset(
                  //                     "assets/images/heart2.png",
                  //                     height: 24,
                  //                   ),
                  //                   SizedBox(width: 10),
                  //                   Text(
                  //                     "2.4k".tr(),
                  //                     /*AppLoaclizations.of(context)!
                  //                         .translate("likes")
                  //                         .toString(),*/
                  //                     style: FontConstant.k16w4008471Text,
                  //                   ),
                  //                   SizedBox(width: 5),
                  //                   Text(
                  //                     "likes".tr(),
                  //                     /*AppLoaclizations.of(context)!
                  //                         .translate("likes")
                  //                         .toString(),*/
                  //                     style: FontConstant.k16w4008471Text,
                  //                   ),
                  //                 ],
                  //               ),
                  //               Text("2 min ago",
                  //                   style: FontConstant.k16w4008471Text
                  //                       .copyWith(fontSize: 14))
                  //             ],
                  //           ),
                  //         ),
                  //         SizedBox(height: 16),
                  //         Container(
                  //           width: 1.sw,
                  //           height: 3,
                  //           color: Colors.white,
                  //         ),
                  //         SizedBox(height: 5),
                  //       ],
                  //     ),
                  //   ),
                  SizedBox(height: 150)
                ],
              ),
            ),
    );
  }
}

class PostInteraction extends StatefulWidget {
  final int index;
  final List<model.SchoolAllPost> postList;
  const PostInteraction({Key? key, required this.index, required this.postList})
      : super(key: key);

  @override
  State<PostInteraction> createState() => _PostInteractionState();
}

class _PostInteractionState extends State<PostInteraction> {
  int _isLiked = 0;
  int _voteCount = 0;
  @override
  void initState() {
    _isLiked = widget.postList[widget.index].likeStatus ?? 0;
    _voteCount = widget.postList[widget.index].like ?? 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              InkWell(
                onTap: () {
                  final resp = TeacherLikePost().get(
                      postId: int.parse(
                          widget.postList[widget.index].postId.toString()));
                  resp.then((value) {
                    print(value);
                    if (value['msg'] == 'post is like') {
                      setState(() {
                        print('Liked');
                        _isLiked = 1;
                        _voteCount++;
                        //_voteCount = min(0, _voteCount++);
                      });
                    } else {
                      setState(() {
                        print('Un liked');
                        _isLiked = 0;
                        _voteCount--;
                        //_voteCount = min(0, _voteCount--);
                      });
                    }
                  });
                },
                child: _isLiked == 0
                    ? Image.asset(
                        "assets/images/heart2.png",
                        height: 24,
                      )
                    : Image.asset(
                        "assets/images/heartliked.png",
                        height: 24,
                      ),
              ),
              SizedBox(width: 10),
              Text(
                _voteCount.toString(),
                /*AppLoaclizations.of(context)!
                                    .translate("likes")
                                    .toString(),*/
                style: FontConstant.k16w4008471Text,
              ),
              SizedBox(width: 5),
              Text(
                "likes".tr(),
                /*AppLoaclizations.of(context)!
                                    .translate("likes")
                                    .toString(),*/
                style: FontConstant.k16w4008471Text,
              ),
            ],
          ),
          Text(widget.postList[widget.index].postDate.toString(),
              style: FontConstant.k16w4008471Text.copyWith(fontSize: 14))
        ],
      ),
    );
  }
}
