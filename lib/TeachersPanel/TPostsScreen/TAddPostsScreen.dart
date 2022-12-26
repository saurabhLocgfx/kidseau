import 'package:dotted_border/dotted_border.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kidseau/Theme.dart';
import 'package:kidseau/Widgets/buttons.dart';

import 'TAddAnnouncement.dart';

class TAddPostsScreen extends StatefulWidget {
  const TAddPostsScreen({Key? key}) : super(key: key);

  @override
  State<TAddPostsScreen> createState() => _TAddPostsScreenState();
}

class _TAddPostsScreenState extends State<TAddPostsScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 70),
          DottedBorder(
            borderType: BorderType.RRect,
            radius: Radius.circular(16),
            strokeWidth: 2,
            color: Color(0xffB7A4B2),
            dashPattern: [10, 10],
            child: Container(
              color: Colors.transparent,
              width: 200.w,
              height: 250.w,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/add.png',
                      width: 100,
                    ),
                    SizedBox(height: 24),
                    Text("Add Photos".tr(),
                        style: FontConstant.k18w500B7A4Text),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Text("OR".tr(), style: FontConstant.k18w500B7A4Text),
          SizedBox(height: 20),
          SizedBox(
            width: 382.w,
            height: 52.h,
            child: materialButton(
              context,
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => AddAnnouncement(),
                  ),
                );
              },
              "Add Announcement".tr(),
              Color(0xFFF0AD56),
              52.0,
            ),
          )
        ],
      ),
    );
  }
}
