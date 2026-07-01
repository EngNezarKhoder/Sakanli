import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sakanle/core/api/api_service.dart';
import 'package:sakanle/core/constant/app_route.dart';
import 'package:sakanle/core/functions/show_error_message.dart';

abstract class VerifiedEmailController extends GetxController {
  void navigateToSignUp();
  void navigateToVerifiedCode();
  void undo();
}

class VerifiedEmailControllerImp extends VerifiedEmailController {
  final TextEditingController email = TextEditingController();
  final GlobalKey<FormState> formState = GlobalKey<FormState>();
  bool isLoading = false;

  @override
  void navigateToSignUp() {
    Get.offNamed(AppRoute.signUp);
  }

  @override
  void navigateToVerifiedCode() async {
    if (formState.currentState!.validate()) {
      isLoading = true;
      update(['loading']);
      var response = await ApiService.resendCode(email.text);
      isLoading = false;
      update(['loading']);
      print(response);
      if (response['status'] == 'done') {
        Get.toNamed(AppRoute.verifiedCode, arguments: {'email': email.text});
      } else {
        showErrorMessage(response['message'] ?? "فشلت إعادة الإرسال");
      }
    }
  }

  @override
  void undo() {
    Get.back();
  }

  @override
  void onClose() {
    email.dispose();
    super.onClose();
  }
}
