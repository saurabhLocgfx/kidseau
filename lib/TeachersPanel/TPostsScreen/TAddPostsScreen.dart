import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:kidseau/Theme.dart';
import 'package:kidseau/Widgets/buttons.dart';

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
              width: 250,
              height: 333,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/add.png',
                      width: 100,
                    ),
                    SizedBox(height: 24),
                    Text('Add Photo', style: FontConstant.k18w500B7A4Text),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 40),
          Text('OR', style: FontConstant.k18w500B7A4Text),
          SizedBox(height: 40),
          materialButton(
            context,
            () {},
            'Add Announcement',
            Color(0xFFF0AD56),
            52.0,
          ),
        ],
      ),
    );
  }
}
