
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/painting/text_style.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class AppStyles {
  static TextStyle regular(double fontSize, { Color color = Colors.black}) {
    return TextStyle(
      fontFamily: 'CustomFont',
      fontSize: fontSize,
      fontWeight: FontWeight.normal,
      color: color,
    );
  }


  static TextStyle bold(double fontSize, {Color color = Colors.black}) {
    return TextStyle(
      fontFamily: 'CustomFont',
      fontSize: fontSize,
      fontWeight: FontWeight.bold,
      color: color,
    );
  }


  static TextStyle italic(double fontSize, {Color color = Colors.black}) {
    return TextStyle(
      fontFamily: 'CustomFont',
      fontSize: fontSize,
      fontStyle: FontStyle.italic,
      color: color,
    );
  }

  // خط مائل وعريض
  static TextStyle boldItalic(double fontSize, {Color color = Colors.black}) {
    return TextStyle(
      fontFamily: 'CustomFont',
      fontSize: fontSize,
      fontWeight: FontWeight.bold,
      fontStyle: FontStyle.italic,
      color: color,
    );
  }

  // خط الحجم الكبير
  static TextStyle large(double fontSize, {Color color = Colors.black}) {
    return TextStyle(
      fontFamily: 'CustomFont',
      fontSize: fontSize,
      fontWeight: FontWeight.normal,
      color: color,
    );
  }


 static TextStyle regular12Text = GoogleFonts.poppins(
      fontSize: 12, fontWeight: FontWeight.w400, color: Colors.black);
  static TextStyle regular11SalePrice = GoogleFonts.poppins(
      fontSize: 12, fontWeight: FontWeight.w400, color: Colors.black);
  static TextStyle regular14Text = GoogleFonts.poppins(
      fontSize: 14, fontWeight: FontWeight.w400, color: Colors.black);
  static TextStyle regular18White = GoogleFonts.poppins(
      fontSize: 18, fontWeight: FontWeight.w400, color: Colors.white);
  static TextStyle light14SearchHint = GoogleFonts.poppins(
      fontSize: 14,
      fontWeight: FontWeight.w300,
      color: Colors.black);
  static TextStyle light16White = GoogleFonts.poppins(
      fontSize: 16, fontWeight: FontWeight.w300, color: Colors.white);
  static TextStyle light18HintText = GoogleFonts.poppins(
      fontSize: 18,
      fontWeight: FontWeight.w300,
      color: Colors.white);
  static TextStyle semi16TextWhite = GoogleFonts.poppins(
      fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white);
  static TextStyle semi20Primary = GoogleFonts.poppins(
      fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black);
  static TextStyle semi24White = GoogleFonts.poppins(
      fontSize: 24, fontWeight: FontWeight.w600, color: Colors.white);
  static TextStyle medium14Category = GoogleFonts.poppins(
      fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black);
  static TextStyle medium14LightPrimary = GoogleFonts.poppins(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: Colors.black);
  static TextStyle medium14PrimaryDark = GoogleFonts.poppins(
      fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black);
  static TextStyle medium18Header = GoogleFonts.poppins(
      fontSize: 18,
      fontWeight: FontWeight.w500,
      color: Colors.black);
  static TextStyle medium18White = GoogleFonts.poppins(
      fontSize: 18, fontWeight: FontWeight.w500, color: Colors.white);
  static TextStyle medium20White = GoogleFonts.poppins(
      fontSize: 20, fontWeight: FontWeight.w500, color: Colors.white);

}