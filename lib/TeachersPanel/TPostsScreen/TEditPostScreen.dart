import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mentions/flutter_mentions.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:kidseau/TeachersPanel/Widgets/Themes.dart';
import 'package:kidseau/Theme.dart';
import 'package:kidseau/Widgets/buttons.dart';
import 'package:kidseau/Widgets/custom_snack_bar.dart';
import 'package:kidseau/Widgets/screen_loader.dart';
import 'package:kidseau/api/Teacherpanelapi/teacher_post_api/post_apis/teacher_tag_kid_api.dart';
import 'package:kidseau/api/Teacherpanelapi/teacher_post_api/teacher_edit_post_api.dart';
import 'package:kidseau/api/models/Tschool_post_model/teacher_school_my_post_model.dart';

class TEditPostFormScreen extends StatefulWidget {
  List<PostDetails> posts;
  final int index;
  final Function(int) onPop;
  TEditPostFormScreen(
      {Key? key, required this.posts, required this.index, required this.onPop})
      : super(key: key);

  @override
  State<TEditPostFormScreen> createState() => _TEditPostFormScreenState();
}

class _TEditPostFormScreenState extends State<TEditPostFormScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _captionController = TextEditingController();
  final TextEditingController _tagController = TextEditingController();

  String _selectedSection = "";
  List<String> languageList = [];
  List<String> sectionList = [];

  List<Map<String, dynamic>> _map = [];
  List<Map<String, dynamic>> _groupMap = [];

  Map<String, dynamic> selectedSection = {};
  Map<String, dynamic> selectedGroup = {};

  List<String> groupList = [];
  List<String> taggedStudentsId = [];

  String _selectedGroup = '';

  @override
  void initState() {
    _captionController.text = widget.posts[widget.index].captions.toString();
    _selectedSection = widget.posts[widget.index].secName.toString();
    _selectedGroup = widget.posts[widget.index].grpName.toString();
    for (var v in widget.posts[widget.index].tagKid!) {
      _taggedStudents.add(v.tagKidName.toString());
      taggedStudentsId.add(v.tagId.toString());
      //log('tag kid id ${v.tagId}');
    }

    super.initState();
  }

  bool _isLoading = false;

  List<String> _taggedStudents = [];

  final GlobalKey<FlutterMentionsState> _key =
      GlobalKey<FlutterMentionsState>();
  List<Map<String, dynamic>> suggestedData = [
    {
      'id': '',
      'display': '',
      'full_name': '',
      'photo':
          'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'
    }
  ];

  CroppedFile? croppedFile;
  List<CroppedFile> _croppedFileList = [];

/*  _imageCropper(String path, int index) async {
    croppedFile = await ImageCropper().cropImage(
        sourcePath: path,
        aspectRatio: CropAspectRatio(ratioX: 4, ratioY: 3),
        aspectRatioPresets: [
          CropAspectRatioPreset.ratio4x3
        ],
        uiSettings: [
          AndroidUiSettings(
            toolbarColor: Colors.blue,
            toolbarWidgetColor: Colors.white,
          ),
          IOSUiSettings(
            title: 'Cropper',
          ),
        ]);
    if (croppedFile == null) {
      return;
    } else {
      setState(() {
        widget.pickedImages.removeAt(index);
        widget.pickedImages.add(File(croppedFile!.path));
      });
      //_croppedFileList.add(croppedFile!);
      final resp = UpdateCoverAndProfileImgAPI.update(
          isProfile ? 'profile' : 'cover', File(croppedFile!.path).path);
      resp.then((value) {
        print(value);
        if (value['message'] == 'image_size_greater_than_10MB') {
          CustomSnackBar.customErrorSnackBar(context,
              'File too large! Maximum size should be less that 10 MB');
        } else if (value['message'] == 'page_not_found') {
          print('page not found');
        } else if (value['message'] == 'page_error') {
          print('page error');
        } else if (value['message'] == 'image_error') {
          print('image error');
        } else if (value['message'] == 'image_empty') {
          print('image empty');
        } else if (value['message'] == 'image_too_small') {
          CustomSnackBar.customErrorSnackBar(context, "Image too small!");
        } else if (value['message'] == 'mode_required') {
          print('mode required');
        } else if (value['message'] == 'image_format_unsupported') {
          CustomSnackBar.customErrorSnackBar(context,
              "Unsupported format! Only jpg, jpeg, png, gif are allowed!");
        } else if (value['message'] == 'upload_failed') {
          CustomSnackBar.customErrorSnackBar(
              context, "Something went wrong! Please try again after a while.");
        } else {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (ctx) =>
                  ProfileScreen(userName: widget.details!.username),
            ),
          );
          CustomSnackBar.customSnackBar(context,
              isProfile ? 'Profile Picture updated' : 'Cover Picture updated');
        }
      });
    }
  }*/

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      height: 1.sh,
      color: Colors.white,
      child: Scaffold(
        backgroundColor: ThemeColor.primarycolor.withOpacity(0.06),
        extendBody: true,
        appBar: AppBar(
          elevation: 0,
          toolbarHeight: 0,
          backgroundColor: ThemeColor.primarycolor.withOpacity(0.16),
          systemOverlayStyle:
              SystemUiOverlayStyle(statusBarBrightness: Brightness.light),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              AppBar(
                //primary: false,
                toolbarHeight: 60,
                backgroundColor: ThemeColor.primarycolor.withOpacity(0.16),
                elevation: 0,
                automaticallyImplyLeading: false,
                centerTitle: false,
                title:
                    Text('Add post'.tr(), style: FontConstant.k16w4008471Text),
                leading: Container(
                  width: 24,
                  height: 24,
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  color: Colors.transparent,
                  child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Image.asset('assets/images/backarrow.png')),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                height: 150,
                padding: EdgeInsets.only(left: 16),
                child: ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (ctx, index) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          widget.posts[widget.index].images![index].fileImage
                              .toString(),
                          fit: BoxFit.fitWidth,
                        ),
                      );
                    },
                    separatorBuilder: (ctx, ind) => SizedBox(
                          width: 10,
                        ),
                    itemCount: widget.posts[widget.index].images!.length),
              ),
              SizedBox(
                height: 16,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 16),
                      Text("Caption".tr(), style: FontConstant.k16w500331FText),
                      SizedBox(height: 4),
                      TextFormField(
                        textInputAction: TextInputAction.done,
                        validator: (val) {
                          if (_captionController.text.isEmpty) {
                            return 'This field cannot be empty';
                          } else {
                            return null;
                          }
                        },
                        controller: _captionController,
                        maxLines: 6,
                        decoration: TextFieldDecoration().curvedWhiteDecoration(
                          curved: false,
                          label: 'Write here...'.tr(),
                        ),
                      ),
                      SizedBox(height: 16),
                      Text("Section*".tr(),
                          style: FontConstant.k16w500331FText),
                      SizedBox(height: 4),
                      Container(
                          padding: EdgeInsets.only(left: 20),
                          height: 54.h,
                          width: 1.sw,
                          decoration: BoxDecoration(
                              color: Color(0xffFFFFFF),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Center(
                                child: Text(
                                  _selectedSection,
                                ),
                              ),
                            ],
                          )),
                      SizedBox(height: 16),
                      Text("Group*".tr(), style: FontConstant.k16w500331FText),
                      SizedBox(height: 4),
                      Container(
                        padding: EdgeInsets.only(left: 20),
                        height: 54.h,
                        width: 1.sw,
                        decoration: BoxDecoration(
                            color: Color(0xffFFFFFF),
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Center(
                              child: Text(
                                _selectedGroup,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 16),
                      Text("Tag".tr(), style: FontConstant.k16w500331FText),
                      SizedBox(height: 4),
                      FlutterMentions(
                        key: _key,
                        suggestionPosition: SuggestionPosition.Top,
                        suggestionListDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            color: Colors.white),
                        decoration: TextFieldDecoration().curvedWhiteDecoration(
                          curved: true,
                          label: '@Tag ${'kids'.tr()}',
                        ),
                        mentions: [
                          Mention(
                              trigger: '@',
                              data: suggestedData,
                              matchAll: false,
                              style: TextStyle(color: Colors.blue),
                              suggestionBuilder: (data) {
                                return Container(
                                  padding: EdgeInsets.all(10),
                                  child: ListTile(
                                    onTap: () {
                                      log('selected');
                                      setState(() {
                                        _taggedStudents.add(data['full_name']);
                                        taggedStudentsId.add(data['id']);
                                        suggestedData.clear();
                                        _key.currentState!.controller!.clear();
                                        FocusScope.of(context).unfocus();
                                      });
                                    },
                                    title: Text(data['display']),
                                  ),
                                );
                              })
                        ],
                        onSearchChanged: (s, t) {
                          if (s == '@') {
                            final resp = TeacherTagKidApi().get(
                                groupId:
                                    widget.posts[widget.index].grpId.toString(),
                                name: t);
                            resp.then((value) {
                              log(value.toString());
                              suggestedData.clear();
                              setState(() {
                                for (var v in value['tag kid']) {
                                  suggestedData.add({
                                    'id': v['kid_id'],
                                    'display': v['name'],
                                    'full_name': v['name'],
                                    'photo': v['grp_id'],
                                    //'grp_id': v['grp_id'],
                                  });
                                }
                              });
                              log("suggested data $suggestedData");
                              setState(() {
                                suggestedData.toSet().toList();
                              });
                            });
                          }
                        },
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Container(
                          height: 50,
                          width: 1.sw,
                          // color: Colors.black,
                          child: ListView.separated(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (ctx, index) {
                                return Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 5),
                                  decoration: BoxDecoration(
                                      color: TThemeColor.purplecolor,
                                      borderRadius: BorderRadius.circular(40)),
                                  child: Center(
                                      child: Row(
                                    children: [
                                      Text(
                                        _taggedStudents[index],
                                        style: FontConstant.k16w400whiteText,
                                      ),
                                      /*SizedBox(
                                        width: 15,
                                      ),*/
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            _taggedStudents.removeAt(index);
                                            taggedStudentsId.removeAt(index);
                                          });
                                        },
                                        child: Container(
                                          color: Colors.transparent,
                                          padding: EdgeInsets.only(left: 15),
                                          child: Icon(Icons.close),
                                        ),
                                      )
                                    ],
                                  )),
                                );
                              },
                              separatorBuilder: (ctx, ind) => SizedBox(
                                    width: 5,
                                  ),
                              itemCount:
                                  _taggedStudents.toSet().toList().length)),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 80),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          color: Colors.transparent,
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: materialButton(
            context,
            () {
              var _isLoading = _formKey.currentState!.validate();
              if (!_isLoading) {
                return;
              } else {
                ScreenLoader().onLoading(context);
                FocusScope.of(context).unfocus();
                final resp = TeacherEditPostApi().get(
                    postId: widget.posts[widget.index].postId.toString(),
                    caption: _captionController.text,
                    tagId: taggedStudentsId.toSet().toList());
                resp.then((value) {
                  Navigator.of(context).pop();
                  if (value['status'] == 1) {
                    CustomSnackBar.customSnackBar(context, 'Post Updated');
                    Navigator.of(context).pop();
                    widget.onPop(1);
                  } else {
                    CustomSnackBar.customErrorSnackBar(
                        context, 'Update failed');
                  }
                  log(value.toString());
                });
              }
            },
            "Update".tr(),
            ThemeColor.primarycolor,
            52.0,
          ),
        ),
      ),
    );
  }
}
