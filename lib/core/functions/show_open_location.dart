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
          Container(
            width: 45,
            height: 5,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFFFF8A00).withValues(alpha: 0.12),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.location_on_rounded,
              size: 40,
              color: Color(0xFFFF8A00),
            ),
          ),
          const SizedBox(height: 18),
          const Text(
            "تفعيل الموقع",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Color(0xFF0D0700),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            "نحتاج الوصول إلى موقعك لتحديد العقار بدقة وعرضه على الخريطة",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black54, height: 1.5, fontSize: 13),
          ),
          const SizedBox(height: 25),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () => onPressedCancel?.call(),
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 13),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                    side: const BorderSide(color: Color(0xFFFF8A00)),
                  ),
                  child: const Text(
                    "لاحقاً",
                    style: TextStyle(
                      color: Color(0xFF0D0700),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: ElevatedButton(
                  onPressed: () => onPressedConfirm?.call(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFF8A00),
                    padding: const EdgeInsets.symmetric(vertical: 13),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    "تفعيل",
                    style: TextStyle(
                      color: Color(0xFF0D0700),
                      fontWeight: FontWeight.bold,
                    ),
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
