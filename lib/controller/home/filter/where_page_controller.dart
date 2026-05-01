import 'package:get/get.dart';
import 'package:sakanle/core/constant/app_route.dart';

abstract class WherePageController extends GetxController {
  void backPressed();
  void navigateToServicePage();
  void changeStateOfSelect(int index);
  void addCityFilter(String cityName);
}

class WherePageControllerImp extends WherePageController {
  late List<String> cites;
  late List<bool> selected;
  late List<String> citesAdded;
  @override
  void backPressed() {
    Get.back();
  }

  @override
  void onInit() {
    cites = [
      "إدلب",
      "حماة",
      "الحسكة",
      "حمص",
      "الرّقة",
      "درعا",
      "السويداء",
      "القنيطرة",
      "دير الزور",
      "اللاذقية",
      "ريف دمشق",
      "حلب",
      "طرطوس",
      "دمشق",
    ];
    selected = List.generate(cites.length, (_) => false);
    citesAdded = [];
    super.onInit();
  }

  @override
  void navigateToServicePage() {
    Get.toNamed(AppRoute.service);
  }

  @override
  void changeStateOfSelect(int index) {
    selected[index] = !selected[index];
    update();
  }

  @override
  void addCityFilter(String cityName) {
    citesAdded.add(cityName);
  }
}
