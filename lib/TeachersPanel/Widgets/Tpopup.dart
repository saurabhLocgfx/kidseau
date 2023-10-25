import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kidseau/Google_SignIn/google_sign_in.dart';
import 'package:kidseau/TeachersPanel/TProfileScreen/TSettings.dart';
import 'package:kidseau/TeachersPanel/TProfileScreen/TSyllabus.dart';
import 'package:kidseau/Theme.dart';
import 'package:path_provider/path_provider.dart';

import '../../ParentsPanel/POnboardingScreens/PStartScreen.dart';
import '../../Widgets/custom_snack_bar.dart';
import '../../api/logout_api/logout_api.dart';
import '../../shard_prefs/shared_prefs.dart';

class TProfilepopup extends StatelessWidget {
  const TProfilepopup({
    Key? key,
  }) : super(key: key);

  Future<void> _deleteAppDir() async {
    final appDir = await getApplicationSupportDirectory();

    if (appDir.existsSync()) {
      appDir.deleteSync(recursive: true);
    }
  }

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
              child: GestureDetector(
                behavior: HitTestBehavior.translucent,
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
            ),
            PopupMenuItem(
              enabled: false,
              child: GestureDetector(
                behavior: HitTestBehavior.translucent,
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
            ),
            PopupMenuItem(
              enabled: false,
              child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  final resp = LogoutApi().get();
                  resp.then((value) async {
                    if (value['status'] == 1) {
                      UserPrefs.clearData(UserPrefs.cookies);
                      UserPrefs.clearData(UserPrefs.Teacher);
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(builder: (ctx) => PStartScreen()),
                          (route) => false);
                      CustomSnackBar.customSnackBar(
                          context, 'Logged out successfully.');
                      GoogleSignInHelper().signOut();
                      // await DefaultCacheManager().emptyCache();
                      // _deleteAppDir();
                    } else {}
                  });
                },
                child: Row(
                  children: [
                    Image.asset(
                      "assets/images/newlogout.png",
                      height: 24,
                    ),
                    // Icon(
                    //   Icons.logout,
                    //   color: Color(0xff331F2D),
                    // ),
                    SizedBox(width: 15),
                    Text(
                      "Logout".tr(),
                      style: FontConstant.k18w5008471Text,
                    )
                  ],
                ),
              ),
            ),
          ];
        });
  }
}
