import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sakanle/core/constant/app_color.dart';

class FilterContainer extends StatelessWidget {
  const FilterContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      decoration: BoxDecoration(
        color: AppColor.primaryColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          FaIcon(FontAwesomeIcons.filter, size: 15, color: AppColor.whiteColor),
          const SizedBox(width: 5),
          Text(
            "فلتر نشط",
            style: TextTheme.of(
              context,
            ).bodySmall!.copyWith(fontWeight: FontWeight.w200, fontSize: 12),
          ),
        ],
      ),
    );
  }
}
