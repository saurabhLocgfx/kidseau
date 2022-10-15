import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kidseau/Theme.dart';

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
        FontConstant.lightText.copyWith(color: Color(0xffB7A4B2), fontSize: 16.0),
      ),
    ),
  );
}

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
      style: FontConstant.materialbuttonText,
    ),
  );
}

Center mainlogo() {
  return Center(child: SizedBox(width:174,height:173,child: Image.asset('assets/images/logo.png')));
}

// FontConstant.normaltext.copyWith(
// color: Colors.white, fontSize: 15.0, fontWeight: FontWeight.w700),
// textAlign: TextAlign.center,
// ),