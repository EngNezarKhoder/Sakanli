import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sakanle/controller/home/ads_page_controller.dart';
import 'package:sakanle/core/constant/image_assets.dart';
import 'package:sakanle/view/widgets/home/home_ad_grid_widget.dart';
import 'package:sakanle/view/widgets/home/home_ad_widget.dart';
import 'package:sakanle/view/widgets/home/my_custom_button_home.dart';
import 'package:sakanle/view/widgets/home/my_custom_text_form_search.dart';
import 'package:sakanle/view/widgets/home/view_mode_widget.dart';
import 'package:sakanle/core/enum/view_mode.dart';

class AdsPage extends StatelessWidget {
  const AdsPage({super.key});
  @override
  Widget build(BuildContext context) {
    final AdsPageControllerImp controller = Get.find<AdsPageControllerImp>();
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: ListView(
        children: [
          Row(
            children: [
              Image.asset(AppImageAssets.profileIcon),
              const SizedBox(width: 10),
              InkWell(
                onTap: () {
                  controller.navigateToAddProperty();
                },
                child: Image.asset(AppImageAssets.addIcon),
              ),
              const Spacer(),
              Image.asset(AppImageAssets.sIcon),
              const SizedBox(width: 10),
              Image.asset(AppImageAssets.menuIcon),
            ],
          ),
          const SizedBox(height: 40),
          Row(
            children: [
              const SizedBox(width: 25),
              GetBuilder<AdsPageControllerImp>(
                builder: (controller) {
                  return Expanded(
                    child: MyCustomButtonHome(
                      onPressed: () {
                        controller.showFilter();
                      },
                      imageName: AppImageAssets.filterIcon,
                      title: controller.filterEnabled ? 'فلتر نشط' : 'تصفية',
                    ),
                  );
                },
              ),
              const SizedBox(width: 10),
              Expanded(
                child: MyCustomTextFormSearch(
                  hintText: "بحث",
                  myController: controller.search,
                  validator: (value) {
                    return;
                  },
                  keyboardType: TextInputType.text,
                  suffixImageName: AppImageAssets.searchIcon,
                ),
              ),
              const SizedBox(width: 25),
            ],
          ),
          const SizedBox(height: 15),
          GetBuilder<AdsPageControllerImp>(
            builder: (controller) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ViewModeWidget(
                    imageName: AppImageAssets.rectanglesIcon,
                    opacity: controller.viewMode == ViewMode.list ? 0.5 : 1,
                    onTap: () {
                      controller.changeViewMode(
                        ViewMode.grid,
                      ); // gv = Grid View
                    },
                  ),
                  const SizedBox(width: 10),
                  ViewModeWidget(
                    imageName: AppImageAssets.rectangleIcon,
                    opacity: controller.viewMode == ViewMode.grid ? 0.5 : 1,
                    onTap: () {
                      controller.changeViewMode(
                        ViewMode.list,
                      ); // lv = List View
                    },
                  ),
                  const SizedBox(width: 25),
                ],
              );
            },
          ),
          const SizedBox(height: 27),
          GetBuilder<AdsPageControllerImp>(
            builder: (controller) {
              return controller.viewMode == ViewMode.list
                  ? ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: controller.homes.length,
                      itemBuilder: (context, index) {
                        return HomeAdWidget(
                          imageName: controller.homes[index]['imageName'],
                          iconName: controller.homes[index]['iconName'],
                          forWhat: controller.homes[index]['forWhat'],
                          city: controller.homes[index]['city'],
                          price: controller.homes[index]['price'],
                          location: controller.homes[index]['location'],
                          service: controller.homes[index]['service'],
                          onTapDetails: () {
                            controller.navigateToPropertyDetails();
                          },
                        );
                      },
                    )
                  : GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 0.65,
                        mainAxisExtent: 290,
                      ),
                      itemCount: controller.homes.length,
                      itemBuilder: (context, index) {
                        return HomeAdGridWidget(
                          forWhat: controller.homes[index]['forWhat'],
                          iconName: controller.homes[index]['iconName'],
                          imageName: controller.homes[index]['imageName'],
                          price: controller.homes[index]['price'],
                          location: controller.homes[index]['location'],
                          service: controller.homes[index]['service'],
                          onTapDetails: () {
                            controller.navigateToPropertyDetails();
                          },
                        );
                      },
                    );
            },
          ),
        ],
      ),
    );
  }
}
