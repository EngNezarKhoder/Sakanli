import 'package:flutter/material.dart';
import 'package:sakanle/core/constant/app_color.dart';

class ViewModeWidget extends StatelessWidget {
  const ViewModeWidget({
    super.key,
    required this.imageName,
    required this.opacity,
    required this.onTap,
  });
  final String imageName;
  final double opacity;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: opacity,
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: AppColor.primaryColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Image.asset(imageName),
        ),
      ),
    );
  }
}
