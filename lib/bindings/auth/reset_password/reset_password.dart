import 'package:get/get.dart';
import 'package:sakanle/controller/auth/reset_password_controller.dart';

class ResetPasswordBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ResetPasswordControllerImp());
  }
}
