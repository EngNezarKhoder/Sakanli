import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sakanle/core/constant/app_route.dart';

abstract class ResetPasswordController extends GetxController {
  void navigateToVerifiedCode();
  void changeObscureTextOne();
  void changeObscureTextTwo();
}

class ResetPasswordControllerImp extends ResetPasswordController {
  late TextEditingController password;
  late TextEditingController rePassword;
  late GlobalKey<FormState> formState;
  late bool obscureTextOne;
  late bool obscureTextTwo;

  @override
  void onInit() {
    password = TextEditingController();
    rePassword = TextEditingController();
    formState = GlobalKey<FormState>();
    obscureTextOne = true;
    obscureTextTwo = true;
    super.onInit();
  }

  @override
  void navigateToVerifiedCode() {
    if (formState.currentState!.validate()) {
      Get.offNamed(AppRoute.verifiedCode);
    }
  }

  @override
  void changeObscureTextOne() {
    obscureTextOne = !obscureTextOne;
    update();
  }

  @override
  void changeObscureTextTwo() {
    obscureTextTwo = !obscureTextTwo;
    update();
  }
}
