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
  int index = 0;
  final List<Widget> pages = const [
    AdsPage(),
    MapPage(),
    FavoritePage(),
    SettingsPage(),
  ];

  @override
  void changeIndexOnTap(int value) {
    index = value;
    update();
  }
}
