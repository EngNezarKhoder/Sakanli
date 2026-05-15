import 'package:get/get.dart';
import 'package:sakanle/controller/auth/verified_code_sign_up_controller.dart';

class VerifiedCodeSignUpBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => VerifiedCodeSignUpControllerImp());
  }
}
