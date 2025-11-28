import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationController extends GetxController {
  Rx<Widget> currentPage = Rx<Widget>(Container());
  Rx<Widget> previousPage = Rx<Widget>(Container());
  RxInt selected = 0.obs;

  void setCurrentPage(Widget page) {
    previousPage.value = currentPage.value;
    currentPage.value = page;
    // selected.value = 0;
  }

  void goBack() {
    currentPage.value = previousPage.value;
  }
}
