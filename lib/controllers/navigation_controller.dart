import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharm_books/pages/dashboard.dart';

class NavigationController extends GetxController {
  Rx<Widget> currentPage = Rx<Widget>(Dashboard());
  Rx<Widget> previousPage = Rx<Widget>(Container());
  RxInt selected = 0.obs;
  RxBool isDrawerOpen = true.obs;

  void setCurrentPage(Widget page) {
    previousPage.value = currentPage.value;
    currentPage.value = page;
    print("current page set to ${currentPage.value}");
    // selected.value = 0;
  }

  void goBack() {
    currentPage.value = previousPage.value;
  }
}
