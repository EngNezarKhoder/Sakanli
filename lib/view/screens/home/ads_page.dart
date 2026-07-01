import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sakanle/controller/home/ads_page_controller.dart';
import 'package:sakanle/core/constant/app_color.dart';
import 'package:sakanle/core/constant/app_url.dart';
import 'package:sakanle/core/constant/image_assets.dart';
import 'package:sakanle/view/widgets/home/home_ad_grid_widget.dart';
import 'package:sakanle/view/widgets/home/home_ad_widget.dart';
import 'package:sakanle/view/widgets/home/my_custom_button_home.dart';
import 'package:sakanle/view/widgets/home/my_custom_text_form_search.dart';
import 'package:sakanle/view/widgets/home/property/details/my_empty_state.dart';
import 'package:sakanle/view/widgets/home/view_mode_widget.dart';
import 'package:sakanle/core/enum/view_mode.dart';

class AdsPage extends StatelessWidget {
  const AdsPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => AdsPageControllerImp(), fenix: false);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: GetBuilder<AdsPageControllerImp>(
        builder: (controller) {
          return ListView(
            children: [
              // ================= HEADER =================
              Row(
                children: [
                  Image.asset(AppImageAssets.profileIcon),
                  const SizedBox(width: 10),
                  InkWell(
                    onTap: controller.navigateToAddProperty,
                    child: Image.asset(AppImageAssets.addIcon),
                  ),
                  const Spacer(),
                  Image.asset(AppImageAssets.sIcon),
                  const SizedBox(width: 10),
                  Image.asset(AppImageAssets.menuIcon),
                ],
              ),

              const SizedBox(height: 40),

              // ================= FILTER + SEARCH =================
              Row(
                children: [
                  const SizedBox(width: 25),
                  Expanded(
                    child: MyCustomButtonHome(
                      onPressed: controller.showFilter,
                      imageName: AppImageAssets.filterIcon,
                      title: controller.filterEnabled ? 'فلتر نشط' : 'تصفية',
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: MyCustomTextFormSearch(
                      hintText: "بحث",
                      myController: controller.search,
                      validator: (value) => null,
                      keyboardType: TextInputType.text,
                      suffixImageName: AppImageAssets.searchIcon,
                    ),
                  ),
                  const SizedBox(width: 25),
                ],
              ),

              const SizedBox(height: 15),

              // ================= VIEW MODE =================
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ViewModeWidget(
                    imageName: AppImageAssets.rectanglesIcon,
                    opacity: controller.viewMode == ViewMode.list ? 0.5 : 1,
                    onTap: () {
                      controller.changeViewMode(ViewMode.grid);
                    },
                  ),
                  const SizedBox(width: 10),
                  ViewModeWidget(
                    imageName: AppImageAssets.rectangleIcon,
                    opacity: controller.viewMode == ViewMode.grid ? 0.5 : 1,
                    onTap: () {
                      controller.changeViewMode(ViewMode.list);
                    },
                  ),
                  const SizedBox(width: 25),
                ],
              ),

              const SizedBox(height: 27),

              // ================= STATES (LOADING / EMPTY / DATA) =================
              if (controller.isLoading)
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: const Center(
                    child: CupertinoActivityIndicator(
                      radius: 12,
                      color: AppColor.secondColor,
                    ),
                  ),
                )
              else if (controller.homes.isEmpty)
                MyEmptyState(
                  title: "جرّب تغيير البحث أو الفلاتر أو أضف عقار جديد.",
                )
              else
                controller.viewMode == ViewMode.list
                    ? ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: controller.homes.length,
                        itemBuilder: (context, index) {
                          final item = controller.homes[index];

                          final photos = item['photos'] ?? [];
                          final image = photos.isNotEmpty
                              ? photos[0]['path']
                              : null;

                          final service =
                              (item['services'] != null &&
                                  item['services'].isNotEmpty)
                              ? item['services'][0]['type']
                              : '';

                          final isFavorite = (item['is_favorite'] ?? 0) == 1;

                          return HomeAdWidget(
                            imageName: "${AppUrl.photoUrl}/$image",
                            iconName: isFavorite
                                ? AppImageAssets.favoriteFilledIcon
                                : AppImageAssets.favoriteIcon,
                            forWhat: service == "sale" ? "ش" : 'أ',
                            city: item['city'] ?? '',
                            price:
                                item['services'][0]['price']?.toString() ?? '',
                            location: item['area_name'] ?? '',
                            service: controller.convertData(service),
                            onTapDetails: () {
                              controller.navigateToPropertyDetails(item['id']);
                            },
                            onTapToggle: () {
                              controller.toggleFavorite(item['id']);
                            },
                          );
                        },
                      )
                    : GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                              childAspectRatio: 0.65,
                              mainAxisExtent: 290,
                            ),
                        itemCount: controller.homes.length,
                        itemBuilder: (context, index) {
                          final item = controller.homes[index];

                          final photos = item['photos'] ?? [];
                          final image = photos.isNotEmpty
                              ? photos[0]['path']
                              : null;

                          final service =
                              (item['services'] != null &&
                                  item['services'].isNotEmpty)
                              ? item['services'][0]['type']
                              : '';

                          final isFavorite = (item['is_favorite'] ?? 0) == 1;

                          return HomeAdGridWidget(
                            forWhat: service == "sale" ? "ش" : 'أ',
                            iconName: isFavorite
                                ? AppImageAssets.favoriteFilledIcon
                                : AppImageAssets.favoriteIcon,
                            imageName: "${AppUrl.photoUrl}/$image",
                            price:
                                item['services'][0]['price']?.toString() ?? '',
                            location: item['area_name'] ?? '',
                            service: controller.convertData(service),
                            city: item['city'] ?? '',
                            onTapDetails: () {
                              controller.navigateToPropertyDetails(item['id']);
                            },
                            onTapToggle: () {
                              controller.toggleFavorite(item['id']);
                            },
                          );
                        },
                      ),
            ],
          );
        },
      ),
    );
  }
}
