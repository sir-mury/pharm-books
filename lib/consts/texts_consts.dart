import 'package:flutter/material.dart';
import 'package:pharm_books/consts/color_const.dart';

class TextsConsts {
  static TextStyle get heading1Light => TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    fontFamily: 'Roboto',
    color: ColorConst.black,
  );

  static TextStyle get heading2Light => TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.normal,
    fontFamily: 'Roboto',
    color: ColorConst.black,
  );

  static TextStyle get heading3Light => TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w400,
    fontFamily: 'Roboto',
    color: ColorConst.black,
  );

  static TextStyle get bodyLight => TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    fontFamily: 'Roboto',
    color: ColorConst.black,
  );

  static TextStyle get captionsLight => TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    fontFamily: 'Roboto',
    color: ColorConst.black,
  );

  static TextStyle get heading1Dark => TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    fontFamily: 'Roboto',
    color: ColorConst.white,
  );

  static TextStyle get heading2Dark => TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.normal,
    fontFamily: 'Roboto',
    color: ColorConst.white,
  );

  static TextStyle get heading3Dark => TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w400,
    fontFamily: 'Roboto',
    color: ColorConst.white,
  );

  static TextStyle get bodyDark => TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    fontFamily: 'Roboto',
    color: ColorConst.white,
  );

  static TextStyle get captionsDark => TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    fontFamily: 'Roboto',
    color: ColorConst.white,
  );
}
