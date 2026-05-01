import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sakanle/controller/property/property_info_three_controller.dart';
import 'package:sakanle/core/constant/app_color.dart';
import 'package:sakanle/core/functions/validate_input.dart';
import 'package:sakanle/view/widgets/home/property/add_image_box.dart';
import 'package:sakanle/view/widgets/home/property/my_text_form_property.dart';
import 'package:sakanle/view/widgets/home/property/rich_text_widget.dart';

class PropertyInfoThree extends StatelessWidget {
  const PropertyInfoThree({super.key});

  @override
  Widget build(BuildContext context) {
    PropertyInfoThreeControllerImp controller = Get.put(
      PropertyInfoThreeControllerImp(),
    );
    return Container(
      child: ListView(
        children: [
          Text(
            "الصور أفقية الاتجاه للحصول على أفضل نتيجة",
            style: TextTheme.of(
              context,
            ).bodySmall!.copyWith(color: AppColor.greyColor),
          ),
          const SizedBox(height: 10),
          AddImageBox(),
          const SizedBox(height: 20),
          RichTextWidget(title: 'رقم التواصل عبر المكالمات '),
          const SizedBox(height: 10),
          MyTextFormProperty(
            keyboardType: TextInputType.phone,
            validator: (val) {
              return validateInput(val!, 10, 100, 'phone');
            },
            myController: controller.phoneCalls,
            hintText: 'رقم الهاتف',
          ),
          const SizedBox(height: 20),
          RichTextWidget(title: 'رقم التواصل عبر الواتساب '),
          const SizedBox(height: 10),
          MyTextFormProperty(
            keyboardType: TextInputType.phone,
            validator: (val) {
              return validateInput(val!, 10, 100, 'phone');
            },
            myController: controller.phoneWhatsApp,
            hintText: 'رقم الواتساب',
          ),
        ],
      ),
    );
  }
}
