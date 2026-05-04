import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showOpenLocation({
  required void Function()? onPressedCancel,
  required void Function()? onPressedConfirm,
}) {
  Get.bottomSheet(
    Container(
      padding: const EdgeInsets.all(22),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // handle bar
          Container(
            width: 45,
            height: 5,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          const SizedBox(height: 20),
          // icon (soft style)
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.blue.withValues(alpha: 0.08),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.location_on_rounded,
              size: 40,
              color: Colors.blueAccent,
            ),
          ),
          const SizedBox(height: 18),
          const Text(
            "تفعيل الموقع",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            "نحتاج الوصول إلى موقعك لتحديد العقار بدقة وعرضه على الخريطة",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey.shade600,
              height: 1.4,
              fontSize: 13,
            ),
          ),
          const SizedBox(height: 25),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () => onPressedCancel?.call(),
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    side: BorderSide(color: Colors.grey.shade300),
                  ),
                  child: const Text(
                    "لاحقاً",
                    style: TextStyle(color: Colors.black87),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: ElevatedButton(
                  onPressed: () => onPressedConfirm?.call(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2563EB), // modern blue
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    "تفعيل",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
