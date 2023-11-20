import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'dart:ui';

import 'package:audioplayers/audioplayers.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:file/local.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_audio_recorder3/flutter_audio_recorder3.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kidseau/Constants/colors.dart';
import 'package:kidseau/Theme.dart';
import 'package:kidseau/Widgets/custom_snack_bar.dart';
import 'package:kidseau/api/message_apis/all_message_api.dart';
import 'package:kidseau/api/message_apis/delete_message_api.dart';
import 'package:kidseau/api/message_apis/get_latest_message_api.dart';
import 'package:kidseau/api/message_apis/send_message_api.dart';
import 'package:kidseau/api/models/message_models/all_messages_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class POpenChats extends StatefulWidget {
  final String userId;
  final String userType;
  final String profilePic;
  final String name;
  final String language;
  final Function onPop;
  const POpenChats({
    Key? key,
    required this.userId,
    required this.userType,
    required this.onPop,
    required this.profilePic,
    required this.name,
    required this.language,
  }) : super(key: key);

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
    _scrollController.addListener(() {
      if (_scrollController.position.maxScrollExtent ==
          _scrollController.offset) {
        _getReloadedData();
      }
    });

    //_getContactPermission();
    //log('init ${widget.userType}');
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

  bool _msgLoading = false;
  bool _noMessageFound = false;
  int scroll = 0;

  List readMore = [];

  _getReloadedData() {
    scroll++;
    //_isLoading = true;
    final resp = AllMessagesApi().get(
        userId: widget.userId,
        userType: widget.userType,
        scroll: scroll.toString());
    resp.then((value) {
      //log(value.toString());
      readMore.clear();
      if (value['status'] == 1) {
        setState(() {
          for (var v in value['allMsg']) {
            messageModel.allMsg!.add(AllMsg.fromJson(v));
          }
          for (var v in messageModel.allMsg!) {
            readMore.add(false);
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
      // log("initial resp" + value.toString());
      readMore.clear();
      if (value['status'] == 1) {
        setState(() {
          messageModel = AllMessagesModel.fromJson(value);
          for (var v in messageModel.allMsg!) {
            readMore.add(false);
          }
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
      // log("Latest msg" + value.toString());
      if (value['status'] == 1) {
        readMore.clear();
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
            for (var v in messageModel.allMsg!) {
              readMore.add(false);
            }
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

  ScrollController _scrollController = ScrollController();
  List<Contact> contactList = [];
  _getContactPermission() async {
    var a = await Permission.contacts.request();
    if (a.isGranted) {
      log('granted');
      contactList = await ContactsService.getContacts().then((value) {
        setState(() {
          _isVisible = false;
        });
        return contactList;
      });
      log(contactList.length.toString());
      showDialog(
          context: context,
          builder: (ctx) {
            return AlertDialog(
              content: SingleChildScrollView(
                child: SizedBox(
                  width: 1.sw,
                  child: contactList.isEmpty
                      ? Center(
                          child: Text(
                            'No Contacts Found.'.tr(),
                            style: FontConstant.k16w500331FText,
                          ),
                        )
                      : ListView.separated(
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
                              subtitle: Text(
                                  contactList[index].phones![0].value ?? ''),
                            );
                          },
                          separatorBuilder: (ctx, ind) => Divider(),
                          itemCount: contactList.length),
                ),
              ),
            );
          }).then((value) {});
    } else {
      await Permission.contacts.request();
    }
  }

  bool isRecording = false;
  File audio = File('');

  /*Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/audioFile.mp4');
  }*/

  _getVoicePermission() async {
    print('a');
    var a = await Permission.microphone.request();
    if (a.isGranted) {
      log('granted');
      String customPath = '/flutter_audio_recorder_';
      Directory appDocDirectory;
      if (Platform.isIOS) {
        appDocDirectory = await getApplicationDocumentsDirectory();
      } else {
        appDocDirectory = (await getExternalStorageDirectory())!;
      }
      customPath = appDocDirectory.path +
          customPath +
          DateTime.now().millisecondsSinceEpoch.toString();
      var recorder =
          FlutterAudioRecorder3(customPath, audioFormat: AudioFormat.AAC);
      await recorder.initialized;
      await recorder.start();
      var recording = await recorder.current(channel: 0);
      if (recording!.status == RecordingStatus.Recording) {
        setState(() {
          isRecording = true;
        });
      }
      //print(await record.hasPermission());
      // Start recording

      //log(isRecording.toString() + '123');
      if (isRecording) {
        setState(() {
          _isVisible = false;
        });
        showDialog(
          context: context,
          builder: (_) => RecorderDialog(),
        ).then(
          (value) async {
            var result = await recorder.stop();
            File file = LocalFileSystem().file(result?.path);
            if (result != null) {
              setState(() {
                soundDuration = result.duration!;
                _recording = result;
              });
            }
          },
        );
      }
    } else {
      await Permission.microphone.request();
    }
  }

  bool playing = false;
  Duration soundDuration = Duration.zero;
  double soundLength = 0.0;
  AudioPlayer audioPlayer = AudioPlayer();
  Recording _recording = Recording();

  setPosition() {
    Timer timer;
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (mounted && playing) {
        setState(() {
          soundLength = soundLength + 1.0;
        });
        if (soundLength > soundDuration.inSeconds) {
          timer.cancel();
          audioPlayer.stop();
          setState(() {
            playing = false;
            soundLength = 0.0;
          });
        }
      } else {
        timer.cancel();
      }
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
        centerTitle: false,
        title: Text(
          widget.name.contains('null') ? 'User' : widget.name,
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
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 34),
          child: Column(
            children: [
              _pickedImg.path == ''
                  ? SizedBox.shrink()
                  : GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (_) => PhotoViewer(
                            asset: true,
                            url: _pickedImg.path,
                          ),
                        );
                      },
                      child: Container(
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
                    ),
              _recording.path == null
                  ? Container()
                  : Container(
                      padding: EdgeInsets.all(16),
                      margin: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.white,
                      ),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () async {
                              //
                              setState(() {
                                playing = !playing;
                              });
                              if (playing) {
                                audioPlayer.play(_recording.path!,
                                    isLocal: true);
                                setPosition();
                              } else {
                                audioPlayer.stop();
                              }
                            },
                            child: Container(
                              width: 50,
                              height: 50,
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors().k8267AC,
                              ),
                              child: playing
                                  ? Image.asset(
                                      'assets/images/pause.png',
                                      color: AppColors().kF8F6FA,
                                    )
                                  : Image.asset(
                                      'assets/images/playB.png',
                                      color: AppColors().kF8F6FA,
                                    ),
                            ),
                          ),
                          //SizedBox(width: 16),
                          Expanded(
                            child: Slider(
                              thumbColor: AppColors().k8267AC,
                              activeColor: AppColors().k8267AC.withOpacity(0.5),
                              inactiveColor: Colors.grey,
                              min: 0,
                              max: soundDuration.inSeconds.toDouble(),
                              value: soundLength,
                              onChanged: (v) {
                                setState(() {
                                  soundLength = v;
                                });
                              },
                            ),
                          ),
                          //SizedBox(width: 16),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _recording = Recording();
                              });
                            },
                            child: Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors().k8267AC,
                              ),
                              child: Icon(
                                Icons.clear,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
              Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        color: Colors.white,
                        child: TextField(
                          maxLines: 5,
                          minLines: 1,
                          //keyboardType: TextInputType.multiline,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(500),
                          ],
                          controller: _controller,
                          onSubmitted: (text) {},
                          textInputAction: TextInputAction.done,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 2, color: Color(0xffDBE8FA)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 2, color: Color(0xffDBE8FA)),
                            ),
                            fillColor: Color(0xffF0F4FA),
                            hintText: _recording.path != null
                                ? 'Audio File'.tr()
                                : "Type here.".tr(),
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
                                      log('message');

                                      if (_controller.text.isNotEmpty ||
                                          _pickedImg.path != '' ||
                                          _recording.path != null) {
                                        log('message');

                                        setState(() {
                                          _msgLoading = true;
                                        });
                                        final resp = SendMessageApi().get(
                                            message: _controller.text,
                                            sendToId: widget.userId,
                                            receiverUserType: widget.userType,
                                            image: _recording.path != null
                                                ? File(_recording.path!)
                                                : _pickedImg);
                                        resp.then((value) {
                                          log(value.toString());
                                          if (value['status'] == 1) {
                                            setState(() {
                                              _recording = Recording();
                                              messageModel.allMsg!
                                                  .add(AllMsg.fromJson({
                                                'message_id':
                                                    '${value['msg_id']}',
                                                'message': '${value['msg']}',
                                                'file_url':
                                                    value['file'] == null
                                                        ? ''
                                                        : "${value['file']}",
                                                'created_at':
                                                    '${value['date_time']}',
                                                'read_at': '',
                                                'send_to_id': widget.userId,
                                                'is_deleted': '0',
                                                'sender_user_type': 'parent',
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
                                      padding: const EdgeInsets.only(
                                        left: 10.0,
                                      ),
                                      child: ImageIcon(
                                        AssetImage(
                                            "assets/images/sendicon.png"),
                                        size: 12,
                                        color: ThemeColor.primarycolor,
                                      ),
                                    ),
                                  ),
                            prefixIconConstraints:
                                BoxConstraints(minHeight: 40, minWidth: 40),
                            prefixIcon: GestureDetector(
                              onTap: showToast,
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: 10.0, top: 10, bottom: 10, right: 20),
                                child: ImageIcon(
                                  AssetImage("assets/images/add-circle.png"),
                                  //size: 19,
                                  color: ThemeColor.darkpurple,
                                ),
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
                      SizedBox(
                        height: 16,
                      ),
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
                            return InkWell(
                              onLongPress: messages.senderUserType == "parent"
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
                                              /*content: SingleChildScrollView(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    messages.fileUrl! == ''
                                                        ? SizedBox.shrink()
                                                        : messages.fileUrl!
                                                                .contains('m4a')
                                                            ? Container()
                                                            : Container(
                                                                constraints:
                                                                    BoxConstraints(
                                                                        // maxWidth: 200,
                                                                        maxHeight:
                                                                            150),
                                                                margin: EdgeInsets
                                                                    .only(
                                                                        bottom:
                                                                            10),
                                                                child: Image
                                                                    .network(
                                                                  messages
                                                                      .fileUrl
                                                                      .toString(),
                                                                  errorBuilder: (q,
                                                                          w,
                                                                          e) =>
                                                                      Text(
                                                                          'Image not found'),
                                                                  fit: BoxFit
                                                                      .fitWidth,
                                                                ),
                                                              ),
                                                    Text(
                                                      messages.message
                                                          .toString(),
                                                      style: FontConstant
                                                          .k16w4008471Text
                                                          .copyWith(
                                                              color: Color(
                                                                  0xff5E5C70)),
                                                    ),
                                                  ],
                                                ),
                                              ),*/
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
                                                                'This message has been deleted!'
                                                                    .tr();
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
                                alignment: messages.senderUserType == "parent"
                                    ? Alignment.centerRight
                                    : Alignment.centerLeft,
                                child: Padding(
                                  padding: EdgeInsets.only(bottom: 32.0),
                                  child: Container(
                                    constraints: BoxConstraints(
                                      maxWidth: 250,
                                    ),
                                    decoration: BoxDecoration(
                                        color: messages.senderUserType ==
                                                "parent"
                                            ? messages.fileUrl!.contains('m4a')
                                                ? Colors.transparent
                                                : Color(0xffF2F1F8)
                                            : messages.fileUrl!.contains('m4a')
                                                ? Colors.transparent
                                                : Color(0xffDBE8FA),
                                        borderRadius: BorderRadius.circular(6)),
                                    child: Padding(
                                      padding: EdgeInsets.all(
                                          messages.fileUrl!.contains('m4a')
                                              ? 0
                                              : 12),
                                      child: messages.isDeleted == '1'
                                          ? Text(
                                              'This message has been deleted!'
                                                  .tr(),
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
                                                    : messages.fileUrl!
                                                            .contains('m4a')
                                                        ? InternetAudioPlayer(
                                                            isParent: messages
                                                                    .senderUserType ==
                                                                "parent",
                                                            url: messages
                                                                .fileUrl!)
                                                        : GestureDetector(
                                                            onTap: () {
                                                              showDialog(
                                                                context:
                                                                    context,
                                                                builder: (_) =>
                                                                    PhotoViewer(
                                                                  asset: false,
                                                                  url: messages
                                                                      .fileUrl!,
                                                                ),
                                                              );
                                                            },
                                                            child: Container(
                                                              constraints:
                                                                  BoxConstraints(
                                                                      maxWidth:
                                                                          200,
                                                                      maxHeight:
                                                                          150),
                                                              margin: EdgeInsets
                                                                  .only(
                                                                      bottom:
                                                                          10),
                                                              child:
                                                                  Image.network(
                                                                messages.fileUrl
                                                                    .toString(),
                                                                fit: BoxFit
                                                                    .cover,
                                                                errorBuilder: (q,
                                                                        w, e) =>
                                                                    Text(
                                                                        'Image not found'),
                                                              ),
                                                            ),
                                                          ),
                                                if (messages.message
                                                    .toString()
                                                    .isNotEmpty)
                                                  (messages.senderUserType ==
                                                          'parent')
                                                      ? GestureDetector(
                                                          onTap: () {
                                                            print(messages
                                                                    .senderUserType ==
                                                                'parent');
                                                          },
                                                          child: Text(
                                                            messages.message
                                                                .toString(),
                                                            style: FontConstant
                                                                .k16w4008471Text
                                                                .copyWith(
                                                                    color: Color(
                                                                        0xff5E5C70)),
                                                          ),
                                                        )
                                                      : messages.message
                                                                  .toString()
                                                                  .length <=
                                                              200
                                                          ? Text(
                                                              messages.message
                                                                  .toString(),
                                                              style: FontConstant
                                                                  .k16w4008471Text
                                                                  .copyWith(
                                                                      color: Color(
                                                                          0xff5E5C70)),
                                                            )
                                                          : RichText(
                                                              text: readMore[
                                                                      index]
                                                                  ? WidgetSpan(
                                                                      child:
                                                                          Text(
                                                                      '${messages.message}',
                                                                      style: FontConstant
                                                                          .k16w4008471Text
                                                                          .copyWith(
                                                                              color: Color(0xff5E5C70)),
                                                                    ))
                                                                  : TextSpan(
                                                                      children: [
                                                                        WidgetSpan(
                                                                            child:
                                                                                Text(
                                                                          '${messages.message}',
                                                                          maxLines:
                                                                              5,
                                                                          overflow:
                                                                              TextOverflow.ellipsis,
                                                                          style: FontConstant
                                                                              .k16w4008471Text
                                                                              .copyWith(color: Color(0xff5E5C70)),
                                                                        )),
                                                                        WidgetSpan(
                                                                            baseline:
                                                                                TextBaseline.alphabetic,
                                                                            alignment: PlaceholderAlignment.baseline,
                                                                            child: GestureDetector(
                                                                              onTap: () {
                                                                                setState(() {
                                                                                  readMore[index] = true;
                                                                                });
                                                                              },
                                                                              child: Container(
                                                                                color: Colors.transparent,
                                                                                child: Text(
                                                                                  'Read More',
                                                                                  style: FontConstant.k16w4008471Text.copyWith(
                                                                                    color: Colors.blue,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            )),
                                                                      ],
                                                                    ),
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
                                        _getVoicePermission();
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

class PhotoViewer extends StatefulWidget {
  final String url;
  final bool asset;
  const PhotoViewer({Key? key, required this.url, required this.asset})
      : super(key: key);

  @override
  State<PhotoViewer> createState() => _PhotoViewerState();
}

class _PhotoViewerState extends State<PhotoViewer> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      insetPadding: EdgeInsets.all(40),
      content: Container(
        clipBehavior: Clip.hardEdge,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: widget.asset
            ? Image.file(
                File(widget.url),
                fit: BoxFit.cover,
              )
            : Image.network(
                widget.url,
                fit: BoxFit.cover,
              ),
      ),
    );
  }
}

class RecorderDialog extends StatefulWidget {
  const RecorderDialog({Key? key}) : super(key: key);

  @override
  State<RecorderDialog> createState() => _RecorderDialogState();
}

class _RecorderDialogState extends State<RecorderDialog>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    )..repeat(reverse: true);
    _animation = Tween(
      begin: 1.0,
      end: 0.5,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.fastOutSlowIn,
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.transparent,
      contentPadding: EdgeInsets.zero,
      insetPadding: EdgeInsets.all(40),
      content: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              "Recording...",
              style: FontConstant.k14w400White,
            ),
            ScaleTransition(
              scale: _animation,
              child: Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                    color: AppColors().kF8F6FA, shape: BoxShape.circle),
                child: Icon(
                  Icons.mic,
                  size: 50,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: 48),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors().k8267AC,
                ),
                child: Icon(
                  Icons.check,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class InternetAudioPlayer extends StatefulWidget {
  final String url;
  final bool isParent;
  const InternetAudioPlayer(
      {Key? key, required this.url, required this.isParent})
      : super(key: key);

  @override
  State<InternetAudioPlayer> createState() => _InternetAudioPlayerState();
}

class _InternetAudioPlayerState extends State<InternetAudioPlayer> {
  bool playing = false;
  AudioPlayer audioPlayer = AudioPlayer();

  @override
  void initState() {
    /*audioPlayer.onPlayerStateChanged.listen((event) {
      setState(() {
        playing = event == PlayerState.PLAYING;
      });
    });*/
    audioPlayer.setUrl(widget.url);
    audioPlayer.onDurationChanged.listen((event) {
      setState(() {
        soundDuration = event;
      });
    });
    audioPlayer.onAudioPositionChanged.listen((event) {
      setState(() {
        soundLength = event.inSeconds.toDouble();
        //log(soundLength.toString());
      });
    });
    audioPlayer.onPlayerError.listen((event) {
      print("Error: $event");
    });
    super.initState();
  }

  @override
  void dispose() {
    //timer.cancel();
    audioPlayer.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      //margin: EdgeInsets.all(2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: widget.isParent ? Color(0xffF2F1F8) : Color(0xffDBE8FA),
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: () async {
              print(widget.url);
              print(soundLength);
              print(soundDuration);
              print(await audioPlayer.getDuration());
              //print(playing);
              setState(() {
                playing = !playing;
              });
              print(playing);
              if (playing) {
                await audioPlayer.play(widget.url);
                setPosition();
              } else {
                setPosition();
                await audioPlayer.stop();
              }
            },
            child: Container(
              width: 50,
              height: 50,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors().k8267AC,
              ),
              child: playing
                  ? Image.asset(
                      'assets/images/pause.png',
                      color: AppColors().kF8F6FA,
                    )
                  : Image.asset(
                      'assets/images/playB.png',
                      color: AppColors().kF8F6FA,
                    ),
            ),
          ),
          //SizedBox(width: 16),
          Expanded(
            child: Slider(
              thumbColor: AppColors().k8267AC,
              activeColor: AppColors().k8267AC.withOpacity(0.5),
              inactiveColor: Colors.grey,
              min: 0,
              max: soundDuration.inSeconds.toDouble(),
              value: soundLength,
              onChanged: (v) {
                soundLength = v;
              },
            ),
          ),
        ],
      ),
    );
  }

  Duration soundDuration = Duration.zero;
  double soundLength = 0.0;

  setPosition() {
    Timer timer;
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (mounted && playing) {
        setState(() {
          soundLength = soundLength + 1.0;
        });
        if (soundLength > soundDuration.inSeconds) {
          timer.cancel();
          audioPlayer.stop();
          setState(() {
            playing = false;
            soundLength = 0.0;
          });
        }
      } else {
        timer.cancel();
      }
    });
  }
}

class Messages {
  final String text;
  final DateTime date;
  final bool isSentByme;
  const Messages(
      {required this.text, required this.date, required this.isSentByme});
}
