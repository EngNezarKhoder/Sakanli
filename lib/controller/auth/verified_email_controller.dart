import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sakanle/core/constant/app_route.dart';

abstract class VerifiedEmailController extends GetxController {
  void navigateToSignUp();
  void navigateToVerifiedCode();
  void undo();
}

class VerifiedEmailControllerImp extends VerifiedEmailController {
  final TextEditingController email = TextEditingController();
  final GlobalKey<FormState> formState = GlobalKey<FormState>();

  @override
  void onClose() {
    email.dispose();
    super.onClose();
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
