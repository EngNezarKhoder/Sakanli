import 'package:get/get.dart';
import 'package:sakanle/controller/auth/login_controller.dart';

class LoginBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginControllerImp());
  }
}
