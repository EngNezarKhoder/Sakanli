import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sakanle/controller/home/favorite_page_controller.dart';
import 'package:sakanle/core/constant/app_color.dart';
import 'package:sakanle/view/widgets/home/home_ad_grid_widget.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    final FavoritePageControllerImp controller =
        Get.find<FavoritePageControllerImp>();
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
        child: GridView.builder(
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
        ),
      ),
    );
  }
}
