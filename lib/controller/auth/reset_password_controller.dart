import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sakanle/core/api/api_service.dart';
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
  bool isLoading = false;
  late String email;

  @override
  void onInit() {
    email = Get.arguments['email'];
    super.onInit();
  }

  

  @override
  void resetPassword() async {
    if (!validatePassword()) return;
    if (formState.currentState!.validate()) {
      isLoading = true;
      update(['loading']);
      var response = await ApiService.resetPassword(
        email,
        password.text.trim(),
        rePassword.text.trim(),
      );
      isLoading = false;
      update(['loading']);
      print(response);
      if (response['status'] == 'done') {
        showSuccessDialog(
          'تمت إعادة تعيين كلمة المرور بنجاح.\nيمكنك الآن تسجيل الدخول إلى حسابك.',
        );
      } else {
        showErrorMessage(response['message'] ?? "فشل إعادة تعيين كلمة المرور");
      }
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

  @override
  void onClose() {
    password.dispose();
    rePassword.dispose();
    super.onClose();
  }
}
