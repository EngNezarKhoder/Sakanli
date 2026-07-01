import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sakanle/controller/home/favorite_page_controller.dart';
import 'package:sakanle/core/constant/app_color.dart';
import 'package:sakanle/core/constant/app_url.dart';
import 'package:sakanle/core/constant/image_assets.dart';
import 'package:sakanle/view/widgets/home/home_ad_grid_widget.dart';
import 'package:sakanle/view/widgets/home/property/details/my_empty_state.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => FavoritePageControllerImp(), fenix: false);

    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      appBar: AppBar(
        elevation: 5,
        shadowColor: Colors.black.withValues(alpha: 0.2),
        scrolledUnderElevation: 3,
        backgroundColor: AppColor.whiteColor,
        surfaceTintColor: AppColor.whiteColor,
        centerTitle: true,
        title: Text(
          "المفضلة",
          style: TextTheme.of(context).bodySmall!.copyWith(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: AppColor.secondColor,
            letterSpacing: 0.5,
          ),
        ),
      ),

      body: Container(
        color: AppColor.whiteColor,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),

        child: GetBuilder<FavoritePageControllerImp>(
          builder: (controller) {
            if (controller.isLoading) {
              return const Center(
                child: CupertinoActivityIndicator(
                  radius: 12,
                  color: AppColor.secondColor,
                ),
              );
            }

            if (controller.homes.isEmpty) {
              return Center(
                child: MyEmptyState(
                  title: "جرّب اضافة عقار الى المفضلة من القائمة الرئيسية .",
                ),
              );
            }

            return GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
                final image = photos.isNotEmpty ? photos[0]['path'] : '';

                final services = item['services'] ?? [];
                final service = services.isNotEmpty ? services[0] : null;

                final type = service != null ? service['type'] : '';
                final price = service != null
                    ? service['price'].toString()
                    : '';

                return HomeAdGridWidget(
                  forWhat: type == "sale" ? "ش" : "أ",
                  iconName: AppImageAssets.favoriteFilledIcon,
                  imageName: "${AppUrl.photoUrl}/$image",
                  price: price,
                  location: item['area_name'] ?? '',
                  service: controller.convertData(type),
                  city: item['city'] ?? '',
                  onTapDetails: () {
                    controller.navigateToPropertyDetails(item['id']);
                  },
                  onTapToggle: () {
                    controller.toggleFavorite(item['id']);
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}
