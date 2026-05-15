import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sakanle/data/model/property_details.dart';

abstract class PropertyDetailsController extends GetxController {
  void changeCurrentIndex(int index);
}

class PropertyDetailsControllerImp extends PropertyDetailsController {
  late int countOfImages;
  late List<String> titlesOfDetails;
  late List<PropertyDetails> propertyDetailsOne;
  late List<PropertyDetails> propertyDetailsTwo;
  late List<PropertyDetails> propertyDetailsThree;
  late List<List<PropertyDetails>> propertyDetails;
  late int currentIndex;

  @override
  void onInit() {
    currentIndex = 0;
    propertyDetailsOne = [
      PropertyDetails(icon: Icons.home, title: 'نوع العقار', content: 'شقة'),
      PropertyDetails(
        icon: Icons.straighten,
        title: 'المساحة',
        content: '126.00 متر مربع',
      ),
      PropertyDetails(
        icon: Icons.houseboat_outlined,
        title: 'الواجهة',
        content: 'شارع رئيسي',
      ),
      PropertyDetails(
        icon: Icons.safety_check_rounded,
        title: 'نوع الملكية',
        content: 'مفروز أصولي',
      ),
      PropertyDetails(icon: Icons.home, title: 'عدد الغرف', content: '3 غرفة'),
      PropertyDetails(
        icon: Icons.bed_rounded,
        title: 'عدد الصالات',
        content: '6 صالة',
      ),
      PropertyDetails(
        icon: Icons.bed,
        title: 'عدد الحمامات',
        content: '1 حمام',
      ),
      PropertyDetails(
        icon: Icons.punch_clock_outlined,
        title: 'عمر العقار',
        content: 'أكثر من عشر سنوات',
      ),
      PropertyDetails(icon: Icons.info, title: 'الحالة', content: 'نشط'),
      PropertyDetails(
        icon: Icons.date_range_sharp,
        title: 'تاريخ الانشاء',
        content: '15/2/2026',
      ),
    ];
    propertyDetailsTwo = [
      PropertyDetails(
        icon: Icons.location_city,
        title: 'المحافطة',
        content: 'حماة',
      ),
      PropertyDetails(icon: Icons.location_on, title: 'المنطقة', content: '1'),
      PropertyDetails(icon: Icons.home, title: 'الحي', content: 'سراقب'),
      PropertyDetails(
        icon: Icons.run_circle_sharp,
        title: 'الشارع',
        content: 'مفروز أصولي',
      ),
      PropertyDetails(
        icon: Icons.location_city_outlined,
        title: 'الطابق',
        content: '5',
      ),
      PropertyDetails(
        icon: Icons.location_on,
        title: 'العنوان الكامل',
        content: 'سراقب',
      ),
    ];
    propertyDetailsThree = [
      PropertyDetails(
        icon: Icons.numbers,
        title: 'رقم الإعلان',
        content: '1283',
      ),
      PropertyDetails(
        icon: Icons.date_range_outlined,
        title: 'تاريخ بداية الإعلان',
        content: '15/2/2026',
      ),
      PropertyDetails(
        icon: Icons.date_range_outlined,
        title: 'تاريخ نهاية الإعلان',
        content: '15/2/2026',
      ),
      PropertyDetails(
        icon: Icons.source,
        title: 'مصدر الإعلان',
        content: 'owner',
      ),
      PropertyDetails(
        icon: Icons.remove_red_eye_outlined,
        title: 'عدد المشاهدات',
        content: '11',
      ),
    ];
    propertyDetails = [
      propertyDetailsOne,
      propertyDetailsTwo,
      propertyDetailsThree,
    ];
    countOfImages = 3;
    titlesOfDetails = ['العقار', 'الموقع', 'الإعلان'];
    super.onInit();
  }

  @override
  void changeCurrentIndex(int index) {
    currentIndex = index;
    update();
  }
}
