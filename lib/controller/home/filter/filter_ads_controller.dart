import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class FilterAdsController extends GetxController {
  void selectPropertyType(String type);
  void selectPropertyNature(String item);
  void onCancelFilter();
  void onConfirmFilter();
}

class FilterAdsControllerImp extends FilterAdsController {
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
  final List<String> propertyNature = ['اخرى', 'حكم محكمة', 'طابو اخضر'];
  RxString selectedType = ''.obs;
  RxString selectedNature = ''.obs;
  final TextEditingController cityName = TextEditingController();

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
            (cityName.text != '' ||
                selectedType.value != '' ||
                selectedNature.value != '')
            ? true
            : false,
        'selectedPropertyType': selectedType.value,
        'selectedPropertyNature': selectedNature.value,
        'city': cityName.text,
      },
    );
  }

  @override
  void onClose() {
    cityName.dispose();
  }
}
