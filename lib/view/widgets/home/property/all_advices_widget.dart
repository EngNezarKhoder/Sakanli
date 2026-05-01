import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sakanle/controller/property/advice_page_controller.dart';
import 'package:sakanle/core/constant/app_color.dart';
import 'package:sakanle/view/widgets/home/property/widget_text.dart';

class AllAdvicesWidget extends StatelessWidget {
  const AllAdvicesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    AdvicePageControllerImp controller = Get.put(AdvicePageControllerImp());
    return Container(
      height: 2340,
      padding: const EdgeInsets.all(20),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColor.secondColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "نصائح لإضافة عقار مميز",
            style: TextTheme.of(context).titleLarge!.copyWith(fontSize: 23),
          ),
          const SizedBox(height: 20),
          Text(
            "الصور",
            style: TextTheme.of(
              context,
            ).bodyMedium!.copyWith(color: AppColor.thirdColor),
          ),
          Container(
            child: ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: controller.advicesImage.length,
              itemBuilder: (context, index) {
                return WidgetText(
                  title: controller.advicesImage[index]['title']!,
                  content: controller.advicesImage[index]['content']!,
                );
              },
            ),
          ),
          const SizedBox(height: 50),
          Text(
            "الوصف",
            style: TextTheme.of(
              context,
            ).bodyMedium!.copyWith(color: AppColor.thirdColor),
          ),
          Container(
            child: ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: controller.advicesDescription.length,
              itemBuilder: (context, index) {
                return WidgetText(
                  title: controller.advicesDescription[index]['title']!,
                  content: controller.advicesDescription[index]['content']!,
                );
              },
            ),
          ),
          const SizedBox(height: 50),

          Text(
            "التسعير",
            style: TextTheme.of(
              context,
            ).bodyMedium!.copyWith(color: AppColor.thirdColor),
          ),
          Container(
            child: ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: controller.advicesPrice.length,
              itemBuilder: (context, index) {
                return WidgetText(
                  title: controller.advicesPrice[index]['title']!,
                  content: controller.advicesPrice[index]['content']!,
                );
              },
            ),
          ),
          const SizedBox(height: 50),

          Text(
            "الموقع",
            style: TextTheme.of(
              context,
            ).bodyMedium!.copyWith(color: AppColor.thirdColor),
          ),
          Container(
            child: ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: controller.advicesLocation.length,
              itemBuilder: (context, index) {
                return WidgetText(
                  title: controller.advicesLocation[index]['title']!,
                  content: controller.advicesLocation[index]['content']!,
                );
              },
            ),
          ),
          const SizedBox(height: 50),

          Text(
            "معلومات الاتصال",
            style: TextTheme.of(
              context,
            ).bodyMedium!.copyWith(color: AppColor.thirdColor),
          ),
          Container(
            child: ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: controller.advicesInfoCall.length,
              itemBuilder: (context, index) {
                return WidgetText(
                  title: controller.advicesInfoCall[index]['title']!,
                  content: controller.advicesInfoCall[index]['content']!,
                );
              },
            ),
          ),
          const SizedBox(height: 50),
          Text(
            "نصائح مهمة",
            style: TextTheme.of(
              context,
            ).bodyMedium!.copyWith(color: AppColor.thirdColor),
          ),
          Container(
            child: ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: controller.advicesImportant.length,
              itemBuilder: (context, index) {
                return WidgetText(
                  title: controller.advicesImportant[index]['title']!,
                  content: controller.advicesImportant[index]['content']!,
                );
              },
            ),
          ),
          const SizedBox(height: 50),
          Text(
            "نصيحة ذهبية",
            style: TextTheme.of(
              context,
            ).bodyMedium!.copyWith(color: AppColor.thirdColor),
          ),
          Text(
            "العقار المعروض بشكل احترافي مع صور عالية الجودة و وصف دقيق يجذب مشترين و بياع أسرع",
          ),
        ],
      ),
    );
  }
}
