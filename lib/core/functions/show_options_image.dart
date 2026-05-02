import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showCustomDialog(
  context, {
  void Function()? onTapCamera,
  void Function()? onTapGallery,
}) {
  Get.dialog(
    Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("اختر مصدر الصور", style: TextTheme.of(context).bodySmall),
            SizedBox(height: 20),
            ListTile(
              leading: Icon(Icons.image, color: Colors.green),
              title: Text(
                "من المعرض",
                style: TextTheme.of(
                  context,
                ).bodySmall!.copyWith(fontWeight: FontWeight.w300),
              ),
              onTap: () {
                onTapGallery?.call();
              },
            ),
            ListTile(
              leading: Icon(Icons.camera_alt, color: Colors.green),
              title: Text(
                "من الكاميرا",
                style: TextTheme.of(
                  context,
                ).bodySmall!.copyWith(fontWeight: FontWeight.w300),
              ),
              onTap: () {
                onTapCamera?.call();
              },
            ),
            SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: () => Get.back(),
                style: TextButton.styleFrom(alignment: Alignment.centerLeft),
                child: Text(
                  "إلغاء",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
