import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:kidseau/Theme.dart';
import 'package:kidseau/Widgets/popups.dart';

class TChats extends StatefulWidget {
  const TChats({Key? key}) : super(key: key);

  @override
  State<TChats> createState() => _TChatsState();
}

class _TChatsState extends State<TChats> {
  List<Messages> messages = [
    Messages(
        text: 'Good morning Umar sir.',
        date: DateTime.now().subtract(Duration(minutes: 1)),
        isSentByme: true),
    Messages(
        text: 'GGood Morning Mr.Jhonny.',
        date: DateTime.now().subtract(Duration(minutes: 1)),
        isSentByme: false),
    Messages(
        text: 'I need to know, how is my kid doing in school?.',
        date: DateTime.now().subtract(Duration(minutes: 1)),
        isSentByme: true),
    Messages(
        text:
            'Nobita ! He is really intelligent kid. He is fast in learning new things',
        date: DateTime.now().subtract(Duration(minutes: 1)),
        isSentByme: false),
  ];

  bool _isVisible = false;
  void showToast() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  // final bottom = MediaQuery.of(context).viewInsets.bottom;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: true,
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
              child: Container(
                color: Colors.white,
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
                    /*AppLoaclizations.of(context)!
                                  .translate("Type here."),*/
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
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          //height: 896.h,
          width: 1.sw,
          decoration: BoxDecoration(
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
                  height: 130.h,
                ),
                GestureDetector(
                  onTap: () {
                    // Navigator.of(context).push(
                    //   MaterialPageRoute(
                    //     builder: (context) => TOpenChats(),
                    //   ),
                    // );
                  },
                  child: Row(
                    children: [
                      Container(
                        height: 112.h,
                        width: 84.w,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image:
                                    AssetImage("assets/images/teacher1.png"))),
                      ),
                      SizedBox(
                        width: 16.w,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Mohammad Umar",
                              style: FontConstant.k24w500brownText
                                  .copyWith(color: ThemeColor.primarycolor)),
                          Text(
                            "Class teacher",
                            style: FontConstant.k16w400B7A4Text,
                          ),
                          Text(
                            "English, French, Arabic",
                            style: FontConstant.k16w4008471Text,
                          )
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 500,
                  child: GroupedListView<Messages, DateTime>(
                    reverse: true,
                    order: GroupedListOrder.DESC,
                    padding: EdgeInsets.all(20),
                    elements: messages,
                    groupBy: (messages) => DateTime(messages.date.year,
                        messages.date.month, messages.date.day),
                    groupHeaderBuilder: (Messages messages) => SizedBox(),
                    itemBuilder: (context, Messages messages) => Align(
                      alignment: messages.isSentByme
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                      child: Align(
                        alignment: messages.isSentByme
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 32.0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: messages.isSentByme
                                    ? Color(0xffF2F1F8)
                                    : Color(0xffDBE8FA),
                                borderRadius: BorderRadius.circular(6)),
                            child: Padding(
                              padding: EdgeInsets.all(12),
                              child: Text(
                                messages.text,
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
                /* Row(
                  children: [
                    Expanded(
                      child: TextField(
                        onSubmitted: (text) {
                          final message = Messages(
                              text: text,
                              date: DateTime.now(),
                              isSentByme: true);
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
                          */ /*AppLoaclizations.of(context)!
                              .translate("Type here."),*/ /*
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
                    ),
                  ],
                ),*/
                SizedBox(
                  height: !_isVisible ? 32.h : 20.h,
                ),
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
