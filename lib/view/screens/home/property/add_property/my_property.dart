import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sakanle/controller/property/my_property_controller.dart';
import 'package:sakanle/core/constant/app_color.dart';
import 'package:sakanle/core/constant/app_url.dart';
import 'package:sakanle/view/widgets/auth/my_custom_button_auth.dart';

class MyProperty extends StatelessWidget {
  const MyProperty({super.key});

  @override
  Widget build(BuildContext context) {
    MyPropertyControllerImp controller = Get.find<MyPropertyControllerImp>();

    return Scaffold(
      backgroundColor: const Color(0xffF6F8FB),
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: const Color(0xffF6F8FB),
        centerTitle: true,
        title: Text(
          "عقاراتي",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: AppColor.secondColor,
            fontFamily: 'Cairo',
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Column(
          children: [
            Expanded(
              child: GetBuilder<MyPropertyControllerImp>(
                id: 'loading',
                builder: (controller) {
                  if (controller.isLoading) {
                    return const Center(
                      child: CupertinoActivityIndicator(
                        radius: 12,
                        color: AppColor.secondColor,
                      ),
                    );
                  }

                  if (controller.properties.isEmpty) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.home_work_outlined,
                            size: 70,
                            color: AppColor.secondColor,
                          ),
                          const SizedBox(height: 20),
                          Text(
                            "لا توجد عقارات مضافة",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Cairo',
                              color: AppColor.secondColor,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "قم بإضافة أول عقار لك الآن",
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'Cairo',
                              color: Colors.grey.shade600,
                            ),
                          ),
                        ],
                      ),
                    );
                  }

                  return ListView.builder(
                    itemCount: controller.properties.length,
                    itemBuilder: (context, index) {
                      final property = controller.properties[index];

                      final photos = property['photos'] ?? [];
                      final image = photos.isNotEmpty
                          ? photos[0]['path']
                          : null;

                      final services = property['services'] ?? [];
                      final service = services.isNotEmpty
                          ? services.first
                          : null;

                      final rawType = service?['type'] ?? '';

                      return Container(
                        margin: const EdgeInsets.only(bottom: 12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(18),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.06),
                              blurRadius: 14,
                              offset: const Offset(0, 6),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            /// IMAGE
                            Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: const BorderRadius.vertical(
                                    top: Radius.circular(18),
                                  ),
                                  child: image != null
                                      ? Image.network(
                                          "${AppUrl.photoUrl}$image",
                                          height: 190,
                                          width: double.infinity,
                                          fit: BoxFit.cover,
                                        )
                                      : Container(
                                          height: 190,
                                          color: Colors.grey[300],
                                          child: const Icon(Icons.image),
                                        ),
                                ),

                                /// GRADIENT
                                Container(
                                  height: 190,
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.vertical(
                                      top: Radius.circular(18),
                                    ),
                                    gradient: LinearGradient(
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.topCenter,
                                      colors: [
                                        Colors.black.withValues(alpha: 0.55),
                                        Colors.transparent,
                                      ],
                                    ),
                                  ),
                                ),

                                /// STATUS BADGE (ARABIC)
                                Positioned(
                                  top: 10,
                                  right: 10,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 5,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.black.withValues(
                                        alpha: 0.6,
                                      ),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Text(
                                      property['status'],
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Cairo',
                                      ),
                                    ),
                                  ),
                                ),

                                /// MENU
                                Positioned(
                                  top: 5,
                                  left: 5,
                                  child: PopupMenuButton(
                                    icon: const Icon(
                                      Icons.more_vert,
                                      color: Colors.white,
                                    ),
                                    color: Colors.white,
                                    itemBuilder: (context) => const [
                                      PopupMenuItem(
                                        value: 'edit',
                                        child: Text('تعديل'),
                                      ),
                                      PopupMenuItem(
                                        value: 'delete',
                                        child: Text('حذف'),
                                      ),
                                    ],
                                    onSelected: (value) {
                                      if (value == 'edit') {
                                        controller.navigateToEditProperty(
                                          property,
                                        );
                                      } else if (value == 'delete') {
                                        controller.deleteProperty(
                                          property['id'].toString(),
                                        );
                                      }
                                    },
                                  ),
                                ),
                              ],
                            ),

                            /// CONTENT
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    property['property_type'] ?? '',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Cairo',
                                    ),
                                  ),

                                  const SizedBox(height: 8),

                                  Wrap(
                                    spacing: 8,
                                    runSpacing: 6,
                                    children: [
                                      _chip(
                                        Icons.location_on,
                                        "${property['city'] ?? ''}",
                                      ),
                                      _chip(
                                        Icons.map,
                                        "${property['area_name'] ?? ''}",
                                      ),
                                      _chip(
                                        Icons.square_foot,
                                        "${property['area'] ?? 0} م²",
                                      ),
                                      if ((property['bedrooms'] ?? 0) > 0)
                                        _chip(
                                          Icons.bed,
                                          "غرف: ${property['bedrooms']}",
                                        ),
                                    ],
                                  ),

                                  const SizedBox(height: 10),

                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "${service?['price'] ?? ''} \$",
                                        style: const TextStyle(
                                          color: Colors.green,
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Cairo',
                                        ),
                                      ),
                                      Text(
                                        _translateType(rawType),
                                        style: TextStyle(
                                          color: AppColor.secondColor,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: 'Cairo',
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ),

            const SizedBox(height: 12),

            SizedBox(
              width: double.infinity,
              child: MyCustomButtonAuth(
                onPressed: () {
                  controller.navigateToAddProperty();
                },
                title: 'طلب اضافة عقار',
                isLogin: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// 🔥 TRANSLATION FUNCTION
String _translateType(String type) {
  switch (type) {
    case 'sale':
      return 'للبيع';
    case 'yearly_rent':
      return 'إيجار سنوي';
    case 'monthly_rent':
      return 'إيجار شهري';
    case 'weekly_rent':
      return 'إيجار أسبوعي';
    default:
      return type;
  }
}

/// CHIP
Widget _chip(IconData icon, String text) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
    decoration: BoxDecoration(
      color: Colors.grey.withValues(alpha: 0.08),
      borderRadius: BorderRadius.circular(12),
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 14, color: Colors.grey[700]),
        const SizedBox(width: 4),
        Text(text, style: const TextStyle(fontSize: 12, fontFamily: 'Cairo')),
      ],
    ),
  );
}
