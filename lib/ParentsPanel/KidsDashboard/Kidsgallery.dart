import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_downloader/image_downloader.dart';
import 'package:kidseau/Theme.dart';
import 'package:kidseau/Widgets/dialogs.dart';
import 'package:kidseau/api/models/parent_models/kid_details_models/parent_post_model.dart';
import 'package:kidseau/api/parent_panel_apis/parent_kid_details_api/parent_kid_post_api.dart';
import 'package:kidseau/api/parent_panel_apis/parent_post_api/parent_like_post_api.dart';

import '../../TeachersPanel/TPostsScreen/TPostsScreen.dart';
import '../../Widgets/custom_snack_bar.dart';
import '../../api/Teacherpanelapi/teacher_post_api/post_apis/teacher_hide_post_api.dart';
import '../../api/report_post_api/report_post_api.dart';
import '../../enlarged_image_screen.dart';

class PKidsGallery extends StatefulWidget {
  final String kidId;
  const PKidsGallery({Key? key, required this.kidId}) : super(key: key);

  @override
  State<PKidsGallery> createState() => _PKidsGalleryState();
}

class _PKidsGalleryState extends State<PKidsGallery> {
  bool _isLoading = false;
  List<ParentPostModel> _postList = [];
  final ScrollController _scrollController = ScrollController();
  bool _onBottom = false;
  int _postCount = 0;
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
  String reloadedVal = '';
  _getReloadedData() {
    _scroll++;
    final resp =
        ParentKidPostApi().get(kidId: widget.kidId, scroll: _scroll.toString());
    resp.then((value) {
      if (value['status'] == 1) {
        setState(() {
          for (var v in value['allPostShow']) {
            _postList.add(ParentPostModel.fromJson(v));
          }
          //_isLoading = false;
        });
      } else {
        setState(() {
          // _isLoading = false;
          reloadedVal = 'no_post_found';
        });
      }
    });
  }

  _getData() {
    _isLoading = true;
    final resp =
        ParentKidPostApi().get(kidId: widget.kidId, scroll: 0.toString());
    resp.then((value) {
      if (value['status'] == 1) {
        setState(() {
          for (var v in value['allPostShow']) {
            _postList.add(ParentPostModel.fromJson(v));
          }
          _isLoading = false;
        });
      } else {
        setState(() {
          _isLoading = false;
          reloadedVal = 'no_post_found';
        });
      }
    });
  }

  String parentPostTag = 'parentPostTag';

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : MediaQuery.removePadding(
            context: context,
            removeTop: true,
            child: ListView.separated(
                controller: _scrollController,
                shrinkWrap: true,
                //physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  if (index < _postList.length) {
                    return Container(
                      // margin: EdgeInsets.only(top: 10),
                      // padding: const EdgeInsets.only(left: 16.0, right: 16),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    clipBehavior: Clip.hardEdge,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                    child: Image.network(
                                      _postList[index].teacherImage.toString(),
                                      fit: BoxFit.fill,
                                      errorBuilder: (q, w, e) => Image.asset(
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
                                    _postList[index].teacherName.toString(),
                                    style: FontConstant2.k16w5008267text,
                                  ),
                                ],
                              ),
                              PopupMenuButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16)),
                                  iconSize: 40,
                                  icon: ImageIcon(
                                    AssetImage(
                                      "assets/images/dots2.png",
                                    ),
                                  ),
                                  itemBuilder: (context) {
                                    return [
                                      PopupMenuItem(
                                        enabled: true,
                                        onTap: () {
                                          log('message');
                                          final resp = TeacherHidePostApi().get(
                                              postId: _postList[index]
                                                  .postId
                                                  .toString());
                                          resp.then((value) {
                                            log(value.toString());
                                            if (value['status'] == 1) {
                                              setState(() {
                                                _postList.removeAt(index);
                                                Navigator.of(context).pop();
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
                                              style:
                                                  FontConstant.k18w5008471Text,
                                            )
                                          ],
                                        ),
                                      ),
                                      PopupMenuItem(
                                        enabled: true,
                                        onTap: () {
                                          showModalBottomSheet(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          topLeft: const Radius
                                                              .circular(20.0),
                                                          topRight: const Radius
                                                              .circular(20.0))),
                                              context: context,
                                              isScrollControlled: true,
                                              builder: (builder) {
                                                return SingleChildScrollView(
                                                  child: Container(
                                                      decoration: BoxDecoration(
                                                          // color: Colors.transparent,
                                                          borderRadius: BorderRadius.only(
                                                              topLeft: const Radius
                                                                      .circular(
                                                                  20.0),
                                                              topRight: const Radius
                                                                      .circular(
                                                                  20.0))),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(left: 16),
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            SizedBox(
                                                              height: 10,
                                                            ),
                                                            Text(
                                                              "Report".tr(),
                                                              style: FontConstant
                                                                  .k24w50084717FText,
                                                            ),
                                                            SizedBox(
                                                              height: 34,
                                                            ),
                                                            ListTile(
                                                              onTap: () {
                                                                final resp = ReportPostApi().get(
                                                                    postId: _postList[
                                                                            index]
                                                                        .postId
                                                                        .toString(),
                                                                    reportDesc:
                                                                        "I don’t like this"
                                                                            .tr());
                                                                resp.then(
                                                                    (value) {
                                                                  print(value);
                                                                  if (value[
                                                                          'status'] ==
                                                                      1) {
                                                                    Navigator.of(
                                                                            context)
                                                                        .pop();
                                                                    CustomSnackBar.customSnackBar(
                                                                        context,
                                                                        'Reported successfully');
                                                                  } else {
                                                                    Navigator.of(
                                                                            context)
                                                                        .pop();
                                                                    CustomSnackBar.customErrorSnackBar(
                                                                        context,
                                                                        'Report failed');
                                                                  }
                                                                });
                                                              },
                                                              title: Text(
                                                                "I don’t like this"
                                                                    .tr(),
                                                                style: FontConstant
                                                                    .k16w500331FText,
                                                              ),
                                                            ),
                                                            ListTile(
                                                              onTap: () {
                                                                final resp = ReportPostApi().get(
                                                                    postId: _postList[
                                                                            index]
                                                                        .postId
                                                                        .toString(),
                                                                    reportDesc:
                                                                        "Not from the same group"
                                                                            .tr());
                                                                resp.then(
                                                                    (value) {
                                                                  if (value[
                                                                          'status'] ==
                                                                      1) {
                                                                    Navigator.of(
                                                                            context)
                                                                        .pop();
                                                                    CustomSnackBar.customSnackBar(
                                                                        context,
                                                                        'Reported successfully');
                                                                  } else {
                                                                    Navigator.of(
                                                                            context)
                                                                        .pop();
                                                                    CustomSnackBar.customErrorSnackBar(
                                                                        context,
                                                                        'Report failed');
                                                                  }
                                                                });
                                                              },
                                                              title: Text(
                                                                "Not from the same group"
                                                                    .tr(),
                                                                style: FontConstant
                                                                    .k16w500331FText,
                                                              ),
                                                            ),
                                                            ListTile(
                                                              onTap: () {
                                                                final resp = ReportPostApi().get(
                                                                    postId: _postList[
                                                                            index]
                                                                        .postId
                                                                        .toString(),
                                                                    reportDesc:
                                                                        "Inappropriate content"
                                                                            .tr());
                                                                resp.then(
                                                                    (value) {
                                                                  if (value[
                                                                          'status'] ==
                                                                      1) {
                                                                    Navigator.of(
                                                                            context)
                                                                        .pop();
                                                                    CustomSnackBar.customSnackBar(
                                                                        context,
                                                                        'Reported successfully');
                                                                  } else {
                                                                    Navigator.of(
                                                                            context)
                                                                        .pop();
                                                                    CustomSnackBar.customErrorSnackBar(
                                                                        context,
                                                                        'Report failed');
                                                                  }
                                                                });
                                                              },
                                                              title: Text(
                                                                "Inappropriate content"
                                                                    .tr(),
                                                                style: FontConstant
                                                                    .k16w500331FText,
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: 50,
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
                                              style:
                                                  FontConstant.k18w5008471Text,
                                            )
                                          ],
                                        ),
                                      ),
                                      PopupMenuItem(
                                        enabled: true,
                                        onTap: () async {
                                          for (var url
                                              in _postList[index].images!) {
                                            try {
                                              var imageId =
                                                  await ImageDownloader
                                                      .downloadImage(url
                                                          .fileName
                                                          .toString());
                                              var path = await ImageDownloader
                                                  .findPath(imageId!);
                                            } catch (error) {
                                              print(error);
                                            }
                                          }
                                          Fluttertoast.showToast(
                                              msg: 'Download complete');
                                        },
                                        child: Row(
                                          children: [
                                            Image.asset(
                                              "assets/images/downloadicon.png",
                                              height: 24,
                                            ),
                                            SizedBox(width: 24),
                                            Text(
                                              "Download".tr(),
                                              /*AppLoaclizations.of(context)!
                                  .translate("Download")
                                  .toString(),*/
                                              style:
                                                  FontConstant.k18w5008471Text,
                                            )
                                          ],
                                        ),
                                      ),
                                    ];
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
                                  _postList[index].postCaption.toString(),
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
                                itemCount: _postList[index].images!.length,
                                onPageChanged: (currentIndex) {
                                  // log(_postList[index].image![currentIndex].fileName.toString());
                                },
                                itemBuilder: (ctx, indexx) {
                                  return ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      child: InkWell(
                                        onTap: () {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (ctx) =>
                                                      ShowEnlargedPictureScreen(
                                                          imageUrl: _postList[
                                                                  index]
                                                              .images![indexx]
                                                              .fileName
                                                              .toString(),
                                                          tag: parentPostTag)));
                                        },
                                        child: Hero(
                                          tag: parentPostTag,
                                          child: Image.network(
                                            _postList[index]
                                                .images![indexx]
                                                .fileName
                                                .toString(),
                                            fit: BoxFit.fitWidth,
                                            loadingBuilder: (q, w, e) {
                                              if (e == null) {
                                                return w;
                                              } else {
                                                return SpinKitThreeBounce(
                                                  size: 30,
                                                  color: Colors.grey,
                                                );
                                              }
                                            },
                                            errorBuilder: (q, w, e) => SizedBox(
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
                          ParentPostInteraction(
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
                  } else if (_postList.isEmpty) {
                    return Image.asset(
                      'assets/images/emptypost.png',
                      width: 200,
                      height: 300,
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
          );
  }
}

class ParentPostInteraction extends StatefulWidget {
  final int index;
  final List<ParentPostModel> postList;
  const ParentPostInteraction(
      {Key? key, required this.index, required this.postList})
      : super(key: key);

  @override
  State<ParentPostInteraction> createState() => _ParentPostInteractionState();
}

class _ParentPostInteractionState extends State<ParentPostInteraction> {
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
                  final resp = ParentLikePostApi().get(
                      postId: widget.postList[widget.index].postId.toString());
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

class ReportBottomSheet extends StatefulWidget {
  const ReportBottomSheet({Key? key}) : super(key: key);

  @override
  State<ReportBottomSheet> createState() => _ReportBottomSheetState();
}

class _ReportBottomSheetState extends State<ReportBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 298,
        decoration: BoxDecoration(
            // color: Colors.transparent,
            borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(20.0),
                topRight: const Radius.circular(20.0))),
        child: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              Text(
                "Report ",
                style: FontConstant.k24w50084717FText,
              ),
              SizedBox(
                height: 34,
              ),
              Text(
                "I don’t like this",
                style: FontConstant.k16w500331FText,
              ),
              SizedBox(
                height: 34,
              ),
              Text(
                "Not from the same group",
                style: FontConstant.k16w500331FText,
              ),
              SizedBox(
                height: 34,
              ),
              Text(
                "Inappropriate content",
                style: FontConstant.k16w500331FText,
              ),
              SizedBox(
                height: 34,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 100.w,
                    height: 3,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0xff331F2D)),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
