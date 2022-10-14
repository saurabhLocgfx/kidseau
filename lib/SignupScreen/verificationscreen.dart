import 'package:flutter/material.dart';

class VerificationScreen extends StatelessWidget {
  const VerificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Color(0xFFFFFF00),
          gradient: LinearGradient(
            begin: Alignment(0.0, 0.0),
            end: Alignment(0, -1),
               colors: [Color.fromRGBO(190, 116, 170, 0.08)]
          ),
        )
    );
  }
}
