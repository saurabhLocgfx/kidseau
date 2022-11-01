import 'package:flutter/material.dart';
import 'package:kidseau/Design/Screens/HomeScreen/homescreen.dart';
import 'package:kidseau/Design/Screens/Messages/MessageScreen.dart';
import 'package:kidseau/Design/Screens/Notifications/notifications.dart';
import 'package:kidseau/Design/Screens/Posts/posts.dart';
import 'package:kidseau/Design/Screens/Profile/ProfileScreen.dart';

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

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  PageController _pageController = PageController(
    initialPage: 0,
  );
  int pageIndex = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  List<String> imagedata = [
    "assets/images/iconhome.png",
    "assets/images/iconprofile.png",
    "assets/images/Postsicon.png",
    "assets/images/notificationicon.png",
    "assets/images/messageicon.png",
  ];
  List<String> txt = [
    "Home",
    "Profile",
    "Posts",
    "Notification",
    "Message",
  ];
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
          HomeScreen(),
          ProfileScreen(),
          Posts(),
          NotificationScreen(),
          MessageScreen()
        ],
      ),
    );
  }

  Padding Bottombar() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Material(
        elevation: 10,
        borderRadius: BorderRadius.circular(131),
        color: Colors.white,
        child: Container(
          height: 64,
          width: 382,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: NeverScrollableScrollPhysics(),
              itemCount: imagedata.length,
              itemBuilder: (ctx, i) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = i;
                    });
                  },
                  child: Container(
                    height: 62,
                    width: 68,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              imagedata[i],
                              height: 24,
                              width: 24,
                              color: i == selectedIndex
                                  ? Color(0xffB7A4B2)
                                  : Color(0xffB7A4B2),
                            ),
                            Text(
                              txt[i],
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: i == selectedIndex
                                    ? Color(0xffB7A4B2)
                                    : Color(0xffB7A4B2),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }

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
      height: 64,
      width: 382,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(126),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                pageIndex = 0;
              });
            },
            child: Image.asset(
              "assets/images/galleryicon.png",
              color: pageIndex == 0 ? Colors.green : Colors.grey,
            ),
          ),
          Image.asset(
            "assets/images/galleryicon.png",
            color: pageIndex == 1 ? Colors.green : Colors.grey,
          ),
          Image.asset(
            "assets/images/galleryicon.png",
            color: pageIndex == 2 ? Colors.green : Colors.grey,
          ),
          Image.asset(
            "assets/images/galleryicon.png",
            color: pageIndex == 3 ? Colors.green : Colors.grey,
          ),
          Image.asset(
            "assets/images/galleryicon.png",
            color: pageIndex == 4 ? Colors.green : Colors.grey,
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
          // IconButton(
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
