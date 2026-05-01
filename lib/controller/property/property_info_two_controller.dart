import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class PropertyInfoTwoController extends GetxController {
  void onChangeMyCity(String city);
  bool validateFields();
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
  bool validateFields() {
    if (formState.currentState!.validate()) {
      return true;
    }
    return false;
  }
}
