import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sakanle/controller/property/property_info_controller.dart';
import 'package:sakanle/core/constant/app_color.dart';
import 'package:sakanle/core/functions/show_options_image.dart';
import 'package:sakanle/core/functions/validate_input.dart';
import 'package:sakanle/view/widgets/home/property/property_info_three/add_image_box.dart';
import 'package:sakanle/view/widgets/home/property/property_info_three/image_container.dart';
import 'package:sakanle/view/widgets/home/property/property_info_three/info_image_box.dart';
import 'package:sakanle/view/widgets/home/property/property_info_one/my_text_form_property.dart';
import 'package:sakanle/view/widgets/home/property/property_info_one/rich_text_widget.dart';

class PropertyInfoThree extends StatelessWidget {
  const PropertyInfoThree({super.key});

  @override
  Widget build(BuildContext context) {
    final PropertyInfoControllerImp controller =
        Get.find<PropertyInfoControllerImp>();

    return Form(
      key: controller.formStatePageThree,
      child: ListView(
        children: [
          Text(
            "الصور أفقية الاتجاه للحصول على أفضل نتيجة",
            style: Theme.of(
              context,
            ).textTheme.bodySmall!.copyWith(color: AppColor.greyColor),
          ),

          const SizedBox(height: 10),

          // ===================== IMAGES =====================
          Obx(() {
            final totalImages =
                controller.imageFiles.length + controller.existingImages.length;

            if (totalImages == 0) {
              return AddImageBox(
                onTap: () {
                  showCustomDialog(
                    context,
                    onTapCamera: controller.uploadImageFromCamera,
                    onTapGallery: controller.uploadImageFromGallery,
                  );
                },
              );
            }

            return Column(
              children: [
                InfoImageBox(
                  countSelectedImages: totalImages,
                  onPressed: () {
                    controller.showWarningDeleteAllImages();
                  },
                  totalSize: controller.getTotalSizeOfImagesByMB(),
                ),

                const SizedBox(height: 20),

                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                    mainAxisExtent: 100,
                  ),
                  itemCount: totalImages,
                  itemBuilder: (context, index) {
                    final isExisting = index < controller.existingImages.length;

                    // ===== صور السيرفر =====
                    if (isExisting) {
                      final image = controller.existingImages[index];

                      return Stack(
                        children: [
                          Positioned.fill(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.network(
                                image['url'],
                                fit: BoxFit.cover,
                                errorBuilder: (c, e, s) =>
                                    const Icon(Icons.broken_image),
                              ),
                            ),
                          ),

                          Positioned(
                            top: 5,
                            right: 5,
                            child: GestureDetector(
                              onTap: () {
                                controller.markImageForDelete(index);
                              },
                              child: Container(
                                padding: const EdgeInsets.all(4),
                                decoration: const BoxDecoration(
                                  color: Colors.red,
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.close,
                                  size: 18,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    }

                    // ===== صور جديدة =====
                    final fileIndex = index - controller.existingImages.length;

                    return ImageContainer(
                      file: controller.imageFiles[fileIndex],
                      onTap: () {
                        controller.removeImage(fileIndex);
                      },
                    );
                  },
                ),

                const SizedBox(height: 20),

                AddImageBox(
                  onTap: () {
                    showCustomDialog(
                      context,
                      onTapCamera: controller.uploadImageFromCamera,
                      onTapGallery: controller.uploadImageFromGallery,
                    );
                  },
                ),
              ],
            );
          }),

          const SizedBox(height: 20),

          const RichTextWidget(title: 'رقم التواصل عبر المكالمات'),
          const SizedBox(height: 10),

          MyTextFormProperty(
            keyboardType: TextInputType.phone,
            validator: (val) => validateInput(val ?? '', 10, 100, 'phone'),
            myController: controller.phoneCalls,
            hintText: 'رقم الهاتف',
          ),

          const SizedBox(height: 20),

          const RichTextWidget(title: 'رقم التواصل عبر الواتساب'),
          const SizedBox(height: 10),

          MyTextFormProperty(
            keyboardType: TextInputType.phone,
            validator: (val) => validateInput(val ?? '', 10, 100, 'phone'),
            myController: controller.phoneWhatsApp,
            hintText: 'رقم الواتساب',
          ),
        ],
      ),
    );
  }
}
