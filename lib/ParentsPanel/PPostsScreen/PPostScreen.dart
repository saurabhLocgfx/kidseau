import 'dart:developer';
import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:kidseau/Theme.dart';
import 'package:kidseau/api/models/parent_models/parent_post_models/parent_post_school_model.dart';
import 'package:kidseau/api/parent_panel_apis/parent_post_api/parent_get_post_api.dart';
import 'package:kidseau/api/parent_panel_apis/parent_post_api/parent_post_school_api.dart';
import 'package:kidseau/restartappwidget/restartwidgets.dart';
import 'package:kidseau/shard_prefs/shared_prefs.dart';

import '../../TeachersPanel/TReminder/TReminderScreen.dart';
import '../../Widgets/custom_snack_bar.dart';
import '../../api/Teacherpanelapi/teacher_post_api/post_apis/teacher_hide_post_api.dart';
import '../../api/models/parent_models/kid_details_models/parent_post_model.dart';
import '../../api/report_post_api/report_post_api.dart';
import '../../enlarged_image_screen.dart';
import '../KidsDashboard/Kidsgallery.dart';

class PPostScreen extends StatefulWidget {
  const PPostScreen({Key? key}) : super(key: key);

  @override
  State<PPostScreen> createState() => _PPostScreenState();
}

class _PPostScreenState extends State<PPostScreen> {
  bool colorChange = false;
  ParentPostSchoolModel model = ParentPostSchoolModel();
  final CarouselController _controller = CarouselController();
  List<ParentPostModel> _postList = [];

  final ScrollController _scrollController = ScrollController();
  bool _onBottom = false;
  int _postCount = 0;
  String reloadedVal = '';

  @override
  void initState() {
    _scrollController.addListener(() {
      if (_scrollController.position.maxScrollExtent ==
          _scrollController.offset) {
        if (_postCount >= 10) {
          _getReloadedPosts();
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

  bool _isLoading = false;

  _getData() {
    _isLoading = true;
    final resp = ParentPostSchoolApi().get();
    if (mounted) {
      resp.then((value) {
        if (value['status'] == 1) {
          if (mounted) {
            setState(() {
              model = ParentPostSchoolModel.fromJson(value);
              //_isLoading = false;
            });
          }
        } else {
          setState(() {
            _isLoading = false;
          });
        }
      }).then((value) {
        /*setState(() {
        _postsLoading = true;
      });*/
        _getPosts();
      });
    }
  }

  bool _postsLoading = false;
  int _scroll = 0;
  int _index = 0;
  _getReloadedPosts() {
    _scroll++;
    final resp = ParentGetPosts().get(
        scroll: _scroll.toString(),
        grpId: model.kidSch![_index].grpId.toString(),
        secId: model.kidSch![_index].secId.toString());
    resp.then((value) {
      if (value['status'] == 1) {
        setState(() {
          for (var v in value['post']) {
            _postList.add(ParentPostModel.fromJson(v));
          }
          _isLoading = false;
          _postsLoading = false;
        });
      } else {
        setState(() {
          reloadedVal = 'no_post_found';
          _isLoading = false;
          _postsLoading = false;
        });
      }
    });
  }

  _getPosts() {
    final resp = ParentGetPosts().get(
        scroll: '0',
        grpId: model.kidSch![_index].grpId.toString(),
        secId: model.kidSch![_index].secId.toString());
    resp.then((value) {
      log(value.toString());
      if (value['status'] == 1) {
        if (mounted) {
          setState(() {
            for (var v in value['post']) {
              _postList.add(ParentPostModel.fromJson(v));
            }
            _isLoading = false;
            _postsLoading = false;
          });
        }
      } else {
        setState(() {
          reloadedVal = 'no_post_found';
          _isLoading = false;
          _postsLoading = false;
        });
      }
    });
  }

  String parentPostTag2 = 'parentPostTag2';
  final GlobalKey<PopupMenuButtonState> pop = GlobalKey<PopupMenuButtonState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
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
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: ThemeColor.lightpurple.withOpacity(0.16),
        ),
        backgroundColor: Color(0xff8267AC).withOpacity(0.16),
        centerTitle: false,
        title: GestureDetector(
          onTap: () {
            // Navigator.of(context).push(MaterialPageRoute(
            //     builder: (context) => NotificationScreen()));
          },
          child: Text("Posts".tr(),
              style: FontConstant.k32w5008267Text.copyWith(fontSize: 32.sp)),
        ),
        actions: [
          InkWell(
            onTap: () {
              pop.currentState!.showButtonMenu();
            },
            child: Container(
                color: Colors.transparent,
                padding: EdgeInsets.all(10),
                child: PopupMenuButton(
                    key: pop,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                    itemBuilder: (context) {
                      return [
                        PopupMenuItem(
                          enabled: false,
                          child: GestureDetector(
                            onTap: () {
                              UserPrefs.setEArbBool(false);
                              UserPrefs.setLang('English');
                              context.locale = Locale('en', 'US');
                              RestartWidget.restartApp(context);
                              setState(() {
                                colorChange;
                              });
                            },
                            child: Row(
                              children: [
                                Text(
                                  ("English".tr()),
                                  style: colorChange
                                      ? FontConstant.k16w5008267Text
                                      : FontConstant.k18w5008471Text,
                                )
                              ],
                            ),
                          ),
                        ),
                        PopupMenuItem(
                          enabled: false,
                          child: GestureDetector(
                            onTap: () {
                              UserPrefs.setEArbBool(false);
                              UserPrefs.setLang('French');
                              context.locale = Locale('fr', 'FR');
                              RestartWidget.restartApp(context);
                              setState(() {
                                colorChange;
                              });
                            },
                            child: Row(
                              children: [
                                Text(
                                  ("French".tr()),
                                  style: colorChange
                                      ? FontConstant.k16w5008267Text
                                      : FontConstant.k18w5008471Text,
                                )
                              ],
                            ),
                          ),
                        ),
                        PopupMenuItem(
                          enabled: false,
                          child: GestureDetector(
                            onTap: () {
                              UserPrefs.setEArbBool(true);
                              UserPrefs.setLang('Arabic');
                              context.locale = Locale('ar', 'AR');
                              RestartWidget.restartApp(context);

                              setState(() {
                                colorChange;
                              });
                            },
                            child: Row(
                              children: [
                                Text(
                                  ("Arabic".tr()),
                                  style: colorChange
                                      ? FontConstant.k16w5008267Text
                                      : FontConstant.k18w5008471Text,
                                )
                              ],
                            ),
                          ),
                        ),
                      ];
                    },
                    child: Image.asset(
                      "assets/images/Languageicon.png",
                      height: 24,
                      width: 24,
                    ))),
          ),
          SizedBox(width: 8),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => TReminderScreen(),
                ),
              );
            },
            child: Container(
              color: Colors.transparent,
              padding: const EdgeInsets.all(10),
              child: Image.asset(
                "assets/images/clockicon.png",
                height: 24,
                width: 24,
              ),
            ),
          ),
          SizedBox(width: 8),
        ],
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                children: [
                  Container(
                    // height: 375,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xffF8F6FA).withOpacity(.100),
                          Color(0xffF8F6FA).withOpacity(.0),
                        ],
                      ),
                      // image: DecorationImage(
                      //     image: AssetImage(
                      //       "assets/images/postsbackground.png",
                      //     ),
                      //     fit: BoxFit.cover),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 120,
                        ),
                        Image.asset(
                          "assets/images/School.png",
                          height: 40,
                          width: 40,
                        ),
                        SizedBox(height: 13),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (model.kidSch!.length > 1)
                              InkWell(
                                onTap: () {
                                  _controller.previousPage();
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 8),
                                  child: Image.asset(
                                    "assets/images/arrleft.png",
                                    height: 24,
                                    width: 24,
                                  ),
                                ),
                              ),
                            SizedBox(
                              width: 200,
                              child: CarouselSlider.builder(
                                carouselController: _controller,
                                itemCount: model.kidSch!.length,
                                itemBuilder: (ctx, index, realIndex) {
                                  return Text(
                                    model.kidSch![index].schoolName.toString(),
                                    style: FontConstant2.k24w5008267text,
                                  );
                                },
                                options: CarouselOptions(
                                  //scrollPhysics: NeverScrollableScrollPhysics(),
                                  height: 40.h,
                                  onPageChanged: (index, reason) {
                                    setState(() {
                                      _index = index;
                                      _postsLoading = true;
                                      _getPosts();
                                    });
                                  },
                                  viewportFraction: 1,
                                  enlargeCenterPage: true,
                                  //pageSnapping: false,
                                  enableInfiniteScroll: false,
                                ),
                              ),
                            ),
                            if (model.kidSch!.length > 1)
                              InkWell(
                                onTap: () {
                                  _controller.nextPage();
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 8),
                                  child: Image.asset(
                                    "assets/images/arrright.png",
                                    height: 24,
                                    width: 24,
                                  ),
                                ),
                              ),
                          ],
                        ),
                        SizedBox(height: 38),
                        Container(
                          height: 5,
                          width: 1.sw,
                          color: Colors.white,
                        ),
                        _postList.isEmpty
                            ? Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
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
                              )
                            : Container(
                                width: 1.sw,
                                color: Colors.white.withOpacity(0.0),
                                padding: EdgeInsets.symmetric(horizontal: 16),
                                child: MediaQuery.removePadding(
                                  removeTop: true,
                                  context: context,
                                  child: _postsLoading
                                      ? Center(
                                          child: CircularProgressIndicator(),
                                        )
                                      : ListView.builder(
                                          itemCount: _postList.length,
                                          physics:
                                              NeverScrollableScrollPhysics(),
                                          shrinkWrap: true,
                                          itemBuilder: (context, index) {
                                            if (index < _postList.length) {
                                              return Column(
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          Container(
                                                            clipBehavior:
                                                                Clip.hardEdge,
                                                            decoration:
                                                                BoxDecoration(
                                                                    shape: BoxShape
                                                                        .circle),
                                                            child:
                                                                Image.network(
                                                              _postList[index]
                                                                  .teacherImage
                                                                  .toString(),
                                                              fit: BoxFit.fill,
                                                              errorBuilder: (q,
                                                                      w, e) =>
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
                                                            _postList[index]
                                                                .teacherName
                                                                .toString(),
                                                            style: FontConstant2
                                                                .k16w5008267text,
                                                          ),
                                                        ],
                                                      ),
                                                      PopupMenuButton(
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          16)),
                                                          iconSize: 40,
                                                          icon: ImageIcon(
                                                            AssetImage(
                                                              "assets/images/dots2.png",
                                                            ),
                                                          ),
                                                          itemBuilder:
                                                              (context) {
                                                            return [
                                                              PopupMenuItem(
                                                                enabled: false,
                                                                child: InkWell(
                                                                  onTap: () {
                                                                    log('message');
                                                                    final resp = TeacherHidePostApi().get(
                                                                        postId: _postList[index]
                                                                            .postId
                                                                            .toString());
                                                                    resp.then(
                                                                        (value) {
                                                                      log(value
                                                                          .toString());
                                                                      if (value[
                                                                              'status'] ==
                                                                          1) {
                                                                        setState(
                                                                            () {
                                                                          _postList
                                                                              .removeAt(index);
                                                                          Navigator.of(context)
                                                                              .pop();
                                                                        });
                                                                      }
                                                                    });
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    padding: EdgeInsets.only(
                                                                        left:
                                                                            16,
                                                                        top: 16,
                                                                        bottom:
                                                                            16),
                                                                    child: Row(
                                                                      children: [
                                                                        Image
                                                                            .asset(
                                                                          "assets/images/eyelogo.png",
                                                                          height:
                                                                              24,
                                                                        ),
                                                                        SizedBox(
                                                                            width:
                                                                                24),
                                                                        Text(
                                                                          "Hide"
                                                                              .tr(),
                                                                          style:
                                                                              FontConstant.k18w5008471Text,
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
                                                                    showModalBottomSheet(
                                                                        shape: RoundedRectangleBorder(
                                                                            borderRadius: BorderRadius.only(
                                                                                topLeft: const Radius.circular(
                                                                                    20.0),
                                                                                topRight: const Radius.circular(
                                                                                    20.0))),
                                                                        context:
                                                                            context,
                                                                        isScrollControlled:
                                                                            true,
                                                                        builder:
                                                                            (builder) {
                                                                          return SingleChildScrollView(
                                                                            child: Container(
                                                                                decoration: BoxDecoration(
                                                                                    // color: Colors.transparent,
                                                                                    borderRadius: BorderRadius.only(topLeft: const Radius.circular(20.0), topRight: const Radius.circular(20.0))),
                                                                                child: Padding(
                                                                                  padding: const EdgeInsets.only(left: 16),
                                                                                  child: Column(
                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                    children: [
                                                                                      SizedBox(
                                                                                        height: 10,
                                                                                      ),
                                                                                      Text(
                                                                                        "Report".tr(),
                                                                                        style: FontConstant.k24w50084717FText,
                                                                                      ),
                                                                                      SizedBox(
                                                                                        height: 34,
                                                                                      ),
                                                                                      ListTile(
                                                                                        onTap: () {
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
                                                                                        title: Text(
                                                                                          "I don’t like this".tr(),
                                                                                          style: FontConstant.k16w500331FText,
                                                                                        ),
                                                                                      ),
                                                                                      ListTile(
                                                                                        onTap: () {
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
                                                                                        title: Text(
                                                                                          "Not from the same group".tr(),
                                                                                          style: FontConstant.k16w500331FText,
                                                                                        ),
                                                                                      ),
                                                                                      ListTile(
                                                                                        onTap: () {
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
                                                                                        title: Text(
                                                                                          "Inappropriate content".tr(),
                                                                                          style: FontConstant.k16w500331FText,
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
                                                                  child:
                                                                      Container(
                                                                    padding: EdgeInsets.only(
                                                                        left:
                                                                            16,
                                                                        top: 16,
                                                                        bottom:
                                                                            16),
                                                                    child: Row(
                                                                      children: [
                                                                        Image
                                                                            .asset(
                                                                          "assets/images/reportlogo.png",
                                                                          height:
                                                                              24,
                                                                        ),
                                                                        SizedBox(
                                                                            width:
                                                                                24),
                                                                        Text(
                                                                          "Report"
                                                                              .tr(),
                                                                          /* AppLoaclizations.of(context)!
                                    .translate("Report")
                                    .toString(),*/
                                                                          style:
                                                                              FontConstant.k18w5008471Text,
                                                                        )
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              PopupMenuItem(
                                                                enabled: false,
                                                                child: InkWell(
                                                                  onTap:
                                                                      () async {
                                                                    Navigator.pop(
                                                                        context);
                                                                    for (var url
                                                                        in _postList[index]
                                                                            .images!) {
                                                                      try {
                                                                        final response = await http.get(Uri.parse(url
                                                                            .fileName
                                                                            .toString()));
                                                                        final imageBytes =
                                                                            response.bodyBytes;

                                                                        final result =
                                                                            await ImageGallerySaver.saveImage(
                                                                          Uint8List.fromList(
                                                                              imageBytes),
                                                                          quality:
                                                                              80,
                                                                          name:
                                                                              "downloaded_image_$url",
                                                                        );
                                                                        if (result[
                                                                            'isSuccess']) {
                                                                          Fluttertoast
                                                                              .showToast(
                                                                            msg:
                                                                                'Image downloaded and saved successfully',
                                                                            toastLength:
                                                                                Toast.LENGTH_SHORT,
                                                                            gravity:
                                                                                ToastGravity.BOTTOM,
                                                                            backgroundColor:
                                                                                Color(0xff8267AC),
                                                                            textColor:
                                                                                Colors.white,
                                                                          );
                                                                          print(
                                                                              'Image downloaded and saved successfully');
                                                                        } else {
                                                                          print(
                                                                              'Failed to download and save the image');
                                                                        }
                                                                      } catch (error) {
                                                                        print(
                                                                            'Error: $error');
                                                                      }
                                                                    }

                                                                    // for (var url
                                                                    //     in _postList[index]
                                                                    //         .images!) {
                                                                    //   try {
                                                                    //     var response = await http.get(Uri.parse(url
                                                                    //         .fileName
                                                                    //         .toString()));
                                                                    //     final result = await ImageGallerySaver.saveImage(
                                                                    //         Uint8List.fromList(response
                                                                    //             .bodyBytes),
                                                                    //         quality:
                                                                    //             60,
                                                                    //         name:
                                                                    //             "newImage");
                                                                    //   } catch (error) {
                                                                    //     print(
                                                                    //         error);
                                                                    //   }
                                                                    // }
                                                                    // String url = _postList[
                                                                    //         index]
                                                                    //     .images
                                                                    //     .toString();
                                                                    // await GallerySaver.saveImage(
                                                                    //     url,
                                                                    //     albumName:
                                                                    //         'kidseau');

                                                                    /*Navigator.of(
                                                                            context)
                                                                        .pop();*/
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    padding: EdgeInsets.only(
                                                                        left:
                                                                            16,
                                                                        top: 16,
                                                                        bottom:
                                                                            16),
                                                                    child: Row(
                                                                      children: [
                                                                        Image
                                                                            .asset(
                                                                          "assets/images/downloadicon.png",
                                                                          height:
                                                                              24,
                                                                        ),
                                                                        SizedBox(
                                                                            width:
                                                                                24),
                                                                        Text(
                                                                          "Download"
                                                                              .tr(),
                                                                          style:
                                                                              FontConstant.k18w5008471Text,
                                                                        )
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ];
                                                          }),
                                                    ],
                                                  ),
                                                  SizedBox(height: 08),
                                                  Row(
                                                    children: [
                                                      Expanded(
                                                        child: Text(
                                                          _postList[index]
                                                              .postCaption
                                                              .toString(),
                                                          style: FontConstant
                                                              .k16w4008471Text,
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
                                                            _postList[index]
                                                                .images!
                                                                .length,
                                                        onPageChanged:
                                                            (currentIndex) {
                                                          // log(_postList[index].image![currentIndex].fileName.toString());
                                                        },
                                                        itemBuilder:
                                                            (ctx, indexx) {
                                                          return ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8),
                                                            child: Container(
                                                              decoration: BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8)),
                                                              child: InkWell(
                                                                onTap: () {
                                                                  Navigator.of(context).push(MaterialPageRoute(
                                                                      builder: (ctx) => ShowEnlargedPictureScreen(
                                                                          imageUrl: _postList[index]
                                                                              .images![indexx]
                                                                              .fileName
                                                                              .toString(),
                                                                          tag: parentPostTag2)));
                                                                },
                                                                child: Hero(
                                                                  tag:
                                                                      parentPostTag2,
                                                                  child: Image
                                                                      .network(
                                                                    _postList[
                                                                            index]
                                                                        .images![
                                                                            indexx]
                                                                        .fileName
                                                                        .toString(),
                                                                    fit: BoxFit
                                                                        .cover,
                                                                    loadingBuilder:
                                                                        (q, w,
                                                                            e) {
                                                                      if (e ==
                                                                          null) {
                                                                        return w;
                                                                      } else {
                                                                        return SpinKitThreeBounce(
                                                                          size:
                                                                              30,
                                                                          color:
                                                                              Colors.grey,
                                                                        );
                                                                      }
                                                                    },
                                                                    errorBuilder: (q,
                                                                            w,
                                                                            e) =>
                                                                        SizedBox(
                                                                            width:
                                                                                1.sw,
                                                                            child: Center(child: Text('No image found'))),
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
                                                  SizedBox(height: 16.5),
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
                                              );
                                            } else if (reloadedVal ==
                                                'no_post_found') {
                                              return Center(
                                                  child:
                                                      Text('No Posts found.'));
                                            } else if (_onBottom &&
                                                _postCount >= 10) {
                                              return Center(
                                                  child:
                                                      CircularProgressIndicator());
                                            } else {
                                              return SizedBox.shrink();
                                            }
                                          }),
                                ),
                              )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  /*Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16),
              child: Column(
                children: [
                  */ /* SizedBox(
                    height: 144,
                  ),
                  Image.asset(
                    "assets/images/School.png",
                    height: 40,
                    width: 40,
                  ),
                  SizedBox(height: 13),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/arrleft.png",
                        height: 24,
                        width: 24,
                      ),
                      SizedBox(width: 18),
                      Text(
                        "Abc School",
                        style: FontConstant2.k24w5008267text,
                      ),
                      SizedBox(width: 18),
                      Image.asset(
                        "assets/images/arrright.png",
                        height: 24,
                        width: 24,
                      ),
                    ],
                  ),*/
                  /*
                  SizedBox(height: 38),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            "assets/images/person2.png",
                            height: 40,
                            width: 40,
                          ),
                          SizedBox(
                            width: 08,
                          ),
                          Text(
                            "Mohammad Umar",
                            style: FontConstant2.k16w5008267text,
                          ),
                        ],
                      ),
                      Image.asset(
                        "assets/images/dots.png",
                        height: 40,
                      ),
                    ],
                  ),
                  SizedBox(height: 08),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          "Today we had small music activity with all kids and teachers. ",
                          style: FontConstant.k16w4008471Text,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                          child:
                              Image.asset("assets/images/childrenposts.png")),
                      */ /* Container(
                          height: 213.h,
                          width: 379.w,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      "assets/images/childrenposts.png"))),
                        ),*/
                  /*
                    ],
                  ),
                  SizedBox(
                    height: 16.5,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              "assets/images/heart2.png",
                              height: 24,
                            ),
                            SizedBox(width: 10),
                            Text(
                              "likes".tr(),
                              */ /*AppLoaclizations.of(context)!
                                    .translate("likes")
                                    .toString(),*/ /*
                              style: FontConstant.k16w4008471Text,
                            ),
                          ],
                        ),
                        Text("2 min ago",
                            style: FontConstant.k16w4008471Text
                                .copyWith(fontSize: 14))
                      ],
                    ),
                  )
                ],
              ),
            ),*/
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
    );
  }
}
