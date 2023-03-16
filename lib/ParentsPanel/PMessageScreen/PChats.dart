import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'dart:ui';

import 'package:contacts_service/contacts_service.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kidseau/Theme.dart';
import 'package:kidseau/Widgets/custom_snack_bar.dart';
import 'package:kidseau/api/message_apis/all_message_api.dart';
import 'package:kidseau/api/message_apis/delete_message_api.dart';
import 'package:kidseau/api/message_apis/get_latest_message_api.dart';
import 'package:kidseau/api/message_apis/send_message_api.dart';
import 'package:kidseau/api/models/message_models/all_messages_model.dart';
import 'package:permission_handler/permission_handler.dart';

class PChats extends StatefulWidget {
  final String userId;
  final String userType;
  final String profilePic;
  final String name;
  final String language;
  final Function onPop;
  const PChats(
      {Key? key,
      required this.userId,
      required this.onPop,
      required this.userType,
      required this.profilePic,
      required this.name,
      required this.language})
      : super(key: key);

  @override
  State<PChats> createState() => _PChatsState();
}

class _PChatsState extends State<PChats> {
  List<Messages> messages = [
    Messages(
        text: 'Good morning Umar sir.',
        date: DateTime.now().subtract(Duration(minutes: 1)),
        isSentByme: true),
    Messages(
        text: 'Good morning Umar sir.',
        date: DateTime.now().subtract(Duration(minutes: 1)),
        isSentByme: false),
    Messages(
        text: 'Good morning Umar sir.',
        date: DateTime.now().subtract(Duration(minutes: 1)),
        isSentByme: true),
    Messages(
        text:
            'Nobita ! He is really intelligent kid. He is fast in learning new things',
        date: DateTime.now().subtract(Duration(minutes: 1)),
        isSentByme: false),
  ];

  AllMessagesModel messageModel = AllMessagesModel();
  final TextEditingController _controller = TextEditingController();
  Timer? _timer;

  @override
  void initState() {
    _scrollController.addListener(() {
      if (_scrollController.position.maxScrollExtent ==
          _scrollController.offset) {
        _getReloadedData();
      }
    });

    // log('init ${widget.userType}');
    _getData();
    _timer = Timer.periodic(Duration(seconds: 5), (timer) {
      _getLatestMessage();
    });
    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _scrollController.dispose();
    widget.onPop();
    super.dispose();
  }

  bool _isLoading = false;

  bool _noMessageFound = false;
  int scroll = 0;

  bool _msgLoading = false;
  _getReloadedData() {
    scroll++;
    //_isLoading = true;
    final resp = AllMessagesApi().get(
        userId: widget.userId,
        userType: widget.userType,
        scroll: scroll.toString());
    resp.then((value) {
      log(value.toString());
      if (value['status'] == 1) {
        setState(() {
          for (var v in value['allMsg']) {
            messageModel.allMsg!.add(AllMsg.fromJson(v));
          }
          // messageModel = AllMessagesModel.fromJson(value);
          // _isLoading = false;
        });
      } else {
        setState(() {
          // messageModel = AllMessagesModel(allMsg: []);
          _noMessageFound = true;
          // _isLoading = false;
        });
      }
    });
  }

  _getData() {
    _isLoading = true;
    final resp = AllMessagesApi()
        .get(userId: widget.userId, userType: widget.userType, scroll: '0');
    resp.then((value) {
      log(value.toString());
      if (value['status'] == 1) {
        setState(() {
          messageModel = AllMessagesModel.fromJson(value);
          _isLoading = false;
        });
      } else {
        setState(() {
          messageModel = AllMessagesModel(allMsg: []);
          _isLoading = false;
        });
      }
    });
  }

  _getLatestMessage() {
    final resp = GetLatestMessage()
        .get(userId: widget.userId, userType: widget.userType);
    resp.then((value) {
      if (value['status'] == 1) {
        setState(() {
          for (var v in value['allMsg']) {
            messageModel.allMsg!.add(AllMsg.fromJson({
              'message_id': '${v['message_id']}',
              'message': '${v['message']}',
              'file_url': v['file_url'] == null ? '' : "${v['file_url']}",
              'created_at': v['created_at'] == null ? '' : '${v['created_at']}',
              'read_at': v['read_at'] == null ? '' : '${v['read_at']}',
              'send_to_id': '${v['send_to_id']}',
              'is_deleted': '${v['is_deleted']}',
              'sender_user_type': '${v['sender_user_type']}',
              'reciever_user_type': '${v['reciever_user_type']}',
            }));
          }
        });
      } else {}
    });
  }

  final _picker = ImagePicker();
  var _pickedImg = File('');
  bool _isVisible = false;
  void showToast() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  List<Contact> contactList = [];
  _getContactPermission() async {
    var a = await Permission.contacts.request();
    if (a.isGranted) {
      log('granted');
      contactList = await ContactsService.getContacts();
      //log(contactList[0].phones![0].value.toString());
      showDialog(
          context: context,
          builder: (ctx) {
            return AlertDialog(
              content: Container(
                height: 300,
                width: 1.sw,
                child: ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return ListTile(
                        contentPadding: EdgeInsets.all(0),
                        onTap: () {
                          _controller.text =
                              "${contactList[index].phones![0].value} \n ${contactList[index].displayName}";
                          Navigator.of(context).pop();
                          setState(() {
                            _isVisible = false;
                          });
                        },
                        title: Text(contactList[index].displayName ?? ''),
                        subtitle:
                            Text(contactList[index].phones![0].value ?? ''),
                      );
                    },
                    separatorBuilder: (ctx, ind) => Divider(),
                    itemCount: contactList.length),
              ),
            );
          }).then((value) {});
    } else {
      await Permission.contacts.request();
    }
  }

  ScrollController _scrollController = ScrollController();
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
        centerTitle: false,
        title: Text(
          widget.name,
          style: FontConstant.k18w5008471Text,
        ),
        automaticallyImplyLeading: false,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Color(0xff8267AC).withOpacity(0.16),
        ),
        backgroundColor: Color(0xff8267AC).withOpacity(0.16),
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
      bottomNavigationBar: SingleChildScrollView(
        child: Column(
          children: [
            _pickedImg.path == ''
                ? SizedBox.shrink()
                : Container(
                    height: 100,
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                            width: 100,
                            height: 100,
                            child: Image.file(
                              _pickedImg,
                              fit: BoxFit.fill,
                            )),
                        InkWell(
                          onTap: () {
                            setState(() {
                              _pickedImg = File('');
                            });
                          },
                          child: Container(
                            color: Colors.transparent,
                            padding: EdgeInsets.all(10),
                            child: Icon(Icons.clear),
                          ),
                        )
                      ],
                    ),
                  ),
            Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      maxLines: 5,
                      controller: _controller,
                      onSubmitted: (text) {},
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 2, color: Color(0xffDBE8FA)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 2, color: Color(0xffDBE8FA)),
                        ),
                        fillColor: Color(0xffF0F4FA),
                        hintText: "Type here.".tr(),
                        hintStyle: FontConstant.k16w400B7A4Text,
                        suffixIcon: _msgLoading
                            ? Container(
                                padding: EdgeInsets.all(10),
                                width: 10,
                                height: 10,
                                child: CircularProgressIndicator(),
                              )
                            : GestureDetector(
                                onTap: () {
                                  if (_controller.text.isNotEmpty ||
                                      _pickedImg.path != '') {
                                    setState(() {
                                      _msgLoading = true;
                                    });
                                    log('message');
                                    final resp = SendMessageApi().get(
                                        message: _controller.text,
                                        sendToId: widget.userId,
                                        receiverUserType: widget.userType,
                                        image: _pickedImg);
                                    resp.then((value) {
                                      log(value.toString());
                                      if (value['status'] == 1) {
                                        setState(() {
                                          messageModel.allMsg!
                                              .add(AllMsg.fromJson({
                                            'message_id': '${value['msg_id']}',
                                            'message': '${value['msg']}',
                                            'file_url': value['file'] == null
                                                ? ''
                                                : "${value['file']}",
                                            'created_at':
                                                '${value['date_time']}',
                                            'read_at': '',
                                            'send_to_id': widget.userId,
                                            'is_deleted': '0',
                                            'sender_user_type': 'teacher',
                                            'reciever_user_type':
                                                widget.userType,
                                          }));
                                          _msgLoading = false;
                                        });
                                        /*final message = Messages(
                                      text: _controller.text,
                                      date: DateTime.now(),
                                      isSentByme: true);
                                  setState(() => messages.add(message));*/
                                        _controller.clear();
                                        _pickedImg = File('');
                                      } else {
                                        log(value.toString());
                                        setState(() {
                                          _msgLoading = false;
                                        });
                                      }
                                    });
                                  }
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: ImageIcon(
                                    AssetImage("assets/images/sendicon.png"),
                                    size: 12,
                                    color: ThemeColor.primarycolor,
                                  ),
                                ),
                              ),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: GestureDetector(
                            onTap: showToast,
                            child: ImageIcon(
                              AssetImage("assets/images/add-circle.png"),
                              size: 12,
                              color: ThemeColor.darkpurple,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SafeArea(
              child: Container(
                // height: 896.h,
                // width: 414.w,
                constraints: BoxConstraints(maxHeight: 1.sh),
                decoration: BoxDecoration(
                  //color: Colors.black,
                  image: DecorationImage(
                      image: AssetImage(
                        "assets/images/framemessages.png",
                      ),
                      colorFilter: ColorFilter.mode(
                        Colors.transparent.withOpacity(0.4),
                        BlendMode.modulate,
                      ),
                      fit: BoxFit.cover),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 16.0, right: 16),
                  child: Column(
                    children: [
                      SizedBox(height: 16),
                      /*Container(
                        color: Colors.transparent,
                        child: Row(
                          children: [
                            Container(
                              height: 112,
                              width: 84,
                              clipBehavior: Clip.hardEdge,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8)),
                              child: Image.network(
                                widget.profilePic,
                                fit: BoxFit.fill,
                                errorBuilder: (q, w, e) =>
                                    Image.asset("assets/images/teacher1.png"),
                              ),
                            ),
                            SizedBox(
                              width: 16,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(widget.name,
                                    style: FontConstant.k24w500brownText.copyWith(
                                        color: ThemeColor.primarycolor)),
                                Text(
                                  widget.userType,
                                  style: FontConstant.k16w400B7A4Text,
                                ),
                                Text(
                                  widget.language,
                                  style: FontConstant.k16w4008471Text,
                                )
                              ],
                            )
                          ],
                        ),
                      ),*/
                      Expanded(
                        //height: 500,
                        child: GroupedListView<AllMsg, DateTime>(
                          controller: _scrollController,
                          //itemExtent: messageModel.allMsg!.length.toDouble(),
                          reverse: true,
                          order: GroupedListOrder.DESC,
                          padding: EdgeInsets.all(16),
                          elements: messageModel.allMsg!,
                          groupBy: (messages) =>
                              DateTime.parse(messages.createdAt!),
                          groupHeaderBuilder: (AllMsg messages) => SizedBox(),
                          indexedItemBuilder:
                              (context, AllMsg messages, int index) {
                            log(messages.senderUserType.toString());
                            return GestureDetector(
                              onLongPress: messages.senderUserType == "teacher"
                                  ? () {
                                      showDialog(
                                          barrierDismissible: true,
                                          context: context,
                                          builder: (ctx) {
                                            return AlertDialog(
                                              title: Text(
                                                'Delete Message',
                                                style: FontConstant
                                                    .k18w500F970Text,
                                              ),
                                              content: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  messages.fileUrl! == ''
                                                      ? SizedBox.shrink()
                                                      : Container(
                                                          constraints:
                                                              BoxConstraints(
                                                                  // maxWidth: 200,
                                                                  maxHeight:
                                                                      150),
                                                          margin:
                                                              EdgeInsets.only(
                                                                  bottom: 10),
                                                          child: Image.network(
                                                            messages.fileUrl
                                                                .toString(),
                                                            errorBuilder: (q, w,
                                                                    e) =>
                                                                Text(
                                                                    'Image not found'),
                                                            fit:
                                                                BoxFit.fitWidth,
                                                          ),
                                                        ),
                                                  Text(
                                                    messages.message.toString(),
                                                    style: FontConstant
                                                        .k16w4008471Text
                                                        .copyWith(
                                                            color: Color(
                                                                0xff5E5C70)),
                                                  ),
                                                ],
                                              ),
                                              actions: [
                                                TextButton(
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: Text('Cancel')),
                                                TextButton(
                                                    onPressed: () {
                                                      final resp =
                                                          DeleteMessageApi().delete(
                                                              msgId: messages
                                                                  .messageId
                                                                  .toString());
                                                      resp.then((value) {
                                                        log(value.toString());
                                                        if (value['status'] ==
                                                            1) {
                                                          setState(() {
                                                            messageModel
                                                                    .allMsg![index]
                                                                    .message =
                                                                'This message has been deleted';
                                                            messageModel
                                                                .allMsg![index]
                                                                .fileUrl = '';
                                                            messageModel
                                                                .allMsg![index]
                                                                .isDeleted = '1';
                                                            messages.isDeleted =
                                                                '1';
                                                          });
                                                          Navigator.of(context)
                                                              .pop();
                                                        } else {
                                                          Navigator.of(context)
                                                              .pop();
                                                          CustomSnackBar
                                                              .customErrorSnackBar(
                                                                  context,
                                                                  value['msg']);
                                                        }
                                                      });
                                                    },
                                                    child: Text(
                                                      'Delete',
                                                      style: FontConstant
                                                          .k16w400F97070,
                                                    )),
                                              ],
                                            );
                                          });
                                    }
                                  : () {},
                              child: Align(
                                alignment: messages.senderUserType == "teacher"
                                    ? Alignment.centerRight
                                    : Alignment.centerLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 32.0),
                                  child: Container(
                                    constraints: BoxConstraints(
                                      maxWidth: 250,
                                    ),
                                    decoration: BoxDecoration(
                                        color:
                                            messages.senderUserType == "teacher"
                                                ? Color(0xffF2F1F8)
                                                : Color(0xffDBE8FA),
                                        borderRadius: BorderRadius.circular(6)),
                                    child: Padding(
                                      padding: EdgeInsets.all(12),
                                      child: messages.isDeleted == '1'
                                          ? Text(
                                              'This message has been deleted!',
                                              style: FontConstant
                                                  .k16w4008471Text
                                                  .copyWith(
                                                      color:
                                                          Colors.red.shade400),
                                            )
                                          : Column(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                messages.fileUrl! == ''
                                                    ? SizedBox.shrink()
                                                    : Container(
                                                        constraints:
                                                            BoxConstraints(
                                                                maxWidth: 200,
                                                                maxHeight: 150),
                                                        margin: EdgeInsets.only(
                                                            bottom: 10),
                                                        child: Image.network(
                                                          messages.fileUrl
                                                              .toString(),
                                                          errorBuilder:
                                                              (q, w, e) => Text(
                                                                  'Image not found'),
                                                        ),
                                                      ),
                                                Text(
                                                  messages.message.toString(),
                                                  maxLines: 5,
                                                  style: FontConstant
                                                      .k16w4008471Text
                                                      .copyWith(
                                                          color: Color(
                                                              0xff5E5C70)),
                                                ),
                                              ],
                                            ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      Visibility(
                        visible: _isVisible,
                        child: Container(
                          height: 115.h,
                          width: 382.w,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(2, 2),
                                blurRadius: 12,
                                color: Color.fromRGBO(93, 61, 143, 0.2),
                              )
                            ],
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(62.0),
                                topRight: Radius.circular(97.0),
                                bottomRight: Radius.circular(97.0)),
                          ),
                          child: SizedBox(
                            height: 67.h,
                            width: 382.w,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        /*
                                        if (isRecording) {
                                          record.stop();
                                        } else {

                                        }*/
                                        // _getVoicePermission();
                                        //log(isRecording.toString());
                                      },
                                      child: Container(
                                        color: Colors.transparent,
                                        child: Column(
                                          children: [
                                            Image.asset(
                                              "assets/images/micicon.png",
                                              height: 24.h,
                                            ),
                                            Text(
                                              "Voice note".tr(),
                                              /*AppLoaclizations.of(context)!
                              .translate("Voice note")
                              .toString(),*/
                                              style:
                                                  FontConstant.k16w5008471Text,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () async {
                                        XFile? image = await _picker.pickImage(
                                            source: ImageSource.gallery,
                                            imageQuality: 50);
                                        if (image != null) {
                                          setState(() {
                                            _pickedImg = File(image.path);
                                            _isVisible = false;
                                          });
                                        }
                                      },
                                      child: Container(
                                        color: Colors.transparent,
                                        child: Column(
                                          children: [
                                            Image.asset(
                                              "assets/images/galleryicon.png",
                                              height: 24.h,
                                            ),
                                            Text(
                                              "Gallery".tr(),
                                              style:
                                                  FontConstant.k16w5008471Text,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () async {
                                        // log('message');
                                        _getContactPermission();
                                      },
                                      child: Container(
                                        color: Colors.transparent,
                                        child: Column(
                                          children: [
                                            Image.asset(
                                              "assets/images/contacticon.png",
                                              height: 24.h,
                                            ),
                                            Text(
                                              "Contact".tr(),
                                              style:
                                                  FontConstant.k16w5008471Text,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      /* Container(
                height: 52.h,
                width: 382.w,
                child: TextField(
                  onSubmitted: (text) {
                    final message = Messages(
                        text: text, date: DateTime.now(), isSentByme: true);
                    setState(() => messages.add(message));
                  },
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 2, color: Color(0xffDBE8FA)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 2, color: Color(0xffDBE8FA)),
                    ),
                    fillColor: Color(0xffF0F4FA),
                    hintText: "Type here.".tr(),
                    */ /* AppLoaclizations.of(context)!.translate("Type here."),*/ /*
                    hintStyle: FontConstant.k16w400B7A4Text,
                    suffixIcon: GestureDetector(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: ImageIcon(
                          AssetImage("assets/images/sendicon.png"),
                          size: 12,
                          color: ThemeColor.primarycolor,
                        ),
                      ),
                    ),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: GestureDetector(
                        onTap: showToast,
                        child: ImageIcon(
                          AssetImage("assets/images/add-circle.png"),
                          size: 12,
                          color: ThemeColor.darkpurple,
                        ),
                      ),
                    ),
                  ),
                ),
              ),*/
                      /*SizedBox(
                        height: 32.h,
                      ),*/
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}

class Messages {
  final String text;
  final DateTime date;
  final bool isSentByme;
  const Messages(
      {required this.text, required this.date, required this.isSentByme});
}
