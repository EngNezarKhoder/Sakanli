import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sakanle/core/functions/show_error_message.dart';
import 'package:sakanle/core/functions/show_success_dialog.dart';

abstract class ResetPasswordController extends GetxController {
  void resetPassword();
  void changeObscureTextOne();
  void changeObscureTextTwo();
  bool validatePassword();
}

class ResetPasswordControllerImp extends ResetPasswordController {
  final TextEditingController password = TextEditingController();
  final TextEditingController rePassword = TextEditingController();
  final GlobalKey<FormState> formState = GlobalKey<FormState>();
  bool obscureTextOne = true;
  bool obscureTextTwo = true;

  @override
  void onClose() {
    password.dispose();
    rePassword.dispose();
    super.onClose();
  }

  @override
  void resetPassword() {
    if (!validatePassword()) return;
    if (formState.currentState!.validate()) {
      // Get.offNamed(AppRoute.login);
      showSuccessDialog();
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

  @override
  bool validatePassword() {
    if (password.text.trim() != rePassword.text.trim()) {
      showErrorMessage('كلمة المرور غير متطابقة');
      return false;
    }
    return true;
  }
}
