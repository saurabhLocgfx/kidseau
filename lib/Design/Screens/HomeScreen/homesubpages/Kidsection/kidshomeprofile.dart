import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kidseau/Design/Screens/HomeScreen/homesubpages/Kidsection/kidsgallery.dart';
import 'package:kidseau/Design/Screens/HomeScreen/homesubpages/Kidsection/kidsprofileoverview.dart';
import 'package:kidseau/Theme.dart';

class KidsHomeProfile extends StatefulWidget {
  const KidsHomeProfile({Key? key}) : super(key: key);

  @override
  State<KidsHomeProfile> createState() => _KidsHomeProfileState();
}

class _KidsHomeProfileState extends State<KidsHomeProfile> {
  List<String> imageicon = [
    "assets/images/iconprofile.png",
    "assets/images/galleryicon.png",
  ];

  List<String> items = [
    "Overview",
    "Gallery",
  ];
  // final List screen = [Messagebody(),];
  int current = 0;

  final controller = PageController(initialPage: 1);

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  PageController _pageController = PageController(
    initialPage: 0,
  );

  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xff8267AC).withOpacity(.06),
      ),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
            automaticallyImplyLeading: false,
            elevation: 0,
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: ThemeColor.lightpurple.withOpacity(0.06),
            ),
            backgroundColor: Color(0xff8267AC).withOpacity(0.06),
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
            title: Padding(
                padding: const EdgeInsets.only(top: 0.0),
                child: GestureDetector(
                    onTap: () {},
                    child: Text("Kid’s Profile",
                        style: FontConstant.k18w5008471Text)))),
        body: Stack(
          children: [
            Container(
              height: 414.h,
              width: 414.w,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xffD9D9D9).withOpacity(.100),
                      Color(0xffD9D9D9).withOpacity(.0),
                    ],
                  ),
                  image: DecorationImage(
                      image: AssetImage("assets/images/postsbackground.png"))),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  SizedBox(height: 110),
                  Row(
                    children: [
                      Container(
                        height: 128.h,
                        width: 96.w,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                    "assets/images/profileperson.png"))),
                      ),
                      SizedBox(width: 24),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Nobita",
                            style: FontConstant2.k32w500331Ftext,
                          ),
                          Text(
                            "S/O -  Akbar",
                            style: FontConstant.k16w5008471Text,
                          ),
                          Text("xyz@gmail.com",
                              style: FontConstant.k16w5008471Text),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 40),
                  Container(
                    height: 56,
                    width: 248,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(76)),
                    child: Container(
                      child: ListView.builder(
                          itemCount: items.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (ctx, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    current = index;
                                  });
                                },
                                child: Container(
                                  height: 56,
                                  width: 108,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Row(
                                        children: [
                                          Stack(children: [
                                            Visibility(
                                              visible: current == index,
                                              child: Container(
                                                width: 40,
                                                height: 40,
                                                decoration: const BoxDecoration(
                                                    color: Color(0xffEBE6F2),
                                                    shape: BoxShape.circle),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Image.asset(
                                                imageicon[index],
                                                height: 24,
                                                width: 24,
                                                color: current == index
                                                    ? Color(0xff8267AC)
                                                    : Color(0xffB7A4B2),
                                              ),
                                            ),
                                          ]),
                                          SizedBox(width: 8),
                                          Text(
                                            items[index],
                                            style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14,
                                              color: current == index
                                                  ? Color(0xff8267AC)
                                                  : Color(0xffB7A4B2),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                  ),
                  SizedBox(height: 20),
                  Expanded(
                    child: PageView(
                      controller: _pageController,
                      onPageChanged: (page) {
                        setState(
                          () {
                            currentIndex = page;
                          },
                        );
                      },
                      children: [KidsProfileOverview(), KidsGallery()],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
