import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kidseau/TeachersPanel/TProfileScreen/TSettings.dart';
import 'package:kidseau/TeachersPanel/TProfileScreen/TSyllabus.dart';
import 'package:kidseau/Theme.dart';

class TProfilepopup extends StatelessWidget {
  const TProfilepopup({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        iconSize: 48,
        icon: ImageIcon(
          AssetImage(
            "assets/images/optionicon.png",
          ),
          color: ThemeColor.darkpurple,
        ),
        itemBuilder: (context) {
          return [
            PopupMenuItem(
              enabled: false,
              child: Padding(
                padding: const EdgeInsets.only(left: 15.0, top: 15, bottom: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => TSyllabus()),
                        );
                      },
                      child: Row(
                        children: [
                          Image.asset(
                            "assets/images/syllabusicon.png",
                            height: 24,
                          ),
                          SizedBox(width: 15),
                          Text(
                            "Syllabus".tr(),
                            /*AppLoaclizations.of(context)!
                                .translate("Syllabus")
                                .toString(),*/
                            style: FontConstant.k18w5008471Text,
                          )
                        ],
                      ),
                    ),
                    /*SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                        // Navigator.of(context).push(
                        //   MaterialPageRoute(
                        //     builder: (context) => Fees(),
                        //   ),
                        // );
                      },
                      child: Row(
                        children: [
                          Image.asset(
                            "assets/images/feesicon.png",
                            height: 24,
                          ),
                          SizedBox(width: 15),
                          Text(
                            AppLoaclizations.of(context)!
                                .translate("Fees")
                                .toString(),
                            style: FontConstant.k18w5008471Text,
                          )
                        ],
                      ),
                    ),*/
                    SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => TSettings(),
                          ),
                        );
                      },
                      child: Row(
                        children: [
                          Image.asset(
                            "assets/images/gearicon.png",
                            height: 24,
                          ),
                          SizedBox(width: 15),
                          Text(
                            "Settings".tr(),
                            /*AppLoaclizations.of(context)!
                                .translate("Settings")
                                .toString(),*/
                            style: FontConstant.k18w5008471Text,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ];
        });
  }
}
