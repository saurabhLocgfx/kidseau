import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kidseau/ParentsPanel/PHomeScreen/PHomeScreen.dart';
import 'package:kidseau/ParentsPanel/PProfileScreens/PKidsdetail.dart';
import 'package:kidseau/Theme.dart';
import 'package:kidseau/Widgets/buttons.dart';

class PParentsProfile extends StatefulWidget {
  const PParentsProfile({Key? key}) : super(key: key);

  @override
  State<PParentsProfile> createState() => _PParentsProfileState();
}

class _PParentsProfileState extends State<PParentsProfile> {
  var infocategory = [
    "Mother’s name",
    "Occupation",
    "Email address",
    "Phone number",
    "Address",
  ];

  var infocategorydata = [
    "Lucy Bravo",
    "House Wife",
    "Ab@gmail.com",
    "9876543210",
    "6391 Elgin St. Celina,"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 140,
                  width: 96.2,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image:
                              AssetImage("assets/images/profileperson.png"))),
                ),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Johnny Bravo",
                      style: FontConstant.k24w500brownText,
                    ),
                    Text(
                      "Occupation",
                      style: FontConstant.k16w400B7A4Text,
                    ),
                    Text("9876543210", style: FontConstant.k16w5008471Text),
                    Text("xyz@gmail.com", style: FontConstant.k16w5008471Text),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 35),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => PKidsDetails(),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: Container(
                height: 132,
                padding: EdgeInsets.only(left: 16),
                child: ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Studentcard();
                    },
                    separatorBuilder: (ctx, ind) => SizedBox(
                          width: 10,
                        ),
                    itemCount: 3),
              ),
            ),
          ),
          SizedBox(
            height: 32,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "info",
                  style: FontConstant2.k22w5008471text,
                ),
                Container(
                  //height: 180,
                  child: ListView.separated(
                    separatorBuilder: (ctx, ind) => SizedBox(
                      height: 16.h,
                    ),
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: infocategory.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Row(
                        children: [
                          SizedBox(
                            width: 130.w,
                            child: Text(
                              infocategory[index],
                              style: FontConstant.k16w500331FText,
                            ),
                          ),
                          SizedBox(width: 16),
                          Expanded(
                            child: Text(
                              infocategorydata[index],
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: FontConstant.k16w5008471Text,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 32),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SizedBox(
              height: 52.h,
              width: 382.w,
              child: MainButton(
                  onTap: () {},
                  title: "Edit".tr(),
                  textStyleColor: Colors.white,
                  backgroundColor: ThemeColor.primarycolor),
            ),
          ),
        ],
      ),
    );
  }
}
