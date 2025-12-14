import 'package:flutter/material.dart';
import 'package:pharm_books/consts/color_const.dart';
import 'package:pharm_books/consts/texts_consts.dart';

class ThemesConst {
  static ThemeData get lightTheme => ThemeData(
    brightness: Brightness.light,
    // primaryColor: ColorConst.primary,
    colorScheme: ColorScheme.light(
      primary: ColorConst.primary,
      onPrimary: ColorConst.white,
      secondary: ColorConst.secondary,
      surface: ColorConst.white,
      onSurface: ColorConst.black,
    ),
    scaffoldBackgroundColor: ColorConst.grey,
    appBarTheme: AppBarTheme(
      backgroundColor: ColorConst.white,
      iconTheme: IconThemeData(color: ColorConst.black),
      titleTextStyle: TextsConsts.heading3Light,
    ),
    listTileTheme: ListTileThemeData(
      iconColor: ColorConst.black,
      selectedTileColor: ColorConst.primary.withValues(alpha: 0.6),
      selectedColor: ColorConst.primary.withValues(alpha: 0.6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
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
    primaryColorLight: ColorConst.primary,
    scaffoldBackgroundColor: ColorConst.black,
    colorScheme: ColorScheme.dark(
      primary: ColorConst.primary,
      onPrimary: ColorConst.black,
      secondary: ColorConst.secondary,
      surface: ColorConst.black,
      onSurface: ColorConst.white,
    ),
    listTileTheme: ListTileThemeData(
      iconColor: ColorConst.white,
      selectedTileColor: ColorConst.primary.withValues(alpha: 0.7),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    ),
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
