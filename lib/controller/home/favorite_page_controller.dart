import 'package:get/get.dart';
import 'package:sakanle/core/constant/app_route.dart';
import 'package:sakanle/core/api/api_service.dart';
import 'package:sakanle/core/services/token_service.dart';

abstract class FavoritePageController extends GetxController {
  void fetchFavorites();
  void navigateToPropertyDetails(int id);
}

class FavoritePageControllerImp extends FavoritePageController {
  List<Map<String, dynamic>> homes = [];
  bool isLoading = false;

  @override
  void onInit() {
    super.onInit();
    fetchFavorites();
  }

  @override
  Future<void> fetchFavorites() async {
    try {
      isLoading = true;
      update();

      final token = await TokenService.getToken();

      final result = await ApiService.getFavorites(token: token ?? "");

      if (result != null) {
        homes = List<Map<String, dynamic>>.from(result);
      }
    } catch (e) {
      print("FETCH FAVORITES ERROR: $e");
    } finally {
      isLoading = false;
      update();
    }
  }

  @override
  void navigateToPropertyDetails(int id) {
    Get.toNamed(AppRoute.propertyDetails, arguments: id);
  }

  String convertData(String data) {
    switch (data) {
      case "sale":
        return "للبيع";
      case "yearly_rent":
        return "إيجار سنوي";
      case "monthly_rent":
        return "إيجار شهري";
      case "weekly_rent":
        return "إيجار أسبوعي";
      default:
        return '';
    }
  }

  Future<void> toggleFavorite(int propertyId) async {
    try {
      final token = await TokenService.getToken();

      final index = homes.indexWhere((item) => item['id'] == propertyId);

      if (index == -1) return;

      final removedItem = homes[index];
      homes.removeAt(index);
      update();

      final result = await ApiService.toggleFavorite(
        token: token ?? "",
        propertyId: propertyId,
      );

      if (result == null) {
        homes.insert(index, removedItem);
        update();
      }
    } catch (e) {
      print("TOGGLE FAVORITE ERROR: $e");
    }
  }
}
