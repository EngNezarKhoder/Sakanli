import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sakanle/controller/home/favorite_page_controller.dart';
import 'package:sakanle/core/constant/app_color.dart';
import 'package:sakanle/core/constant/image_assets.dart';
import 'package:sakanle/view/widgets/home/property/favorite/home_ad_favorite.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    FavoritePageControllerImp controller = Get.put(FavoritePageControllerImp());
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
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
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(
            color: Colors.grey.withValues(alpha: 0.08),
            height: 1,
          ),
        ),
      ),
      body: Container(
        color: AppColor.whiteColor,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: ListView.builder(
          itemCount: 3,
          itemBuilder: (context, index) {
            return HomeAdFavorite(
              imageName: AppImageAssets.roomOneIcon,
              iconName: AppImageAssets.favoriteIcon,
              forWhat: "ش",
              location: " حمص",
              price: 80.00,
              service: "للايجار السنوي",
              onTap: () {
                controller.navigateToPropertyDetails();
              },
            );
          },
        ),
      ),
    );
  }
}
