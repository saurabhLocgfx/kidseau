import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kidseau/Design/Screens/HomeScreen/homescreen.dart';
import 'package:kidseau/TeachersPanel/Screens/THomeScreen/TKidsDetails.dart';
import 'package:kidseau/Theme.dart';

class TAllStudents extends StatefulWidget {
  const TAllStudents({Key? key}) : super(key: key);

  @override
  State<TAllStudents> createState() => _TAllStudentsState();
}

class _TAllStudentsState extends State<TAllStudents> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Color(0xff8267AC).withOpacity(0.16),
        ),
        backgroundColor: Color(0xff8267AC).withOpacity(0.16),
        title: Text(
          "All Students",
          style: FontConstant.k18w5008471Text,
        ),
        leading: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Image.asset(
                  "assets/images/backarrow.png",
                  height: 24,
                  width: 24,
                ),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              SizedBox(height: 20.h),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Students",
                  style: FontConstant2.baloothampifont,
                ),
              ),
              SizedBox(height: 8),
              ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 10,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TKidsOverview()),
                          );
                        },
                        child: SizedBox(
                            height: 128, width: 382, child: Studentcard()),
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
