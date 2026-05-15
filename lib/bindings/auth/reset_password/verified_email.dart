import 'package:get/get.dart';
import 'package:sakanle/controller/auth/verified_email_controller.dart';

class VerifiedEmailBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => VerifiedEmailControllerImp());
  }
}
