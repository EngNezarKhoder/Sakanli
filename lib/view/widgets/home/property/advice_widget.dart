import 'package:flutter/material.dart';
import 'package:sakanle/core/constant/app_color.dart';

class AdviceWidget extends StatelessWidget {
  const AdviceWidget({super.key, required this.onTap});
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 90,
        padding: const EdgeInsets.all(15),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColor.secondColor,
        ),
        child: Row(
          children: [
            Icon(Icons.lightbulb_circle, color: AppColor.primaryColor),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "نصائح لإضافة العقارات",
                  style: TextTheme.of(
                    context,
                  ).titleMedium!.copyWith(fontSize: 17),
                ),
                const SizedBox(height: 5),
                Text(
                  "نصائح و تعليمات لزيادة نسبة مشاهدة عقارك.",
                  style: TextTheme.of(context).bodySmall!.copyWith(
                    color: AppColor.primaryColor,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
            Spacer(),
            Icon(
              Icons.arrow_forward_ios_outlined,
              color: AppColor.primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
