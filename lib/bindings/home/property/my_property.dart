import 'package:get/get.dart';
import 'package:sakanle/controller/property/my_property_controller.dart';

class MyPropertyBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MyPropertyControllerImp());
  }
}
