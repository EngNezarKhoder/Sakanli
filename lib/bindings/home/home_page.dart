import 'package:get/get.dart';
import 'package:sakanle/controller/home/ads_page_controller.dart';
import 'package:sakanle/controller/home/favorite_page_controller.dart';
import 'package:sakanle/controller/home/home_page_controller.dart';
import 'package:sakanle/controller/home/map_page_controller.dart';
import 'package:sakanle/controller/home/settings_page_controller.dart';

class HomePageBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomePageControllerImp());
    Get.lazyPut(() => AdsPageControllerImp());
    Get.lazyPut(() => FavoritePageControllerImp());
    Get.lazyPut(() => MapPageControllerImp());
    Get.lazyPut(() => SettingsPageControllerImp());
  }
}
