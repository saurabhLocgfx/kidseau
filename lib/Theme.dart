import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/src/painting/text_style.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeColor {
  static const Color primarycolor = Color(0xff8267ac);
  static const Color primaryorange = Color(0xfff0ad56);
}


// ------------------FONTS-------------------

class FontConstant {
  static TextStyle getTextStyle(Color color,
      double fontSize, {
        FontWeight? fontWeight,
      }) {
    return GoogleFonts.montserrat(
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
    );
  }

  static TextStyle headingText = GoogleFonts.montserrat(
      fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black);
  static TextStyle lightText = GoogleFonts.montserrat(
      fontWeight: FontWeight.normal, fontSize: 13, color: Color(0xffbeb1b9));


}