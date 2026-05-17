import 'package:get/get.dart';
import 'package:sakanle/core/constant/app_route.dart';

abstract class MyPropertyController extends GetxController {
  void back();
  void navigateToAddProperty();
}

class MyPropertyControllerImp extends MyPropertyController {
  List<Map<String, dynamic>> homes = [];

  @override
  void back() {
    Get.back();
  }

  @override
  void navigateToAddProperty() {
    Get.offNamed(AppRoute.addProperty);
  }
}
