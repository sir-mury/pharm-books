import 'package:flutter/material.dart';
import 'package:pharm_books/widgets/drawer_widget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(padding: EdgeInsets.all(24), children: [DrawerWidget()]),
    );
  }
}
