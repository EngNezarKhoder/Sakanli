import 'package:get/get.dart';
import 'package:sakanle/controller/property/property_info_controller.dart';
import 'package:sakanle/controller/property/property_info_one_controller.dart';
import 'package:sakanle/controller/property/property_info_three_controller.dart';
import 'package:sakanle/controller/property/property_info_two_controller.dart';

class PropertyInfoBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PropertyInfoControllerImp());
    Get.lazyPut(() => PropertyInfoOneControllerImp());
    Get.lazyPut(() => PropertyInfoTwoControllerImp());
    Get.lazyPut(() => PropertyInfoThreeControllerImp());
  }
}
