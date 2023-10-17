import 'package:flutter/material.dart';
import 'package:kidseau/Constants/text_style.dart';
import 'package:kidseau/Widgets/buttons.dart';
import 'package:path_provider/path_provider.dart';

import '../../../TeachersPanel/TLoginScreen/TLoginScreen.dart';
import '../../../Theme.dart';

class SuccessfullyDeletedScreen extends StatelessWidget {
  const SuccessfullyDeletedScreen({super.key});

  Future<void> _deleteAppDir() async {
    final appDir = await getApplicationSupportDirectory();

    if (appDir.existsSync()) {
      appDir.deleteSync(recursive: true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 320,
      //width: MediaQuery.of(context).size.width,
      child: /*Padding(
        padding: const EdgeInsets.only(right: 24,left: 24,top: 24),
        child:*/
          Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: Colors.white,
        ),
        padding: EdgeInsets.all(24),
        child: Column(
          children: [
            Center(
                child: Image.asset(
              'assets/images/successfully-done 1.png',
              height: 80,
            )),
            SizedBox(
              height: 24,
            ),
            Text(
              'Account deleted',
              style: k24_500_3CC56A,
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              'We’re looking forward to see you again',
              style: k16_500_847171F,
            ),
            SizedBox(
              height: 24,
            ),
            MainButton(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => TLoginScreen()));
                  _deleteAppDir();
                },
                title: 'Take me to Login',
                textStyleColor: Colors.white,
                backgroundColor: ThemeColor.primarycolor)
          ],
        ),
      ),
      //),
    );
  }
}
