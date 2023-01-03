import 'package:flutter/material.dart';
import 'package:kidseau/Theme.dart';

class FieldDecoration {
  final String hintText;
  final String? imagePath;
  // final Widget? child;
  FieldDecoration({
    required this.hintText,
    this.imagePath,
    // required this.child,
  });
  InputDecoration baseInputDecoration() {
    return InputDecoration(
      contentPadding: EdgeInsets.all(14.0),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(30.0)),
          borderSide: BorderSide(color: Colors.white, width: 1.0)),
      disabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white, width: 1.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(30.0)),
        borderSide: BorderSide(color: Color(0xffBE74AA), width: 1.0),
      ),
      isDense: true,
      hintText: hintText,
      filled: true,
      focusColor: Colors.white,
      fillColor: Colors.white,
      hintStyle: FontConstant.k14w400lightText.copyWith(
          color: Color(0xffB7A4B2),
          fontSize: 16.0,
          fontWeight: FontWeight.w400),
    );
  }

  InputDecoration baseInputIconDecoration() {
    return InputDecoration(
      contentPadding: EdgeInsets.all(14.0),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(30.0)),
          borderSide: BorderSide(color: Colors.white, width: 1.0)),
      disabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white, width: 1.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(30.0)),
        borderSide: BorderSide(color: Color(0xffBE74AA), width: 1.0),
      ),
      isDense: true,
      hintText: hintText,
      hintStyle: FontConstant.k14w400lightText.copyWith(
          color: Color(0xffB7A4B2),
          fontSize: 16.0,
          fontWeight: FontWeight.w400),
      filled: true,
      fillColor: Colors.white,
      focusColor: Colors.white,
      suffixIcon: Padding(
        padding: const EdgeInsets.only(
          right: 16.0,
        ),
        child: Image.asset(
          imagePath!,
          height: 7,
          width: 16,
        ),
      ),
    );
  }
}
