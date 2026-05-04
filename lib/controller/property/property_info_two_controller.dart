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
}

class PropertyInfoTwoControllerImp extends PropertyInfoTwoController {
  late List<String> cites;
  late String selectedCity;
  late TextEditingController locationArea;
  late TextEditingController street;
  late TextEditingController level;
  late TextEditingController building;
  late TextEditingController propertyId;
  late GlobalKey<FormState> formState;
  double lat = 0.0;
  double lng = 0.0;
  String address = "";

  @override
  void onInit() {
    selectedCity = 'دمشق';
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
    locationArea = TextEditingController();
    street = TextEditingController();
    level = TextEditingController();
    building = TextEditingController();
    propertyId = TextEditingController();
    formState = GlobalKey<FormState>();
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
}
