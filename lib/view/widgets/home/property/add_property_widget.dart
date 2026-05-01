import 'package:flutter/material.dart';
import 'package:sakanle/core/constant/app_color.dart';

class AddPropertyWidget extends StatelessWidget {
  const AddPropertyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      padding: const EdgeInsets.all(15),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColor.secondColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(Icons.add_home, color: AppColor.primaryColor, size: 30),
              const SizedBox(width: 10),
              Text(
                "إضافة عقار",
                style: TextTheme.of(
                  context,
                ).titleMedium!.copyWith(fontSize: 20),
              ),
            ],
          ),
          const SizedBox(height: 15),
          Text(
            "يمكنكم هنا إضافة العقارات مع تحديد الخدمة شراء أو آجار (يومي، شهري، سنوي).",
            style: TextTheme.of(
              context,
            ).bodySmall!.copyWith(color: AppColor.primaryColor),
          ),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsetsGeometry.only(right: 15),
            child: Text(
              "نريد فرص القبول عند ملء كافة المعلومات المطلوبة للحفاظ على ثقة العملاء بإعلاناتنا.",
              style: TextTheme.of(
                context,
              ).bodySmall!.copyWith(color: AppColor.primaryColor),
            ),
          ),
        ],
      ),
    );
  }
}
