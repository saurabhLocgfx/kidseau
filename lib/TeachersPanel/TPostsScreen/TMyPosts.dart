import 'dart:developer';
import 'dart:typed_data';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:kidseau/TeachersPanel/TPostsScreen/TEditPostScreen.dart';
import 'package:kidseau/api/Teacherpanelapi/teacher_post_api/teacher_delete_post_api.dart';
import 'package:kidseau/api/Teacherpanelapi/teacher_post_api/teacher_my_post_api.dart';
import 'package:kidseau/enlarged_image_screen.dart';

import '../../Theme.dart';
import '../../Widgets/dialogs.dart';
import '../../api/Teacherpanelapi/teacher_post_api/teacher_like_post.dart';
import '../../api/models/Tschool_post_model/teacher_school_my_post_model.dart'
    as model;

class TMyPosts extends StatefulWidget {
  const TMyPosts({Key? key}) : super(key: key);

  @override
  State<TMyPosts> createState() => _TMyPostsState();
}

class _TMyPostsState extends State<TMyPosts> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    _scrollController.addListener(() {
      if (_scrollController.position.maxScrollExtent ==
          _scrollController.offset) {
        if (_postCount >= 10) {
          _getReloadedVal();
        }
      }
    });
    _getData();
    super.initState();
  }

  int _scroll = 0;
  int _postCount = 0;
  List<model.PostDetails> _postList = [];
  bool _isLoading = false;
  String reloadedVal = '';

  _getReloadedVal() {
    _scroll++;
    final resp = TeacherMyPostApi().get(scroll: _scroll);
    resp.then((value) {
      try {
        if (value.status == 1) {
          setState(() {
            _postCount = value.postDetails!.length;
            for (var v in value.postDetails!) {
              _postList.add(v);
            }
            _isLoading = false;
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
    final resp = TeacherMyPostApi().get(scroll: 0);
    resp.then((value) {
      //log(value.postDetails![0].tagKid.toString());
      try {
        if (value.status == 1) {
          setState(() {
            _postList = value.postDetails!;
            _postCount = value.postDetails!.length;
            _isLoading = false;
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

  final String myPostTag = 'myPostTag';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        controller: _scrollController,
        child: _isLoading
            ? SizedBox(
                height: 1.sh,
                child: Center(
                  child: CircularProgressIndicator(),
                ))
            : Column(
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
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                              child: Image.network(
                                                _postList[index]
                                                    .techProfile
                                                    .toString(),
                                                fit: BoxFit.cover,
                                                errorBuilder: (q, w, e) =>
                                                    Image.asset(
                                                  "assets/images/person2.png",
                                                  height: 40,
                                                  width: 40,
                                                ),
                                                height: 40,
                                                width: 40,
                                              ),
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
                                              return <PopupMenuItem<Widget>>[
                                                PopupMenuItem(
                                                  enabled: false,
                                                  child: InkWell(
                                                    onTap: () {
                                                      log('Edit');
                                                      Navigator.of(context)
                                                          .pop();
                                                      Navigator.of(context).push(
                                                          MaterialPageRoute(
                                                              builder: (ctx) =>
                                                                  TEditPostFormScreen(
                                                                    posts:
                                                                        _postList,
                                                                    index:
                                                                        index,
                                                                    onPop:
                                                                        (val) {
                                                                      _getData();
                                                                    },
                                                                  )));
                                                    },
                                                    child: Container(
                                                      width: 160,
                                                      padding: EdgeInsets.only(
                                                          left: 16,
                                                          top: 16,
                                                          bottom: 16),
                                                      child: Row(
                                                        children: [
                                                          Image.asset(
                                                            "assets/images/edit.png",
                                                            height: 24,
                                                          ),
                                                          SizedBox(width: 24),
                                                          Text(
                                                            "Edit".tr(),
                                                            style: FontConstant
                                                                .k18w5008471Text,
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                /*PopupMenuItem(
                                              enabled: false,
                                              child: InkWell(
                                                onTap: () {
                                                  log('Hide');
                                                  Navigator.of(context).pop();
                                                },
                                                child: Container(
                                                  padding: EdgeInsets.only(
                                                      left: 16,
                                                      top: 16,
                                                      bottom: 16),
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
                                                ),
                                              ),
                                            ),*/
                                                PopupMenuItem(
                                                  enabled: false,
                                                  child: InkWell(
                                                    onTap: () async {
                                                      Navigator.pop(context);
                                                      for (var url
                                                          in _postList[index]
                                                              .images!) {
                                                        try {
                                                          var response = await http
                                                              .get(Uri.parse(url
                                                                  .fileImage
                                                                  .toString()));
                                                          final result =
                                                              await ImageGallerySaver.saveImage(
                                                                  Uint8List.fromList(
                                                                      response
                                                                          .bodyBytes),
                                                                  quality: 60,
                                                                  name:
                                                                      "newImage");
                                                        } catch (error) {
                                                          print(error);
                                                        }
                                                      }
                                                      Fluttertoast.showToast(
                                                        msg:
                                                            'Image downloaded and saved successfully',
                                                        // toastLength:
                                                        //     Toast.LENGTH_SHORT,
                                                        // gravity:
                                                        //     ToastGravity.BOTTOM,
                                                        // timeInSecForIosWeb:
                                                        //     1,
                                                        backgroundColor:
                                                            Color(0xff8267AC),
                                                        textColor: Colors.white,
                                                      );
                                                    },
                                                    child: Container(
                                                      width: 160,
                                                      padding: EdgeInsets.only(
                                                          left: 16,
                                                          top: 16,
                                                          bottom: 16),
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
                                                PopupMenuItem(
                                                  enabled: false,
                                                  child: InkWell(
                                                    onTap: () {
                                                      Navigator.pop(context);
                                                      showDialog(
                                                        context: context,
                                                        builder: (_) =>
                                                            SuretyDialog(
                                                          onYesTap: () {
                                                            print(_postList[
                                                                    index]
                                                                .postId
                                                                .toString());
                                                            final resp = tDeletePostApi(
                                                                postId: _postList[
                                                                        index]
                                                                    .postId
                                                                    .toString());
                                                            resp.then((value) {
                                                              _isLoading
                                                                  ? SizedBox(
                                                                      height:
                                                                          1.sh,
                                                                      child:
                                                                          Center(
                                                                        child:
                                                                            CircularProgressIndicator(),
                                                                      ))
                                                                  : _getData();
                                                              Navigator.of(
                                                                      context)
                                                                  .pop();
                                                              log(value
                                                                  .toString());
                                                              if (value[
                                                                      'status'] ==
                                                                  1) {
                                                                setState(() {
                                                                  Fluttertoast
                                                                      .showToast(
                                                                    msg: value[
                                                                        'msg'],
                                                                    toastLength:
                                                                        Toast
                                                                            .LENGTH_SHORT,
                                                                    gravity:
                                                                        ToastGravity
                                                                            .BOTTOM,
                                                                    backgroundColor:
                                                                        Color(
                                                                            0xff8267AC),
                                                                    textColor:
                                                                        Colors
                                                                            .white,
                                                                  );
                                                                  _postList
                                                                      .removeAt(
                                                                          index);
                                                                  Navigator.of(
                                                                          context)
                                                                      .pop();
                                                                });
                                                              } else {
                                                                Fluttertoast
                                                                    .showToast(
                                                                  msg: value[
                                                                      'msg'],
                                                                  toastLength: Toast
                                                                      .LENGTH_SHORT,
                                                                  gravity:
                                                                      ToastGravity
                                                                          .BOTTOM,
                                                                  backgroundColor:
                                                                      Color(
                                                                          0xff8267AC),
                                                                  textColor:
                                                                      Colors
                                                                          .white,
                                                                );
                                                              }
                                                            });
                                                          },
                                                        ),
                                                      );
                                                    },
                                                    child: Container(
                                                      width: 160,
                                                      padding: EdgeInsets.only(
                                                          left: 16,
                                                          top: 16,
                                                          bottom: 16),
                                                      child: Row(
                                                        children: [
                                                          Image.asset(
                                                            "assets/images/trash.png",
                                                            height: 24,
                                                          ),
                                                          SizedBox(width: 24),
                                                          Text(
                                                            "Delete".tr(),
                                                            style: FontConstant
                                                                .k18w500F970Text,
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ];
                                            })
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
                                      height: 300,
                                      //width: 1.sw,
                                      child: PageView.builder(
                                          //controller: PageController(viewportFraction: 0.6),
                                          itemCount:
                                              _postList[index].images!.length,
                                          onPageChanged: (currentIndex) {},
                                          itemBuilder: (ctx, indexx) {
                                            return ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              child: Container(
                                                // margin: EdgeInsets.only(right: 16),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8)),
                                                child: InkWell(
                                                  onTap: () {
                                                    Navigator.of(context).push(MaterialPageRoute(
                                                        builder: (ctx) =>
                                                            ShowEnlargedPictureScreen(
                                                                imageUrl: _postList[
                                                                        index]
                                                                    .images![
                                                                        indexx]
                                                                    .fileImage
                                                                    .toString(),
                                                                tag:
                                                                    myPostTag)));
                                                  },
                                                  child: Hero(
                                                    tag: myPostTag,
                                                    child: Image.network(
                                                      _postList[index]
                                                          .images![indexx]
                                                          .fileImage
                                                          .toString(),
                                                      fit: BoxFit.cover,
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
                                    ),
                                    SizedBox(
                                      height: 16.5,
                                    ),
                                    MyPostInteraction(
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
                            } else if (_scrollController
                                    .position.maxScrollExtent ==
                                _scrollController.offset) {
                              return Center(child: CircularProgressIndicator());
                            } else {
                              return SizedBox.shrink();
                            }
                          },
                          separatorBuilder: (ctx, ind) => SizedBox(),
                          itemCount: _postList.length + 1),
                  SizedBox(height: 150)
                ],
              ),
      ),
    );
  }
}

class MyPostInteraction extends StatefulWidget {
  final int index;
  final List<model.PostDetails> postList;
  const MyPostInteraction(
      {Key? key, required this.index, required this.postList})
      : super(key: key);

  @override
  State<MyPostInteraction> createState() => _MyPostInteractionState();
}

class _MyPostInteractionState extends State<MyPostInteraction> {
  @override
  void initState() {
    _isLiked = widget.postList[widget.index].likeStatus ?? 0;
    _voteCount = widget.postList[widget.index].like ?? 0;
    super.initState();
  }

  int _isLiked = 0;
  int _voteCount = 0;
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
                        //_voteCount = min(0, _voteCount++);
                        _voteCount++;
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
          Text(
              DateFormat('dd MMM').format(DateTime.parse(
                  widget.postList[widget.index].postDate.toString())),
              style: FontConstant.k16w4008471Text.copyWith(fontSize: 14))
        ],
      ),
    );
  }
}
