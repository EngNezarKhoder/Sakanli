import 'dart:async';

import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:sakanle/core/api/api_service.dart';
import 'package:sakanle/core/functions/show_error_message.dart';
import 'package:sakanle/core/functions/show_success_alert.dart';
import 'package:sakanle/core/functions/show_success_dialog.dart';

abstract class VerifiedCodeSignUpController extends GetxController {
  void verifyCode();
  void undo();
}

class VerifiedCodeSignUpControllerImp extends VerifiedCodeSignUpController {
  late String email;
  PinInputController pinInputController = PinInputController();
  bool isLoadingCode = false;
  bool isLoadingResendCode = false;
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
  void verifyCode() async {
    isLoadingCode = true;
    update(['loadingCode']);
    var response = await ApiService.verifyCode(email, pinInputController.text);
    isLoadingCode = false;
    update(['loadingCode']);
    print(response);
    if (response['status'] == 'done') {
      showSuccessDialog('تم انشاء حسابك بنجاج \n يمكنك الان تسجيل الدخول');
    } else {
      showErrorMessage(response['message'] ?? "فشل التسجيل");
      pinInputController.clear();
    }
  }

  Future<void> resendCode() async {
    isLoadingResendCode = true;
    update(['timer']);
    var response = await ApiService.resendCode(email);
    isLoadingResendCode = false;
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

  @override
  void onClose() {
    pinInputController.clear();
    timer?.cancel();
    super.onClose();
  }
}
