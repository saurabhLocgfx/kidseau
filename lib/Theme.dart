import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/src/painting/text_style.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeColor {
  static const Color primarycolor = Color(0xff8267AC);
  static const Color primaryorange = Color(0xffF0AD56);
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

  static TextStyle headingText = GoogleFonts.balooDa2(
      fontWeight: FontWeight.w500, fontSize: 32, color: Colors.black);
  static TextStyle lightText = GoogleFonts.balooDa2(
      fontWeight: FontWeight.w400, fontSize: 14, color: Color(0xffbeb1b9));
  static TextStyle smallboldText = GoogleFonts.balooDa2(
      fontWeight: FontWeight.normal, fontSize: 16, color: Colors.black);
  static TextStyle smallnormalText = GoogleFonts.balooDa2(
      fontWeight: FontWeight.w400, fontSize: 13, color: Colors.black);
  static TextStyle smallpurpleText = GoogleFonts.balooDa2(
      fontWeight: FontWeight.w500, fontSize: 16, color: Color(0xff8267AC),);
  static TextStyle smalllightpurpleText = GoogleFonts.balooDa2(
    fontWeight: FontWeight.w400, fontSize: 14, color: Color(0xffB7A4B2),);
  static TextStyle materialbuttonText = GoogleFonts.balooDa2(
      fontWeight: FontWeight.w500, fontSize: 18, color: Colors.white);


}