import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sakanle/core/constant/app_route.dart';
import 'package:sakanle/core/enum/view_mode.dart';
import 'package:sakanle/core/functions/show_filter_ads_sheet.dart';
import 'package:sakanle/core/api/api_service.dart';
import 'package:sakanle/core/services/token_service.dart';
import 'dart:async';

abstract class AdsPageController extends GetxController {
  void changeViewMode(ViewMode mode);
  void showFilter();
  void navigateToAddProperty();
  void navigateToPropertyDetails(int id);
  void selectPropertyType(String type);
  void selectPropertyNature(String item);
  void onCancelFilter();
  void onConfirmFilter();
  void navigateToProfilePage();
}

class AdsPageControllerImp extends AdsPageController {
  final TextEditingController search = TextEditingController();
  ViewMode viewMode = ViewMode.list;
  bool filterEnabled = false;
  bool isFavorite = false;
  List<Map<String, dynamic>> homes = [];
  bool isLoading = false;
  Timer? _debounce;
  final List<String> propertyTypes = [
    'منزل',
    'شقة',
    'بناء',
    'اسهم',
    'اخرى',
    'أرض',
    'مكتب',
    'محل تجاري',
    'فيلا',
    'مستودع',
    'مطعم',
    'مزرعة',
    'عيادة',
  ];
  final List<String> propertyNature = ['أخرى', 'حكم محكمة', 'طابو أخضر'];
  RxString selectedType = ''.obs;
  RxString selectedNature = ''.obs;

  @override
  void onInit() {
    super.onInit();

    fetchProperties();

    search.addListener(() {
      if (_debounce?.isActive ?? false) {
        _debounce!.cancel();
      }

      _debounce = Timer(const Duration(milliseconds: 500), () {
        fetchProperties();
      });
    });
  }

  @override
  void changeViewMode(ViewMode mode) {
    viewMode = mode;
    update();
  }

  @override
  void showFilter() async {
    var result = await showFilterAdsBottomSheet();

    if (result != null) {
      filterEnabled = result['filterEnabled'] ?? false;

      selectedType.value = result['selectedPropertyType'] ?? '';

      selectedNature.value = result['selectedPropertyNature'] ?? '';

      fetchProperties();

      update();
    }
  }

  @override
  void selectPropertyType(String item) {
    selectedType.value = item;
  }

  @override
  void selectPropertyNature(String item) {
    selectedNature.value = item;
  }

  @override
  void onCancelFilter() {
    Get.back(result: {'filterEnabled': false});
  }

  @override
  void onConfirmFilter() {
    Get.back(
      result: {
        'filterEnabled':
            (selectedType.value != '' || selectedNature.value != '')
            ? true
            : false,
        'selectedPropertyType': selectedType.value,
        'selectedPropertyNature': selectedNature.value,
      },
    );
  }

  Future<void> fetchProperties() async {
    try {
      isLoading = true;
      update();

      final token = await TokenService.getToken();

      final result = await ApiService.getAllProperties(
        token: token ?? "",
        search: search.text,
        propertyType: selectedType.value,
        ownershipType: selectedNature.value,
      );
      print(result);
      if (result != null) {
        homes = List<Map<String, dynamic>>.from(result);
      }
    } catch (e) {
      print("FETCH PROPERTIES ERROR: $e");
    } finally {
      isLoading = false;
      update();
    }
  }

  @override
  void navigateToAddProperty() {
    Get.toNamed(AppRoute.myProperty);
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

      final index = homes.indexWhere((e) => e['id'] == propertyId);
      if (index == -1) return;

      final current = homes[index]['is_favorite'] ?? 0;

      homes[index]['is_favorite'] = current == 1 ? 0 : 1;
      update();

      final result = await ApiService.toggleFavorite(
        token: token ?? "",
        propertyId: propertyId,
      );

      if (result == null) {
        homes[index]['is_favorite'] = current;
        update();
      }
    } catch (e) {
      print("TOGGLE FAVORITE ERROR: $e");
    }
  }

  @override
  void navigateToProfilePage() {
    Get.toNamed(AppRoute.myProfile);
  }
}
