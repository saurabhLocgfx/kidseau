import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kidseau/Theme.dart';
import 'package:kidseau/Widgets/textfields.dart';
import 'package:kidseau/api/feedback_api/feedback_api.dart';

import 'buttons.dart';

class FeedbackWidget extends StatefulWidget {
  const FeedbackWidget({Key? key}) : super(key: key);

  @override
  State<FeedbackWidget> createState() => _FeedbackWidgetState();
}

class _FeedbackWidgetState extends State<FeedbackWidget> {
  int _rating = 0;
  final TextEditingController _controller = TextEditingController();
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(24)),
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "How did we do?".tr(),
                style: FontConstant.k18w500BlackText,
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Expanded(
                      child: InkWell(
                    onTap: () {
                      setState(() {
                        _rating = 1;
                      });
                    },
                    child: Stack(
                      children: [
                        Center(
                          child: Image.asset(
                            "assets/images/f1.png",
                            width: 40,
                            height: 40,
                          ),
                        ),
                        if (_rating != 1)
                          Positioned(
                            left: 0,
                            top: 0,
                            right: 0,
                            bottom: 0,
                            child: Container(
                              color: Colors.white.withOpacity(0.4),
                            ),
                          ),
                      ],
                    ),
                  )),
                  Expanded(
                      child: InkWell(
                    onTap: () {
                      setState(() {
                        _rating = 2;
                      });
                    },
                    child: Stack(
                      children: [
                        Center(
                          child: Image.asset(
                            "assets/images/f2.png",
                            width: 40,
                            height: 40,
                          ),
                        ),
                        if (_rating != 2)
                          Positioned(
                            left: 0,
                            top: 0,
                            right: 0,
                            bottom: 0,
                            child: Container(
                              color: Colors.white.withOpacity(0.4),
                            ),
                          ),
                      ],
                    ),
                  )),
                  Expanded(
                      child: InkWell(
                    onTap: () {
                      setState(() {
                        _rating = 3;
                      });
                    },
                    child: Stack(
                      children: [
                        Center(
                          child: Image.asset(
                            "assets/images/f3.png",
                            width: 40,
                            height: 40,
                          ),
                        ),
                        if (_rating != 3)
                          Positioned(
                            left: 0,
                            top: 0,
                            right: 0,
                            bottom: 0,
                            child: Container(
                              color: Colors.white.withOpacity(0.4),
                            ),
                          ),
                      ],
                    ),
                  )),
                  Expanded(
                      child: InkWell(
                    onTap: () {
                      setState(() {
                        _rating = 4;
                      });
                    },
                    child: Stack(
                      children: [
                        Center(
                          child: Image.asset(
                            "assets/images/f4.png",
                            width: 40,
                            height: 40,
                          ),
                        ),
                        if (_rating != 4)
                          Positioned(
                            left: 0,
                            top: 0,
                            right: 0,
                            bottom: 0,
                            child: Container(
                              color: Colors.white.withOpacity(0.4),
                            ),
                          ),
                      ],
                    ),
                  )),
                  Expanded(
                      child: InkWell(
                    onTap: () {
                      setState(() {
                        _rating = 5;
                      });
                    },
                    child: Stack(
                      children: [
                        Center(
                          child: Image.asset(
                            "assets/images/f5.png",
                            width: 40,
                            height: 40,
                          ),
                        ),
                        if (_rating != 5)
                          Positioned(
                            left: 0,
                            top: 0,
                            right: 0,
                            bottom: 0,
                            child: Container(
                              color: Colors.white.withOpacity(0.4),
                            ),
                          ),
                      ],
                    ),
                  )),
                ],
              ),
              SizedBox(
                height: 24,
              ),
              Text(
                "Do not hesitate to share your experiences".tr(),
                style: FontConstant.k18w500BlackText,
              ),
              SizedBox(
                height: 12,
              ),
              TextFormField(
                style: FontConstant.k18w5008471Text,
                maxLines: 5,
                maxLength: 500,
                /*inputFormatters: [
                  LengthLimitingTextInputFormatter(10),
                ],*/
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(14.0),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide:
                        BorderSide(color: Color(0xFFF3F1FD), width: 1.0),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    borderSide: BorderSide(color: Colors.redAccent, width: 1.0),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    borderSide: BorderSide(color: Colors.redAccent, width: 1.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    borderSide:
                        BorderSide(color: Color(0xffBE74AA), width: 1.0),
                  ),
                  isDense: true,
                  hintText: "Write here...".tr(),
                  filled: true,
                  fillColor: Colors.white,
                  hintStyle: FontConstant.k14w400lightText.copyWith(
                      color: Color(0xffB7A4B2),
                      fontSize: 16.0,
                      fontWeight: FontWeight.w400),
                ),
                controller: _controller,
                /*  controller: controller,*/
              ),
              SizedBox(
                height: 24,
              ),
              SizedBox(
                height: 56,
                width: 1.sw,
                child: _isLoading
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : MainButton(
                        onTap: () {
                          if (_rating != 0) {
                            setState(() {
                              _isLoading = true;
                            });
                            final resp = SendFeedbackApi().get(
                                feedback: _controller.text, rating: "$_rating");
                            resp.then((value) {
                              if (value['status'] == 1) {
                                setState(() {
                                  _isLoading = false;
                                });
                                Navigator.of(context).pop();
                                Fluttertoast.showToast(
                                    msg: "Feedback submitted");
                              } else {
                                setState(() {
                                  _isLoading = false;
                                  Fluttertoast.showToast(msg: value["msg"]);
                                });
                              }
                            });
                          }
                        },
                        title: "Submit".tr(),
                        textStyleColor: Colors.white,
                        backgroundColor: ThemeColor.primarycolor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
