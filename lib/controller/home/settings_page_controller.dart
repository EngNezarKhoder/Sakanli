import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';
import 'package:sakanle/core/constant/app_route.dart';
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
}

class SettingsPageControllerImp extends SettingsPageController {
  bool notificationIsEnabled = false;
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
  void deleteAccount() {
    Get.offAllNamed(AppRoute.login);
  }

  @override
  void signOut() {
    Get.offAllNamed(AppRoute.login);
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
