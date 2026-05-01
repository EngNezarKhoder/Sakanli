import 'package:get/get.dart';
import 'package:sakanle/core/constant/app_route.dart';

abstract class VerifiedCodeController extends GetxController {
  void navigateToResetPassword();
  void undo();
}

class VerifiedCodeControllerImp extends VerifiedCodeController {
  @override
  void navigateToResetPassword() {
    Get.offNamed(AppRoute.resetPassword);
  }

  @override
  void undo() {
    Get.back();
  }
}
