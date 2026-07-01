import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sakanle/core/api/api_service.dart';
import 'package:sakanle/core/constant/app_route.dart';
import 'package:sakanle/core/functions/show_error_message.dart';
import 'package:sakanle/core/services/token_service.dart';

abstract class LoginController extends GetxController {
  void onChangedRemember(bool val);
  void onChangedPrivacy(bool val);
  void navigateToVerifiedEmail();
  void navigateToSignUp();
  void login();
  void changeObscureText();
  bool validatePrivacy();
}

class LoginControllerImp extends LoginController {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  bool checkBoxRemember = false;
  bool checkBoxPrivacy = false;
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  bool obscureText = true;
  bool isLoading = false;

  @override
  void onChangedRemember(bool val) {
    checkBoxRemember = val;
    update();
  }

  @override
  void navigateToVerifiedEmail() {
    Get.toNamed(AppRoute.verifiedEmail);
  }

  @override
  void onChangedPrivacy(bool val) {
    checkBoxPrivacy = val;
    update();
  }

  @override
  void login() async {
    if (!validatePrivacy()) return;
    if (formState.currentState!.validate()) {
      isLoading = true;
      update(['loading']);
      var response = await ApiService.login(email.text, password.text);
      isLoading = false;
      update(['loading']);
      print(response);
      if (response['status'] == 'done') {
        await TokenService.saveToken(response['token']);
        Get.offAllNamed(AppRoute.homePage);
      } else {
        showErrorMessage(response['message'] ?? 'فشل تسجيل الدخول');
      }
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

  @override
  bool validatePrivacy() {
    if (!checkBoxPrivacy) {
      showErrorMessage("يجب الموافقة على الشروط وسياسة الخصوصية");
      return false;
    }
    return true;
  }

  // @override
  // void onClose() {
  //   email.dispose();
  //   password.dispose();
  //   super.onClose();
  // }
}
