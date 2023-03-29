import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:kidseau/Theme.dart';

import '../ParentsPanel/PProfileScreens/PSettings/PNotificationSettings.dart';

Center mainlogo() {
  return Center(
      child: SizedBox(
          width: 170.w,
          height: 170.w,
          child: Image.asset('assets/images/logo.png')));
}

class PostDialog extends StatefulWidget {
  var value;
  PostDialog({Key? key, required this.value}) : super(key: key);

  @override
  State<PostDialog> createState() => _PostDialogState();
}

class _PostDialogState extends State<PostDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      insetPadding: EdgeInsets.symmetric(horizontal: 16),
      backgroundColor: Colors.white,
      content: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16),
          // height: 500,
          width: 200,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              SizedBox(height: 08),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      widget.value['captions'],
                      style: FontConstant.k16w4008471Text,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 6),
              SizedBox(
                height: 200,
                child: PageView.builder(
                    itemCount: widget.value['images'].length,
                    onPageChanged: (currentIndex) {
                      // log(_postList[index].image![currentIndex].fileName.toString());
                    },
                    itemBuilder: (ctx, indexx) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8)),
                          child: Image.network(
                            widget.value['images'][indexx],
                            fit: BoxFit.cover,
                            loadingBuilder: (q, w, e) {
                              if (e == null) {
                                return w;
                              } else {
                                return SpinKitThreeBounce(
                                  size: 30,
                                  color: Colors.grey,
                                );
                              }
                            },
                            errorBuilder: (q, w, e) => SizedBox(
                                width: 1.sw,
                                child: Center(child: Text('No image found'))),
                            width: 1.sw,
                          ),
                        ),
                      );
                    }),
                // ListView.separated(
                //   itemBuilder: (ctx, indexx){
                //   return Image.network(
                //     'https://d2dupazv4z3oi6.cloudfront.net/i/nic/abp_live.jpg', errorBuilder: (q, w, e) =>
                //       SizedBox(width: 1.sw,child: Text('No image found')),width: 1.sw,);
                // }, separatorBuilder: (ctx, ind)=> SizedBox.shrink(),
                //   itemCount: _postList[index].image!.length,
                //   shrinkWrap: true,
                //   scrollDirection: Axis.horizontal,)
              ),
              /*SizedBox(height: 16),
              Container(
                width: 1.sw,
                height: 3,
                color: Colors.white,
              ),
              SizedBox(height: 5),*/
            ],
          ),
        ),
      ),
    );
  }
}

Future<dynamic> notificationDialog({
  required BuildContext context,
  required String title,
  required String desc,
  required Function onAddReminderTap,
  required Function onPop,
}) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          insetPadding: EdgeInsets.all(15),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0)), //this right here
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: FontConstant2.k24w500331Ftext,
                  ),
                  Text(
                    desc,
                    style: FontConstant.k16w4008471Text,
                  ),
                  SizedBox(height: 24),
                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 52,
                          //width: 170,
                          child: MaterialButton(
                            elevation: 0,
                            onPressed: () {
                              Navigator.pop(context);
                              onPop();
                            },
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                                side: BorderSide(
                                    color: ThemeColor.lightpurple, width: 1),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(94))),
                            child: Text(
                              "Close".tr(),
                              /*AppLoaclizations.of(context)!
                                  .translate("Close")
                                  .toString(),*/
                              style: FontConstant.k16w5008267Text
                                  .copyWith(fontSize: 14),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: SizedBox(
                          height: 52,
                          //width: 170,
                          child: MaterialButton(
                            onPressed: () {
                              onAddReminderTap();
                            },
                            elevation: 0,
                            color: ThemeColor.primarycolor,
                            shape: RoundedRectangleBorder(
                                side: BorderSide(
                                    color: ThemeColor.lightpurple, width: 1),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(94))),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "assets/images/clockicon.png",
                                  height: 24,
                                  color: Colors.white,
                                ),
                                SizedBox(width: 8),
                                Text("Add Reminder".tr(),
                                    /*AppLoaclizations.of(context)!
                                        .translate("Add Reminder")
                                        .toString(),*/
                                    overflow: TextOverflow.ellipsis,
                                    style: FontConstant.k16w5008267Text
                                        .copyWith(
                                            fontSize: 14, color: Colors.white)),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      }).then((value) {
    onPop();
  });
}

class CustomBottomAppbar extends StatelessWidget {
  final Color selectedColor;
  final Color unSelectedColor;
  final Function(int index) onTap;
  final List<CustomBottomAppBarItem> children;
  final int selectedTab;
  const CustomBottomAppbar({
    Key? key,
    required this.selectedColor,
    required this.unSelectedColor,
    required this.onTap,
    required this.children,
    required this.selectedTab,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 32.0),
      child: Container(
        width: double.infinity,
        height: 80,
        padding: const EdgeInsets.symmetric(
          vertical: 5,
          horizontal: 10,
        ),
        color: Colors.transparent,
        child: Container(
          width: double.infinity,
          height: 70,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                blurRadius: 20,
                color: Colors.grey.shade300,
              )
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: List.generate(
              children.length,
              (index) {
                return CustomBottomAppBarItem(
                  image: children[index].image,
                  text: children[index].text,
                  color: selectedTab == index ? selectedColor : unSelectedColor,
                  press: () {
                    onTap(index);
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class CustomBottomAppBarItem extends StatelessWidget {
  final String image;
  final String text;
  final VoidCallback? press;
  final Color? color;
  const CustomBottomAppBarItem({
    Key? key,
    required this.image,
    required this.text,
    this.press,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                image,
                height: 20,
                color: color == ThemeColor.primarycolor
                    ? ThemeColor.primarycolor
                    : ThemeColor.primarycolor,
              ),
              Text(
                text,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: color == ThemeColor.primarycolor
                      ? ThemeColor.primarycolor
                      : ThemeColor.primarycolor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

Future<Object?> AnnouncementDialog(BuildContext context) {
  return showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: Colors.black45,
      transitionDuration: const Duration(milliseconds: 200),
      pageBuilder: (BuildContext buildContext, Animation animation,
          Animation secondaryAnimation) {
        return Center(
          child: Material(
            child: Container(
              width: 382,
              height: 290,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(24)),
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Bring notebook (Title)",
                      style: FontConstant2.k24w500331Ftext,
                    ),
                    Text(
                      "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit. Exercitation veniam consequat sunt nostrud amet.",
                      style: FontConstant.k16w4008471Text,
                    ),
                    SizedBox(height: 24),
                    Row(
                      children: [
                        SizedBox(
                          height: 52,
                          width: 170,
                          child: MaterialButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                                side: BorderSide(
                                    color: ThemeColor.lightpurple, width: 1),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(94))),
                            child: Text(
                              "Close".tr(),
                              /*AppLoaclizations.of(context)!
                                  .translate("Close")
                                  .toString(),*/
                              style: FontConstant.k16w5008267Text,
                            ),
                          ),
                        ),
                        SizedBox(width: 8),
                        SizedBox(
                          height: 52,
                          width: 170,
                          child: MaterialButton(
                            onPressed: () {},
                            color: ThemeColor.primarycolor,
                            shape: RoundedRectangleBorder(
                                side: BorderSide(
                                    color: ThemeColor.lightpurple, width: 1),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(94))),
                            child: Row(
                              children: [
                                Image.asset(
                                  "assets/images/clockicon.png",
                                  height: 24,
                                ),
                                SizedBox(width: 14),
                                Text("Add Reminder".tr(),
                                    /*AppLoaclizations.of(context)!
                                        .translate("Add Reminder")
                                        .toString(),*/
                                    style: FontConstant.k16w5008267Text
                                        .copyWith(color: Colors.white)),
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
        );
      });
}

class Notificationpopup extends StatelessWidget {
  final String image;
  final String image2;
  final String title;
  final String title2;
  final Function onMarkAllRead;
  const Notificationpopup({
    Key? key,
    required this.image,
    required this.title,
    required this.image2,
    required this.title2,
    required this.onMarkAllRead,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        iconSize: 48,
        icon: ImageIcon(
          AssetImage(
            "assets/images/dots2.png",
          ),
          color: ThemeColor.primarycolor,
        ),
        itemBuilder: (context) {
          return [
            PopupMenuItem(
              enabled: false,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 24.h,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        //Navigator.pop(context);
                        onMarkAllRead();
                      },
                      child: Container(
                        color: Colors.transparent,
                        child: Row(
                          children: [
                            Image.asset(
                              image,
                              height: 24,
                            ),
                            SizedBox(width: 24),
                            Text(title,
                                style: FontConstant.k18w5008471Text
                                    .copyWith(fontSize: 15))
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 26),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => PNotificationsettings(),
                          ),
                        );
                      },
                      child: Container(
                        color: Colors.transparent,
                        child: Row(
                          children: [
                            Image.asset(
                              image2,
                              height: 24,
                            ),
                            SizedBox(width: 24),
                            Text(
                              title2,
                              style: FontConstant.k18w5008471Text
                                  .copyWith(fontSize: 15),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ];
        });
  }
}
