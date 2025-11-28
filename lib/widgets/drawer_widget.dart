import 'package:change_case/change_case.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharm_books/consts/color_const.dart';
import 'package:pharm_books/controllers/navigation_controller.dart';
import 'package:pharm_books/pages/dashboard.dart';
import 'package:recase/recase.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    NavigationController navigationController =
        Get.find<NavigationController>();
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    List<String> drawerItems = [
      'Dashboard',
      'POS / Sales',
      'Inventory',
      'Purchasing',
      'Patients',
      'Reports',
      'Settings',
      'Help & Support',
      'Logout',
    ];
    List<Widget> pages = [Dashboard()];
    List<IconData> drawerIcons = [
      Icons.dashboard,
      Icons.point_of_sale,
      Icons.inventory,
      Icons.shopping_cart,
      Icons.people,
      Icons.bar_chart,
      Icons.settings,
      Icons.help,
      Icons.logout,
    ];
    return Material(
      type: MaterialType.transparency,
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        child: Column(
          // mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(height: 50, width: 200, color: ColorConst.primary),
            SizedBox(height: 20),
            ...List.generate(drawerItems.length - 3, (index) {
              return Obx(
                () => ListTile(
                  selected: navigationController.selected.value == index,
                  selectedTileColor: ColorConst.primary.withValues(alpha: 0.5),
                  tileColor: ColorConst.white,
                  hoverColor: ColorConst.primary.withValues(alpha: 0.2),
                  onTap: () {
                    navigationController.selected.value = index;
                  },
                  leading: Icon(
                    drawerIcons[index],
                    color: ColorConst.black,
                    size: 24,
                  ),
                  title: SelectableText.rich(
                    TextSpan(
                      text: drawerItems[index].toTitleCase(),
                      style: TextTheme.of(context).bodyMedium,
                    ),
                  ),
                ),
              );
            }),
            SizedBox(height: screenHeight * 0.22),
            Divider(color: ColorConst.secondary, height: 1),
            ...List.generate(3, (index) {
              return Align(
                alignment: Alignment.bottomCenter,
                child: Obx(
                  () => ListTile(
                    selected:
                        navigationController.selected.value ==
                        index + drawerItems.length - 3,
                    hoverColor: ColorConst.primary.withValues(alpha: 0.2),
                    selectedTileColor: ColorConst.primary.withValues(
                      alpha: 0.5,
                    ),
                    onTap: () {
                      navigationController.selected.value =
                          index + drawerItems.length - 3;
                    },
                    leading: Icon(
                      drawerIcons[index + drawerItems.length - 3],
                      color: ColorConst.black,
                      size: 24,
                    ),
                    title: SelectableText.rich(
                      TextSpan(
                        text: drawerItems[drawerItems.length - 3 + index],
                        style: TextTheme.of(context).bodyMedium,
                      ),
                    ),
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
