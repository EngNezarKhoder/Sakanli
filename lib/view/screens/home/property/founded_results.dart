import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sakanle/controller/home/founded_results_controller.dart';
import 'package:sakanle/core/constant/app_color.dart';
import 'package:sakanle/view/widgets/home/map/my_button_location.dart';
import 'package:sakanle/view/widgets/home/property/property_info_one/price_widget.dart';
import 'package:sakanle/view/widgets/home/property/founded_result/property_card.dart';

class FoundedResults extends StatelessWidget {
  const FoundedResults({super.key});

  @override
  Widget build(BuildContext context) {
    FoundedResultsControllerImp controller = Get.put(
      FoundedResultsControllerImp(),
    );
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
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: controller.services.length,
              itemBuilder: (context, index) {
                return GetBuilder<FoundedResultsControllerImp>(
                  builder: (controller) {
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
          Container(
            padding: const EdgeInsets.only(right: 10, left: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GetBuilder<FoundedResultsControllerImp>(
                  builder: (controller) {
                    return PriceWidget(
                      onTap: () {
                        controller.changeStatusOfFormDownToTop();
                      },
                      formDownToTop: controller.formDownToTop,
                    );
                  },
                ),
                Spacer(),
                Text(
                  "قائمة العقارات ",
                  style: TextTheme.of(context).bodySmall!.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w200,
                  ),
                ),
                Text(
                  "${controller.countOfFoundedResults} نتيجة",
                  style: TextTheme.of(context).bodySmall!.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w200,
                    color: AppColor.primaryColor,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          PropertyCard(
            image:
                'https://images.unsplash.com/photo-1600585154526-990dced4db0d',
            price: 'USD 35,000 ',
            propertyType: 'شقة',
            description: 'شقة طابق خامس مع مصعد',
            location: 'سراقب، إدلب، Saragib',
            onTap: () {
              controller.navigateToPropertyDetails();
            },
          ),
        ],
      ),
    );
  }
}
