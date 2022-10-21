import 'package:flutter/material.dart';
import 'package:kidseau/Design/Screens/HomeScreen/homescreen.dart';
import 'package:kidseau/Design/Screens/Messages/messages.dart';
import 'package:kidseau/Design/Screens/Notifications/notifications.dart';
import 'package:kidseau/Design/Screens/Posts/posts.dart';
import 'package:kidseau/Design/Screens/Profile/profile.dart';
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

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  PageController _pageController = PageController(
    initialPage: 0,
  );
  int currentIndex = 0;

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
      bottomNavigationBar: buildBottomNavigationBar(context),
      body: PageView(
        controller: _pageController,
        onPageChanged: (page) {
          setState(
            () {
              currentIndex = page;
            },
          );
        },
        children: <Widget>[
          HomeScreen(),
          Profile(),
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
        borderRadius: BorderRadius.circular(20),
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
                  child: GestureDetector(
                    onTap: () {},
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
                  ),
                );
              }),
        ),
      ),
    );
  }

  Container buildBottomNavigationBar(BuildContext context) {
    return Container(
      height: 64,
      width: 382,
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      child: BottomNavigationBar(
        selectedItemColor: ThemeColor.primarycolor,
        unselectedItemColor: ThemeColor.primarycolor,
        currentIndex: currentIndex,
        onTap: (value) {
          currentIndex = value;
          _pageController.animateToPage(
            value,
            duration: Duration(milliseconds: 200),
            curve: Curves.linear,
          );

          setState(() {});
        },
        items: [
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage(
                "assets/images/iconhome.png",
              ),
            ),
            label: "First",
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("assets/images/iconprofile2.png"),
            ),
            label: "Second",
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("assets/images/Postsicon.png"),
            ),
            label: "Third",
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("assets/images/notificationicon.png"),
            ),
            label: "Third",
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("assets/images/messageicon.png"),
            ),
            label: "Third",
          ),
        ],
      ),
    );
  }
}
