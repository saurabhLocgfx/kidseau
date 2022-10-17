import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/src/painting/text_style.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeColor {
  static const Color primarycolor = Color(0xff8267AC);
  static const Color primaryorange = Color(0xffF0AD56);
  static const Color lightpurple = Color(0xff8267AC);
}


// ------------------FONTS-------------------

class FontConstant {
  static TextStyle getTextStyle(Color color,
      double fontSize, {
        FontWeight? fontWeight,
      }) {
    return GoogleFonts.balooDa2(
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
    );

  }
  static TextStyle k18w500whiteText = GoogleFonts.balooDa2(
      fontWeight: FontWeight.w500, fontSize: 18, color: Colors.white);
  static TextStyle k32w500blackText = GoogleFonts.balooDa2(
      fontWeight: FontWeight.w500, fontSize: 32, color: Colors.black);
  static TextStyle k14w400lightText = GoogleFonts.balooDa2(
      fontWeight: FontWeight.w400, fontSize: 14, color: Color(0xffbeb1b9));
  static TextStyle k16blackboldText = GoogleFonts.balooDa2(
      fontWeight: FontWeight.normal, fontSize: 16, color: Colors.black);
  static TextStyle k13w400blackText = GoogleFonts.balooDa2(
      fontWeight: FontWeight.w400, fontSize: 13, color: Colors.black);
  static TextStyle k16w500purpleText = GoogleFonts.balooDa2(
      fontWeight: FontWeight.w500, fontSize: 16, color: Color(0xff8267AC),);
  static TextStyle k14w400lightpurpleText = GoogleFonts.balooDa2(
    fontWeight: FontWeight.w400, fontSize: 14, color: Color(0xffB7A4B2),);
  static TextStyle k18w500materialbuttonText = GoogleFonts.balooDa2(
      fontWeight: FontWeight.w500, fontSize: 18, color: Colors.white);
  static TextStyle k16w500brownText = GoogleFonts.balooDa2(
    fontWeight: FontWeight.w500, fontSize: 16, color: Color(0xff331F2D));

}

class FontConstant2 {
  static TextStyle getTextStyle(Color color,
      double fontSize, {
        FontWeight? fontWeight,
      }) {
    return GoogleFonts.balooThambi2(
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
    );

  }
  static TextStyle baloothampifont = GoogleFonts.balooDa2(
      fontWeight: FontWeight.w500, fontSize: 24, color: Color(0xff84717F ));
}