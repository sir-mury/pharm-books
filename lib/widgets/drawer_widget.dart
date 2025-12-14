import 'package:change_case/change_case.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharm_books/consts/color_const.dart';
import 'package:pharm_books/consts/themes_const.dart';
import 'package:pharm_books/controllers/navigation_controller.dart';
import 'package:pharm_books/controllers/themes_controller.dart';
import 'package:pharm_books/pages/dashboard.dart';
import 'package:pharm_books/pages/help_support.dart';
import 'package:pharm_books/pages/inventory.dart';
import 'package:pharm_books/pages/login.dart';
import 'package:pharm_books/pages/patients.dart';
import 'package:pharm_books/pages/pos.dart';
import 'package:pharm_books/pages/purchasing.dart';
import 'package:pharm_books/pages/reports.dart';
import 'package:pharm_books/pages/settings.dart';
import 'package:pharm_books/utils/responsive.dart';
import 'package:pharm_books/widgets/buttons.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    ThemesController themesController = Get.find<ThemesController>();
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
    List<Widget> drawerPages = [
      Dashboard(),
      POSPage(),
      InventoryPage(),
      PurchasingPage(),
      PatientsPage(),
      ReportsPage(),
      SettingsPage(),
      HelpSupportPage(),
      Container(),
    ];

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
    if (Responsive.isDesktop(context)) {
      return buildDesktop(
        context: context,
        navigationController: navigationController,
        themesController: themesController,
        screenHeight: screenHeight,
        screenWidth: screenWidth,
        drawerItems: drawerItems,
        drawerPages: drawerPages,
        drawerIcons: drawerIcons,
      );
    } else if (Responsive.isTablet(context)) {
      return buildTablet(
        context: context,
        navigationController: navigationController,
        themesController: themesController,
        screenHeight: screenHeight,
        drawerPages: drawerPages,
        screenWidth: screenWidth,
        drawerItems: drawerItems,
        drawerIcons: drawerIcons,
      );
    } else {
      return SizedBox.shrink();
    }
  }

  Widget buildDesktop({
    required BuildContext context,
    required NavigationController navigationController,
    required ThemesController themesController,
    required double screenHeight,
    required double screenWidth,
    required List<String> drawerItems,
    required List<Widget> drawerPages,
    required List<IconData> drawerIcons,
  }) {
    bool checkItem(int index, List items) {
      bool val = false;
      for (var item in items) {
        if (item == items[index]) {
          val = true;
        } else {
          val = false;
        }
      }
      print(val);
      return val;
    }

    return Material(
      type: MaterialType.transparency,
      child: Obx(
        () => AnimatedContainer(
          // transform: Matrix4.translationValues(
          //   navigationController.isDrawerOpen.value
          //       ? 0
          //       : -screenWidth * 0.2, // Slides in/out
          //   0,
          //   0,
          // ),
          decoration: BoxDecoration(
            border: Border(
              right: BorderSide(
                color: Theme.of(
                  context,
                ).colorScheme.onSurface.withValues(alpha: 0.1),
                width: 1.6,
              ),
            ),
          ),
          duration: Duration(milliseconds: 600),
          curve: Curves.linear,
          width: navigationController.isDrawerOpen.value
              ? screenWidth * 0.2
              : screenWidth * 0.06,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: navigationController.isDrawerOpen.value
                ? Drawer(
                    width: screenWidth * 0.20,
                    shadowColor: ColorConst.darkGrey,
                    elevation: 5,
                    shape: BeveledRectangleBorder(
                      side: BorderSide.none,
                      borderRadius: BorderRadius.zero,
                    ),
                    backgroundColor: Theme.of(context).colorScheme.surface,
                    child: SingleChildScrollView(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 12,
                      ),
                      child: Column(
                        // mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 50,
                                width: 200,
                                color: ColorConst.primary,
                              ),
                              const SizedBox(width: 20),
                              TertiaryIconButton(
                                icon: Icons.menu,
                                onPressed: () {
                                  navigationController.isDrawerOpen.value =
                                      false;
                                },
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          ...List.generate(drawerItems.length - 3, (index) {
                            return GestureDetector(
                              onDoubleTap: () {
                                themesController.toggleTheme();
                                debugPrint(
                                  'Theme toggled to: ${themesController.themeMode}',
                                );
                              },
                              child: Obx(() {
                                bool isSelected =
                                    navigationController
                                        .currentPage
                                        .value
                                        .runtimeType ==
                                    drawerPages[index].runtimeType;
                                return ListTile(
                                  selected: isSelected,
                                  // selectedTileColor: ColorConst.primary.withValues(
                                  //   alpha: 0.5,
                                  // ),
                                  // tileColor: ColorConst.white,
                                  hoverColor: ColorConst.primary.withValues(
                                    alpha: 0.2,
                                  ),
                                  onTap: () {
                                    if (drawerItems[index].toLowerCase() !=
                                        "logout") {
                                      navigationController.setCurrentPage(
                                        drawerPages[index],
                                      );
                                    } else {
                                      navigationController.setCurrentPage(
                                        LoginPage(),
                                      );
                                    }

                                    // navigationController.selected.value = index;
                                  },

                                  leading: Icon(
                                    drawerIcons[index],
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.onSurface,
                                  ),
                                  title: SelectableText.rich(
                                    TextSpan(
                                      text: drawerItems[index].toTitleCase(),
                                      style: TextTheme.of(context).bodyMedium,
                                    ),
                                  ),
                                );
                              }),
                            );
                          }),
                          SizedBox(height: screenHeight * 0.22),
                          Divider(color: ColorConst.secondary, height: 1),
                          ...List.generate(3, (index) {
                            int actualIndex = index + drawerItems.length - 3;
                            return Align(
                              alignment: Alignment.bottomCenter,

                              child: Obx(() {
                                bool isSelected =
                                    navigationController
                                        .currentPage
                                        .value
                                        .runtimeType ==
                                    drawerPages[actualIndex].runtimeType;

                                return ListTile(
                                  selected: isSelected,
                                  hoverColor: ColorConst.primary.withValues(
                                    alpha: 0.2,
                                  ),
                                  onTap: () {
                                    if (drawerItems[actualIndex]
                                            .toLowerCase() !=
                                        "logout") {
                                      navigationController.setCurrentPage(
                                        drawerPages[actualIndex],
                                      );
                                    } else {
                                      navigationController.setCurrentPage(
                                        LoginPage(),
                                      );
                                      print("Logout tapped");
                                    }
                                  },
                                  leading: Icon(
                                    drawerIcons[index + drawerItems.length - 3],
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.onSurface,
                                  ),
                                  title: SelectableText.rich(
                                    TextSpan(
                                      text:
                                          drawerItems[drawerItems.length -
                                              3 +
                                              index],
                                      style: TextTheme.of(context).bodyMedium,
                                    ),
                                  ),
                                );
                              }),
                            );
                          }),
                        ],
                      ),
                    ),
                  )
                : Drawer(
                    width: screenWidth * 0.06,
                    shadowColor: ColorConst.darkGrey,
                    elevation: 5,
                    shape: BeveledRectangleBorder(
                      side: BorderSide.none,
                      borderRadius: BorderRadius.zero,
                    ),
                    backgroundColor: Theme.of(context).colorScheme.surface,
                    child: SingleChildScrollView(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 12,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TertiaryIconButton(
                            icon: Icons.menu,
                            onPressed: () =>
                                navigationController.isDrawerOpen.value = true,
                          ),
                          SizedBox(height: 20),
                          ...List.generate(drawerItems.length - 3, (index) {
                            return Tooltip(
                              textStyle: TextTheme.of(context).bodyMedium!
                                  .copyWith(
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.surface,
                                  ),
                              message: drawerItems[index].toTitleCase(),
                              child: InkWell(
                                hoverColor: ColorConst.primary.withValues(
                                  alpha: 0.2,
                                ),
                                splashColor: ColorConst.grey.withValues(
                                  alpha: 0.3,
                                ),
                                onTap: () {
                                  navigationController.setCurrentPage(
                                    drawerPages[index],
                                  );
                                },
                                child: Obx(() {
                                  bool isSelected =
                                      navigationController
                                          .currentPage
                                          .value
                                          .runtimeType ==
                                      drawerPages[index].runtimeType;
                                  return Container(
                                    height: kToolbarHeight * 0.9,
                                    decoration: BoxDecoration(
                                      color: isSelected
                                          ? ColorConst.primary.withValues(
                                              alpha: 0.6,
                                            )
                                          : Colors.transparent,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 12.0,
                                        horizontal: 16.0,
                                      ),
                                      child: Icon(
                                        drawerIcons[index],
                                        color: Theme.of(
                                          context,
                                        ).colorScheme.onSurface,
                                      ),
                                    ),
                                  );
                                }),
                              ),
                            );
                          }),
                          SizedBox(height: screenHeight * 0.22),
                          Divider(color: ColorConst.secondary, height: 1),
                          ...List.generate(3, (index) {
                            int actualIndex = index + drawerItems.length - 3;
                            return Tooltip(
                              textStyle: TextTheme.of(context).bodyMedium!
                                  .copyWith(
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.surface,
                                  ),
                              message: drawerItems[actualIndex].toTitleCase(),
                              child: InkWell(
                                splashColor: ColorConst.grey.withValues(
                                  alpha: 0.3,
                                ),
                                hoverColor: ColorConst.primary.withValues(
                                  alpha: 0.2,
                                ),
                                onTap: () {
                                  if (drawerItems[actualIndex].toLowerCase() !=
                                      "logout") {
                                    navigationController.setCurrentPage(
                                      drawerPages[actualIndex],
                                    );
                                  } else {
                                    navigationController.setCurrentPage(
                                      LoginPage(),
                                    );
                                    print("Logout tapped");
                                  }
                                },
                                child: Obx(() {
                                  bool isSelected =
                                      navigationController
                                          .currentPage
                                          .value
                                          .runtimeType ==
                                      drawerPages[actualIndex].runtimeType;
                                  return Container(
                                    height: kToolbarHeight * 0.9,
                                    decoration: BoxDecoration(
                                      color: isSelected
                                          ? ColorConst.primary.withValues(
                                              alpha: 0.6,
                                            )
                                          : Colors.transparent,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 12.0,
                                        horizontal: 16.0,
                                      ),
                                      child: Icon(
                                        drawerIcons[drawerItems.length -
                                            3 +
                                            index],
                                        color: Theme.of(
                                          context,
                                        ).colorScheme.onSurface,
                                      ),
                                    ),
                                  );
                                }),
                              ),
                            );
                          }),
                        ],
                      ),
                    ),
                  ),
          ),
        ),
      ),
    );
  }

  Widget buildTablet({
    required BuildContext context,
    required NavigationController navigationController,
    required ThemesController themesController,
    required double screenHeight,
    required double screenWidth,
    required List<String> drawerItems,
    required List<Widget> drawerPages,
    required List<IconData> drawerIcons,
  }) {
    return Drawer(
      width: screenWidth * 0.06,
      shadowColor: ColorConst.darkGrey,
      elevation: 5,
      shape: BeveledRectangleBorder(
        side: BorderSide.none,
        borderRadius: BorderRadius.zero,
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // TertiaryIconButton(
            //   icon: Icons.menu,
            //   onPressed: () => navigationController.isDrawerOpen.value = true,
            // ),
            // SizedBox(height: 20),
            ...List.generate(drawerItems.length - 3, (index) {
              return Tooltip(
                message: drawerItems[index].toTitleCase(),
                child: InkWell(
                  splashColor: ColorConst.grey.withValues(alpha: 0.3),
                  hoverColor: ColorConst.primary.withValues(alpha: 0.2),
                  onTap: () {},
                  child: Container(
                    alignment: Alignment.center,
                    height: kToolbarHeight * 0.9,
                    decoration: BoxDecoration(
                      color: navigationController.selected.value == index
                          ? ColorConst.primary.withValues(alpha: 0.6)
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      drawerIcons[index],
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                ),
              );
            }),
            SizedBox(height: screenHeight * 0.22),
            Divider(color: ColorConst.secondary, height: 1),
            ...List.generate(3, (index) {
              return Tooltip(
                message: drawerItems[drawerItems.length - 3 + index]
                    .toTitleCase(),
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: kToolbarHeight * 0.9,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: navigationController.selected.value == index
                          ? ColorConst.primary.withValues(alpha: 0.6)
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      drawerIcons[drawerItems.length - 3 + index],
                      color: Theme.of(context).colorScheme.onSurface,
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
