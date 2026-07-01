import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sakanle/controller/home/founded_results_controller.dart';
import 'package:sakanle/core/constant/app_color.dart';
import 'package:sakanle/core/constant/app_url.dart';
import 'package:sakanle/view/widgets/home/map/my_button_location.dart';
import 'package:sakanle/view/widgets/home/property/founded_result/property_card.dart';

class FoundedResults extends StatelessWidget {
  const FoundedResults({super.key});

  @override
  Widget build(BuildContext context) {
    FoundedResultsControllerImp controller =
        Get.find<FoundedResultsControllerImp>();

    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      appBar: AppBar(
        title: Text(
          Get.arguments['city'],
          style: TextTheme.of(context).bodySmall!.copyWith(fontSize: 18),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          SizedBox(
            height: 40,
            child: GetBuilder<FoundedResultsControllerImp>(
              builder: (controller) {
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.services.length,
                  itemBuilder: (context, index) {
                    return MyButtonLocation(
                      isPressed: controller.isPressed[index],
                      onPressed: () {
                        controller.changeStatusOfIsPressed(index);
                        controller.changeOfSelectedService(
                          controller.services[index],
                        );
                        controller.showResults();
                      },
                      title: controller.services[index],
                    );
                  },
                );
              },
            ),
          ),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: GetBuilder<FoundedResultsControllerImp>(
              id: 'results',
              builder: (controller) {
                return Row(
                  children: [
                    Text(
                      "قائمة العقارات",
                      style: TextTheme.of(context).bodySmall!.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      "${controller.foundedResults.length} نتيجة",
                      style: TextTheme.of(context).bodySmall!.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w200,
                        color: AppColor.primaryColor,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),

          const SizedBox(height: 10),
          Expanded(
            child: GetBuilder<FoundedResultsControllerImp>(
              id: 'results',
              builder: (controller) {
                if (controller.isLoading) {
                  return const Center(
                    child: CupertinoActivityIndicator(
                      radius: 12,
                      color: AppColor.secondColor,
                    ),
                  );
                }
                if (controller.foundedResults.isEmpty) {
                  return const Center(child: Text("لا توجد نتائج"));
                }
                return ListView.builder(
                  padding: const EdgeInsets.only(bottom: 20),
                  itemCount: controller.foundedResults.length,
                  itemBuilder: (context, index) {
                    final property = controller.foundedResults[index];
                    final photos = property['photos'] as List<dynamic>? ?? [];
                    final services =
                        property['services'] as List<dynamic>? ?? [];
                    final image = photos.isNotEmpty
                        ? "${AppUrl.photoUrl}${photos.first['path']}"
                        : "";
                    final price = services.isNotEmpty
                        ? services.first['price'].toString()
                        : "";
                    return PropertyCard(
                      image: image,
                      price: price,
                      propertyType: property['property_type'] ?? "",
                      description: property['facade'] ?? "",
                      location:
                          "${property['city'] ?? ""}، ${property['area_name'] ?? ""}، ${property['street'] ?? ""}",
                      onTap: () {
                        controller.navigateToPropertyDetails(property['id']);
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
