import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sakanle/controller/property/property_info_one_controller.dart';
import 'package:sakanle/controller/property/property_info_three_controller.dart';
import 'package:sakanle/controller/property/property_info_two_controller.dart';
import 'package:sakanle/core/constant/app_route.dart';
import 'package:sakanle/core/functions/show_success_message.dart';
import 'package:sakanle/view/screens/home/property/property_info_one.dart';
import 'package:sakanle/view/screens/home/property/property_info_three.dart';
import 'package:sakanle/view/screens/home/property/property_info_two.dart';

abstract class PropertyInfoController extends GetxController {
  void changeValueOfIndex(int val);
  void navigateToNextPage();
  void navigateToPerviousPage();
}

class PropertyInfoControllerImp extends PropertyInfoController {
  late int index;
  late PageController pageController;
  late List<Widget> pages;
  late bool pageOneIsDone;
  late bool pageTwoIsDone;

  @override
  void onInit() {
    pageOneIsDone = false;
    pageTwoIsDone = false;
    pages = [PropertyInfoOne(), PropertyInfoTwo(), PropertyInfoThree()];
    pageController = PageController();
    index = 0;
    super.onInit();
  }

  @override
  void changeValueOfIndex(int val) {
    index = val;
    update();
  }

  @override
  void navigateToNextPage() async {
    if (index == 0) {
      PropertyInfoOneControllerImp controllerOne =
          Get.find<PropertyInfoOneControllerImp>();
      if (!controllerOne.validatePageFields()) {
        Get.snackbar(
          "تنبيه",
          "يرجى اتمام جميع الحقول المطلوبة و المحددة بعلامة *",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
        return;
      } else {
        pageOneIsDone = true;
        update();
      }
    }
    if (index == 1) {
      PropertyInfoTwoControllerImp controllerTwo =
          Get.find<PropertyInfoTwoControllerImp>();
      if (!controllerTwo.validateFields()) {
        Get.snackbar(
          "تنبيه",
          "يرجى اتمام جميع الحقول المطلوبة و المحددة بعلامة *",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
        return;
      } else {
        pageTwoIsDone = true;
        update();
      }
    }
    if (index == 2) {
      PropertyInfoThreeControllerImp controllerThree =
          Get.find<PropertyInfoThreeControllerImp>();
      if (!controllerThree.validateFields()) {
        Get.snackbar(
          "تنبيه",
          "يرجى اتمام جميع الحقول المطلوبة و المحددة بعلامة *",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
        return;
      } else {
        showSuccessMessage();
        await Future.delayed(Duration(seconds: 3));
        Get.offAllNamed(AppRoute.homePage);
      }
    }
    if (index < 2) {
      index++;
      pageController.animateToPage(
        index,
        duration: Duration(milliseconds: 900),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void navigateToPerviousPage() {
    if (index > 0) {
      index--;
      pageController.animateToPage(
        index,
        duration: Duration(milliseconds: 900),
        curve: Curves.easeInOut,
      );
    }
  }
}
