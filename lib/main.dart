import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharm_books/consts/themes_const.dart';
import 'package:pharm_books/controllers/navigation_controller.dart';
import 'package:pharm_books/controllers/themes_controller.dart';
import 'package:pharm_books/pages/homepage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(ThemesController());
  Get.put(NavigationController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ThemesController themesController = Get.find<ThemesController>();
    return GetMaterialApp(
      defaultTransition: Transition.fade,
      themeMode: themesController.themeMode,
      darkTheme: ThemesConst.darkTheme,
      theme: ThemesConst.lightTheme,
      home: const Homepage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
