import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sakanle/core/functions/alert_exit_app.dart';
import 'package:sakanle/core/functions/show_error_message.dart';

abstract class PropertyInfoThreeController extends GetxController {
  void uploadImageFromCamera();
  void uploadImageFromGallery();
  void clearAllImages();
  void removeImage(int index);
  double getTotalSizeOfImagesByMB();
  String validateFields();
  void showWarningDeleteAllImages();
}

class PropertyInfoThreeControllerImp extends PropertyInfoThreeController {
  final TextEditingController phoneCalls = TextEditingController();
  final TextEditingController phoneWhatsApp = TextEditingController();
  final GlobalKey<FormState> formState = GlobalKey<FormState>();
  List<File> imageFiles = [];
  static const maxImages = 3;
  static const maxImageSize = 1 * 1024 * 1024;

  @override
  void uploadImageFromCamera() async {
    Get.back();
    try {
      XFile? cameraFile = await ImagePicker().pickImage(
        source: ImageSource.camera,
      );
      if (imageFiles.length >= maxImages) {
        showErrorMessage('الحد الأقصى 3 صور فقط');
        return;
      }
      if (cameraFile != null) {
        if (File(cameraFile.path).lengthSync() > maxImageSize) {
          showErrorMessage('لا يمكن رفع صورة حجمها اكبر من 1 ميغا');
          return;
        }
        imageFiles.add(File(cameraFile.path));
        update();
      }
    } catch (e) {
      showErrorMessage('حدث خطأ أثناء رفع الصورة');
    }
  }

  @override
  void uploadImageFromGallery() async {
    Get.back();
    List<XFile>? galleryFiles = await ImagePicker().pickMultiImage();
    if (galleryFiles.isEmpty) return;
    for (var file in galleryFiles) {
      if (File(file.path).lengthSync() > maxImageSize) {
        showErrorMessage('لا يمكن رفع صورة أكبر من 1 ميغا');
        continue;
      }
      if (imageFiles.length < maxImages) {
        imageFiles.add(File(file.path));
      } else {
        showErrorMessage('الحد الأقصى 3 صور فقط');
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
  String validateFields() {
    if (imageFiles.isEmpty) {
      return 'imageError';
    }
    if (!formState.currentState!.validate() || imageFiles.isEmpty) {
      return 'fieldsError';
    }
    return 'ok';
  }

  @override
  void onClose() {
    phoneWhatsApp.dispose();
    phoneCalls.dispose();
    super.onClose();
  }

  @override
  void showWarningDeleteAllImages() {
    alert(
      title: 'حذف الصور',
      content: 'هل أنت متأكد من رغبتك بحذف كل الصور ؟',
      cancelButtonTitle: 'الغاء',
      okButtonTitle: 'حذف الكل',
      onPressedOk: () {
        clearAllImages();
        Get.back();
      },
      onPressedCancel: () {
        Get.back();
      },
    );
  }
}
