import 'package:get/get.dart';
import 'package:sakanle/core/constant/app_route.dart';

abstract class ServicePageController extends GetxController {
  void backPressed();
  void changeStateOfSelected(int index);
  void addService(String service);
  void backToAdsPage();
}

class ServicePageControllerImp extends ServicePageController {
  late List<String> services;
  late List<String> servicesAdded;
  late List<bool> selected;

  @override
  void onInit() {
    services = [
      "بيع",
      "إيجار سنوي",
      "إيجار شهري",
      "إيجار أسبوعي",
      "إيجار يومي",
    ];
    servicesAdded = [];
    selected = List.generate(services.length, (_) => false);
    super.onInit();
  }

  @override
  void backPressed() {
    Get.back();
  }

  @override
  void changeStateOfSelected(int index) {
    selected[index] = !selected[index];
    update();
  }

  @override
  void addService(String service) {
    servicesAdded.add(service);
  }

  @override
  void backToAdsPage() {
    Get.offAllNamed(AppRoute.homePage);
  }
}
