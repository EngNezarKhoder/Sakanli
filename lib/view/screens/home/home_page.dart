import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sakanle/controller/home/home_page_controller.dart';
import 'package:sakanle/core/constant/app_color.dart';
import 'package:sakanle/core/constant/image_assets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomePageControllerImp>(
      init: HomePageControllerImp(),
      builder: (controller) {
        return Scaffold(
        backgroundColor: AppColor.whiteColor,
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: controller.index,
          onTap: (value) {
            controller.changeIndexOnTap(value);
          },
          items: [
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(bottom: 8),
                child: Image.asset(AppImageAssets.adsIcon),
              ),
              label: "الإعلانات",
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(bottom: 8),
                child: Image.asset(AppImageAssets.mapIcon),
              ),
              label: "الخريطة",
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(bottom: 8),
                child: Image.asset(AppImageAssets.favoriteIcon),
              ),
              label: "المفضّلة",
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(bottom: 8),
                child: Image.asset(AppImageAssets.settingsIcon),
              ),
              label: "الإعدادات",
            ),
          ],
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: controller.pages[controller.index],
        ),
      );
      },
    );
  }
}
