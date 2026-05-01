import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class PropertyInfoThreeController extends GetxController {}

class PropertyInfoThreeControllerImp extends PropertyInfoThreeController {
  late TextEditingController phoneCalls;
  late TextEditingController phoneWhatsApp;

  @override
  void onInit() {
    phoneCalls = TextEditingController();
    phoneWhatsApp = TextEditingController();
    super.onInit();
  }
}
