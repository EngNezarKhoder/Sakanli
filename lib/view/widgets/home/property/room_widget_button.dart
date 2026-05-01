import 'package:flutter/material.dart';
import 'package:sakanle/core/constant/app_color.dart';

class RoomWidgetButton extends StatelessWidget {
  const RoomWidgetButton({
    super.key,
    required this.onTap,
    required this.color,
    required this.icon,
  });

  final void Function()? onTap;
  final Color color;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(3),
        ),
        child: Icon(icon, color: AppColor.whiteColor),
      ),
    );
  }
}
