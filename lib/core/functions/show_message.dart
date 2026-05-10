import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showMessage() {
  Get.rawSnackbar(
    messageText: Row(
      children: const [
        SizedBox(width: 6),

        Expanded(
          child: Text(
            "تم العثور على موقعك الحالي",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    ),
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: Color(0xFFFF8A00), // primaryColor
    margin: const EdgeInsets.only(top: 14, left: 14, right: 14, bottom: 100),
    borderRadius: 14,
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
    boxShadows: [
      BoxShadow(color: Colors.black26, blurRadius: 12, offset: Offset(0, 4)),
    ],
    duration: const Duration(seconds: 3),
  );
}
