import 'package:flutter/material.dart';

Color kMaintheme = Color(0x906366FF);

InputDecoration kTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(20),
    ),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: kMaintheme, width: 1),
    borderRadius: BorderRadius.all(
      Radius.circular(20),
    ),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: kMaintheme, width: 2),
    borderRadius: BorderRadius.all(
      Radius.circular(20),
    ),
  ),
);


const TextStyle kGreyTextStyle = TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.w500,
  color: Color(0xff878080),
);


const TextStyle kBlackHeadingSize = TextStyle(
    fontSize: 25, color: Colors.black, fontWeight: FontWeight.w700); //black