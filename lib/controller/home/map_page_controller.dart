import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart' as latlng;
import 'package:permission_handler/permission_handler.dart';
import 'package:sakanle/core/api/api_service.dart';
import 'package:sakanle/core/constant/app_route.dart';
import 'package:sakanle/core/functions/show_filter_map_sheet.dart';
import 'package:sakanle/core/functions/show_message.dart';
import 'package:sakanle/core/functions/show_open_location.dart';
import 'package:sakanle/core/services/token_service.dart';

abstract class MapPageController extends GetxController {
  void getCurrentCenter();
  void changeStatusOfCityButton(int index);
  void changeStatusOfSErviceButton(int index);
  void changeCurrentCenterAndZoom(String city);
  Future<void> showResults();
  void changeOfSelectedService(String service);
  void navigateToAddProperty();
  void getCurrentLocation();
  Future<bool> handleLocationPermission();
  void showFilterSheet();
  void navigateToResultsPage();
  void changeValueOfPrice(bool value);
  void selectPropertyType(String type);
  void selectPropertyNature(String item);
  void onCancelFilter();
  void onConfirmFilter();
  void changePriceRange(double value);
}

class MapPageControllerImp extends MapPageController {
  late List<String> cites;
  late List<String> services;
  late List<bool> citesStatus;
  late List<bool> servicesStatus;
  late MapController mapController;
  RxDouble initialZoom = 0.0.obs;
  late Rxn<latlng.LatLng> currentCenter = Rxn<latlng.LatLng>();
  late List<Map<String, dynamic>> foundedResults;
  late String selectedCity;
  late String selectedService;
  bool filterEnabled = false;
  bool isLoading = false;

  // filter fields
  RxBool priceEnabled = false.obs;
  late List<String> propertyTypes;
  late List<String> propertyNature;
  RxDouble price = 0.0.obs;
  RxString selectedType = ''.obs;
  RxString selectedNature = ''.obs;

  // API filter params
  String? selectedPropertyType;
  double? selectedPriceMin;
  double? selectedPriceMax;

  @override
  void onInit() {
    mapController = MapController();
    getCurrentCenter();
    initialZoom.value = 6.26;
    foundedResults = [];
    selectedCity = "";
    selectedService = "الكل";
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
    services = [
      'الكل',
      'للبيع',
      'للإيجار السنوي',
      'للإيجار - شهري',
      'للإيجار - أسبوعي',
    ];
    propertyTypes = [
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
    propertyNature = ['اخرى', 'حكم محكمة', 'طابو اخضر'];
    citesStatus = List.generate(cites.length, (_) => false);
    servicesStatus = List.generate(services.length, (_) => false);
    servicesStatus[0] = true;
    super.onInit();
  }

  @override
  void getCurrentCenter() async {
    await Future.delayed(const Duration(seconds: 5));
    currentCenter.value = latlng.LatLng(35.8, 38.01);
    update(['map']);
  }

  @override
  void changeStatusOfCityButton(int index) {
    citesStatus = List.generate(cites.length, (_) => false);
    citesStatus[index] = true;
    update(['cities']);
  }

  @override
  void changeStatusOfSErviceButton(int index) {
    servicesStatus = List.generate(services.length, (_) => false);
    servicesStatus[index] = true;
    update(['services']);
  }

  @override
  void changeCurrentCenterAndZoom(String city) {
    latlng.LatLng newCenter;
    switch (city) {
      case 'إدلب':
        newCenter = latlng.LatLng(35.7661, 36.6342);
        break;
      case 'حماة':
        newCenter = latlng.LatLng(35.1315, 36.7567);
        break;
      case 'الحسكة':
        newCenter = latlng.LatLng(37.0044, 40.7630);
        break;
      case 'حمص':
        newCenter = latlng.LatLng(34.7304, 36.7123);
        break;
      case 'الرّقة':
        newCenter = latlng.LatLng(35.9400, 39.0200);
        break;
      case 'درعا':
        newCenter = latlng.LatLng(32.6163, 36.0989);
        break;
      case 'السويداء':
        newCenter = latlng.LatLng(32.6359, 36.7032);
        break;
      case 'القنيطرة':
        newCenter = latlng.LatLng(33.0833, 35.5833);
        break;
      case 'دير الزور':
        newCenter = latlng.LatLng(35.3290, 40.1448);
        break;
      case 'اللاذقية':
        newCenter = latlng.LatLng(35.5296, 35.7869);
        break;
      case 'ريف دمشق':
        newCenter = latlng.LatLng(33.6043, 36.4055);
        break;
      case 'حلب':
        newCenter = latlng.LatLng(36.2021, 37.1343);
        break;
      case 'طرطوس':
        newCenter = latlng.LatLng(34.9339, 35.8843);
        break;
      case 'دمشق':
        newCenter = latlng.LatLng(33.5138, 36.2765);
        break;
      default:
        newCenter = latlng.LatLng(35.8, 38.01);
        break;
    }
    selectedCity = city;
    mapController.move(newCenter, 8);
  }

  // ===== Filter Methods =====

  @override
  void changeValueOfPrice(bool value) {
    priceEnabled.value = value;
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
  void changePriceRange(double value) {
    price.value = value;
  }

  // ===== Results =====

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
        ownershipType: selectedNature.value.isNotEmpty
            ? selectedNature.value
            : null,
        propertyType: selectedPropertyType,
        priceMin: selectedPriceMin,
        priceMax: selectedPriceMax,
      );

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
  void changeOfSelectedService(String service) {
    selectedService = service;
  }

  // ===== Filter Sheet =====

  @override
  void showFilterSheet() async {
    selectedType.value = '';
    selectedNature.value = '';
    priceEnabled.value = false;
    price.value = 0.0;

    var result = await showFilterMapsBottomSheet();
    if (result != null) {
      filterEnabled = result['filterEnabled'] ?? false;
      selectedPropertyType = result['property_type'];
      selectedNature.value = result['property_nature'] ?? ''; 
      selectedPriceMin = result['price_min'] != null
          ? double.tryParse(result['price_min'].toString())
          : null;
      selectedPriceMax = result['price_max'] != null
          ? double.tryParse(result['price_max'].toString())
          : null;
      update(['filter']);
      showResults();
    }
  }

  @override
  void onCancelFilter() {
    filterEnabled = false;
    selectedPropertyType = null;
    selectedPriceMin = null;
    selectedPriceMax = null;
    Get.back(result: {'filterEnabled': false});
  }

  @override
  void onConfirmFilter() {
    final hasFilter =
        priceEnabled.value ||
        selectedType.value.isNotEmpty ||
        selectedNature.value.isNotEmpty;

    Get.back(
      result: {
        'filterEnabled': hasFilter,
        'property_type': selectedType.value.isNotEmpty
            ? selectedType.value
            : null,
        'property_nature': selectedNature.value.isNotEmpty
            ? selectedNature.value
            : null,
        'price_min': priceEnabled.value ? 0.0 : null,
        'price_max': priceEnabled.value ? price.value : null,
      },
    );
  }

  // ===== Navigation =====

  @override
  void navigateToAddProperty() {
    Get.toNamed(AppRoute.addProperty);
  }

  @override
  void navigateToResultsPage() {
    Get.toNamed(
      AppRoute.foundedResults,
      arguments: {
        "city": selectedCity,
        "service": selectedService,
      },
    );
  }

  // ===== Location =====

  @override
  Future<bool> handleLocationPermission() async {
    var status = await Permission.location.request();
    if (!status.isGranted) return false;
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      showOpenLocation(
        onPressedCancel: () => Get.back(),
        onPressedConfirm: () async {
          Get.back();
          await Geolocator.openLocationSettings();
        },
      );
      return false;
    }
    await getCurrentLocation();
    return true;
  }

  @override
  Future<void> getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) return;
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) return;
    Position position = await Geolocator.getCurrentPosition();
    latlng.LatLng center = latlng.LatLng(position.latitude, position.longitude);
    mapController.move(center, 16);
    showMessage();
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
