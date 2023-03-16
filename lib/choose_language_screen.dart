import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kidseau/Theme.dart';
import 'package:kidseau/Widgets/widgets.dart';
import 'package:kidseau/restartappwidget/restartwidgets.dart';
import 'package:kidseau/shard_prefs/shared_prefs.dart';

import 'ParentsPanel/POnboardingScreens/PStartScreen.dart';

class ChooseLanguageScreen extends StatelessWidget {
  const ChooseLanguageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff8267ac),
      body: SizedBox(
        width: 1.sw,
        height: 1.sh,
        child: Stack(
          children: [
            Container(
              height: 1.sh,
              width: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                color: Colors.transparent,
              ),
              child: Image.asset(
                "assets/images/onbbg.png",
                fit: BoxFit.cover,
              ),
            ),
            /*Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  color: Colors.white,
                  width: 1.sw,
                  height: 200.h,
                )),*/
            Positioned(
              top: 1.sh / 4,
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                height: 1.sh / 4,
                child: Container(
                  //width: 414.w,
                  //height: 1.sh,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: const Radius.circular(24.0),
                      topRight: const Radius.circular(24.0),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 59.h,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 120, right: 120),
                          child: mainlogo(),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.05,
                        ),
                        ListTile(
                          onTap: () {
                            UserPrefs.setEArbBool(false);
                            UserPrefs.setIsFirst(true);
                            UserPrefs.setLang('English');
                            context.locale = Locale('en', 'US');
                            RestartWidget.restartApp(context);
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (ctx) => PStartScreen()));
                          },
                          title: Text('English'.tr()),
                          trailing: Icon(Icons.arrow_forward_ios_rounded),
                        ),
                        ListTile(
                          onTap: () {
                            UserPrefs.setEArbBool(false);
                            UserPrefs.setIsFirst(true);
                            UserPrefs.setLang('French');
                            context.locale = Locale('fr', 'FR');
                            RestartWidget.restartApp(context);
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (ctx) => PStartScreen()));
                          },
                          title: Text('French'.tr()),
                          trailing: Icon(Icons.arrow_forward_ios_rounded),
                        ),
                        ListTile(
                          onTap: () {
                            UserPrefs.setEArbBool(true);
                            UserPrefs.setIsFirst(true);
                            UserPrefs.setLang('Arabic');
                            context.locale = Locale('ar', 'AR');
                            RestartWidget.restartApp(context);
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (ctx) => PStartScreen()));
                          },
                          title: Text('Arabic'.tr()),
                          trailing: Icon(Icons.arrow_forward_ios_rounded),
                        ),
                        Spacer(),
                        /*SizedBox(
                          height: 150,
                        ),*/
                        /*SizedBox(
                          height: Get.size.height * 0.18,
                        ),*/
                        //Image.asset("assets/images/Made with ❤️ Locgfx.png"),
                        Text(
                          'Made with ❤️ by HOMA DESIGN',
                          style: FontConstant.k16w400greyText,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
