import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sakanle/core/constant/app_route.dart';

abstract class LoginController extends GetxController {
  void onChangedRemember(val);
  void onChangedPrivacy(val);
  void navigateToVerifiedEmail();
  void navigateToSignUp();
  void login();
  void changeObscureText();
}

class LoginControllerImp extends LoginController {
  late TextEditingController email;
  late TextEditingController password;
  late bool checkBoxRemember;
  late bool checkBoxPrivacy;
  late GlobalKey<FormState> formState;
  late bool obscureText;
  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    checkBoxRemember = false;
    checkBoxPrivacy = false;
    formState = GlobalKey<FormState>();
    obscureText = true;
    super.onInit();
  }

  @override
  void onChangedRemember(val) {
    checkBoxRemember = val;
    update();
  }

  @override
  void navigateToVerifiedEmail() {
    Get.toNamed(AppRoute.verifiedEmail);
  }

  @override
  void onChangedPrivacy(val) {
    checkBoxPrivacy = val;
    update();
  }

  @override
  void login() {
    if (formState.currentState!.validate()) {
      Get.offAllNamed(AppRoute.homePage);
    }
  }

  @override
  void navigateToSignUp() {
    Get.offNamed(AppRoute.signUp);
  }

  @override
  void changeObscureText() {
    obscureText = !obscureText;
    update();
  }
}
