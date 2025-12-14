import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemesController extends GetxController {
  Rx<ThemeMode> themeMode = ThemeMode.light.obs;

  void toggleTheme() {
    if (themeMode.value == ThemeMode.light) {
      themeMode.value = ThemeMode.dark;
    } else {
      themeMode.value = ThemeMode.light;
    }
    update();
  }
}
