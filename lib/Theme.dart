import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/painting/text_style.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeColor {
  static const Color primarycolor = Color(0xff8267AC);
  static const Color primaryorange = Color(0xffF0AD56);
  static const Color lightpurple = Color(0xff8267AC);
  static const Color darkpurple = Color(0xff84717F);
}

// ------------------FONTS-------------------

class FontConstant {
  static TextStyle getTextStyle(
    Color color,
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
  static TextStyle k18w5008471Text = GoogleFonts.balooDa2(
      fontWeight: FontWeight.w500, fontSize: 18, color: Color(0xff84717F));
  static TextStyle k18w5008267Text = GoogleFonts.balooDa2(
      fontWeight: FontWeight.w500, fontSize: 18, color: Color(0xff8267AC));
  static TextStyle k32w500blackText = GoogleFonts.balooDa2(
      fontWeight: FontWeight.w500, fontSize: 32, color: Colors.black);
  static TextStyle k18w500331FText = GoogleFonts.balooDa2(
      fontWeight: FontWeight.w500, fontSize: 18, color: Color(0xff331F2D));
  static TextStyle k14w400lightText = GoogleFonts.balooDa2(
      fontWeight: FontWeight.w400, fontSize: 14, color: Color(0xffbeb1b9));
  static TextStyle k22w5008471Text = GoogleFonts.balooDa2(
      fontWeight: FontWeight.w500, fontSize: 22, color: Color(0xff84717F));
  static TextStyle k16blackboldText = GoogleFonts.balooDa2(
      fontWeight: FontWeight.normal, fontSize: 16, color: Colors.black);
  static TextStyle k13w400blackText = GoogleFonts.balooDa2(
      fontWeight: FontWeight.w400, fontSize: 13, color: Colors.black);
  static TextStyle k16w500purpleText = GoogleFonts.balooDa2(
    fontWeight: FontWeight.w500,
    fontSize: 16,
    color: Color(0xff8267AC),
  );
  static TextStyle k16w5008267Text = GoogleFonts.balooDa2(
    fontWeight: FontWeight.w500,
    fontSize: 16,
    color: Color(0xff8267AC),
  );
  static TextStyle k32w5008267Text = GoogleFonts.balooDa2(
    fontWeight: FontWeight.w500,
    fontSize: 32,
    color: Color(0xff8267AC),
  );
  static TextStyle k14w400lightpurpleText = GoogleFonts.balooDa2(
    fontWeight: FontWeight.w400,
    fontSize: 14,
    color: Color(0xffB7A4B2),
  );
  static TextStyle k14w4008471Text = GoogleFonts.balooDa2(
    fontWeight: FontWeight.w400,
    fontSize: 14,
    color: Color(0xff84717F),
  );
  static TextStyle k32w500l6666Text = GoogleFonts.balooDa2(
    fontWeight: FontWeight.w400,
    fontSize: 32,
    color: Color(0xffB7A4B2),
  );
  static TextStyle k14w400B7A4Text = GoogleFonts.balooDa2(
    fontWeight: FontWeight.w400,
    fontSize: 14,
    color: Color(0xffB7A4B2),
  );
  static TextStyle k16w400B7A4Text = GoogleFonts.balooDa2(
    fontWeight: FontWeight.w400,
    fontSize: 16,
    color: Color(0xffB7A4B2),
  );
  static TextStyle k14w500B7A4Text = GoogleFonts.balooDa2(
    fontWeight: FontWeight.w500,
    fontSize: 14,
    color: Color(0xffB7A4B2),
  );

  static TextStyle k18w500materialbuttonText = GoogleFonts.balooDa2(
      fontWeight: FontWeight.w500, fontSize: 18, color: Colors.white);
  static TextStyle k16w500brownText = GoogleFonts.balooDa2(
      fontWeight: FontWeight.w500, fontSize: 16, color: Color(0xff331F2D));
  static TextStyle k16w500331FText = GoogleFonts.balooDa2(
      fontWeight: FontWeight.w500, fontSize: 16, color: Color(0xff331F2D));

  static TextStyle k24w500brownText = GoogleFonts.balooDa2(
      fontWeight: FontWeight.w500, fontSize: 24, color: Color(0xff331F2D));
  static TextStyle k16w400greyText = GoogleFonts.balooDa2(
      fontWeight: FontWeight.w500, fontSize: 16, color: Color(0xff666666));
  static TextStyle k16w4008471Text = GoogleFonts.balooDa2(
      fontWeight: FontWeight.w400, fontSize: 16, color: Color(0xff84717F));
  static TextStyle k16w400331FText = GoogleFonts.balooDa2(
      fontWeight: FontWeight.w400, fontSize: 16, color: Color(0xff331F2D));
  static TextStyle k16w5008471Text = GoogleFonts.balooDa2(
      fontWeight: FontWeight.w500, fontSize: 16, color: Color(0xff84717F));
  static TextStyle k14w5008471Text = GoogleFonts.balooDa2(
      fontWeight: FontWeight.w500, fontSize: 14, color: Color(0xff84717F));
}

class FontConstant2 {
  static TextStyle getTextStyle(
    Color color,
    double fontSize, {
    FontWeight? fontWeight,
  }) {
    return GoogleFonts.balooThambi2(
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
    );
  }

  static TextStyle baloothampifont = GoogleFonts.balooThambi2(
      fontWeight: FontWeight.w500, fontSize: 24, color: Color(0xff84717F));
  static TextStyle k22w5008471text = GoogleFonts.balooThambi2(
      fontWeight: FontWeight.w500, fontSize: 22, color: Color(0xff84717F));
  static TextStyle k24w5008267text = GoogleFonts.balooThambi2(
      fontWeight: FontWeight.w500, fontSize: 24, color: Color(0xff8267AC));
  static TextStyle k32w5008267text = GoogleFonts.balooThambi2(
      fontWeight: FontWeight.w500, fontSize: 32, color: Color(0xff8267AC));
  static TextStyle k16w5008267text = GoogleFonts.balooThambi2(
      fontWeight: FontWeight.w500, fontSize: 16, color: Color(0xff331F2D));
  static TextStyle k24w500331Ftext = GoogleFonts.balooThambi2(
      fontWeight: FontWeight.w500, fontSize: 24, color: Color(0xff331F2D));
}
