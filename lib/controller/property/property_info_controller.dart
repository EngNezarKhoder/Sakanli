import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sakanle/controller/property/property_info_one_controller.dart';
import 'package:sakanle/controller/property/property_info_three_controller.dart';
import 'package:sakanle/controller/property/property_info_two_controller.dart';
import 'package:sakanle/core/constant/app_route.dart';
import 'package:sakanle/core/functions/show_error_message.dart';
import 'package:sakanle/core/functions/show_success_message.dart';
import 'package:sakanle/view/screens/home/property/add_property/property_info_one.dart';
import 'package:sakanle/view/screens/home/property/add_property/property_info_three.dart';
import 'package:sakanle/view/screens/home/property/add_property/property_info_two.dart';

abstract class PropertyInfoController extends GetxController {
  void changeValueOfIndex(int val);
  void navigateToNextPage();
  void navigateToPerviousPage();
}

class PropertyInfoControllerImp extends PropertyInfoController {
  int index = 0;
  final PageController pageController = PageController();
  late List<Widget> pages = [
    PropertyInfoOne(),
    PropertyInfoTwo(),
    PropertyInfoThree(),
  ];
  bool pageOneIsDone = false;
  bool pageTwoIsDone = false;

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
        showErrorMessage("يرجى اتمام جميع الحقول المطلوبة و المحددة بعلامة *");
        return;
      } else {
        pageOneIsDone = true;
        update();
      }
    }
    if (index == 1) {
      PropertyInfoTwoControllerImp controllerTwo =
          Get.find<PropertyInfoTwoControllerImp>();
      String message = controllerTwo.validateFields();
      if (message == "fieldsError") {
        showErrorMessage("يرجى اتمام جميع الحقول المطلوبة و المحددة بعلامة *");
        return;
      } else if (message == "addError") {
        showErrorMessage("يرجى تحديد موقع العقار على الخريطة");
        return;
      } else {
        pageTwoIsDone = true;
        update();
      }
    }
    if (index == 2) {
      PropertyInfoThreeControllerImp controllerThree =
          Get.find<PropertyInfoThreeControllerImp>();
      if (controllerThree.validateFields() == 'imageError') {
        showErrorMessage("يرجى رفع صورة واحدة للعقار كحد أدنى");
        return;
      } else if (controllerThree.validateFields() == 'fieldsError') {
        showErrorMessage("يرجى اتمام جميع الحقول المطلوبة و المحددة بعلامة *");
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
    if (index == 0) Get.back();
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
