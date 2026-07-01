import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';
import 'package:sakanle/core/api/api_service.dart';
import 'package:sakanle/core/constant/app_route.dart';
import 'package:sakanle/core/functions/show_error_message.dart';
import 'package:sakanle/core/services/token_service.dart';
import 'package:url_launcher/url_launcher.dart';

abstract class SettingsPageController extends GetxController {
  void navigateToProfilePage();
  void navigateToMyProperty();
  void onChangeValueOfNotification(bool val);
  void callWhatsApp();
  void signOut();
  void deleteAccount();
  void navigateToPrivacyPage();
  void navigateToConditionsPage();
  void navigateToFaqPage();
  void getProfile();
}

class SettingsPageControllerImp extends SettingsPageController {
  bool notificationIsEnabled = false;
  bool isLoading = false;
  bool isLoadingProfile = false;
  Map<String, dynamic>? user;
  Map<String, dynamic>? profile;

  @override
  void onInit() {
    super.onInit();
    getProfile();
  }

  @override
  void getProfile() async {
    isLoadingProfile = true;
    update(['profile']);
    String? token = await TokenService.getToken();
    if (token == null) {
      isLoading = false;
      update(['profile']);
      return;
    }
    final response = await ApiService.getProfile(token: token);
    isLoadingProfile = false;
    if (response != null && response['status'] == 'success') {
      user = response['user'];
      profile = response['profile'];
      print(response);
    } else {
      showErrorMessage("فشل في تحميل بيانات الملف الشخصي");
    }

    update(['profile']);
  }

  @override
  void navigateToProfilePage() {
    Get.toNamed(AppRoute.myProfile);
  }

  @override
  void navigateToMyProperty() {
    Get.toNamed(AppRoute.myProperty);
  }

  @override
  void onChangeValueOfNotification(bool val) {
    notificationIsEnabled = val;
    update();
  }

  @override
  void callWhatsApp() async {
    final Uri whatsapp = Uri.parse("https://wa.me/963983076884");

    await launchUrl(whatsapp, mode: LaunchMode.externalApplication);
  }

  @override
  void deleteAccount() async {
    isLoading = true;
    update(['loadingDelete']);

    String? token = await TokenService.getToken();

    if (token == null) {
      isLoading = false;
      update(['loadingDelete']);
      showErrorMessage('يجب تسجيل الدخول أولاً');
      return;
    }

    final response = await ApiService.deleteAccount(token: token);

    isLoading = false;
    update(['loadingDelete']);

    if (response != null &&
        (response['statusCode'] == 200 || response['statusCode'] == 204)) {
      await TokenService.deleteToken();

      Get.offAllNamed(AppRoute.login);
    } else {
      showErrorMessage(response?['body']?['message'] ?? 'فشل حذف الحساب');
    }
  }

  @override
  void signOut() async {
    isLoading = true;
    update(['loading']);
    String? token = await TokenService.getToken();
    var response = await ApiService.logout(token!);
    isLoading = false;
    update(['loading']);
    print(response);
    if (response['status'] == 'done') {
      await TokenService.deleteToken();
      Get.offAllNamed(AppRoute.login);
    } else {
      showErrorMessage(response['message'] ?? 'فشل تسجيل الخروج');
    }
  }

  @override
  void navigateToConditionsPage() {
    Get.toNamed(AppRoute.conditionsPage);
  }

  @override
  void navigateToFaqPage() {
    Get.toNamed(AppRoute.faqPage);
  }

  @override
  void navigateToPrivacyPage() {
    Get.toNamed(AppRoute.privacyPage);
  }
}
