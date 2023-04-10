// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const purple = Color(0xff5D3891);
const orange = Color(0xffF99417);
const dirtyWhite = Color(0xffE8E2E2);
const white = Color(0xffF5F5F5);
const green = Color(0xff628c36);
const red = Color(0xffCF0A0A);

class FontStyles {
  static TextStyle headers = GoogleFonts.righteous(
    color: purple,
    fontSize: 64,
    textStyle: const TextStyle(
      shadows: [
        Shadow(
          blurRadius: 5.0, // shadow blur
          color: Colors.grey, // shadow color
          offset: Offset(3.0, 3.0), // how much shadow will be shown
        ),
      ],
    ),
  );
  static TextStyle header2 = GoogleFonts.righteous(color: purple, fontSize: 32);
  static TextStyle buttons = GoogleFonts.righteous(color: white, fontSize: 18);
  static TextStyle smallButtonPurple = GoogleFonts.righteous(color: purple, fontSize: 14);
  static TextStyle smallButtonOrange = GoogleFonts.righteous(color: orange, fontSize: 14);
  static TextStyle smallButtonBlack = GoogleFonts.righteous(color: Colors.black, fontSize: 14);
  static TextStyle smallButtonwhite = GoogleFonts.righteous(color: white, fontSize: 14);
  static TextStyle gameBlack = GoogleFonts.righteous(color: Colors.black, fontSize: 10);
  static TextStyle gameWhite = GoogleFonts.righteous(color: white, fontSize: 10);
  static TextStyle bodyOrange = GoogleFonts.righteous(color: orange, fontSize: 18);
  static TextStyle bodyPurple = GoogleFonts.righteous(color: purple, fontSize: 18);
  static TextStyle bodyWhite = GoogleFonts.righteous(color: white, fontSize: 18);
  static TextStyle bodyGreen = GoogleFonts.righteous(color: green, fontSize: 18);
  static TextStyle bodyBlack = GoogleFonts.righteous(color: Colors.black, fontSize: 18);
}
