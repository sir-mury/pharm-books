import 'package:flutter/material.dart';
import 'package:pharm_books/consts/color_const.dart';
import 'package:pharm_books/consts/texts_consts.dart';

class ThemesConst {
  static ThemeData get lightTheme => ThemeData(
    brightness: Brightness.light,
    primaryColor: ColorConst.primary,
    scaffoldBackgroundColor: ColorConst.white,
    appBarTheme: AppBarTheme(
      backgroundColor: ColorConst.white,
      iconTheme: IconThemeData(color: ColorConst.black),
      titleTextStyle: TextsConsts.heading3Light,
    ),
    textTheme: TextTheme(
      headlineLarge: TextsConsts.heading1Light,
      headlineMedium: TextsConsts.heading2Light,
      headlineSmall: TextsConsts.heading3Light,
      bodyMedium: TextsConsts.bodyLight,
      bodySmall: TextsConsts.captionsLight,
    ),
  );

  static ThemeData get darkTheme => ThemeData(
    brightness: Brightness.dark,
    primaryColor: ColorConst.primary,
    scaffoldBackgroundColor: ColorConst.black,
    appBarTheme: AppBarTheme(
      backgroundColor: ColorConst.black,
      iconTheme: IconThemeData(color: ColorConst.white),
      titleTextStyle: TextsConsts.heading3Dark,
    ),
    textTheme: TextTheme(
      headlineLarge: TextsConsts.heading1Dark,
      headlineMedium: TextsConsts.heading2Dark,
      headlineSmall: TextsConsts.heading3Dark,
      bodyMedium: TextsConsts.bodyDark,
      bodySmall: TextsConsts.captionsDark,
    ),
  );
}
