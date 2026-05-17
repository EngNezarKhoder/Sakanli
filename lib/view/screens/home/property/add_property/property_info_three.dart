import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sakanle/controller/property/property_info_three_controller.dart';
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
    final PropertyInfoThreeControllerImp controller =
        Get.find<PropertyInfoThreeControllerImp>();

    return Form(
      key: controller.formState,
      child: ListView(
        children: [
          Text(
            "الصور أفقية الاتجاه للحصول على أفضل نتيجة",
            style: TextTheme.of(
              context,
            ).bodySmall!.copyWith(color: AppColor.greyColor),
          ),
          const SizedBox(height: 10),
          GetBuilder<PropertyInfoThreeControllerImp>(
            builder: (controller) {
              return controller.imageFiles.isEmpty
                  ? AddImageBox(
                      onTap: () {
                        showCustomDialog(
                          context,
                          onTapCamera: controller.uploadImageFromCamera,
                          onTapGallery: controller.uploadImageFromGallery,
                        );
                      },
                    )
                  : Column(
                      children: [
                        InfoImageBox(
                          countSelectedImages: controller.imageFiles.length,
                          onPressed: () {
                            controller.showWarningDeleteAllImages();
                          },
                          totalSize: controller.getTotalSizeOfImagesByMB(),
                        ),
                        const SizedBox(height: 20),
                        GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                crossAxisSpacing: 8,
                                mainAxisSpacing: 8,
                                mainAxisExtent: 100,
                              ),
                          itemCount: controller.imageFiles.length,
                          itemBuilder: (context, index) {
                            return ImageContainer(
                              file: controller.imageFiles[index],
                              onTap: () {
                                controller.removeImage(index);
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
            },
          ),
          const SizedBox(height: 20),
          const RichTextWidget(title: 'رقم التواصل عبر المكالمات '),
          const SizedBox(height: 10),
          MyTextFormProperty(
            keyboardType: TextInputType.phone,
            validator: (val) {
              return validateInput(val ?? '', 10, 100, 'phone');
            },
            myController: controller.phoneCalls,
            hintText: 'رقم الهاتف',
          ),
          const SizedBox(height: 20),
          const RichTextWidget(title: 'رقم التواصل عبر الواتساب '),
          const SizedBox(height: 10),
          MyTextFormProperty(
            keyboardType: TextInputType.phone,
            validator: (val) {
              return validateInput(val ?? '', 10, 100, 'phone');
            },
            myController: controller.phoneWhatsApp,
            hintText: 'رقم الواتساب',
          ),
        ],
      ),
    );
  }
}
