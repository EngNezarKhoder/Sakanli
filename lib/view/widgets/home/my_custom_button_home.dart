import 'package:flutter/material.dart';
import 'package:sakanle/core/constant/app_color.dart';

class MyCustomButtonHome extends StatelessWidget {
  const MyCustomButtonHome({
    super.key,
    required this.onPressed,
    required this.imageName,
    required this.title,
  });

  final void Function()? onPressed;
  final String imageName;
  final String title;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(12),
        side: BorderSide(color: AppColor.primaryColor, width: 1),
      ),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 7),
      child: Row(
        children: [
          Text(
            title,
            style: TextTheme.of(
              context,
            ).bodySmall!.copyWith(color: AppColor.primaryColor),
          ),
          Spacer(),
          Image.asset(imageName),
        ],
      ),
    );
  }
}
