import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sakanle/controller/home/filter/filter_ads_controller.dart';
import 'package:sakanle/core/constant/app_color.dart';
import 'package:sakanle/core/functions/validate_input.dart';
import 'package:sakanle/view/widgets/home/property/filter/my_custom_text_form_filter.dart';

Future<dynamic> showFilterAdsBottomSheet() async {
  final controller = Get.isRegistered<FilterAdsControllerImp>()
      ? Get.find<FilterAdsControllerImp>()
      : Get.put(FilterAdsControllerImp());

  return await Get.bottomSheet(
    Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        gradient: RadialGradient(
          center: Alignment.topLeft,
          radius: 1.5,
          colors: [
            Color(0xFFFFC56B),
            Color(0xFFFFE2BD),
            Color.fromARGB(255, 253, 239, 221),
          ],
        ),
        borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
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
                'فلاتر البحث',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 25),
              MyCustomTextFormFilter(
                hintText: 'أدخل اسم المحافظة أو المدينة',
                myController: controller.cityName,
                validator: (val) {
                  return validateInput(val ?? '', 3, 100, 'city');
                },
                keyboardType: TextInputType.text,
                prefixIcon: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 7,
                  ),
                  child: const Icon(Icons.location_pin),
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                'نوع العقار',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
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
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
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
