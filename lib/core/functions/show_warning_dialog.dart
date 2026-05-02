import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showWarningDialog(String title, String content) {
  Get.snackbar(
    title,
    content,
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: Colors.red,
    colorText: Colors.white,
  );
}
