import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kidseau/Design/Screens/Messages/Messages.dart';
import 'package:kidseau/Design/Screens/Messages/Teachers.dart';
import 'package:kidseau/Design/Screens/ReminderScreens/ReminderScreen.dart';
import 'package:kidseau/Theme.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({Key? key}) : super(key: key);

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  List<String> imageicon = [
    "assets/images/micon.png",
    "assets/images/ticon.png",
  ];

  List<String> items = [
    "Message",
    "Teacher",
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
      height: 896.h,
      width: 414.w,
      decoration: BoxDecoration(
        gradient: new LinearGradient(colors: [
          Color(0xffFFFFFF),
          Color(0xff8267AC).withOpacity(0.6),
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
      ),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: ThemeColor.lightpurple.withOpacity(0.16),
          ),
          backgroundColor: Color(0xff8267AC).withOpacity(0.16),
          title: Padding(
            padding: const EdgeInsets.only(top: 0.0),
            child: GestureDetector(
              onTap: () {
                // Navigator.of(context).push(MaterialPageRoute(
                //     builder: (context) => NotificationScreen()));
              },
              child: Text("Messages",
                  style: FontConstant.k32w5008267Text.copyWith(fontSize: 25)),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Row(
                children: [
                  Image.asset(
                    "assets/images/appbaricon1.png",
                    height: 48,
                    width: 48,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ReminderScreen(),
                        ),
                      );
                    },
                    child: Image.asset(
                      "assets/images/appbarclock.png",
                      height: 24,
                      width: 24,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
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
                                  crossAxisAlignment: CrossAxisAlignment.center,
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
                                            padding: const EdgeInsets.all(8.0),
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
              ],
            ),
            SizedBox(height: 24.h),
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
                children: <Widget>[
                  Messages(),
                  Teachers(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
