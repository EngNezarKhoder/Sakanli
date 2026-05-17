import 'package:get/get.dart';
import 'package:sakanle/controller/property/property_details_controller.dart';

class PropertyDetailsBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PropertyDetailsControllerImp());
  }
}
