import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:kidseau/Theme.dart';
import 'package:kidseau/Widgets/popups.dart';
import 'package:kidseau/api/message_apis/all_message_api.dart';
import 'package:kidseau/api/message_apis/get_latest_message_api.dart';
import 'package:kidseau/api/models/message_models/all_messages_model.dart';
import 'package:kidseau/api/message_apis/send_message_api.dart';

class POpenChats extends StatefulWidget {
  final String userId;
  final String userType;
  final String profilePic;
  final String name;
  final String language;
  const POpenChats(
      {Key? key,
      required this.userId,
      required this.userType,
      required this.profilePic,
      required this.name,
      required this.language})
      : super(key: key);

  @override
  State<POpenChats> createState() => _POpenChatsState();
}

class _POpenChatsState extends State<POpenChats> {
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
    _getData();
    _timer = Timer.periodic(Duration(seconds: 5), (timer) {
      _getLatestMessage();
    });
    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  bool _isLoading = false;

  _getData() {
    _isLoading = true;
    final resp =
        AllMessagesApi().get(userId: widget.userId, userType: widget.userType);
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
      } else {
        setState(() {});
      }
    });
  }

  var _pickedImg = File('');
  bool _isVisible = false;
  void showToast() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

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
      bottomNavigationBar: Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: _controller,
                onSubmitted: (text) {},
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 2, color: Color(0xffDBE8FA)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 2, color: Color(0xffDBE8FA)),
                  ),
                  fillColor: Color(0xffF0F4FA),
                  hintText: "Type here.".tr(),
                  hintStyle: FontConstant.k16w400B7A4Text,
                  suffixIcon: GestureDetector(
                    onTap: () {
                      if (_controller.text.isNotEmpty) {
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
                              var v = DateFormat().format(DateTime.now());
                              var W = DateFormat().format(DateTime.now());
                              messageModel.allMsg!.add(AllMsg.fromJson({
                                'message_id': '${value['msg_id']}',
                                'message': '${value['msg']}',
                                'file_url': value['file'] == null
                                    ? ''
                                    : "${value['file']}",
                                'created_at': '${value['date_time']}',
                                'read_at': '',
                                'send_to_id': widget.userId,
                                'is_deleted': '0',
                                'sender_user_type': 'parent',
                                'reciever_user_type': widget.userType,
                              }));
                            });
                            /*final message = Messages(
                                text: _controller.text,
                                date: DateTime.now(),
                                isSentByme: true);
                            setState(() => messages.add(message));*/
                            _controller.clear();
                          } else {
                            log(value.toString());
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
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Container(
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
                    SizedBox(
                      height: 140,
                    ),
                    GestureDetector(
                      onTap: () {
                        //_getLatestMessage();
                      },
                      child: Container(
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
                                    style: FontConstant.k24w500brownText
                                        .copyWith(
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
                      ),
                    ),
                    Expanded(
                      //height: 500,
                      child: GroupedListView<AllMsg, DateTime>(
                        reverse: true,
                        order: GroupedListOrder.DESC,
                        padding: EdgeInsets.all(16),
                        elements: messageModel.allMsg!,
                        groupBy: (messages) =>
                            DateTime.parse(messages.createdAt!),
                        /*DateTime(
                            int.parse(DateFormat.y()
                                .format(DateTime.parse(messages.createdAt!))),
                            int.parse(DateFormat.m()
                                .format(DateTime.parse(messages.createdAt!))),
                            int.parse(DateFormat.d()
                                .format(DateTime.parse(messages.createdAt!)))),*/
                        groupHeaderBuilder: (AllMsg messages) => SizedBox(),
                        itemBuilder: (context, AllMsg messages) => Align(
                          alignment: messages.senderUserType == "parent"
                              ? Alignment.centerRight
                              : Alignment.centerLeft,
                          child: Align(
                            alignment: messages.senderUserType == "parent"
                                ? Alignment.centerRight
                                : Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 32.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: messages.senderUserType == "parent"
                                        ? Color(0xffF2F1F8)
                                        : Color(0xffDBE8FA),
                                    borderRadius: BorderRadius.circular(6)),
                                child: Padding(
                                  padding: EdgeInsets.all(12),
                                  child: Text(
                                    messages.message.toString(),
                                    style: FontConstant.k16w4008471Text
                                        .copyWith(color: Color(0xff5E5C70)),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    popuptextfield(isVisible: _isVisible),
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
