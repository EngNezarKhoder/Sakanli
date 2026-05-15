import 'package:get/get.dart';
import 'package:sakanle/core/constant/app_route.dart';

abstract class FavoritePageController extends GetxController {
  void navigateToPropertyDetails();
}

class FavoritePageControllerImp extends FavoritePageController {
  @override
  void navigateToPropertyDetails() {
    Get.toNamed(AppRoute.propertyDetails);
  }
}
