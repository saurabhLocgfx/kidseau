import 'dart:developer';
import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kidseau/api/Teacherpanelapi/teacher_post_api/teacher_my_post_api.dart';

import '../../Theme.dart';
import '../../Widgets/dialogs.dart';
import '../../api/Teacherpanelapi/teacher_post_api/teacher_like_post.dart';
import '../../api/models/Tschool_post_model/teacher_school_my_post_model.dart' as model;

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
        _getReloadedVal();
      }
    });
    _getData();
    super.initState();
  }

  int _scroll = 1;
  List<model.PostDetails> _postList = [];
  bool _isLoading = false;
  String reloadedVal = '';

  _getReloadedVal(){
    _scroll++;
    final resp = TeacherMyPostApi().get(scroll: _scroll);
    resp.then((value){
      try{
        if(value.status == 1){
          setState(() {
            _postList = value.postDetails!;
            _isLoading = false;
          });
        }else{
          setState(() {
            reloadedVal = 'no_post_found';
            _isLoading = false;
          });
        }
        // setState(() {
        //   _schoolPostModel = value;
        //   _isLoading = false;
        // });
      }catch(e){
        setState(() {
          _isLoading = false;
        });
      }
    });
  }

  _getData(){
    _isLoading = true;
    final resp = TeacherMyPostApi().get(scroll: 1);
    resp.then((value){
      //log(value.postDetails![0].captions.toString());
      try{
        if(value.status == 1){
          setState(() {
            _postList = value.postDetails!;
            _isLoading = false;
          });
        }else{
          setState(() {
            reloadedVal = 'no_post_found';
            _isLoading = false;
          });
        }
        // setState(() {
        //   _schoolPostModel = value;
        //   _isLoading = false;
        // });
      }catch(e){
        setState(() {
          _isLoading = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        controller: _scrollController,
        child: _isLoading? Center(child: CircularProgressIndicator(),): Column(
          children: [
            ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index){
                  if(index < _postList.length) {
                    return Container(
                      margin: EdgeInsets.only(top: 10),
                      padding: const EdgeInsets.only(left: 16.0, right: 16),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Image.network(
                                    _postList[index].techProfile.toString(),
                                    errorBuilder: (q,w,e)=> Image.asset("assets/images/person2.png",height: 40,
                                      width: 40,),
                                    height: 40,
                                    width: 40,
                                  ),
                                  SizedBox(
                                    width: 08,
                                  ),
                                  Text(
                                    _postList[index].fName.toString(),
                                    style: FontConstant2.k16w5008267text,
                                  ),
                                ],
                              ),
                              PostOptionsDialog(),
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
                                  _postList[index].captions.toString(),
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
                                onPageChanged: (currentIndex){
                                  //log(_postList[index].images![currentIndex].fileImage.toString());
                                },
                                itemBuilder: (ctx, indexx) {
                                  return ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(8)
                                      ),
                                      child: Image.network(
                                        _postList[index].images![indexx].fileImage.toString(),
                                        fit: BoxFit.fill,
                                        errorBuilder: (q, w, e) =>
                                            SizedBox(width: 1.sw,
                                                child: Center(child: Text('No image found'))),
                                        width: 1.sw,),
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
                          MyPostInteraction(index: index,postList: _postList,),
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
                  }else if(reloadedVal == 'no_post_found'){
                    return Center(child: Text('No Posts found.'));
                  }else{
                    return Center(child: CircularProgressIndicator());
                  }
                }, separatorBuilder: (ctx, ind) => SizedBox(), itemCount: _postList.length+1),
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
            //             MyPostOptionsDialog(),
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
            //                     Image.asset("assets/images/childrenposts.png"))
            //             /*Container(
            //               height: 214,
            //               width: 382,
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
            //                     "2.4k likes",
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

class MyPostInteraction extends StatefulWidget {
  final int index;
  final  List<model.PostDetails> postList;
  const MyPostInteraction({Key? key, required this.index, required this.postList}) : super(key: key);

  @override
  State<MyPostInteraction> createState() => _MyPostInteractionState();
}

class _MyPostInteractionState extends State<MyPostInteraction> {

  @override
  void initState() {
    _isLiked = widget.postList[widget.index].likeStatus ?? 0;
    _voteCount = widget.postList[widget.index].like??0;
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
                onTap:(){
                  final resp = TeacherLikePost().get(postId: int.parse(widget.postList[widget.index].postId.toString()));
                  resp.then((value){
                    print(value);
                    if(value['msg'] == 'post is like'){
                      setState(() {
                        print('Liked');
                        _isLiked = 1;
                        //_voteCount = min(0, _voteCount++);
                        _voteCount++;
                      });
                    }else{
                      setState(() {
                        print('Un liked');
                        _isLiked = 0;
                        _voteCount--;
                        //_voteCount = min(0, _voteCount--);
                      });
                    }
                  });
                },
                child: _isLiked == 0? Image.asset(
                  "assets/images/heart2.png",
                  height: 24,
                ): Image.asset(
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
              style: FontConstant.k16w4008471Text
                  .copyWith(fontSize: 14))
        ],
      ),
    );
  }
}

