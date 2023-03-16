import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kidseau/Constants/colors.dart';
import 'package:kidseau/Theme.dart';
import 'package:kidseau/Widgets/buttons.dart';

class MyPostOptionsDialog extends StatelessWidget {
  const MyPostOptionsDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        iconSize: 40,
        icon: ImageIcon(
          AssetImage(
            "assets/images/dots2.png",
          ),
        ),
        itemBuilder: (context) {
          return [
            PopupMenuItem(
              enabled: false,
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0, top: 16, bottom: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          "assets/images/edit.png",
                          height: 24,
                        ),
                        SizedBox(width: 24),
                        Text(
                          "Edit".tr(),
                          /* AppLoaclizations.of(context)!
                              .translate("Edit")
                              .toString(),*/
                          style: FontConstant.k18w5008471Text,
                        )
                      ],
                    ),
                    SizedBox(height: 26),
                    Row(
                      children: [
                        Image.asset(
                          "assets/images/eyelogo.png",
                          height: 24,
                        ),
                        SizedBox(width: 24),
                        Text(
                          "Hide".tr(),
                          /* AppLoaclizations.of(context)!
                              .translate("Hide")
                              .toString(),*/
                          style: FontConstant.k18w5008471Text,
                        )
                      ],
                    ),
                    SizedBox(height: 26),
                    Row(
                      children: [
                        Image.asset(
                          "assets/images/downloadicon.png",
                          height: 24,
                        ),
                        SizedBox(width: 24),
                        Text(
                          "Download".tr(),
                          /*AppLoaclizations.of(context)!
                              .translate("Download")
                              .toString(),*/
                          style: FontConstant.k18w5008471Text,
                        )
                      ],
                    ),
                    SizedBox(height: 26),
                    Row(
                      children: [
                        Image.asset(
                          "assets/images/trashicon.png",
                          height: 24,
                          color: Colors.redAccent,
                        ),
                        SizedBox(width: 24),
                        Text(
                          "Delete".tr(),
                          /*AppLoaclizations.of(context)!
                              .translate("Delete")
                              .toString(),*/
                          style: FontConstant.k18w500F970Text,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ];
        });
  }
}

class PostOptionsDialog extends StatelessWidget {
  const PostOptionsDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        iconSize: 40,
        icon: ImageIcon(
          AssetImage(
            "assets/images/dots2.png",
          ),
        ),
        itemBuilder: (context) {
          return [
            PopupMenuItem(
              enabled: false,
              child: SizedBox(
                height: 160,
                child: Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            "assets/images/eyelogo.png",
                            height: 24,
                          ),
                          SizedBox(width: 24),
                          Text(
                            "Hide".tr(),
                            /* AppLoaclizations.of(context)!
                                .translate("Hide")
                                .toString(),*/
                            style: FontConstant.k18w5008471Text,
                          )
                        ],
                      ),
                      SizedBox(height: 26),
                      InkWell(
                        onTap: () {
                          showModalBottomSheet(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      topLeft: const Radius.circular(20.0),
                                      topRight: const Radius.circular(20.0))),
                              context: context,
                              builder: (builder) {
                                return Container(
                                    height: 298,
                                    decoration: BoxDecoration(
                                        // color: Colors.transparent,
                                        borderRadius: BorderRadius.only(
                                            topLeft:
                                                const Radius.circular(20.0),
                                            topRight:
                                                const Radius.circular(20.0))),
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 16),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            "Report ",
                                            style:
                                                FontConstant.k24w50084717FText,
                                          ),
                                          SizedBox(
                                            height: 34,
                                          ),
                                          Text(
                                            "I don’t like this",
                                            style: FontConstant.k16w500331FText,
                                          ),
                                          SizedBox(
                                            height: 34,
                                          ),
                                          Text(
                                            "Not from the same group",
                                            style: FontConstant.k16w500331FText,
                                          ),
                                          SizedBox(
                                            height: 34,
                                          ),
                                          Text(
                                            "Inappropriate content",
                                            style: FontConstant.k16w500331FText,
                                          ),
                                          SizedBox(
                                            height: 34,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                width: 100.w,
                                                height: 3,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    color: Color(0xff331F2D)),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ));
                              });
                        },
                        child: Row(
                          children: [
                            Image.asset(
                              "assets/images/reportlogo.png",
                              height: 24,
                            ),
                            SizedBox(width: 24),
                            Text(
                              "Report".tr(),
                              /* AppLoaclizations.of(context)!
                                  .translate("Report")
                                  .toString(),*/
                              style: FontConstant.k18w5008471Text,
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 26),
                      Row(
                        children: [
                          Image.asset(
                            "assets/images/downloadicon.png",
                            height: 24,
                          ),
                          SizedBox(width: 24),
                          Text(
                            "Download".tr(),
                            /*AppLoaclizations.of(context)!
                                .translate("Download")
                                .toString(),*/
                            style: FontConstant.k18w5008471Text,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ];
        });
  }
}

class messageoptiondialog extends StatelessWidget {
  const messageoptiondialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        iconSize: 10,
        icon: ImageIcon(
          AssetImage(
            "assets/images/dots2.png",
          ),
        ),
        itemBuilder: (context) {
          return [
            PopupMenuItem(
              enabled: false,
              child: Container(
                /*height: 160,
                width: 258,*/
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 32.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            "assets/images/markicon.png",
                            height: 24,
                          ),
                          SizedBox(width: 24),
                          Text(
                            "Mark as unread".tr(),
                            /*AppLoaclizations.of(context)!
                                .translate("Mark as unread")
                                .toString(),*/
                            style: FontConstant.k18w5008471Text,
                          )
                        ],
                      ),
                      SizedBox(height: 26),
                      Row(
                        children: [
                          Image.asset(
                            "assets/images/trashicon.png",
                            height: 24,
                          ),
                          SizedBox(width: 24),
                          Text(
                            "Delete chat".tr(),
                            /*AppLoaclizations.of(context)!
                                .translate("Delete chat")
                                .toString(),*/
                            style: FontConstant.k18w5008471Text,
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ];
        });
  }
}

class kidsgallerydialog extends StatelessWidget {
  const kidsgallerydialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        iconSize: 10,
        icon: ImageIcon(
          AssetImage(
            "assets/images/dots2.png",
          ),
        ),
        itemBuilder: (context) {
          return [
            PopupMenuItem(
              enabled: false,
              child: Container(
                height: 200,
                width: 135,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            "assets/images/eyelogo.png",
                            height: 20,
                          ),
                          SizedBox(width: 20),
                          Text(
                            "Hide",
                            style: FontConstant.k18w5008471Text,
                          )
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Image.asset(
                            "assets/images/reportlogo.png",
                            height: 24,
                          ),
                          SizedBox(width: 20),
                          Text(
                            "Report",
                            style: FontConstant.k18w5008471Text,
                          )
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Image.asset(
                            "assets/images/downloadicon.png",
                            height: 24,
                          ),
                          SizedBox(width: 20),
                          Text(
                            "Download",
                            style: FontConstant.k18w5008471Text,
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ];
        });
  }
}

class SuretyDialog extends StatefulWidget {
  final Function onYesTap;
  const SuretyDialog({Key? key, required this.onYesTap}) : super(key: key);

  @override
  State<SuretyDialog> createState() => _SuretyDialogState();
}

class _SuretyDialogState extends State<SuretyDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: EdgeInsets.all(16),
      contentPadding: EdgeInsets.zero,
      backgroundColor: Colors.transparent,
      content: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    'Delete',
                    style: FontConstant.k18w500F970Text,
                  ),
                ],
              ),
              SizedBox(height: 8),
              Text(
                'Are you sure you want to delete this post?',
                style: FontConstant.k16w500331FText,
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: materialButton2(context, () {
                      Navigator.pop(context);
                    }, 'No', AppColors().kF8F6FA, 44.0),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: materialButton(context, () {
                      widget.onYesTap();
                    }, 'Yes, Delete', AppColors().k8267AC, 44.0),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
