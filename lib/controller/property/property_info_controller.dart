import 'dart:io';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sakanle/core/api/api_service.dart';
import 'package:sakanle/core/constant/app_route.dart';
import 'package:sakanle/core/constant/app_url.dart';
import 'package:sakanle/core/functions/alert_exit_app.dart';
import 'package:sakanle/core/functions/show_error_message.dart';
import 'package:sakanle/core/functions/show_open_location.dart';
import 'package:sakanle/core/functions/show_success_message.dart';
import 'package:sakanle/core/services/token_service.dart';
import 'package:sakanle/data/model/property_service_model.dart';
import 'package:sakanle/view/screens/home/property/add_property/property_info_one.dart';
import 'package:sakanle/view/screens/home/property/add_property/property_info_three.dart';
import 'package:sakanle/view/screens/home/property/add_property/property_info_two.dart';
import 'package:http/http.dart' as http;

abstract class PropertyInfoController extends GetxController {
  void changeValueOfIndex(int val);
  void navigateToNextPage();
  void navigateToPerviousPage();
  void changeStatusOfService(bool val, int index);
  void changeFocusPropertyType(bool val);
  void onChangePropertyType(String val);
  void changeAdvertiserType(String val);
  void changeFocusFront(bool val);
  void onChangePropertyFront(String val);
  void changeFocusOwnerShip(bool val);
  void onChangePropertyOwnerShip(String val);
  void removeToilet();
  void addBedRoom();
  void removeBedRoom();
  void addPathRoom();
  void removePathRoom();
  void addToilet();
  void setDate(DateTime date);
  bool validatePageFieldsPageOne();
  void onChangeMyCity(String city);
  Future<bool> handleLocationPermission();
  void onTapAddLocation();
  void onChangeFocus(bool value);
  String validateFieldsPageTwo();
  void uploadImageFromCamera();
  void uploadImageFromGallery();
  Future<void> clearAllImages();
  void removeImage(int index);
  double getTotalSizeOfImagesByMB();
  String validateFieldsPageThree();
  void showWarningDeleteAllImages();
  void markImageForDelete(int index);
}

class PropertyInfoControllerImp extends PropertyInfoController {
  int index = 0;
  final PageController pageController = PageController();
  late List<Widget> pages = [
    PropertyInfoOne(),
    PropertyInfoTwo(),
    PropertyInfoThree(),
  ];
  bool pageOneIsDone = false;
  bool pageTwoIsDone = false;
  final GlobalKey<FormState> formStatePageOne = GlobalKey();
  final GlobalKey<FormState> formStatePageTwo = GlobalKey();
  final GlobalKey<FormState> formStatePageThree = GlobalKey();
  late List<Map<String, dynamic>> serviceInfo;
  final TextEditingController priceRentMonthly = TextEditingController();
  final TextEditingController priceSale = TextEditingController();
  final TextEditingController priceRentAnnually = TextEditingController();
  final TextEditingController priceRentDaily = TextEditingController();
  bool isFocusPropertyType = false;
  final FocusNode propertyTypeFocusNode = FocusNode();
  String? selectedProperty;
  late List<String> propertyTypes;
  String? advertiserType;
  final TextEditingController propertyArea = TextEditingController();
  bool isFocusFront = false;
  final FocusNode frontFocusNode = FocusNode();
  String? front;
  late List<String> fronts;
  bool isFocusPropertyOwnerShip = false;
  final FocusNode ownerShipFocusNode = FocusNode();
  String? ownerShip;
  late List<String> ownerShips;
  DateTime selectedDate = DateTime.now();
  int countBedRoom = 0;
  int countPathRoom = 0;
  int countToilet = 0;
  final TextEditingController detailsController = TextEditingController();
  final TextEditingController myDate = TextEditingController();
  RxInt textLength = 0.obs;
  double lat = 0.0;
  double lng = 0.0;
  String address = "";
  final FocusNode cityFocusNode = FocusNode();
  late List<String> cites;
  bool isFocusedCity = false;
  String? selectedCity;
  final TextEditingController locationArea = TextEditingController();
  final TextEditingController street = TextEditingController();
  final TextEditingController building = TextEditingController();
  final TextEditingController floor = TextEditingController();
  final TextEditingController propertyNumber = TextEditingController();
  RxList<File> imageFiles = <File>[].obs;
  static const maxImages = 3;
  static const maxImageSize = 1 * 1024 * 1024;
  final TextEditingController phoneCalls = TextEditingController();
  final TextEditingController phoneWhatsApp = TextEditingController();
  String? token;
  bool isLoadingSend = false;
  bool isEditMode = false;
  Map<String, dynamic>? editProperty;
  RxList<Map<String, dynamic>> existingImages = <Map<String, dynamic>>[].obs;

  RxList<int> deletedImageIds = <int>[].obs;

  @override
  void changeValueOfIndex(int val) {
    index = val;
    update();
  }

  @override
  void onInit() async {
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
    detailsController.addListener(() {
      textLength.value = detailsController.text.length;
    });
    token = await TokenService.getToken();
    final args = Get.arguments;

    if (args != null && args['property'] != null) {
      isEditMode = true;
      editProperty = args['property'];
      _fillEditData(editProperty!);
    }
    super.onInit();
  }

  void _fillEditData(Map<String, dynamic> data) {
    selectedProperty = data['property_type'];
    advertiserType = data['user_role'];
    front = data['facade'];
    ownerShip = data['ownership_type'];
    selectedCity = data['city'];

    propertyArea.text = data['area']?.toString() ?? "";

    locationArea.text = data['area_name'] ?? "";
    street.text = data['street'] ?? "";
    building.text = data['building'] ?? "";
    floor.text = data['floor'] ?? "";
    propertyNumber.text = data['property_number'] ?? "";

    phoneCalls.text = data['phone'] ?? "";
    phoneWhatsApp.text = data['whatsapp'] ?? "";
    detailsController.text = data['notes'] ?? "";

    // rooms
    countBedRoom = int.tryParse(data['bedrooms']?.toString() ?? '0') ?? 0;
    countPathRoom = int.tryParse(data['bathrooms']?.toString() ?? '0') ?? 0;
    countToilet = int.tryParse(data['toilets']?.toString() ?? '0') ?? 0;

    // location
    lat = double.tryParse(data['lat']?.toString() ?? '0') ?? 0.0;
    lng = double.tryParse(data['lng']?.toString() ?? '0') ?? 0.0;

    // =========================
    // SERVICES SYNC (IMPORTANT)
    // =========================
    final List services = data['services'] ?? [];

    for (var service in serviceInfo) {
      service['status'] = false;

      for (var apiService in services) {
        String apiType = apiService['type'];

        if ((service['title'] == 'للبيع' && apiType == 'sale') ||
            (service['title'] == 'للإيجار-سنوي' && apiType == 'yearly_rent') ||
            (service['title'] == 'للإيجار-شهري' && apiType == 'monthly_rent') ||
            (service['title'] == 'للإيجار-يومي' && apiType == 'weekly_rent')) {
          service['status'] = true;

          (service['price'] as TextEditingController).text =
              apiService['price']?.toString() ?? '';
        }
      }
    }

    const String baseUrl = "http://192.171.100.7:8000/storage/";

    final List photos = data['photos'] ?? [];

    existingImages.assignAll(
      photos.map((e) => {"id": e["id"], "url": baseUrl + e["path"]}).toList(),
    );
    update();
  }

  @override
  void changeStatusOfService(bool val, int index) {
    serviceInfo[index]['status'] = val;
    update();
  }

  @override
  void uploadImageFromCamera() async {
    Get.back();
    try {
      XFile? cameraFile = await ImagePicker().pickImage(
        source: ImageSource.camera,
      );
      if (imageFiles.length + existingImages.length >= maxImages) {
        showErrorMessage('الحد الأقصى 3 صور فقط');
        return;
      }
      if (cameraFile != null) {
        if (File(cameraFile.path).lengthSync() > maxImageSize) {
          showErrorMessage('لا يمكن رفع صورة حجمها اكبر من 1 ميغا');
          return;
        }
        imageFiles.add(File(cameraFile.path));
        update();
      }
    } catch (e) {
      showErrorMessage('حدث خطأ أثناء رفع الصورة');
    }
  }

  @override
  void onTapAddLocation() async {
    bool hasPermission = await handleLocationPermission();
    var result = await Get.toNamed(AppRoute.mapScreen);
    if (hasPermission) {
      if (result != null) {
        lat = result['lat'];
        lng = result['lng'];
        address = result['address'];
        update();
      }
    }
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
  void changeFocusOwnerShip(bool val) {
    isFocusPropertyOwnerShip = val;
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
  void onChangePropertyType(String val) {
    selectedProperty = val;
    update();
  }

  @override
  void changeFocusFront(bool val) {
    isFocusFront = val;
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
  bool validatePageFieldsPageOne() {
    return serviceInfo.any((e) => e['status'] == true) &&
        (selectedProperty?.isNotEmpty ?? false) &&
        (advertiserType?.isNotEmpty ?? false) &&
        (front?.isNotEmpty ?? false) &&
        (ownerShip?.isNotEmpty ?? false);
  }

  @override
  void navigateToNextPage() async {
    if (index == 0) {
      if (!validatePageFieldsPageOne()) {
        showErrorMessage("يرجى اتمام جميع الحقول المطلوبة و المحددة بعلامة *");
        return;
      } else {
        pageOneIsDone = true;
        update();
      }
    }
    if (index == 1) {
      String message = validateFieldsPageTwo();
      if (message == "fieldsError") {
        showErrorMessage("يرجى اتمام جميع الحقول المطلوبة و المحددة بعلامة *");
        return;
      } else if (message == "addError") {
        showErrorMessage("يرجى تحديد موقع العقار على الخريطة");
        return;
      } else {
        pageTwoIsDone = true;
        update();
      }
    }
    if (index == 2) {
      if (validateFieldsPageThree() == 'imageError') {
        showErrorMessage("يرجى رفع صورة واحدة للعقار كحد أدنى");
        return;
      } else if (validateFieldsPageThree() == 'fieldsError') {
        showErrorMessage("يرجى اتمام جميع الحقول المطلوبة و المحددة بعلامة *");
      } else {
        if (token == null) return;
        if (isEditMode && editProperty != null) {
          updateProperty(token!, editProperty!['id']);
        } else {
          addProperty(token!);
        }
      }
    }
    if (index < 2) {
      index++;
      pageController.animateToPage(
        index,
        duration: Duration(milliseconds: 900),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void navigateToPerviousPage() {
    if (index == 0) Get.back();
    if (index > 0) {
      index--;
      pageController.animateToPage(
        index,
        duration: Duration(milliseconds: 900),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  String validateFieldsPageThree() {
    if (imageFiles.isEmpty && existingImages.isEmpty) {
      return 'imageError';
    }
    if (!formStatePageThree.currentState!.validate()) {
      return 'fieldsError';
    }
    return 'ok';
  }

  @override
  String validateFieldsPageTwo() {
    if (lat == 0.0 || lng == 0.0) {
      return "addError";
    }
    if (!formStatePageTwo.currentState!.validate()) {
      return "fieldsError";
    }
    return "ok";
  }

  @override
  void changeFocusPropertyType(bool val) {
    isFocusPropertyType = val;
    update();
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
    propertyNumber.dispose();
    building.dispose();
    floor.dispose();
    street.dispose();
    locationArea.dispose();
    phoneWhatsApp.dispose();
    phoneCalls.dispose();
    super.onClose();
  }

  @override
  void onChangeMyCity(String city) {
    selectedCity = city;
    update();
  }

  @override
  void onChangeFocus(bool value) {
    isFocusedCity = value;
    update();
  }

  @override
  void uploadImageFromGallery() async {
    Get.back();
    List<XFile>? galleryFiles = await ImagePicker().pickMultiImage();
    if (galleryFiles.isEmpty) return;
    for (var file in galleryFiles) {
      if (File(file.path).lengthSync() > maxImageSize) {
        showErrorMessage('لا يمكن رفع صورة أكبر من 1 ميغا');
        continue;
      }
      if (imageFiles.length + existingImages.length < maxImages) {
        imageFiles.add(File(file.path));
      } else {
        showErrorMessage('الحد الأقصى 3 صور فقط');
        break;
      }
    }
    update();
  }

  @override
  Future<void> clearAllImages() async {
    if (isEditMode) {
      for (final image in existingImages) {
        deletedImageIds.add(image['id']);
      }
    }

    imageFiles.clear();
    existingImages.clear();

    update();
  }

  Future<void> deleteMarkedImages() async {
    for (final photoId in deletedImageIds) {
      try {
        await ApiService.deletePropertyPhoto(token: token!, photoId: photoId);
      } catch (_) {}
    }

    deletedImageIds.clear();
  }

  @override
  void removeImage(int index) {
    imageFiles.removeAt(index);
    update();
  }

  @override
  double getTotalSizeOfImagesByMB() {
    double totalBytes = 0.0;
    for (var file in imageFiles) {
      totalBytes += file.lengthSync();
    }
    return double.parse((totalBytes / (1024 * 1024)).toStringAsFixed(1));
  }

  @override
  void showWarningDeleteAllImages() {
    alert(
      title: 'حذف الصور',
      content: 'هل أنت متأكد من رغبتك بحذف كل الصور ؟',
      cancelButtonTitle: 'الغاء',
      okButtonTitle: 'حذف الكل',
      onPressedOk: () async {
        await clearAllImages();
        Get.back();
      },
      onPressedCancel: () {
        Get.back();
      },
    );
  }

  Future<void> addProperty(String token) async {
    if (validateFieldsPageThree() != "ok") {
      showErrorMessage("الرجاء رفع صور وإكمال الحقول المطلوبة");
      return;
    }

    if (imageFiles.isEmpty && existingImages.isEmpty) {
      showErrorMessage("يجب رفع صورة واحدة على الأقل");
      return;
    }

    try {
      final services = serviceInfo.where((e) => e['status'] == true).map((e) {
        String type = e['title'].toString().toLowerCase().replaceAll(" ", "_");
        switch (type) {
          case 'للبيع':
            type = 'sale';
            break;
          case 'للإيجار-سنوي':
            type = 'yearly_rent';
            break;
          case 'للإيجار-شهري':
            type = 'monthly_rent';
            break;
          case 'للإيجار-يومي':
            type = 'weekly_rent'; // أو daily_rent حسب الـ API
            break;
        }

        return PropertyServiceModel(
          type: type,
          price: double.parse((e['price'] as TextEditingController).text),
        );
      }).toList();
      isLoadingSend = true;
      update(['isLoadingSend']);
      final result = await ApiService.createProperty(
        token: token,
        propertyType: selectedProperty!,
        userRole: advertiserType!,
        area: double.tryParse(propertyArea.text) ?? 0,
        facade: front!,
        ownershipType: ownerShip!,
        propertyAge: 0,
        city: selectedCity ?? "",
        areaName: locationArea.text,
        street: street.text,
        building: building.text,
        floor: floor.text,
        propertyNumber: propertyNumber.text,
        lat: lat,
        lng: lng,
        phone: phoneCalls.text,
        whatsapp: phoneWhatsApp.text,
        notes: detailsController.text,
        services: services,
        images: imageFiles,
      );
      isLoadingSend = false;
      update(['isLoadingSend']);

      if (result != null && result['statusCode'] == 201) {
        showSuccessMessage();

        imageFiles.clear();
        existingImages.clear();
        deletedImageIds.clear();

        Get.offAllNamed(AppRoute.homePage);
      } else {
        showErrorMessage(result?['body']?['message'] ?? "فشل إضافة العقار");
      }
    } catch (e) {
      showErrorMessage("حدث خطأ غير متوقع");
      print("addProperty error: $e");
    }
  }

  @override
  void markImageForDelete(int index) {
    deletedImageIds.add(existingImages[index]['id']);

    existingImages.removeAt(index);

    update();
  }

  Future<void> updateProperty(String token, int propertyId) async {
    if (validateFieldsPageThree() != "ok") {
      showErrorMessage("الرجاء رفع صور وإكمال الحقول المطلوبة");
      return;
    }

    if (imageFiles.isEmpty && existingImages.isEmpty) {
      showErrorMessage("يجب رفع صورة واحدة على الأقل");
      return;
    }

    try {
      final services = serviceInfo.where((e) => e['status'] == true).map((e) {
        String type = e['title'].toString().toLowerCase().replaceAll(" ", "_");

        switch (type) {
          case 'للبيع':
            type = 'sale';
            break;
          case 'للإيجار-سنوي':
            type = 'yearly_rent';
            break;
          case 'للإيجار-شهري':
            type = 'monthly_rent';
            break;
          case 'للإيجار-يومي':
            type = 'weekly_rent';
            break;
        }

        return PropertyServiceModel(
          type: type,
          price: double.parse((e['price'] as TextEditingController).text),
        );
      }).toList();

      isLoadingSend = true;
      update(['isLoadingSend']);

      final request = http.MultipartRequest(
        'POST',
        Uri.parse("${AppUrl.baseUrl}/property/$propertyId"),
      );

      request.headers['Accept'] = 'application/json';
      request.headers['Authorization'] = 'Bearer $token';


      request.fields['property_type'] = selectedProperty!;
      request.fields['user_role'] = advertiserType!;
      request.fields['area'] = propertyArea.text.toString();
      request.fields['facade'] = front!;
      request.fields['ownership_type'] = ownerShip!;
      request.fields['property_age'] = "0";
      request.fields['city'] = selectedCity ?? "";
      request.fields['area_name'] = locationArea.text;
      request.fields['street'] = street.text;
      request.fields['building'] = building.text;
      request.fields['floor'] = floor.text;
      request.fields['property_number'] = propertyNumber.text;
      request.fields['lat'] = lat.toString();
      request.fields['lng'] = lng.toString();
      request.fields['phone'] = phoneCalls.text;
      request.fields['whatsapp'] = phoneWhatsApp.text;
      request.fields['notes'] = detailsController.text;

      // services
      for (int i = 0; i < services.length; i++) {
        request.fields['services[$i][type]'] = services[i].type;
        request.fields['services[$i][price]'] = services[i].price.toString();
      }

      // deleted images (أفضل صيغة)
      for (int i = 0; i < deletedImageIds.length; i++) {
        request.fields['deleted_images[$i]'] = deletedImageIds[i].toString();
      }

      // new images
      for (int i = 0; i < imageFiles.length; i++) {
        request.files.add(
          await http.MultipartFile.fromPath('photos[$i]', imageFiles[i].path),
        );
      }

      print("URL: ${AppUrl.baseUrl}/property/$propertyId");
print("EDIT PROPERTY: $editProperty");

      final streamed = await request.send();
      final response = await http.Response.fromStream(streamed);

      isLoadingSend = false;
      update(['isLoadingSend']);

      if (response.statusCode == 200) {
        showSuccessMessage();

        imageFiles.clear();
        existingImages.clear();
        deletedImageIds.clear();

        Get.offAllNamed(AppRoute.homePage);
      } else {
        print(response.body);
        showErrorMessage("فشل تعديل العقار");
      }
    } catch (e) {
      isLoadingSend = false;
      update(['isLoadingSend']);
      showErrorMessage("حدث خطأ غير متوقع");
      print("updateProperty error: $e");
    }
  }
}
