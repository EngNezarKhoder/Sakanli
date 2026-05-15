import 'package:get/get.dart';
import 'package:sakanle/controller/auth/sign_up_controller.dart';

class SignUpBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignUpControllerImp());
  }
}
