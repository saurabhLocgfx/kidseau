import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kidseau/ParentsPanel/PHomeScreen/PHomeScreen.dart';
import 'package:kidseau/ParentsPanel/PMessageScreen/PMessageDashboard.dart';
import 'package:kidseau/ParentsPanel/PNotificationScreen/PNotificationScreen.dart';
import 'package:kidseau/ParentsPanel/PPostsScreen/PPostScreen.dart';
import 'package:kidseau/ParentsPanel/PProfileScreens/PProfileDashBoard.dart';
import 'package:kidseau/Theme.dart';

// class Dashboard extends StatefulWidget {
//   const Dashboard({Key? key}) : super(key: key);
//
//   @override
//   State<Dashboard> createState() => _DashboardState();
// }

// class _DashboardState extends State<Dashboard> {
//   // final List screen = [
//   //   HomeScreen(),
//   //   Profile(),
//   //   Posts(),
//   //   NotificationScreen(),
//   //   MessageScreen()
//   // ];
//   int bottomSelectedIndex = 0;
//
//   List<BottomBarData> BottomNavBar() {
//     return [
//       BottomBarData(
//           text: "Home",
//           image: "assets/images/Homeicon.png",
//           selected: true,
//           onPressed: () {}),
//       BottomBarData(
//           text: "Home",
//           image: "assets/images/Homeicon.png",
//           selected: true,
//           onPressed: () {}),
//       BottomBarData(
//           text: "Home",
//           image: "assets/images/Homeicon.png",
//           selected: true,
//           onPressed: () {}),
//       BottomBarData(
//           text: "Home",
//           image: "assets/images/Homeicon.png",
//           selected: true,
//           onPressed: () {}),
//       BottomBarData(
//           text: "Home",
//           image: "assets/images/Homeicon.png",
//           selected: true,
//           onPressed: () {}),
//     ];
//   }
//
//   PageController pageController = PageController(
//     initialPage: 0,
//     keepPage: true,
//   );
//
//   Widget buildPageView() {
//     return PageView(
//       controller: pageController,
//       onPageChanged: (index) {
//         pageChanged(index);
//       },
//       children: <Widget>[
//         HomeScreen(),
//         Profile(),
//         Posts(),
//         NotificationScreen(),
//         MessageScreen()
//       ],
//     );
//   }
//
//   @override
//   void initState() {
//     super.initState();
//   }
//
//   void pageChanged(int index) {
//     setState(() {
//       bottomSelectedIndex = index;
//     });
//   }
//
//   void bottomTapped(int index) {
//     setState(() {
//       bottomSelectedIndex = index;
//       pageController.animateToPage(index,
//           duration: Duration(milliseconds: 500), curve: Curves.ease);
//     });
//   }
//
//   @override
//   Widget buildPageView() {
//     return PageView(
//       controller: pageController,
//       onPageChanged: (index) {
//         pageChanged(index);
//       },
//       children: <Widget>[
//         HomeScreen(),
//         Profile(),
//         Posts(),
//         NotificationScreen(),
//         MessageScreen()
//       ],
//     );
//   }
//
//   @override
//   void initState() {
//     super.initState();
//   }
//
//
// @override
// Widget build(BuildContext context) {
//   return Scaffold(
//     body: buildPageView(),
//     bottomNavigationBar: BottomNavBar();
//   );
// }
// }

class PDashboard extends StatefulWidget {
  const PDashboard({Key? key}) : super(key: key);
  @override
  _PDashboardState createState() => _PDashboardState();
}

class _PDashboardState extends State<PDashboard> {
  final PageController _pageController = PageController(
    initialPage: 0,
  );
  int pageIndex = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: buildMyNavBar(context),
      // bottomNavigationBar: Padding(
      //   padding: const EdgeInsets.all(20.0),
      //   child: CustomNavigationBar(
      //     strokeColor: ThemeColor.primarycolor,
      //     borderRadius: Radius.circular(120.0),
      //     currentIndex: currentIndex,
      //     selectedColor: Colors.purple,
      //     unSelectedColor: Colors.red,
      //     backgroundColor: Colors.white,
      //     onTap: (value) {
      //       currentIndex = value;
      //       _pageController.animateToPage(
      //         value,
      //         duration: Duration(milliseconds: 200),
      //         curve: Curves.linear,
      //       );
      //       setState(() {});
      //     },
      //     items: [
      //       CustomNavigationBarItem(
      //         icon: ImageIcon(AssetImage("assets/images/iconhome.png")),
      //         title: Text(
      //           "Home",
      //           style: TextStyle(
      //             fontWeight: FontWeight.w500,
      //             fontSize: 14,
      //             color: currentIndex == currentIndex
      //                 ? Color(0xff8267AC)
      //                 : Colors.red,
      //           ),
      //         ),
      //       ),
      //       CustomNavigationBarItem(
      //         icon: Icon(Icons.shopping_cart),
      //         title: Text(
      //           "Cart",
      //           style: TextStyle(
      //             fontWeight: FontWeight.w500,
      //             fontSize: 14,
      //             color: currentIndex == currentIndex
      //                 ? Color(0xff8267AC)
      //                 : Colors.red,
      //           ),
      //         ),
      //       ),
      //       CustomNavigationBarItem(
      //         icon: Icon(Icons.lightbulb_outline),
      //         title: Text(
      //           "Explore",
      //           style: TextStyle(
      //             fontWeight: FontWeight.w500,
      //             fontSize: 14,
      //             color: currentIndex == currentIndex
      //                 ? Color(0xff8267AC)
      //                 : Colors.green,
      //           ),
      //         ),
      //       ),
      //       CustomNavigationBarItem(
      //         icon: Icon(Icons.search),
      //         title: Text(
      //           "Search",
      //           style: TextStyle(
      //             fontWeight: FontWeight.w500,
      //             fontSize: 14,
      //             color: currentIndex == currentIndex
      //                 ? Color(0xff8267AC)
      //                 : Colors.red,
      //           ),
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (page) {
          setState(
            () {
              pageIndex = page;
            },
          );
        },
        children: <Widget>[
          PHomeScreen(),
          PProfileDashBoard(),
          PPostScreen(),
          PNotificationScreen(),
          PMessageDashboard(),

          // HomeProfile(),
          // Posts(),
          // NotificationScreen(),
          // MessageScreen()
        ],
      ),
    );
  }

  // Padding Bottombar() {
  //   return Padding(
  //     padding: const EdgeInsets.all(20),
  //     child: Material(
  //       elevation: 10,
  //       borderRadius: BorderRadius.circular(131),
  //       color: Colors.white,
  //       child: Container(
  //         height: 64,
  //         width: 382,
  //         child: ListView.builder(
  //             scrollDirection: Axis.horizontal,
  //             physics: NeverScrollableScrollPhysics(),
  //             itemCount: imagedata.length,
  //             itemBuilder: (ctx, i) {
  //               return GestureDetector(
  //                 onTap: () {
  //                   setState(() {
  //                     selectedIndex = i;
  //                   });
  //                 },
  //                 child: Container(
  //                   height: 62,
  //                   width: 68,
  //                   child: Row(
  //                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //                     children: [
  //                       Column(
  //                         mainAxisAlignment: MainAxisAlignment.center,
  //                         children: [
  //                           Image.asset(
  //                             imagedata[i],
  //                             height: 24,
  //                             width: 24,
  //                             color: i == selectedIndex
  //                                 ? Color(0xffB7A4B2)
  //                                 : Color(0xffB7A4B2),
  //                           ),
  //                           Text(
  //                             txt[i],
  //                             style: TextStyle(
  //                               fontSize: 12,
  //                               fontWeight: FontWeight.w400,
  //                               color: i == selectedIndex
  //                                   ? Color(0xffB7A4B2)
  //                                   : Color(0xffB7A4B2),
  //                             ),
  //                           )
  //                         ],
  //                       ),
  //                     ],
  //                   ),
  //                 ),
  //               );
  //             }),
  //       ),
  //     ),
  //   );
  // }

  // Container buildBottomNavigationBar(BuildContext context) {
  //   return Container(
  //     height: 64,
  //     width: 382,
  //     margin: EdgeInsets.all(20),
  //     decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
  //     child: BottomNavigationBar(
  //       selectedLabelStyle: ,
  //       selectedItemColor: ThemeColor.primarycolor,
  //       unselectedItemColor: ThemeColor.primarycolor,
  //       currentIndex: currentIndex,
  //       onTap: (value) {
  //         currentIndex = value;
  //         _pageController.animateToPage(
  //           value,
  //           duration: Duration(milliseconds: 200),
  //           curve: Curves.linear,
  //         );
  //
  //         setState(() {});
  //       },
  //       items: [
  //         BottomNavigationBarItem(
  //           icon: ImageIcon(
  //             AssetImage(
  //               "assets/images/iconhome.png",
  //             ),
  //           ),
  //           label: "First",
  //         ),
  //         BottomNavigationBarItem(
  //           icon: ImageIcon(
  //             AssetImage("assets/images/iconprofile2.png"),
  //           ),
  //           label: "Second",
  //         ),
  //         BottomNavigationBarItem(
  //           icon: ImageIcon(
  //             AssetImage("assets/images/Postsicon.png"),
  //           ),
  //           label: "Third",
  //         ),
  //         BottomNavigationBarItem(
  //           icon: ImageIcon(
  //             AssetImage("assets/images/notificationicon.png"),
  //           ),
  //           label: "Third",
  //         ),
  //         BottomNavigationBarItem(
  //           icon: ImageIcon(
  //             AssetImage("assets/images/messageicon.png"),
  //           ),
  //           label: "Third",
  //         ),
  //       ],
  //     ),
  //   );
  // }
  Container buildMyNavBar(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      height: 56.h,
      width: 382.w,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(126),
        boxShadow: [
          BoxShadow(
            color: Color(0xff5D3D8F).withOpacity(0.3),
            spreadRadius: 0,
            blurRadius: 16,
            offset: Offset(0, 0), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InkWell(
            onTap: () {
              setState(() {
                selectedIndex = pageIndex = 0;
                _pageController.jumpToPage(
                  pageIndex,
                );
                pageIndex = 0;
              });
            },
            child: Container(
              color: Colors.transparent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    pageIndex == 0
                        ? "assets/images/homeiconfill.png"
                        : "assets/images/iconhome.png",
                    height: 24,
                    // color: pageIndex == 0 ? Colors.green : Colors.grey,
                  ),
                  Text("Home".tr(),
                      style: FontConstant.k12w400B7A4Text.copyWith(
                          color: pageIndex == 0
                              ? Color(0xff8267AC)
                              : Color(0xffB7A4B2)))
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                selectedIndex = pageIndex = 1;
                _pageController.jumpToPage(
                  pageIndex,
                );
                pageIndex = 1;
              });
            },
            child: Container(
              color: Colors.transparent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    pageIndex == 1
                        ? "assets/images/profileiconfill.png"
                        : "assets/images/profileicon.png",
                    height: 24,
                  ),
                  Text("Profile".tr(),
                      style: FontConstant.k12w400B7A4Text.copyWith(
                          color: pageIndex == 1
                              ? Color(0xff8267AC)
                              : Color(0xffB7A4B2)))
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = pageIndex = 2;
                _pageController.jumpToPage(
                  pageIndex,
                );
                pageIndex = 2;
              });
            },
            child: Container(
              color: Colors.transparent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    pageIndex == 2
                        ? "assets/images/postsiconfill.png"
                        : "assets/images/Postsicon.png",
                    height: 24,
                  ),
                  Text("Posts".tr(),
                      style: FontConstant.k12w400B7A4Text.copyWith(
                          color: pageIndex == 2
                              ? Color(0xff8267AC)
                              : Color(0xffB7A4B2)))
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = pageIndex = 3;
                _pageController.jumpToPage(
                  pageIndex,
                );
                pageIndex = 3;
              });
            },
            child: Container(
              color: Colors.transparent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    pageIndex == 3
                        ? "assets/images/notificationiconfill.png"
                        : "assets/images/notificationicon.png",
                    height: 24,
                  ),
                  Text("Notification".tr(),
                      style: FontConstant.k12w400B7A4Text.copyWith(
                          color: pageIndex == 3
                              ? Color(0xff8267AC)
                              : Color(0xffB7A4B2)))
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = pageIndex = 4;
                _pageController.jumpToPage(
                  pageIndex,
                );
                pageIndex = 4;
              });
            },
            child: Container(
              color: Colors.transparent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    pageIndex == 4
                        ? "assets/images/messageiconfill.png"
                        : "assets/images/messageicon.png",
                    height: 24,
                  ),
                  Text("Message".tr(),
                      style: FontConstant.k12w400B7A4Text.copyWith(
                          color: pageIndex == 4
                              ? Color(0xff8267AC)
                              : Color(0xffB7A4B2)))
                ],
              ),
            ),
          ),

          // IconButton(
          //     // enableFeedback: false,
          //     onPressed: () {
          //       setState(() {
          //         pageIndex = 0;
          //       });
          //     },
          //     icon: pageIndex == 0
          //         ? const ImageIcon(
          //             AssetImage("assets/images/Galleryfill.png"),
          //             color: Color(0xffB7A4B2),
          //             size: 35,
          //           )
          //         : const ImageIcon(
          //             AssetImage("assets/images/galleryicon.png"),
          //             color: Color(0xffB7A4B2),
          //             size: 35,
          //           )),
          // IconButt on(
          //     // enableFeedback: false,
          //     onPressed: () {
          //       setState(() {
          //         pageIndex = 1;
          //       });
          //     },
          //     icon: pageIndex == 1
          //         ? const ImageIcon(
          //             AssetImage("assets/images/Galleryfill.png"),
          //             color: Color(0xff8267AC),
          //             size: 35,
          //           )
          //         : const ImageIcon(
          //             AssetImage("assets/images/galleryicon.png"),
          //             color: Color(0xffB7A4B2),
          //             size: 35,
          //           )),
          // IconButton(
          //     // enableFeedback: false,
          //     onPressed: () {
          //       setState(() {
          //         pageIndex = 2;
          //       });
          //     },
          //     icon: pageIndex == 2
          //         ? const ImageIcon(
          //             AssetImage("assets/images/Galleryfill.png"),
          //             color: Color(0xff8267AC),
          //             size: 35,
          //           )
          //         : const ImageIcon(
          //             AssetImage("assets/images/galleryicon.png"),
          //             color: Color(0xffB7A4B2),
          //             size: 35,
          //           )),
          // IconButton(
          //     // enableFeedback: false,
          //     onPressed: () {
          //       setState(() {
          //         pageIndex = 3;
          //       });
          //     },
          //     icon: pageIndex == 3
          //         ? const ImageIcon(
          //             AssetImage("assets/images/Galleryfill.png"),
          //             color: Color(0xff8267AC),
          //             size: 35,
          //           )
          //         : const ImageIcon(
          //             AssetImage("assets/images/galleryicon.png"),
          //             color: Color(0xffB7A4B2),
          //             size: 35,
          //           )),
          // IconButton(
          //     // enableFeedback: false,
          //     onPressed: () {
          //       setState(() {
          //         pageIndex = 4;
          //       });
          //     },
          //     icon: pageIndex == 4
          //         ? const ImageIcon(
          //             AssetImage("assets/images/Galleryfill.png"),
          //             color: Color(0xffB7A4B2),
          //             size: 35,
          //           )
          //         : const ImageIcon(
          //             AssetImage("assets/images/galleryicon.png"),
          //             color: Colors.white,
          //             size: 35,
          //           )),
        ],
      ),
    );
  }
}
// bottomNavigationBar: FloatingNavbar(
//   backgroundColor: Colors.white,
//   unselectedItemColor: Colors.red,
//   selectedItemColor: Colors.purple,
//   currentIndex: currentIndex,
//   onTap: (value) {
//     currentIndex = value;
//     _pageController.animateToPage(
//       value,
//       duration: Duration(milliseconds: 200),
//       curve: Curves.linear,
//     );
//     setState(() {});
//   },
//   items: [
//     FloatingNavbarItem( icon: ImageIcon(AssetImage("assets/images/iconhome.png")), title: 'Home'),
//     FloatingNavbarItem(icon: Icons.explore, title: 'Explore'),
//     FloatingNavbarItem(icon: Icons.chat_bubble_outline, title: 'Chats'),
//     FloatingNavbarItem(icon: Icons.settings, title: 'Settings'),
//   ],
// ),
