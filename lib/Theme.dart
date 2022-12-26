import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/painting/text_style.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeColor {
  static const Color primarycolor = Color(0xff8267AC);
  static const Color primaryorange = Color(0xffF0AD56);
  static const Color lightpurple = Color(0xff8267AC);
  static const Color darkpurple = Color(0xff84717F);
  static const Color b7A4B2 = Color(0xFFB7A4B2);
  static const Color ebe6F2 = Color(0xFFebe6F2);
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
  static TextStyle k16w400whiteText = GoogleFonts.balooDa2(
      fontWeight: FontWeight.w400, fontSize: 16, color: Colors.white);
  static TextStyle k18w5008471Text = GoogleFonts.balooDa2(
      fontWeight: FontWeight.w500, fontSize: 18, color: Color(0xff84717F));
  static TextStyle k18w500F970Text = GoogleFonts.balooDa2(
      fontWeight: FontWeight.w500, fontSize: 18, color: Color(0xffF97070));
  static TextStyle k18w5008267Text = GoogleFonts.balooDa2(
      fontWeight: FontWeight.w500, fontSize: 18, color: Color(0xff8267AC));
  static TextStyle k32w500blackText = GoogleFonts.balooDa2(
      fontWeight: FontWeight.w500, fontSize: 32, color: Colors.black);
  static TextStyle k18w500331FText = GoogleFonts.balooDa2(
      fontWeight: FontWeight.w500, fontSize: 18, color: Color(0xff331F2D));
  static TextStyle k14w400lightText = GoogleFonts.balooDa2(
      fontWeight: FontWeight.w400, fontSize: 14, color: Color(0xffbeb1b9));
  static TextStyle k14w400White = GoogleFonts.balooDa2(
      fontWeight: FontWeight.w400, fontSize: 14, color: Colors.white);
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
  static TextStyle k14w500B7A4TextU = GoogleFonts.balooDa2(
    decoration: TextDecoration.underline,
    fontWeight: FontWeight.w500,
    fontSize: 14,
    color: Color(0xffB7A4B2),
  );

  static TextStyle k18w500materialbuttonText = GoogleFonts.balooDa2(
      fontWeight: FontWeight.w500, fontSize: 18, color: Colors.white);
  static TextStyle k18w500BlackText = GoogleFonts.balooDa2(
      fontWeight: FontWeight.w500, fontSize: 18, color: Colors.black);
  static TextStyle k16w500brownText = GoogleFonts.balooDa2(
      fontWeight: FontWeight.w500, fontSize: 16, color: Color(0xff331F2D));
  static TextStyle k16w500331FText = GoogleFonts.balooDa2(
      fontWeight: FontWeight.w500, fontSize: 16, color: Color(0xff331F2D));
  static TextStyle k16w500White = GoogleFonts.balooDa2(
      fontWeight: FontWeight.w500, fontSize: 16, color: Colors.white);
  static TextStyle k16w500B7A4Text = GoogleFonts.balooDa2(
      fontWeight: FontWeight.w500, fontSize: 16, color: Color(0xffB7A4B2));
  static TextStyle k22w500brownText = GoogleFonts.balooDa2(
      fontWeight: FontWeight.w500, fontSize: 22, color: Color(0xff331F2D));
  static TextStyle k24w500brownText = GoogleFonts.balooDa2(
      fontWeight: FontWeight.w500, fontSize: 24, color: Color(0xff331F2D));

  static TextStyle k24w50084717FText = GoogleFonts.balooDa2(
      fontWeight: FontWeight.w500, fontSize: 24, color: Color(0xff84717F));
  static TextStyle k16w400greyText = GoogleFonts.balooDa2(
      fontWeight: FontWeight.w500, fontSize: 16, color: Color(0xff666666));
  static TextStyle k16w4008471Text = GoogleFonts.balooDa2(
      fontWeight: FontWeight.w400, fontSize: 16, color: Color(0xff84717F));
  static TextStyle k12w400B7A4Text = GoogleFonts.balooDa2(
      fontWeight: FontWeight.w400, fontSize: 12, color: Color(0xffB7A4B2));
  static TextStyle k12w400White = GoogleFonts.balooDa2(
      fontWeight: FontWeight.w400, fontSize: 12, color: Colors.white);
  static TextStyle k18w500B7A4Text = GoogleFonts.balooDa2(
      fontWeight: FontWeight.w500, fontSize: 18, color: Color(0xffB7A4B2));
  static TextStyle k12w4008267Text = GoogleFonts.balooDa2(
      fontWeight: FontWeight.w400, fontSize: 12, color: Color(0xff8267AC));
  static TextStyle k16w400331FText = GoogleFonts.balooDa2(
      fontWeight: FontWeight.w400, fontSize: 16, color: Color(0xff331F2D));
  static TextStyle k16w5008471Text = GoogleFonts.balooDa2(
      fontWeight: FontWeight.w500, fontSize: 16, color: Color(0xff84717F));
  static TextStyle k14w5008471Text = GoogleFonts.balooDa2(
      fontWeight: FontWeight.w500, fontSize: 14, color: Color(0xff84717F));
  static TextStyle k12w5008471Text = GoogleFonts.balooDa2(
      fontWeight: FontWeight.w500, fontSize: 12, color: Color(0xff84717F));
  static TextStyle k16w400B7A4B2Text = GoogleFonts.balooDa2(
      fontWeight: FontWeight.w400, fontSize: 16, color: Color(0xffB7A4B2));
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
  static TextStyle k24w5008471text = GoogleFonts.balooThambi2(
      fontWeight: FontWeight.w500, fontSize: 24, color: Color(0xff84717F));
  static TextStyle k24w5008267text = GoogleFonts.balooThambi2(
      fontWeight: FontWeight.w500, fontSize: 24, color: Color(0xff8267AC));
  static TextStyle k24w4008267text = GoogleFonts.balooThambi2(
      fontWeight: FontWeight.w400, fontSize: 24, color: Color(0xff8267AC));
  static TextStyle k32w5008267text = GoogleFonts.balooThambi2(
      fontWeight: FontWeight.w500, fontSize: 32, color: Color(0xff8267AC));
  static TextStyle k32w500331Ftext = GoogleFonts.balooThambi2(
      fontWeight: FontWeight.w500, fontSize: 32, color: Color(0xff331F2D));
  static TextStyle k16w5008267text = GoogleFonts.balooThambi2(
      fontWeight: FontWeight.w500, fontSize: 16, color: Color(0xff331F2D));
  static TextStyle k16w400B7A4text = GoogleFonts.balooThambi2(
      fontWeight: FontWeight.w400, fontSize: 16, color: Color(0xffB7A4B2));
  static TextStyle k24w500331Ftext = GoogleFonts.balooThambi2(
      fontWeight: FontWeight.w500, fontSize: 24, color: Color(0xff331F2D));
  static TextStyle k18w500331Ftext = GoogleFonts.balooThambi2(
      fontWeight: FontWeight.w500, fontSize: 18, color: Color(0xff331F2D));
  static TextStyle k18w500Black = GoogleFonts.balooThambi2(
      fontWeight: FontWeight.w500, fontSize: 18, color: Colors.black);
  static TextStyle k24w500WhiteText = GoogleFonts.balooThambi2(
      fontWeight: FontWeight.w500, fontSize: 24, color: Colors.white);
}

class TextFieldDecoration {
  InputDecoration curvedWhiteDecoration({
    required String label,
    required bool curved,
  }) {
    return InputDecoration(
      fillColor: Colors.white,
      filled: true,
      hintText: label,
      hintStyle: FontConstant.k16w400B7A4Text,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(curved ? 90 : 24),
        borderSide: BorderSide(color: Colors.white, width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(curved ? 90 : 24),
        borderSide: BorderSide(color: Colors.white, width: 1),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(curved ? 90 : 24),
        borderSide: BorderSide(color: Colors.redAccent, width: 1),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(curved ? 90 : 24),
        borderSide: BorderSide(color: Colors.white, width: 1),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(curved ? 90 : 24),
        borderSide: BorderSide(color: Colors.white, width: 1),
      ),
    );
  }
}
