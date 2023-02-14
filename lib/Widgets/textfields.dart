import 'package:easy_localization/easy_localization.dart';
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
      /*  controller: controller,*/
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
        hintText: title,
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

class Texticonfield extends StatelessWidget {
  final String Icon;
  final String title;
  final String hinttext;

  Texticonfield({
    Key? key,
    required this.Icon,
    required this.title,
    required this.hinttext,
  }) : super(key: key);

  @override
  Widget build(
    BuildContext context,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: FontConstant.k16w500331FText,
        ),
        SizedBox(height: 4),
        TextFormField(
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
            hintText: hinttext,
            filled: true,
            fillColor: Colors.white,
            hintStyle: FontConstant.k14w400lightText.copyWith(
                color: Color(0xffB7A4B2),
                fontSize: 16.0,
                fontWeight: FontWeight.w400),
          ),
        ),
      ],
    );
  }
}

class Primarytextfield extends StatelessWidget {
  final String text;
  final String desc;
  final TextEditingController controller;

  // final String text;
  const Primarytextfield({
    Key? key,
    required this.text,
    required this.desc,
    required this.controller,

    // required this.text
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: FontConstant.k16w500331FText,
        ),
        Container(
          height: 60.h,
          width: 1.sw,
          child: Container(
            height: 56.h,
            width: 382.w,
            child: TextFormField(
              controller: controller,
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
                hintText: desc,
                filled: true,
                fillColor: Colors.white,
                hintStyle: FontConstant.k14w400lightText.copyWith(
                    color: Color(0xffB7A4B2),
                    fontSize: 16.0,
                    fontWeight: FontWeight.w400),
              ),
              /*  controller: controller,*/
            ),
          ),
        )
      ],
    );
  }
}

class CustomInputDecoration {
  final String hintText;
  CustomInputDecoration({required this.hintText});
  InputDecoration decoration() {
    return InputDecoration(
      contentPadding: EdgeInsets.all(14.0),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide.none,
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(30.0)),
        borderSide: BorderSide(color: Colors.redAccent, width: 1.0),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(30.0)),
        borderSide: BorderSide(color: Colors.redAccent, width: 1.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(30.0)),
        borderSide: BorderSide(color: Color(0xffBE74AA), width: 1.0),
      ),
      isDense: true,
      hintText: hintText.tr(),
      filled: true,
      fillColor: Colors.white,
      hintStyle: FontConstant.k14w400lightText.copyWith(
          color: Color(0xffB7A4B2),
          fontSize: 16.0,
          fontWeight: FontWeight.w400),
    );
  }
}
