import 'dart:async';

import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:sakanle/core/api/api_service.dart';
import 'package:sakanle/core/constant/app_route.dart';
import 'package:sakanle/core/functions/show_error_message.dart';
import 'package:sakanle/core/functions/show_success_alert.dart';

abstract class VerifiedCodeController extends GetxController {
  void navigateToResetPassword();
  void undo();
}

class VerifiedCodeControllerImp extends VerifiedCodeController {
  PinInputController pinController = PinInputController();
  bool isLoadingCode = false;
  bool isLoadingReCode = false;
  late String email;
  int seconds = 60;
  bool canResend = false;
  Timer? timer;

  @override
  void onInit() {
    email = Get.arguments['email'];
    startTimer();
    super.onInit();
  }

  @override
  void navigateToResetPassword() async {
    isLoadingCode = true;
    update(['loadingCode']);
    var response = await ApiService.verifyCode(email, pinController.text);
    isLoadingCode = false;
    update(['loadingCode']);
    print(response);
    if (response['status'] == 'done') {
      Get.toNamed(AppRoute.resetPassword, arguments: {'email': email});
    } else {
      showErrorMessage(response['message'] ?? "فشل التسجيل");
      pinController.clear();
    }
  }

  Future<void> resendCode() async {
    isLoadingCode = true;
    update(['timer']);
    var response = await ApiService.resendCode(email);
    isLoadingReCode = false;
    update(['timer']);
    print(response);
    if (response['status'] == 'done') {
      ShowSuccessAlert('تم إرسال رمز جديد إلى بريدك الإلكتروني');
      startTimer();
    } else {
      showErrorMessage(response['message'] ?? "فشلت إعادة الإرسال");
    }
  }

  void startTimer() {
    seconds = 60;
    canResend = false;
    timer?.cancel();
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (seconds > 0) {
        seconds--;
        update(['timer']);
      } else {
        canResend = true;
        timer.cancel();
        update(['timer']);
      }
    });
  }

  @override
  void undo() {
    Get.back();
  }
}
