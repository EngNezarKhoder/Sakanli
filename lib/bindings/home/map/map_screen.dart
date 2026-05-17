import 'package:get/get.dart';
import 'package:sakanle/controller/home/map/map_screen_controller.dart';

class MapScreenBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MapScreenControllerImp());
  }
}
