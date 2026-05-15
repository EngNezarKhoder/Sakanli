import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:latlong2/latlong.dart' as latlng;
import 'package:permission_handler/permission_handler.dart';
import 'package:sakanle/core/constant/app_route.dart';
import 'package:sakanle/core/functions/show_filter_sheet.dart';
import 'package:sakanle/core/functions/show_message.dart';
import 'package:sakanle/core/functions/show_open_location.dart';

abstract class MapPageController extends GetxController {
  void getCurrentCenter();
  void changeStatusOfCityButton(int index);
  void changeStatusOfSErviceButton(int index);
  void changeCurrentCenterAndZoom(String city);
  void showResults();
  void changeOfSelectedService(String service);
  void navigateToAddProperty();
  void getCurrentLocation();
  Future<bool> handleLocationPermission();
  void showFilterSheet();
  void navigateToResultsPage();
}

class MapPageControllerImp extends MapPageController {
  late List<String> cites;
  late List<String> services;
  late List<bool> citesStatus;
  late List<bool> servicesStatus;
  late MapController mapController;
  RxDouble initialZoom = 0.0.obs;
  late Rxn<LatLng> currentCenter = Rxn<LatLng>();
  late List<Map<String, dynamic>> foundedResults;
  late String selectedCity;
  late String selectedService;
  RxBool filterEnabled = false.obs;

  @override
  void onInit() {
    mapController = MapController();
    getCurrentCenter();
    initialZoom.value = 6.26;
    foundedResults = [];
    selectedCity = "";
    selectedService = "";
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
      'للإيجار - يومي',
    ];
    citesStatus = List.generate(cites.length, (status) => false);
    servicesStatus = List.generate(services.length, (status) => false);
    servicesStatus[0] = true;
    super.onInit();
  }

  @override
  void getCurrentCenter() async {
    await Future.delayed(Duration(seconds: 5));
    currentCenter.value = LatLng(35.8, 38.01);
  }

  @override
  void changeStatusOfCityButton(int index) {
    citesStatus = List.generate(cites.length, (status) => false);
    citesStatus[index] = true;
    update();
  }

  @override
  void changeStatusOfSErviceButton(int index) {
    servicesStatus = List.generate(services.length, (status) => false);
    servicesStatus[index] = true;
    update();
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

  @override
  void showResults() {
    switch (selectedService) {
      case 'الكل':
        if (selectedCity != '')
          foundedResults = [
            {"name": "حمص"},
          ];
        break;
      case 'للبيع':
        if (selectedCity != '')
          foundedResults = [
            {"name": "حمص"},
          ];
        break;
      case 'للإيجار السنوي':
        if (selectedCity != '')
          foundedResults = [
            {"name": "حمص"},
          ];
        break;
      case 'للإيجار - شهري':
        if (selectedCity != '')
          foundedResults = [
            {"name": "حمص"},
          ];
        break;
      case 'للإيجار - يومي':
        if (selectedCity != '') foundedResults = [];
        break;
    }
    update();
  }

  @override
  void changeOfSelectedService(String service) {
    selectedService = service;
  }

  @override
  void navigateToAddProperty() {
    Get.toNamed(AppRoute.addProperty);
  }

  @override
  Future<bool> handleLocationPermission() async {
    var status = await Permission.location.request();
    if (!status.isGranted) return false;
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      showOpenLocation(
        onPressedCancel: () {
          Get.back();
        },
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

  @override
  void showFilterSheet() async {
    var result = await showFilterBottomSheet();
    if (result != null) {
      filterEnabled.value = result['filterEnabled'];
    }
  }

  @override
  void navigateToResultsPage() {
    Get.toNamed(
      AppRoute.foundedResults,
      arguments: {
        "city": selectedCity,
        "service": selectedService,
        "countOfPropertyFounded": foundedResults.length,
      },
    );
  }
}
