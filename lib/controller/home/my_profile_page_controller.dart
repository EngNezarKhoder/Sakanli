import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sakanle/core/api/api_service.dart';
import 'package:sakanle/core/constant/app_route.dart';
import 'package:sakanle/core/functions/show_error_message.dart';
import 'package:sakanle/core/functions/show_success_alert.dart';
import 'package:sakanle/core/services/token_service.dart';

abstract class MyProfilePageController extends GetxController {
  void back();
  void uploadImageFromCamera();
  void uploadImageFromGallery();
  Future<void> saveChanges();
  void getProfile();
}

class MyProfilePageControllerImp extends MyProfilePageController {
  final TextEditingController userName = TextEditingController();
  final TextEditingController phoneNumber = TextEditingController();
  bool isLoadingPage = false;
  File? imageFile;
  Map<String, dynamic>? user;
  Map<String, dynamic>? profile;
  late String imageName;

  static const maxImageSize = 2 * 1024 * 1024;

  bool isLoading = false;

  @override
  void onInit() {
    getProfile();
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
          showErrorMessage('لا يمكن رفع صورة حجمها أكبر من 2 ميغا');
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

    try {
      XFile? galleryFile = await ImagePicker().pickImage(
        source: ImageSource.gallery,
      );

      if (galleryFile != null) {
        if (File(galleryFile.path).lengthSync() > maxImageSize) {
          showErrorMessage('لا يمكن رفع صورة حجمها أكبر من 2 ميغا');
          return;
        }

        imageFile = File(galleryFile.path);
        update();
      }
    } catch (e) {
      showErrorMessage('حدث خطأ أثناء رفع الصورة');
    }
  }

  @override
  Future<void> saveChanges() async {
    isLoading = true;
    update(['loading']);
    try {
      final String? token = await TokenService.getToken();

      if (token == null) {
        showErrorMessage('يجب تسجيل الدخول أولاً');
        return;
      }

      final response = await ApiService.updateProfile(
        token: token,
        name: userName.text.trim(),
        phone: phoneNumber.text.trim(),
        image: imageFile,
      );
      isLoading = false;
      update(['loading']);
      if (response != null && response['status'] == 'success') {
        isLoading = false;
        update(['loading']);

        ShowSuccessAlert('تم تحديث ملفك بنجاح');

        await Future.delayed(const Duration(milliseconds: 300));
        Get.offAllNamed(AppRoute.homePage);
        return;
      } else {
        showErrorMessage('فشل تحديث الحساب');
      }
    } catch (e) {
      isLoading = false;
      update(['loading']);
      showErrorMessage('حدث خطأ أثناء تحديث الحساب');
    }
  }

  @override
  void getProfile() async {
    isLoadingPage = true;
    update();
    String? token = await TokenService.getToken();
    if (token == null) {
      isLoading = false;
      update();
      return;
    }
    final response = await ApiService.getProfile(token: token);
    isLoadingPage = false;
    if (response != null && response['status'] == 'success') {
      user = response['user'];
      profile = response['profile'];
      userName.text = user?['name'];
      phoneNumber.text = user?['phone'];
      imageName = profile?['image'] ?? '';
      print(response);
    } else {
      showErrorMessage("فشل في تحميل بيانات الملف الشخصي");
    }

    update();
  }
}
