import 'package:flutter/material.dart';

abstract class AppColors {
  static const Color white = Color(0xffF9F9F9);

  static const Color grey = Color(0xff535353);
  static const Color red = Color(0xffCC1010);
  static const Color green = Color(0xff11CE19);
  static const Color lightBlue = Color(0xffEDEFF3);
  static const Color lightGreen = Color(0xffCAF9CC);
  static const Color lightRed = Color(0xffF8D2D2);
  static const Color lightGrey = Color(0xffA6A6A6);

  static const MaterialColor blue = MaterialColor(0xff02369C, <int, Color>{
    10:  Color(0xffccd7eb),
    20: Color(0xffabbcde),
    30: Color(0xff819bce),
    40: Color(0xff5679bd),
    50: Color(0xff2c58ad),
    0: Color(0xff02369c),
    60: Color(0xff022d82),
    70: Color(0xff012468),
    80: Color(0xff011b4e),
    90: Color(0xff011234),
    100: Color(0xff000b1f),
  });

  static const MaterialColor black = MaterialColor(0xff0f0f0f, <int, Color>{
    10: Color(0xffcfcfcf),
    20: Color(0xffafafaf),
    30: Color(0xff878787),
    40: Color(0xff5f5f5f),
    50: Color(0xff373737),
    0: Color(0xff0f0f0f),
    60: Color(0xff0d0d0d),
    70: Color(0xff0a0a0a),
    80: Color(0xff080808),
    90: Color(0xff050505),
    100: Color(0xff030303),
  });
}
