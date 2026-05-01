import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sakanle/view/screens/home/ads_page.dart';
import 'package:sakanle/view/screens/home/favorite_page.dart';
import 'package:sakanle/view/screens/home/map_page.dart';
import 'package:sakanle/view/screens/home/settings_page.dart';

abstract class HomePageController extends GetxController {
  void changeIndexOnTap(int value);
}

class HomePageControllerImp extends HomePageController {
  late int index;
  late List<Widget> pages;
  @override
  void onInit() {
    index = 0;
    pages = [
      AdsPage(),
      MapPage(),
      FavoritePage(),
      SettingsPage()
    ];
    super.onInit();
  }

  @override
  void changeIndexOnTap(int value) {
    index = value;
    update();
  }
}
