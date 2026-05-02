import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sakanle/core/functions/show_warning_dialog.dart';

abstract class PropertyInfoThreeController extends GetxController {
  void uploadImageFromCamera();
  void uploadImageFromGallery();
  void clearAllImages();
  void removeImage(int index);
  double getTotalSizeOfImagesByMB();
  bool validateFields();
}

class PropertyInfoThreeControllerImp extends PropertyInfoThreeController {
  late TextEditingController phoneCalls;
  late TextEditingController phoneWhatsApp;
  late GlobalKey<FormState> formState;
  List<File> imageFiles = [];
  static const maxImages = 3;
  static const maxImageSize = 1 * 1024 * 1024;

  @override
  void onInit() {
    formState = GlobalKey<FormState>();
    phoneCalls = TextEditingController();
    phoneWhatsApp = TextEditingController();
    super.onInit();
  }

  @override
  void uploadImageFromCamera() async {
    Get.back();
    try {
      XFile? cameraFile = await ImagePicker().pickImage(
        source: ImageSource.camera,
      );
      if (imageFiles.length >= maxImages) {
        showWarningDialog("تنبيه", "الحد الأقصى 3 صور فقط");
        return;
      }
      if (cameraFile != null) {
        if (File(cameraFile.path).lengthSync() > maxImageSize) {
          showWarningDialog('تنبيه', 'لا يمكن رفع صورة حجمها اكبر من 1 ميغا');
          return;
        }
        imageFiles.add(File(cameraFile.path));
        update();
      }
    } catch (e) {
      //
    }
  }

  @override
  void uploadImageFromGallery() async {
    Get.back();
    List<XFile>? galleryFiles = await ImagePicker().pickMultiImage();
    if (galleryFiles.isEmpty) return;
    for (var file in galleryFiles) {
      if (File(file.path).lengthSync() > maxImageSize) {
        showWarningDialog('تنبيه', 'لا يمكن رفع صورة أكبر من 1 ميغا');
        continue;
      }
      if (imageFiles.length < maxImages) {
        imageFiles.add(File(file.path));
      } else {
        showWarningDialog("تنبيه", "الحد الأقصى 3 صور فقط");
        break;
      }
    }
    update();
  }

  @override
  void clearAllImages() {
    imageFiles.clear();
    update();
  }

  @override
  void removeImage(int index) {
    imageFiles.removeAt(index);
    update();
  }

  @override
  double getTotalSizeOfImagesByMB() {
    double totalBytes = 0.0;
    for (var file in imageFiles) {
      totalBytes += file.lengthSync();
    }
    return double.parse((totalBytes / (1024 * 1024)).toStringAsFixed(1));
  }

  @override
  bool validateFields() {
    if (!formState.currentState!.validate() || imageFiles.isEmpty) {
      return false;
    }
    return true;
  }
}
