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
      builder: (controller) {
        return Scaffold(
          backgroundColor: AppColor.whiteColor,
          bottomNavigationBar: Container(
            margin: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.08),
                  blurRadius: 20,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: ClipRRect(
              child: BottomNavigationBar(
                selectedItemColor: const Color(0xFFFF8A00),
                showUnselectedLabels: true,
                selectedFontSize: 17,
                unselectedFontSize: 0,
                elevation: 0,
                type: BottomNavigationBarType.fixed,
                currentIndex: controller.index,
                onTap: (value) {
                  controller.changeIndexOnTap(value);
                },
                items: [
                  BottomNavigationBarItem(
                    icon: Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: controller.index == 0
                          ? Image.asset(AppImageAssets.adsIcon)
                          : Image.asset(AppImageAssets.adsOutlinedIcon),
                    ),
                    label: "الإعلانات",
                  ),
                  BottomNavigationBarItem(
                    icon: Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: controller.index == 1
                          ? Image.asset(AppImageAssets.mapFilledIcon)
                          : Image.asset(AppImageAssets.mapIcon),
                    ),
                    label: "الخريطة",
                  ),
                  BottomNavigationBarItem(
                    icon: Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: controller.index == 2
                          ? Image.asset(AppImageAssets.favoriteFilledIcon)
                          : Image.asset(AppImageAssets.favoriteIcon),
                    ),
                    label: "المفضّلة",
                  ),
                  BottomNavigationBarItem(
                    icon: Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: controller.index == 3
                          ? Image.asset(AppImageAssets.settingsFilledIcon)
                          : Image.asset(AppImageAssets.settingsIcon),
                    ),
                    label: "الإعدادات",
                  ),
                ],
              ),
            ),
          ),
          body: controller.pages[controller.index],
        );
      },
    );
  }
}
