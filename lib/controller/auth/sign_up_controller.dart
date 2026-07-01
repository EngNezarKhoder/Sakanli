import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sakanle/core/api/api_service.dart';
import 'package:sakanle/core/constant/app_route.dart';
import 'package:sakanle/core/functions/show_error_message.dart';

abstract class SignUpController extends GetxController {
  void changeCheckBoxPrivacy(bool val);
  void navigateToSignIn();
  void signUp();
  void changeObscureText();
  bool validatePrivacy();
}

class SignUpControllerImp extends SignUpController {
  final TextEditingController email = TextEditingController();
  final TextEditingController userName = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController password = TextEditingController();
  bool checkBoxValue = false;
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  bool obscureText = true;
  bool isLoading = false;

  @override
  void onClose() {
    email.dispose();
    userName.dispose();
    phone.dispose();
    password.dispose();
    super.onClose();
  }

  @override
  void changeCheckBoxPrivacy(bool val) {
    checkBoxValue = val;
    update();
  }

  @override
  void signUp() async {
    if (!validatePrivacy()) return;
    if (formState.currentState!.validate()) {
      isLoading = true;
      update(['loading']);
      var response = await ApiService.register({
        'name': userName.text,
        'email': email.text,
        'phone': phone.text,
        'password': password.text,
      });
      isLoading = false;
      update(['loading']);
      print(response);
      if (response != null && response['status'] == 'done') {
        Get.toNamed(
          AppRoute.verifiedCodeSignUp,
          arguments: {"email": email.text},
        );
      } else {
        showErrorMessage(response?['message'] ?? "فشل التسجيل");
      }
    }
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

  @override
  bool validatePrivacy() {
    if (!checkBoxValue) {
      showErrorMessage("يجب الموافقة على الشروط وسياسة الخصوصية");
      return false;
    }
    return true;
  }
}
