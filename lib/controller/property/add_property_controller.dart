import 'package:get/get.dart';
import 'package:sakanle/core/constant/app_route.dart';

abstract class AddPropertyController extends GetxController {
  void navigateToAdvicePage();
  void navigateToAddPropertyInfo();
}

class AddPropertyControllerImp extends AddPropertyController {
  @override
  void navigateToAdvicePage() {
    Get.toNamed(AppRoute.advicePage);
  }

  @override
  void navigateToAddPropertyInfo() {
    Get.toNamed(AppRoute.propertyInfo);
  }
}
