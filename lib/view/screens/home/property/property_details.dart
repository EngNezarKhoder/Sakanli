import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sakanle/controller/property/property_details_controller.dart';
import 'package:sakanle/core/constant/app_color.dart';
import 'package:sakanle/core/constant/image_assets.dart';
import 'package:sakanle/view/widgets/home/property/details/image_container_view.dart';
import 'package:sakanle/view/widgets/home/property/add_property_widgets/my_cancel_button.dart';
import 'package:sakanle/view/widgets/home/property/add_property_widgets/my_next_button.dart';
import 'package:sakanle/view/widgets/home/property/details/my_button_details.dart';
import 'package:sakanle/view/widgets/home/property/details/owner_card_call.dart';
import 'package:sakanle/view/widgets/home/property/details/property_card.dart';
import 'package:sakanle/view/widgets/home/property/details/property_details_widget.dart';

class PropertyDetails extends StatelessWidget {
  const PropertyDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final PropertyDetailsControllerImp controller =
        Get.find<PropertyDetailsControllerImp>();
    return Scaffold(
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(16),
        color: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                MyCancelButton(
                  onPressed: () {
                    controller.callWhatsApp();
                  },
                  title: "مراسلة واتساب",
                ),
                SizedBox(width: 10),
                MyNextButton(
                  onPressed: () {
                    controller.callPhone();
                  },
                  title: "اتصال",
                ),
              ],
            ),
          ],
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 250,
            pinned: true,
            backgroundColor: Colors.white,
            elevation: 0,
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                child: IconButton(
                  onPressed: () {
                    controller.back();
                  },
                  icon: Icon(Icons.arrow_back),
                  color: Colors.black,
                ),
              ),
            ),
            actions: [
              CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.favorite_border, color: Colors.black),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(Icons.share, color: Colors.black),
                ),
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(AppImageAssets.roomOneIcon, fit: BoxFit.cover),
                  Container(color: Colors.black.withValues(alpha: 0.2)),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Column(
                children: [
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      Icon(
                        Icons.photo_library,
                        color: AppColor.primaryColor,
                        size: 25,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        "صور العقار",
                        style: TextTheme.of(context).bodySmall!.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Spacer(),
                      Text(
                        "${controller.countOfImages} صورة",
                        style: TextTheme.of(
                          context,
                        ).bodySmall!.copyWith(fontWeight: FontWeight.w200),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Container(
                    height: 120,
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,
                        mainAxisExtent: 100,
                      ),
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return ImageContainerView(
                          fileName: AppImageAssets.roomTwoIcon,
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 15),
                  PropertyCard(
                    propertyType: "شقة",
                    price: "USD 6500-للإيجار السنوي",
                    numberOfAdd: 1160,
                    numOfViews: 112,
                    statusOfProperty: "نشط",
                    location: "حمص , الإنشاءات , أبو جعفر المنصور",
                    description: "شقة أرضية مفروشة ٤ غرف حديثة",
                    area: "175.00",
                    countBathRoom: "1",
                    countBedRoom: "2",
                  ),
                  const SizedBox(height: 15),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 0,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.08),
                          blurRadius: 12,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 45,
                          child: GetBuilder<PropertyDetailsControllerImp>(
                            builder: (controller) {
                              return ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: controller.titlesOfDetails.length,
                                itemBuilder: (context, index) {
                                  return MyButtonDetails(
                                    onPressed: () {
                                      controller.changeCurrentIndex(index);
                                    },
                                    title: controller.titlesOfDetails[index],
                                    isPressed: controller.currentIndex == index,
                                  );
                                },
                              );
                            },
                          ),
                        ),
                        const SizedBox(height: 20),
                        GetBuilder<PropertyDetailsControllerImp>(
                          builder: (controller) {
                            return ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: controller
                                  .propertyDetails[controller.currentIndex]
                                  .length,
                              itemBuilder: (context, index) {
                                return PropertyDetailsWidget(
                                  icon: controller
                                      .propertyDetails[controller
                                          .currentIndex][index]
                                      .icon!,
                                  title: controller
                                      .propertyDetails[controller
                                          .currentIndex][index]
                                      .title!,
                                  content: controller
                                      .propertyDetails[controller
                                          .currentIndex][index]
                                      .content!,
                                );
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  InkWell(
                    onTap: () {
                      controller.callPhone();
                    },
                    child: OwnerCardCall(ownerName: 'نزار'),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
