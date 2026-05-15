import 'package:get/get.dart';
import 'package:sakanle/core/constant/app_route.dart';

abstract class FoundedResultsController extends GetxController {
  void changeStatusOfIsPressed(int index);
  void changeOfSelectedService(String service);
  void showResults();
  void changeStatusOfFormDownToTop();
  void navigateToPropertyDetails();
}

class FoundedResultsControllerImp extends FoundedResultsController {
  late List<String> services;
  late String selectedService;
  late List<bool> isPressed;
  late int countOfFoundedResults;
  late bool formDownToTop;

  @override
  void onInit() {
    formDownToTop = true;
    services = [
      'الكل',
      'للبيع',
      'للإيجار السنوي',
      'للإيجار - شهري',
      'للإيجار - يومي',
    ];
    countOfFoundedResults = Get.arguments['countOfPropertyFounded'];
    isPressed = List.generate(services.length, (status) => false);
    selectedService = '';
    for (int i = 0; i < services.length; i++) {
      if (Get.arguments['service'] == services[i]) {
        isPressed[i] = true;
      } else {
        isPressed[i] = false;
      }
    }
    super.onInit();
  }

  @override
  void changeStatusOfIsPressed(int index) {
    isPressed = List.generate(services.length, (status) => false);
    isPressed[index] = true;
    update();
  }

  @override
  void changeOfSelectedService(String service) {
    selectedService = service;
    update();
  }

  @override
  void showResults() {}

  @override
  void changeStatusOfFormDownToTop() {
    formDownToTop = !formDownToTop;
    update();
  }

  @override
  void navigateToPropertyDetails() {
    Get.toNamed(AppRoute.propertyDetails);
  }
}
