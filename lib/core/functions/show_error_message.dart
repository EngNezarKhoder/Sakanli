import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sakanle/core/constant/app_color.dart';

void showErrorMessage(String content) {
  Get.snackbar(
    "",
    content,
    titleText: const SizedBox(),
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: AppColor.redColor,
    colorText: AppColor.whiteColor,
    margin: EdgeInsets.zero,
    borderRadius: 0,
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
  );
}
