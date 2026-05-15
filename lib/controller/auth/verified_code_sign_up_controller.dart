import 'package:get/get.dart';
import 'package:sakanle/core/constant/app_route.dart';

abstract class VerifiedCodeSignUpController extends GetxController {
  void navigateToHomePage();
  void undo();
}

class VerifiedCodeSignUpControllerImp extends VerifiedCodeSignUpController {
  @override
  void navigateToHomePage() {
    Get.offAllNamed(AppRoute.homePage);
  }

  @override
  void undo() {
    Get.back();
  }
}
