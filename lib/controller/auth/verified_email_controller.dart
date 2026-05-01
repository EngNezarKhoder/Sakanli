import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sakanle/core/constant/app_route.dart';

abstract class VerifiedEmailController extends GetxController {
  void navigateToSignUp();
  void navigateToVerifiedCode();
  void undo();
}

class VerifiedEmailControllerImp extends VerifiedEmailController {
  late TextEditingController email;
  late GlobalKey<FormState> formState;
  @override
  void onInit() {
    email = TextEditingController();
    formState = GlobalKey<FormState>();
    super.onInit();
  }

  @override
  void navigateToSignUp() {
    Get.offNamed(AppRoute.signUp);
  }

  @override
  void navigateToVerifiedCode() {
    if (formState.currentState!.validate()) {
      Get.toNamed(AppRoute.verifiedCode);
    }
  }

  @override
  void undo() {
    Get.back();
  }
}
