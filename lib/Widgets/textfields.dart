import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kidseau/Theme.dart';

textfield(context, txt) {
  return Container(
    height: 56.h,
    width: 382.w,
    child: TextFormField(
      style: FontConstant.k18w5008471Text,
      decoration: InputDecoration(
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
        hintText: txt,
        filled: true,
        fillColor: Colors.white,
        hintStyle: FontConstant.k14w400lightText.copyWith(
            color: Color(0xffB7A4B2),
            fontSize: 16.0,
            fontWeight: FontWeight.w400),
      ),
    ),
  );
}

class Otpfield extends StatelessWidget {
  // final MaterialStateProperty<Color> backgroundColor;

  final Function onTap;
  final String title;
  final Color underlinecolor1;
  final Color underlinecolor2;
  const Otpfield({
    Key? key,
    // required this.backgroundColor,
    required this.onTap,
    required this.title,
    required this.underlinecolor1,
    required this.underlinecolor2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24,
      width: 24,
      child: TextFormField(
        style: FontConstant.k18w5008471Text,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(14.0),
          disabledBorder: InputBorder.none,
          isDense: true,
          filled: true,
          hintStyle: FontConstant.k32w500l6666Text,
          fillColor: Colors.transparent,
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: underlinecolor1),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: underlinecolor2),
          ),
        ),
      ),
    );
  }
}

class IconTextfield extends StatelessWidget {
  final String Icon;
  final String title;
  IconTextfield({
    Key? key,
    required this.Icon,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(
    BuildContext context,
  ) {
    return TextFormField(
      style: FontConstant.k18w5008471Text,
      decoration: InputDecoration(
        suffixIconConstraints: BoxConstraints(minHeight: 21, minWidth: 21),
        suffixIcon: Padding(
          padding: const EdgeInsets.only(right: 15),
          child: ImageIcon(
            AssetImage(Icon),
            size: 21,
          ),
        ),
        suffixIconColor: Color(0xffB7A4B2),
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
        hintText: "Select gender",
        filled: true,
        fillColor: Colors.white,
        hintStyle: FontConstant.k14w400lightText.copyWith(
            color: Color(0xffB7A4B2),
            fontSize: 16.0,
            fontWeight: FontWeight.w400),
      ),
    );
  }
}
