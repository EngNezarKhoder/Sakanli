import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sakanle/core/constant/app_route.dart';
import 'package:sakanle/core/constant/image_assets.dart';
import 'package:sakanle/core/enum/view_mode.dart';
import 'package:sakanle/core/functions/show_filter_ads_sheet.dart';

abstract class AdsPageController extends GetxController {
  void changeViewMode(ViewMode mode);
  void showFilter();
  void navigateToAddProperty();
  void navigateToPropertyDetails();
}

class AdsPageControllerImp extends AdsPageController {
  final TextEditingController search = TextEditingController();
  ViewMode viewMode = ViewMode.list;
  bool filterEnabled = false;
  bool isFavorite = false;
  List<Map<String, dynamic>> homes = [
    {
      'imageName': AppImageAssets.roomOneIcon,
      'iconName': AppImageAssets.favoriteIcon,
      'forWhat': "أ",
      'city': " حمص",
      'price': '80',
      'location': 'حمص',
      'service': 'للبيع',
    },
    {
      'imageName': AppImageAssets.roomOneIcon,
      'iconName': AppImageAssets.favoriteIcon,
      'forWhat': "أ",
      'city': " حمص",
      'price': '80',
      'location': 'حمص',
      'service': 'للبيع',
    },
  ];

  @override
  void changeViewMode(ViewMode mode) {
    viewMode = mode;
    update();
  }

  @override
  void showFilter() async {
    var result = await showFilterAdsBottomSheet();
    if (result != null) {
      filterEnabled = result['filterEnabled'];
      update();
    }
  }

  @override
  void navigateToAddProperty() {
    Get.toNamed(AppRoute.myProperty);
  }

  @override
  void navigateToPropertyDetails() {
    Get.toNamed(AppRoute.propertyDetails);
  }
}
