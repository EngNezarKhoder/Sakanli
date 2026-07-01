import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sakanle/controller/property/property_details_controller.dart';
import 'package:sakanle/core/constant/app_color.dart';
import 'package:sakanle/core/constant/app_url.dart';
import 'package:sakanle/core/constant/image_assets.dart';
import 'package:sakanle/view/widgets/home/property/details/image_container_view.dart';
import 'package:sakanle/view/widgets/home/property/add_property_widgets/my_cancel_button.dart';
import 'package:sakanle/view/widgets/home/property/add_property_widgets/my_next_button.dart';
import 'package:sakanle/view/widgets/home/property/details/my_button_details.dart';
import 'package:sakanle/view/widgets/home/property/details/my_empty_state.dart';
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
      bottomNavigationBar: GetBuilder<PropertyDetailsControllerImp>(
        builder: (controller) {
          if (controller.isLoading) return const SizedBox();

          return Container(
            padding: const EdgeInsets.all(16),
            color: Colors.white,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    MyCancelButton(
                      onPressed: controller.callWhatsApp,
                      title: "مراسلة واتساب",
                    ),
                    const SizedBox(width: 10),
                    MyNextButton(
                      onPressed: controller.callPhone,
                      title: "اتصال",
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),

      body: GetBuilder<PropertyDetailsControllerImp>(
        builder: (controller) {
          if (controller.isLoading) {
            return const Center(
              child: CupertinoActivityIndicator(
                radius: 12,
                color: AppColor.secondColor,
              ),
            );
          }
          if (controller.isError) {
            return const Center(child: Text("حدث خطأ في تحميل العقار"));
          }

          if (controller.isEmpty) {
            return MyEmptyState(
              title: "جرّب تغيير البحث أو الفلاتر أو أضف عقار جديد.",
            );
          }

          final images = controller.images;

          return CustomScrollView(
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
                      onPressed: controller.back,
                      icon: const Icon(Icons.arrow_back),
                      color: Colors.black,
                    ),
                  ),
                ),
                actions: [
                  const Padding(
                    padding: EdgeInsets.only(left: 8, right: 8),
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
                      Image.network(
                        "${AppUrl.photoUrl}${images[0]}",
                        fit: BoxFit.cover,
                      ),
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

                      // ================= IMAGES HEADER =================
                      Row(
                        children: [
                          const Icon(
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
                          const Spacer(),
                          Text(
                            "${images.length} صورة",
                            style: TextTheme.of(
                              context,
                            ).bodySmall!.copyWith(fontWeight: FontWeight.w200),
                          ),
                        ],
                      ),

                      const SizedBox(height: 15),

                      // ================= IMAGES =================
                      SizedBox(
                        height: 120,
                        child: GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                crossAxisSpacing: 8,
                                mainAxisSpacing: 8,
                                mainAxisExtent: 100,
                              ),
                          itemCount: images.isNotEmpty ? images.length : 1,
                          itemBuilder: (context, index) {
                            final img = images.isEmpty
                                ? AppImageAssets.roomTwoIcon
                                : "${AppUrl.photoUrl}${images[index]}";

                            return ImageContainerView(fileName: img);
                          },
                        ),
                      ),

                      const SizedBox(height: 15),
                      PropertyCard(
                        propertyType:
                            controller.property?['property_type'] ?? '',
                        price:
                            "${controller.property?['services'] != null && controller.property!['services'].isNotEmpty ? controller.property!['services'][0]['price'] : ''}",
                        numberOfAdd: controller.property?['id'] ?? 0,
                        numOfViews: controller.property?['num_of_views'] ?? 0,
                        statusOfProperty: 'نشط',
                        location:
                            "${controller.property?['city'] ?? ''} , ${controller.property?['area_name'] ?? ''} , ${controller.property?['street'] ?? ''}",
                        description:
                            controller.property?['notes'] ??
                            controller.property?['property_type'],
                        area: controller.property?['area']?.toString() ?? '',
                        countBathRoom:
                            controller.property?['bathrooms']?.toString() ??
                            '1',
                        countBedRoom:
                            controller.property?['bedrooms']?.toString() ?? '1',
                      ),

                      const SizedBox(height: 15),

                      // ================= DETAILS =================
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
                              child: ListView.builder(
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
                              ),
                            ),

                            const SizedBox(height: 20),

                            ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: controller
                                  .propertyDetails[controller.currentIndex]
                                  .length,
                              itemBuilder: (context, index) {
                                final item =
                                    controller.propertyDetails[controller
                                        .currentIndex][index];

                                return PropertyDetailsWidget(
                                  icon: item.icon!,
                                  title: item.title!,
                                  content: item.content!,
                                );
                              },
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 10),

                      InkWell(
                        onTap: controller.callPhone,
                        child: OwnerCardCall(ownerName: controller.ownerName),
                      ),

                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
