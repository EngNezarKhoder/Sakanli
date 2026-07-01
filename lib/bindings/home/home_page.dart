import 'package:get/get.dart';
import 'package:sakanle/controller/home/home_page_controller.dart';
import 'package:sakanle/controller/home/map_page_controller.dart';

class HomePageBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomePageControllerImp());
    Get.lazyPut(() => MapPageControllerImp(), fenix: false);
  }
}
