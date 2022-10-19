import 'package:flutter/material.dart';
import 'package:kidseau/Design/Screens/Messages/messages.dart';
import 'package:kidseau/Design/Screens/Notifications/notifications.dart';
import 'package:kidseau/Design/Screens/Posts/posts.dart';
import 'package:kidseau/Design/Screens/Profile/profile.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final List screen = [
    Profile(),
    Posts(),
    NotificationScreen(),
    MessageScreen()
  ];
  int _selectedindex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
