import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sakanle/core/api/api_service.dart';
import 'package:sakanle/core/constant/app_color.dart';
import 'package:sakanle/core/constant/app_route.dart';
import 'package:sakanle/core/functions/show_error_message.dart';
import 'package:sakanle/core/functions/show_success_alert.dart';
import 'package:sakanle/core/services/token_service.dart';

abstract class MyPropertyController extends GetxController {
  void back();
  void navigateToAddProperty();
  void navigateToEditProperty(Map<String, dynamic> property);
}

class MyPropertyControllerImp extends MyPropertyController {
  List<Map<String, dynamic>> properties = [];
  bool isLoading = false;

  @override
  void onInit() {
    getMyProperties();
    super.onInit();
  }

  @override
  void back() {
    Get.back();
  }

  @override
  void navigateToAddProperty() {
    Get.offNamed(AppRoute.addProperty);
  }

  Future<void> getMyProperties() async {
    String? token = await TokenService.getToken();
    if (token == null) return;
    isLoading = true;
    update(['loading']);
    properties = await ApiService.myProperties(token);
    isLoading = false;
    update(['loading']);
    print(properties);
    update();
  }

  Future<void> deleteProperty(String id) async {
    String? token = await TokenService.getToken();
    if (token == null) return;

    isLoading = true;
    update(['loading']);

    final response = await ApiService.deleteProperty(
      token: token,
      propertyId: id,
    );

    isLoading = false;

    if (response != null &&
        (response['statusCode'] == 200 || response['statusCode'] == 204)) {
      properties.removeWhere((item) => item['id'].toString() == id);
      ShowSuccessAlert("تم حذف العقار بنجاح");
    } else {
      showErrorMessage('فشل حذف العقار');
    }

    update(['loading']);
  }

  void navigateToEditProperty(Map<String, dynamic> property) async {
    Get.dialog(
      const Center(
        child: CircularProgressIndicator(color: AppColor.primaryColor),
      ),
      barrierDismissible: false,
    );

    await Future.delayed(const Duration(milliseconds: 200));

    Get.back(); // يقفل اللودينغ
    Get.offNamed(AppRoute.propertyInfo, arguments: {'property': property});
  }
}
