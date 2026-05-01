import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sakanle/core/constant/app_route.dart';

abstract class AdsPageController extends GetxController {
  void changeViewMode(String mode);
  void navigateToFilter();
  void navigateToAddProperty();
}

class AdsPageControllerImp extends AdsPageController {
  late TextEditingController search;
  late String viewMode;
  late bool isExpanded;
  @override
  void onInit() {
    search = TextEditingController();
    viewMode = "lv"; // lv = List View (Initial Value)
    isExpanded = false;
    super.onInit();
  }

  @override
  void changeViewMode(String mode) {
    viewMode = mode;
    update();
  }

  @override
  void navigateToFilter() {
    Get.toNamed(AppRoute.where);
  }

  @override
  void navigateToAddProperty() {
    Get.toNamed(AppRoute.addProperty);
  }
}
