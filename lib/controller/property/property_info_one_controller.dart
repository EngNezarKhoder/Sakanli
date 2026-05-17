import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class PropertyInfoOneController extends GetxController {
  void changeStatusOfService(bool val, int index);
  void onChangePropertyType(String val);
  void onChangePropertyFront(String val);
  void onChangePropertyOwnerShip(String val);
  void changeAdvertiserType(String val);
  void addBedRoom();
  void removeBedRoom();
  void addPathRoom();
  void removePathRoom();
  void addToilet();
  void removeToilet();
  void setDate(DateTime date);
  bool validatePageFields();
  void changeFocusFront(bool val);
  void changeFocusPropertyType(bool val);
  void changeFocusOwnerShip(bool val);
}

class PropertyInfoOneControllerImp extends PropertyInfoOneController {
  late List<Map<String, dynamic>> serviceInfo;
  final TextEditingController priceSale = TextEditingController();
  TextEditingController priceRentAnnually = TextEditingController();
  final TextEditingController priceRentMonthly = TextEditingController();
  final TextEditingController priceRentDaily = TextEditingController();
  late List<String> propertyTypes;
  late List<String> fronts;
  String? selectedProperty;
  String? advertiserType;
  final TextEditingController propertyArea = TextEditingController();
  String? front;
  late List<String> ownerShips;
  String? ownerShip;
  int countBedRoom = 0;
  int countPathRoom = 0;
  int countToilet = 0;
  final TextEditingController myDate = TextEditingController();
  DateTime selectedDate = DateTime.now();
  final TextEditingController detailsController = TextEditingController();
  RxInt textLength = 0.obs;
  final GlobalKey<FormState> formState = GlobalKey<FormState>();

  bool isFocusFront = false;
  bool isFocusPropertyType = false;
  bool isFocusPropertyOwnerShip = false;

  final FocusNode frontFocusNode = FocusNode();
  final FocusNode propertyTypeFocusNode = FocusNode();
  final FocusNode ownerShipFocusNode = FocusNode();

  @override
  void onInit() {
    propertyTypes = [
      'اخرى',
      'اسهم',
      'بناء',
      'منزل',
      'فيلا',
      'محل تجاري',
      'مكتب',
      'أرض',
      'مستودع',
      'مزرعة',
      'مطعم',
      'عيادة',
    ];
    fronts = [
      'اخرى',
      'شارع رئيسي',
      'شارع فرعي',
      'زاوية',
      'شارع هادئ',
      'حديقة عامة',
      'البحر',
      'الجبل',
      'ساحة عامة',
      'منطقة تجارية',
      'منطقة سكنية',
    ];
    ownerShips = [
      'اخرى',
      'حكم محكمة',
      'طابو أسهم',
      'طابو أخضر',
      'طابو اسكان',
      'فروغ',
      'سند الملكية',
      'عقد بيع',
      'وكالة',
      'هبة',
      'إرث',
      'إجازة',
      'حق انتفاع',
      'مفروز أصولي',
      'قيد شرعي',
      'إشغال',
    ];
    serviceInfo = [
      {
        "title": "للبيع",
        "status": false,
        "titleService": "سعر للبيع بالدولار ",
        "price": priceSale,
      },
      {
        "title": "للإيجار-سنوي",
        "status": false,
        "titleService": "سعر للإيجار السنوي بالدولار ",
        "price": priceRentAnnually,
      },
      {
        "title": "للإيجار-شهري",
        "status": false,
        "titleService": "سعر للإيجار الشهري بالدولار ",
        "price": priceRentMonthly,
      },
      {
        "title": "للإيجار-يومي",
        "status": false,
        "titleService": "سعر للإيجار اليومي بالدولار ",
        "price": priceRentDaily,
      },
    ];
    detailsController.addListener(() {
      textLength.value = detailsController.text.length;
    });
    super.onInit();
  }

  @override
  void onChangePropertyType(String val) {
    selectedProperty = val;
    update();
  }

  @override
  void changeAdvertiserType(String val) {
    advertiserType = val;
    update();
  }

  @override
  void onChangePropertyFront(String val) {
    front = val;
    update();
  }

  @override
  void changeStatusOfService(bool val, int index) {
    serviceInfo[index]['status'] = val;
    update();
  }

  @override
  void onChangePropertyOwnerShip(String val) {
    ownerShip = val;
    update();
  }

  @override
  void addBedRoom() {
    countBedRoom++;
    update();
  }

  @override
  void addPathRoom() {
    countPathRoom++;
    update();
  }

  @override
  void addToilet() {
    countToilet++;
    update();
  }

  @override
  void removeBedRoom() {
    if (countBedRoom > 0) countBedRoom--;
    update();
  }

  @override
  void removePathRoom() {
    if (countPathRoom > 0) countPathRoom--;
    update();
  }

  @override
  void removeToilet() {
    if (countToilet > 0) countToilet--;
    update();
  }

  @override
  void setDate(DateTime date) {
    selectedDate = date;
    myDate.text =
        "${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";
    update();
  }

  @override
  bool validatePageFields() {
    return serviceInfo.any((e) => e['status'] == true) &&
        (selectedProperty?.isNotEmpty ?? false) &&
        (advertiserType?.isNotEmpty ?? false) &&
        (front?.isNotEmpty ?? false) &&
        (ownerShip?.isNotEmpty ?? false);
  }

  @override
  void onClose() {
    detailsController.dispose();
    myDate.dispose();
    propertyArea.dispose();
    priceRentDaily.dispose();
    priceRentMonthly.dispose();
    priceRentAnnually.dispose();
    priceSale.dispose();
    super.onClose();
  }

  @override
  void changeFocusFront(bool val) {
    isFocusFront = val;
    update();
  }

  @override
  void changeFocusOwnerShip(bool val) {
    isFocusPropertyOwnerShip = val;
    update();
  }

  @override
  void changeFocusPropertyType(bool val) {
    isFocusPropertyType = val;
    update();
  }
}
