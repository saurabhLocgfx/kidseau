import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kidseau/Theme.dart';

class Kidsprofile extends StatefulWidget {
  const Kidsprofile({Key? key}) : super(key: key);

  @override
  State<Kidsprofile> createState() => _KidsprofileState();
}

class _KidsprofileState extends State<Kidsprofile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Color(0xff8267AC).withOpacity(0.16),
        ),
        backgroundColor: Color(0xff8267AC).withOpacity(0.16),
        title: Text(
          "Kid’s Profile",
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
        child: Stack(
          children: [
            Image.asset(
              "assets/images/postsbackground.png",
              height: 414,
              width: 414,
            ),
            Column(
              children: [
                SizedBox(height: 144),
                Row(
                  children: [
                    Container(
                      height: 128.h,
                      width: 96.2.w,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  "assets/images/profileperson.png"))),
                    ),
                    SizedBox(width: 24),
                    Column(
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
                        Text("xyz@gmail.com",
                            style: FontConstant.k16w5008471Text),
                      ],
                    ),
                  ],
                ),
                Text(
                  "kid",
                  style: FontConstant2.k22w5008471text,
                ),
                Container(
                  height: 120,
                  child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemCount: 4,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          child: Column(
                            children: [
                              Text(
                                "Age",
                                style: FontConstant.k16w500331FText,
                              ),
                            ],
                          ),
                        );
                      }),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
