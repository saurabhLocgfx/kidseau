import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kidseau/Theme.dart';
import 'package:kidseau/Widgets/dialogs.dart';

class TPostsScreen extends StatefulWidget {
  const TPostsScreen({Key? key}) : super(key: key);

  @override
  State<TPostsScreen> createState() => _TPostsScreenState();
}

class _TPostsScreenState extends State<TPostsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            for (int i = 0; i < 8; i++)
              Container(
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
                            "Today we had small music activity with all kids and teachers. ",
                            style: FontConstant.k16w4008471Text,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 6),
                    Row(
                      children: [
                        Expanded(
                            child:
                                Image.asset("assets/images/childrenposts.png")),
                        /* Container(
                          height: 213.h,
                          width: 379.w,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      "assets/images/childrenposts.png"))),
                        ),*/
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
                                "2.4k".tr(),
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
                          Text("2 min ago",
                              style: FontConstant.k16w4008471Text
                                  .copyWith(fontSize: 14))
                        ],
                      ),
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
              ),
            SizedBox(height: 150)
          ],
        ),
      ),
    );
  }
}
