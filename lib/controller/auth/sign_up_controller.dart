import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sakanle/core/constant/app_route.dart';

abstract class SignUpController extends GetxController {
  void changeCheckBoxPrivacy(bool val);
  void navigateToSignIn();
  void signUp();
  void changeObscureText();
}

class SignUpControllerImp extends SignUpController {
  late TextEditingController email;
  late TextEditingController userName;
  late TextEditingController phone;
  late TextEditingController password;
  late bool checkBoxValue;
  late GlobalKey<FormState> formState;
  late bool obscureText;
  @override
  void onInit() {
    email = TextEditingController();
    userName = TextEditingController();
    phone = TextEditingController();
    password = TextEditingController();
    checkBoxValue = false;
    formState = GlobalKey<FormState>();
    obscureText = true;
    super.onInit();
  }

  @override
  void changeCheckBoxPrivacy(bool val) {
    checkBoxValue = val;
    update();
  }

  @override
  void signUp() {
    if (formState.currentState!.validate()) {}
  }

  @override
  void navigateToSignIn() {
    Get.offNamed(AppRoute.login);
  }

  @override
  void changeObscureText() {
    obscureText = !obscureText;
    update();
  }
}
