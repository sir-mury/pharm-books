import 'package:flutter/material.dart';
import 'package:pharm_books/consts/color_const.dart';
import 'package:pharm_books/pages/dashboard.dart';
import 'package:pharm_books/pages/login.dart';
import 'package:pharm_books/widgets/drawer_widget.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: LoginPage(), backgroundColor: ColorConst.white);
  }
}
