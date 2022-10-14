import 'package:flutter/material.dart';
import 'package:kidseau/Theme.dart';

textfield (context, txt) {
  return Container(
    width: MediaQuery.of(context).size.width *0.80,
    child: TextFormField(
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(14.0),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30.0)),
            borderSide: BorderSide(color: Colors.grey.shade200, width: 4.0)),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade200, width: 4.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(30.0)),
          borderSide: BorderSide(color: Colors.grey.shade200, width: 4.0),
        ),
        isDense: true,
        prefixIcon: Icon(Icons.search),
        hintText: txt,
        filled: true,
        fillColor: Colors.grey.shade200,
        hintStyle:
        FontConstant.lightText.copyWith(color: Colors.grey, fontSize: 13.0),
      ),
    ),
  );
}

materialButton(context, onpressed, txt,c) {
  return MaterialButton(
    onPressed: onpressed,
    enableFeedback: true,
    shape:  RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(30))),
    height: 50.0,
    minWidth: MediaQuery.of(context).size.width *0.95,
    elevation: 0.5,
    color: c,
    child: Text(
      txt,
      style: TextStyle(
          color: Colors.white, fontSize: 15.0, fontWeight: FontWeight.w700),
      textAlign: TextAlign.center,
    ),
  );
}

// FontConstant.normaltext.copyWith(
// color: Colors.white, fontSize: 15.0, fontWeight: FontWeight.w700),
// textAlign: TextAlign.center,
// ),