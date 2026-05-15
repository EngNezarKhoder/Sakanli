import 'package:get/get.dart';
import 'package:sakanle/controller/auth/verified_code_controller.dart';

class VerifiedCodeBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => VerifiedCodeControllerImp());
  }
}
