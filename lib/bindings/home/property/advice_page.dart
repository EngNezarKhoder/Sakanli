import 'package:get/get.dart';
import 'package:sakanle/controller/property/advice_page_controller.dart';

class AdvicePageBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AdvicePageControllerImp());
  }
}
