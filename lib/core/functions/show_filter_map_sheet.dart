import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sakanle/controller/home/map_page_controller.dart';
import 'package:sakanle/core/constant/app_color.dart';

Future<dynamic> showFilterMapsBottomSheet() async {
  MapPageControllerImp controller = Get.find<MapPageControllerImp>();

  return await Get.bottomSheet(
    Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(28)),

        gradient: RadialGradient(
          center: Alignment.topLeft,
          radius: 1.5,
          colors: [
            Color(0xFFFFC56B),
            Color(0xFFFFE2BD),
            Color.fromARGB(255, 253, 239, 221),
          ],
        ),
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 50,
                  height: 5,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'فلاتر الخريطة',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'السعر',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                  ),
                  Obx(
                    () => Row(
                      children: [
                        const Text('تفعيل البحث بالسعر'),
                        const SizedBox(width: 10),
                        Switch(
                          value: controller.priceEnabled.value,
                          activeThumbColor: AppColor.primaryColor,
                          onChanged: (value) {
                            controller.changeValueOfPrice(value);
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Obx(
                () => controller.priceEnabled.value
                    ? Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Obx(
                                  () => Text(
                                    'من: ${controller.price.value.toStringAsFixed(1)} دولار',
                                  ),
                                ),
                                const Text('أي سعر'),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Obx(
                              () => Slider(
                                value: controller.price.value,
                                min: 0,
                                max: 50000,
                                activeColor: AppColor.primaryColor,
                                onChanged: (value) {
                                  controller.price.value = value;
                                },
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: AppColor.thirdColor.withValues(
                                  alpha: 0.2,
                                ),
                                borderRadius: BorderRadius.circular(14),
                              ),
                              child: const Text(
                                'حرّك المؤشر لتحديد نطاق السعر أو اتركه على كامل المدى لإظهار كافة الأسعار',
                                style: TextStyle(fontSize: 13),
                              ),
                            ),
                          ],
                        ),
                      )
                    : const SizedBox(),
              ),
              const SizedBox(height: 30),
              const Text(
                'نوع العقار',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 15),
              Obx(
                () => Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: controller.propertyTypes.map((type) {
                    final selected = controller.selectedType.value == type;
                    return ChoiceChip(
                      label: Text(type),
                      selected: selected,
                      selectedColor: AppColor.primaryColor,
                      backgroundColor: Colors.white,
                      labelStyle: TextStyle(
                        color: selected ? Colors.white : Colors.black,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                        side: BorderSide(
                          color: selected
                              ? AppColor.primaryColor
                              : Colors.grey.shade300,
                        ),
                      ),
                      onSelected: (_) {
                        controller.selectPropertyType(type);
                      },
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                'طبيعة العقار',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 15),
              Obx(
                () => Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: controller.propertyNature.map((item) {
                    final selected = controller.selectedNature.value == item;
                    return ChoiceChip(
                      label: Text(item),
                      selected: selected,
                      selectedColor: AppColor.primaryColor,
                      backgroundColor: Colors.white,
                      labelStyle: TextStyle(
                        color: selected ? Colors.white : Colors.black,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                        side: BorderSide(
                          color: selected
                              ? AppColor.primaryColor
                              : Colors.grey.shade300,
                        ),
                      ),
                      onSelected: (_) {
                        controller.selectPropertyNature(item);
                      },
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 30),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        controller.onCancelFilter();
                      },
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                      ),
                      child: const Text('إلغاء'),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        controller.onConfirmFilter();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColor.primaryColor,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                      ),
                      child: const Text(
                        'تطبيق',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ),
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
  );
}
