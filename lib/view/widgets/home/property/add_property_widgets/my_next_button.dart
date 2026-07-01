import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sakanle/core/constant/app_color.dart';

class MyNextButton extends StatelessWidget {
  const MyNextButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.isLoading = false,
  });
  final String title;
  final void Function()? onPressed;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColor.primaryColor,
          foregroundColor: AppColor.whiteColor,
          padding: const EdgeInsets.symmetric(vertical: 14),
        ),
        child: isLoading
            ? CupertinoActivityIndicator(
                radius: 12,
                color: AppColor.secondColor,
              )
            : Text(
                title,
                style: TextStyle(
                  fontFamily: "Tajawal",
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
      ),
    );
  }
}
