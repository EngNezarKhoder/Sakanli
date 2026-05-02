import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showSuccessMessage() {
  Get.snackbar(
    "تم الإرسال",
    "تم إرسال طلبك بنجاح، سيتم إعلامك بالنتيجة في أقرب وقت ممكن",
    snackPosition: SnackPosition.BOTTOM,
    margin: EdgeInsets.all(16),
    borderRadius: 12,
    backgroundColor: Color(0xFF1E1E2C),
    colorText: Colors.white,
    duration: Duration(seconds: 4),
    icon: Padding(
      padding: EdgeInsets.only(right: 8),
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.green.withValues(alpha: 0.15),
          shape: BoxShape.circle,
        ),
        child: Icon(Icons.check, color: Colors.green, size: 26),
      ),
    ),
    shouldIconPulse: false,
    boxShadows: [
      BoxShadow(
        color: Colors.black.withValues(alpha: 0.2),
        blurRadius: 10,
        offset: Offset(0, 5),
      ),
    ],
    titleText: Text(
      "تم الإرسال",
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
    messageText: Text(
      "تم إرسال طلبك بنجاح، سيتم إعلامك بالنتيجة في أقرب وقت ممكن",
      style: TextStyle(
        fontSize: 14,
        color: Colors.white.withValues(alpha: 0.8),
      ),
    ),
  );
}
