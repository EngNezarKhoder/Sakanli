import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sakanle/core/api/api_service.dart';
import 'package:sakanle/core/services/token_service.dart';
import 'package:sakanle/data/model/property_details.dart';
import 'package:url_launcher/url_launcher.dart';

abstract class PropertyDetailsController extends GetxController {
  void changeCurrentIndex(int index);
  void callWhatsApp();
  void callPhone();
  void back();
  Future<void> loadProperty(int id);
}

class PropertyDetailsControllerImp extends PropertyDetailsController {
  int currentIndex = 0;

  int? id;
  bool isLoading = false;
  bool isError = false;
  bool isEmpty = false;
  String ownerName = '';
  Map<String, dynamic>? property;

  List<String> images = [];

  List<PropertyDetails> propertyDetailsOne = [];
  List<PropertyDetails> propertyDetailsTwo = [];
  List<PropertyDetails> propertyDetailsThree = [];

  List<List<PropertyDetails>> propertyDetails = [];
  List<String> titlesOfDetails = [];

  @override
  void onInit() {
    super.onInit();

    titlesOfDetails = ['العقار', 'الموقع', 'الإعلان'];

    final args = Get.arguments;

    if (args is int) {
      id = args;
    } else if (args is Map && args['id'] != null) {
      id = args['id'];
    }

    if (id != null) {
      loadProperty(id!);
    } else {
      isError = true;
      update();
    }
  }

  // ================= LOAD =================
  @override
  Future<void> loadProperty(int id) async {
    try {
      isLoading = true;
      isError = false;
      isEmpty = false;
      update();

      final token = await TokenService.getToken();

      final result = await ApiService.getPropertyById(
        token: token ?? "",
        id: id,
      );

      if (result == null) {
        isEmpty = true;
        return;
      }

      property = result;

      _mapData();
    } catch (e) {
      print("LOAD PROPERTY ERROR: $e");
      isError = true;
    } finally {
      isLoading = false;
      update();
    }
  }

  // ================= MAP DATA =================
  void _mapData() {
    final data = property;

    if (data == null) {
      isEmpty = true;
      return;
    }

    ownerName = data['user']?['name'] ?? 'غير معروف';

    // ================= PHOTOS SAFE =================
    final photos = (data['photos'] ?? []) as List;
    images = photos
        .map((e) => (e['path'] ?? '').toString())
        .where((e) => e.isNotEmpty)
        .toList();

    // ================= SERVICE SAFE =================
    final services = (data['services'] ?? []) as List;
    final service = services.isNotEmpty ? services[0] : {};

    // ================= PROPERTY DETAILS 1 =================
    propertyDetailsOne = [
      PropertyDetails(
        icon: Icons.home,
        title: 'نوع العقار',
        content: data['property_type'] ?? '',
      ),
      PropertyDetails(
        icon: Icons.straighten,
        title: 'المساحة',
        content: '${data['area'] ?? ''} متر مربع',
      ),
      PropertyDetails(
        icon: Icons.houseboat_outlined,
        title: 'الواجهة',
        content: data['facade'] ?? '',
      ),
      PropertyDetails(
        icon: Icons.safety_check_rounded,
        title: 'نوع الملكية',
        content: data['ownership_type'] ?? '',
      ),
      PropertyDetails(
        icon: Icons.bed,
        title: 'الطابق',
        content: '${data['floor'] ?? ''}',
      ),
      PropertyDetails(
        icon: Icons.info,
        title: 'الحالة',
        content: data['status'] == "approved" ? "نشط" : 'موقف',
      ),
    ];

    // ================= PROPERTY DETAILS 2 =================
    propertyDetailsTwo = [
      PropertyDetails(
        icon: Icons.location_city,
        title: 'المدينة',
        content: data['city'] ?? '',
      ),
      PropertyDetails(
        icon: Icons.home,
        title: 'المنطقة',
        content: data['area_name'] ?? '',
      ),
      PropertyDetails(
        icon: Icons.location_on,
        title: 'الشارع',
        content: data['street'] ?? '',
      ),
      PropertyDetails(
        icon: Icons.location_city_outlined,
        title: 'البناء',
        content: data['building'] ?? '',
      ),
      PropertyDetails(
        icon: Icons.confirmation_number,
        title: 'رقم العقار',
        content: data['property_number'] ?? '',
      ),
    ];

    // ================= PROPERTY DETAILS 3 =================
    propertyDetailsThree = [
      PropertyDetails(
        icon: Icons.numbers,
        title: 'رقم الإعلان',
        content: data['id']?.toString() ?? '',
      ),
      PropertyDetails(
        icon: Icons.date_range,
        title: 'تاريخ الإنشاء',
        content: formatDate(data['created_at']),
      ),
      PropertyDetails(
        icon: Icons.source,
        title: 'نوع الخدمة',
        content: convertData(service['type']),
      ),
      PropertyDetails(
        icon: Icons.monetization_on,
        title: 'السعر',
        content: service['price']?.toString() ?? '',
      ),
    ];

    propertyDetails = [
      propertyDetailsOne,
      propertyDetailsTwo,
      propertyDetailsThree,
    ];

    isEmpty = false;
  }

  // ================= UI =================
  @override
  void changeCurrentIndex(int index) {
    currentIndex = index;
    update();
  }

  @override
  void back() {
    Get.back();
  }

  // ================= CALL =================
  @override
  void callWhatsApp() async {
    String? phone = property?['whatsapp'];

    if (phone == null || phone.toString().isEmpty) return;
    phone = phone.toString().replaceAll('+', '').replaceAll(' ', '');
    if (phone.startsWith('0')) {
      phone = '963${phone.substring(1)}';
    }
    final Uri whatsapp = Uri.parse("https://wa.me/$phone");

    await launchUrl(whatsapp, mode: LaunchMode.externalApplication);
  }

  @override
  void callPhone() async {
    final phone = property?['phone'];

    if (phone == null || phone.toString().isEmpty) return;

    final Uri uri = Uri(scheme: 'tel', path: phone.toString());
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  String convertData(String data) {
    switch (data) {
      case "sale":
        return "للبيع";
      case "yearly_rent":
        return "إيجار سنوي";
      case "monthly_rent":
        return "إيجار شهري";
      case "weekly_rent":
        return "إيجار أسبوعي";
      default:
        return "";
    }
  }

  String formatDate(String? date) {
    if (date == null || date.isEmpty) return '';

    try {
      final dt = DateTime.parse(date);
      return DateFormat('yyyy-MM-dd').format(dt); // أو أي شكل بدك ياه
    } catch (e) {
      return date;
    }
  }
}
