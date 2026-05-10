import 'package:get/get.dart';

abstract class FilterMapController extends GetxController {
  void changeValueOfPrice(bool value);
  void selectPropertyType(String type);
  void selectPropertyNature(String item);
  void onCancelFilter();
  void onConfirmFilter();
  void changePriceRange(double price);
}

class FilterMapControllerImp extends FilterMapController {
  RxBool priceEnabled = false.obs;
  late List<String> propertyTypes;
  late List<String> propertyNature;
  RxDouble price = 0.0.obs;
  RxString selectedType = ''.obs;
  RxString selectedNature = ''.obs;

  @override
  void onInit() {
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
    super.onInit();
  }

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
  void onCancelFilter() {
    Get.back(result: {'filterEnabled': false});
    Get.back();
  }

  @override
  void onConfirmFilter() {
    Get.back(
      result: {
        'filterEnabled':
            (priceEnabled.value ||
                selectedType.value != '' ||
                selectedNature.value != '')
            ? true
            : false,
        'selectedPropertyType': selectedType.value,
        'selectedPropertyNature': selectedNature.value,
        'price': price.value,
      },
    );
  }

  @override
  void changePriceRange(double price) {
    price = price;
  }
}
