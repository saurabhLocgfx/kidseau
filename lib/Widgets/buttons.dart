import 'package:flutter/material.dart';
import 'package:kidseau/Theme.dart';

materialButton(context, onpressed, txt,c,h) {
  return MaterialButton(
    onPressed: onpressed,
    enableFeedback: true,
    shape:  RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(30))),
    height: h,
    minWidth: MediaQuery.of(context).size.width *0.92,
    elevation: 0.5,
    color: c,
    child: Text(
      txt,
      style: FontConstant.k18w500materialbuttonText,
    ),
  );
}

textfield (context, txt) {
  return Container(
    height: 56,
    width: MediaQuery.of(context).size.width *0.92,
    child: TextFormField(
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
          borderSide: BorderSide(color: Colors.white, width: 1.0),
        ),
        isDense: true,
        hintText: txt,
        filled: true,
        fillColor: Colors.white,
        hintStyle:
        FontConstant.k14w400lightText.copyWith(color: Color(0xffB7A4B2), fontSize: 16.0,fontWeight: FontWeight.w400),
      ),
    ),
  );
}