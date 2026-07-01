import 'package:get/get.dart';
import 'package:sakanle/core/api/api_service.dart';
import 'package:sakanle/core/constant/app_route.dart';
import 'package:sakanle/core/services/token_service.dart';

abstract class FoundedResultsController extends GetxController {
  void changeStatusOfIsPressed(int index);
  void changeOfSelectedService(String service);
  void showResults();
  void changeStatusOfFormDownToTop();
  void navigateToPropertyDetails(int id);
}

class FoundedResultsControllerImp extends FoundedResultsController {
  late List<String> services;
  late String selectedService;
  late List<bool> isPressed;
  late bool formDownToTop;
  bool isLoading = false;
  late String selectedCity;
  List<Map<String, dynamic>> foundedResults = [];

  @override
  void onInit() {
    selectedCity = Get.arguments['city'];
    selectedService = Get.arguments['service'];
    formDownToTop = true;
    services = [
      'الكل',
      'للبيع',
      'للإيجار السنوي',
      'للإيجار - شهري',
      'للإيجار - يومي',
    ];
    isPressed = List.generate(services.length, (status) => false);
    for (int i = 0; i < services.length; i++) {
      if (Get.arguments['service'] == services[i]) {
        isPressed[i] = true;
      } else {
        isPressed[i] = false;
      }
    }
    showResults();
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
  Future<void> showResults() async {
    if (selectedCity.isEmpty) {
      foundedResults = [];
      update(['results']);
      return;
    }

    isLoading = true;
    update(['results']);

    try {
      final token = await TokenService.getToken();

      if (token == null) {
        foundedResults = [];
        isLoading = false;
        Get.snackbar('خطأ', 'يرجى تسجيل الدخول أولاً');
        update(['results']);
        return;
      }

      final result = await ApiService.mapProperties(
        token: token,
        city: selectedCity,
        serviceType: convertData(selectedService),
      );

      print(result);

      if (result != null && result['data'] != null) {
        foundedResults = List<Map<String, dynamic>>.from(result['data']);
      } else {
        foundedResults = [];
      }
    } catch (e) {
      print("SHOW RESULTS ERROR: $e");
      foundedResults = [];
    }

    isLoading = false;
    update(['results']);
  }

  @override
  void changeStatusOfFormDownToTop() {
    formDownToTop = !formDownToTop;
    update();
  }

  @override
  void navigateToPropertyDetails(int id) {
    Get.toNamed(AppRoute.propertyDetails, arguments: id);
  }

  String convertData(String itemData) {
    switch (itemData) {
      case 'للبيع':
        return 'sale';
      case 'للإيجار السنوي':
        return 'yearly_rent';
      case 'للإيجار - شهري':
        return 'monthly_rent';
      case 'للإيجار - أسبوعي':
        return 'weekly_rent';
      default:
        return 'الكل';
    }
  }
}
