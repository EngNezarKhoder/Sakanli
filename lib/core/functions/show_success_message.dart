import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sakanle/core/constant/app_color.dart';

void showSuccessMessage() {
  Get.snackbar(
    "",
    "",
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: Colors.white,
    margin: const EdgeInsets.all(16),
    borderRadius: 14,
    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
    duration: const Duration(seconds: 3),
    isDismissible: true,
    boxShadows: [
      BoxShadow(
        color: Colors.black.withValues(alpha: 0.08),
        blurRadius: 12,
        offset: const Offset(0, 6),
      ),
    ],

    /// Title
    titleText: Row(
      children: [
        Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: AppColor.primaryColor.withValues(alpha: 0.15),
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.check,
            color: AppColor.primaryColor,
            size: 20,
          ),
        ),
        const SizedBox(width: 10),
        Text(
          "تم الإرسال",
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: AppColor.secondColor,
            fontFamily: 'Cairo',
          ),
        ),
      ],
    ),

    /// Message
    messageText: Padding(
      padding: const EdgeInsets.only(right: 36),
      child: Text(
        "تم إرسال طلبك بنجاح وسيتم إعلامك قريباً",
        style: TextStyle(
          fontSize: 13,
          color: Colors.grey.shade600,
          fontFamily: 'Cairo',
        ),
      ),
    ),
  );
}