import 'package:get/get.dart';
import 'package:sakanle/controller/home/my_profile_page_controller.dart';

class MyProfileBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MyProfilePageControllerImp());
  }
}
