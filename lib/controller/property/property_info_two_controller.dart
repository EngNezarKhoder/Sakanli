import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sakanle/core/constant/app_route.dart';
import 'package:sakanle/core/functions/show_open_location.dart';

abstract class PropertyInfoTwoController extends GetxController {
  void onChangeMyCity(String city);
  String validateFields();
  Future<bool> handleLocationPermission();
  void onTapAddLocation();
  void onChangeFocus(bool value);
}

class PropertyInfoTwoControllerImp extends PropertyInfoTwoController {
  late List<String> cites;
  String? selectedCity;
  final TextEditingController locationArea = TextEditingController();
  final TextEditingController street = TextEditingController();
  final TextEditingController floor = TextEditingController();
  final TextEditingController building = TextEditingController();
  final TextEditingController propertyNumber = TextEditingController();
  final GlobalKey<FormState> formState = GlobalKey<FormState>();
  double lat = 0.0;
  double lng = 0.0;
  String address = "";
  bool isFocusedCity = false;
  final FocusNode cityFocusNode = FocusNode();

  @override
  void onInit() {
    cites = [
      'إدلب',
      'حماة',
      'الحسكة',
      'حمص',
      'الرقة',
      'درعا',
      'السويداء',
      'دمشق',
      'القنيطرة',
      'اللاذقية',
      'ريف دمشق',
      'حلب',
      'طرطوس',
    ];
    super.onInit();
  }

  @override
  void onChangeMyCity(String city) {
    selectedCity = city;
    update();
  }

  @override
  String validateFields() {
    if (address == "") {
      return "addError";
    }
    if (!formState.currentState!.validate()) {
      return "fieldsError";
    }
    return "ok";
  }

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
    return true;
  }

  @override
  void onTapAddLocation() async {
    bool hasPermission = await handleLocationPermission();
    if (hasPermission) {
      var result = await Get.toNamed(AppRoute.mapScreen);
      if (result != null) {
        lat = result['lat'];
        lng = result['lng'];
        address = result['address'];
        update();
      }
    }
  }

  @override
  void onChangeFocus(bool value) {
    isFocusedCity = value;
    update();
  }

  @override
  void onClose() {
    propertyNumber.dispose();
    building.dispose();
    floor.dispose();
    street.dispose();
    locationArea.dispose();
    super.onClose();
  }
}
