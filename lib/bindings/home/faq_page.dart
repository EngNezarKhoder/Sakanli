import 'package:get/get.dart';
import 'package:sakanle/controller/property/faq_page_controller.dart';


class FaqPageBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FaqPageControllerImp());
  }
}
