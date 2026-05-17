import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sakanle/core/functions/show_error_message.dart';

abstract class MyProfilePageController extends GetxController {
  void back();
  void uploadImageFromCamera();
  void uploadImageFromGallery();
  void saveChanges();
}

class MyProfilePageControllerImp extends MyProfilePageController {
  final TextEditingController userName = TextEditingController();
  final TextEditingController phoneNumber = TextEditingController();
  File? imageFile;
  static const maxImageSize = 2 * 1024 * 1024;

  @override
  void onInit() {
    userName.text = 'Nezar Khoder';
    phoneNumber.text = '0991974223';
    super.onInit();
  }

  @override
  void back() {
    Get.back();
  }

  @override
  void onClose() {
    userName.dispose();
    phoneNumber.dispose();
    super.onClose();
  }

  @override
  void uploadImageFromCamera() async {
    Get.back();
    try {
      XFile? cameraFile = await ImagePicker().pickImage(
        source: ImageSource.camera,
      );
      if (cameraFile != null) {
        if (File(cameraFile.path).lengthSync() > maxImageSize) {
          showErrorMessage('لا يمكن رفع صورة حجمها اكبر من 2 ميغا');
          return;
        }
        imageFile = File(cameraFile.path);
        update();
      }
    } catch (e) {
      showErrorMessage('حدث خطأ أثناء رفع الصورة');
    }
  }

  @override
  void uploadImageFromGallery() async {
    Get.back();
    XFile? galleryFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (galleryFile != null) {
      if (File(galleryFile.path).lengthSync() > maxImageSize) {
        showErrorMessage('لا يمكن رفع صورة حجمها اكبر من 2 ميغا');
        return;
      }
      imageFile = File(galleryFile.path);
      update();
    }
    update();
  }

  @override
  void saveChanges() {
    Get.back();
  }
}
