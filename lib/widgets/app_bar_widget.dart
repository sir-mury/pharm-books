import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharm_books/consts/color_const.dart';
import 'package:pharm_books/controllers/navigation_controller.dart';
import 'package:pharm_books/controllers/themes_controller.dart';
import 'package:pharm_books/widgets/buttons.dart';
import 'package:pharm_books/widgets/text_input.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    NavigationController navigationController =
        Get.find<NavigationController>();
    ThemesController themesController = Get.find<ThemesController>();
    return Material(
      child: Container(
        // height: MediaQuery.of(context).size.height * 0.5,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Theme.of(
                context,
              ).colorScheme.onSurface.withValues(alpha: 0.1),
              width: 1.6,
            ),
          ),
          color: Theme.of(context).colorScheme.surface,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(width: 16),
                  SizedBox(
                    width: 250,
                    child: IconTextInput(
                      atBeginning: true,
                      icon: Icons.search,
                      controller: searchController,
                      onChanged: (value) {},
                      hintText: 'Search...',
                    ),
                  ),
                ],
              ),
              AnimatedOpacity(
                opacity: navigationController.isDrawerOpen.value ? 0.0 : 1.0,
                duration: Duration(milliseconds: 800),
                child: navigationController.isDrawerOpen.value
                    ? SizedBox.shrink()
                    : Container(
                        width: 200,
                        height: 50,
                        color: ColorConst.primary,
                      ),
              ),
              Row(
                children: [
                  TertiaryIconButton(
                    icon: Icons.notifications,
                    onPressed: () {},
                  ),
                  SizedBox(width: 12),
                  TertiaryIconButton(icon: Icons.help, onPressed: () {}),
                  SizedBox(width: 12),
                  AnimatedSwitcher(
                    duration: Duration(milliseconds: 300),
                    transitionBuilder: (child, animation) {
                      return RotationTransition(turns: animation, child: child);
                    },
                    child: TertiaryIconButton(
                      key: ValueKey(themesController.themeMode.value),
                      icon: themesController.themeMode.value == ThemeMode.light
                          ? Icons.light_mode_outlined
                          : Icons.dark_mode_outlined,
                      onPressed: () {
                        themesController.toggleTheme();
                      },
                    ),
                  ),
                  SizedBox(width: 12),
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    child: Text(
                      'AB',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
