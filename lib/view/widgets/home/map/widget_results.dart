import 'package:flutter/material.dart';
import 'package:sakanle/core/constant/app_color.dart';

class WidgetResults extends StatelessWidget {
  const WidgetResults({
    super.key,
    required this.countOfProperties,
    required this.onTap,
  });

  final int countOfProperties;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
        decoration: BoxDecoration(
          color: AppColor.whiteColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("قائمة العقارات", style: TextTheme.of(context).bodySmall),
            Text(" $countOfProperties نتيجة"),
            const SizedBox(width: 5),
            const Icon(Icons.menu, size: 25, color: AppColor.primaryColor),
          ],
        ),
      ),
    );
  }
}
