import 'package:flutter/material.dart';

class ScreenLoader{
  void onLoading(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          insetPadding: EdgeInsets.symmetric(horizontal: 100),
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircularProgressIndicator()
              ],
            ),
          ),
        );
      },
    );
   // _isLoading ? null : Navigator.pop(context); //pop dialog
  }
}