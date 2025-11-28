import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemesController extends GetxController {
  ThemeMode themeMode = ThemeMode.light;

  void toggleTheme() {
    if (themeMode == ThemeMode.light) {
      themeMode = ThemeMode.dark;
    } else {
      themeMode = ThemeMode.light;
    }
    update();
  }
}
