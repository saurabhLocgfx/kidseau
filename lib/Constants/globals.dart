import 'package:flutter/material.dart';

class TextFieldUnFocusOnTap extends StatelessWidget {
  final Widget child;
  const TextFieldUnFocusOnTap({Key? key, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: child,
    );
  }
}

class ExitApp extends StatefulWidget {
  final Widget child;
  ExitApp({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  State<ExitApp> createState() => _ExitAppState();
}

class _ExitAppState extends State<ExitApp> {
  DateTime? _currentBackPressTime;
  DateTime _lastExitTime = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        DateTime now = DateTime.now();

        if (_currentBackPressTime == null ||
            now.difference(_currentBackPressTime!) > Duration(seconds: 2)) {
          _currentBackPressTime = now;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Press back button again to exit'),
            ),
          );
          return false;
        }

        return true;
      },
      child: widget.child,
    );
  }
}
