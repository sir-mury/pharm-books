import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharm_books/consts/color_const.dart';
import 'package:pharm_books/controllers/navigation_controller.dart';
import 'package:pharm_books/pages/dashboard.dart';
import 'package:pharm_books/pages/login.dart';
import 'package:pharm_books/widgets/app_bar_widget.dart';
import 'package:pharm_books/widgets/drawer_widget.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    NavigationController navigationController =
        Get.find<NavigationController>();
    return Scaffold(
      body: Obx(
        () => navigationController.currentPage.value.runtimeType != LoginPage
            ? Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height,
                        child: DrawerWidget(),
                      ),
                    ],
                  ),
                  Expanded(
                    // flex: 5,
                    child: Column(
                      children: [
                        AppBarWidget(),
                        Obx(
                          () => Expanded(
                            flex: 8,
                            child: navigationController.currentPage.value,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            : navigationController.currentPage.value,
        // backgroundColor: ColorConst.white,
      ),
    );
  }
}
