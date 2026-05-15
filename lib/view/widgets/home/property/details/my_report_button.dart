import 'package:flutter/material.dart';
import 'package:sakanle/core/constant/app_color.dart';

class MyReportButton extends StatelessWidget {
  const MyReportButton({
    super.key,
    required this.title,
    required this.onPressed,
  });

  final String title;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 14),
          side: BorderSide(color: AppColor.redColor, width: 1.5),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: AppColor.redColor,
            fontFamily: "Tajawal",
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
