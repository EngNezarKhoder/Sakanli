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
}

class PropertyInfoOneControllerImp extends PropertyInfoOneController {
  late List<Map<String, dynamic>> serviceInfo;
  late TextEditingController priceSale;
  late TextEditingController priceRentAnnually;
  late TextEditingController priceRentMonthly;
  late TextEditingController priceRentDaily;
  late List<String> propertyTypes;
  late List<String> fronts;
  late String selectedProperty;
  late String advertiserType;
  late TextEditingController propertyArea;
  late String front;
  late List<String> ownerShips;
  late String ownerShip;
  late int countBedRoom;
  late int countPathRoom;
  late int countToilet;
  late TextEditingController myDate;
  late DateTime selectedDate;
  late TextEditingController detailsController;
  RxInt textLength = 0.obs;
  late GlobalKey<FormState> formState;

  late bool requiredService;
  late bool requiredAdvertiserType;
  late bool requiredPropertyArea;
  late bool status;

  @override
  void onInit() {
    advertiserType = "";
    propertyArea = TextEditingController();
    priceSale = TextEditingController();
    priceRentAnnually = TextEditingController();
    priceRentMonthly = TextEditingController();
    priceRentDaily = TextEditingController();
    myDate = TextEditingController();
    detailsController = TextEditingController();
    formState = GlobalKey<FormState>();
    countBedRoom = 0;
    countPathRoom = 0;
    countToilet = 0;
    selectedDate = DateTime.now();
    requiredService = false;
    requiredAdvertiserType = false;
    requiredPropertyArea = false;
    status = false;
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
    front = 'اخرى';
    selectedProperty = 'اخرى';
    ownerShip = 'اخرى';
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
    for (int i = 0; i < serviceInfo.length; i++) {
      if (serviceInfo[i]['status'] == true) {
        requiredService = true;
        break;
      }
    }
    if (advertiserType != '') {
      requiredAdvertiserType = true;
    }
    if (propertyArea.text != '') {
      requiredPropertyArea = true;
    }
    if (formState.currentState!.validate() &&
        requiredAdvertiserType &&
        requiredPropertyArea &&
        requiredService) {
      status = true;
    }
    return status;
  }
}
