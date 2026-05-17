import 'package:get/get.dart';
import 'package:sakanle/controller/property/add_property_controller.dart';

class AddPropertyBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddPropertyControllerImp());
  }
}
