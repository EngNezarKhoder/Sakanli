import 'package:get/get.dart';
import 'package:sakanle/controller/property/property_info_controller.dart';

class PropertyInfoBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PropertyInfoControllerImp());
  }
}
