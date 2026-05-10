import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sakanle/core/constant/app_color.dart';

class WidgetExtensions extends StatelessWidget {
  const WidgetExtensions({super.key, required this.onTap, required this.icon});
  final void Function()? onTap;
  final FaIconData icon;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          color: AppColor.whiteColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: FaIcon(icon, color: AppColor.primaryColor, size: 25),
      ),
    );
  }
}
