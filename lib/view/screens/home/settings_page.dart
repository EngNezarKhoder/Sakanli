import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sakanle/controller/home/settings_page_controller.dart';
import 'package:sakanle/core/constant/app_color.dart';
import 'package:sakanle/core/constant/app_url.dart';
import 'package:sakanle/view/widgets/home/property/settings_page/section_title.dart';
import 'package:sakanle/view/widgets/home/property/settings_page/settings_item.dart';

class SettingsPage extends GetView<SettingsPageControllerImp> {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => SettingsPageControllerImp(), fenix: false);
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(
        elevation: 5,
        shadowColor: Colors.black.withValues(alpha: 0.2),
        scrolledUnderElevation: 3,
        backgroundColor: AppColor.whiteColor,
        surfaceTintColor: AppColor.whiteColor,
        centerTitle: true,
        title: Text(
          "الإعدادات",
          style: TextTheme.of(context).bodySmall!.copyWith(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: AppColor.secondColor,
            letterSpacing: 0.5,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(
            color: Colors.grey.withValues(alpha: 0.08),
            height: 1,
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            center: Alignment.topLeft,
            radius: 1.5,
            colors: [
              Color(0xFFFFC56B),
              Color(0xFFFFE2BD),
              Color.fromARGB(255, 253, 239, 221),
            ],
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(
            top: 8,
            left: 8,
            right: 12,
            bottom: 12,
          ),
          child: Column(
            children: [
              GetBuilder<SettingsPageControllerImp>(
                id: 'profile',
                builder: (controller) {
                  if (controller.isLoadingProfile) {
                    return Padding(
                      padding: const EdgeInsets.all(10),
                      child: Center(
                        child: CupertinoActivityIndicator(
                          radius: 12,
                          color: AppColor.secondColor,
                        ),
                      ),
                    );
                  }
                  final user = controller.user;
                  final profile = controller.profile;
                  return InkWell(
                    onTap: () {
                      controller.navigateToProfilePage();
                    },
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: AppColor.thirdColor,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.05),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 55,
                            height: 55,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            clipBehavior: Clip.antiAlias,
                            child:
                                profile?["image"] != null &&
                                    profile!["image"].toString().isNotEmpty
                                ? Image.network(
                                    "${AppUrl.photoUrl}${profile["image"]}",
                                    fit: BoxFit.cover,
                                    errorBuilder: (_, __, ___) {
                                      return Container(
                                        color: AppColor.primaryColor,
                                        child: const Icon(
                                          Icons.person,
                                          color: Colors.white,
                                          size: 35,
                                        ),
                                      );
                                    },
                                    loadingBuilder: (context, child, progress) {
                                      if (progress == null) return child;
                                      return const Center(
                                        child: CupertinoActivityIndicator(
                                          radius: 12,
                                          color: AppColor.secondColor,
                                        ),
                                      );
                                    },
                                  )
                                : Container(
                                    color: AppColor.primaryColor,
                                    child: const Icon(
                                      Icons.person,
                                      color: Colors.white,
                                      size: 35,
                                    ),
                                  ),
                          ),
                          const SizedBox(width: 14),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${user?['name']}",
                                  style: TextTheme.of(
                                    context,
                                  ).bodySmall!.copyWith(fontSize: 22),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  "${user?['phone']}",
                                  style: TextStyle(color: AppColor.greyColor),
                                ),
                              ],
                            ),
                          ),
                          const Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 18,
                            color: AppColor.secondColor,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 25),
              SectionTitle(title: "الضبط"),
              SettingsItem(
                onTap: () {
                  controller.navigateToMyProperty();
                },
                title: "عقاراتي المعروضة",
                icon: Icons.home_work_rounded,
                subtitle: "عرض العقارات المرفوعة من قبلي",
              ),
              SettingsItem(
                icon: Icons.phone,
                title: "الاتصال بالدعم",
                subtitle: "إرسال رسالة الى الواتساب",
                onTap: () {
                  controller.callWhatsApp();
                },
              ),
              const SizedBox(height: 20),
              SectionTitle(title: "الضبط"),
              SettingsItem(
                icon: Icons.privacy_tip,
                title: "سياسة الخصوصية",
                subtitle: "",
                onTap: () {
                  controller.navigateToPrivacyPage();
                },
              ),
              SettingsItem(
                icon: Icons.description,
                title: "الشروط والأحكام",
                subtitle: "",
                onTap: () {
                  controller.navigateToConditionsPage();
                },
              ),
              SettingsItem(
                icon: Icons.help_outline,
                title: "الأسئلة الشائعة",
                subtitle: "",
                onTap: () {
                  controller.navigateToFaqPage();
                },
              ),
              const SizedBox(height: 20),
              SectionTitle(title: 'تسجيل الخروج'),
              GetBuilder<SettingsPageControllerImp>(
                id: 'loading',
                builder: (controller) {
                  return SettingsItem(
                    icon: Icons.logout,
                    iconColor: AppColor.redColor,
                    titleColor: AppColor.redColor,
                    title: "تسجيل الخروج",
                    subtitle: "تسجيل الخروج من الحساب الحالي",
                    onTap: () {
                      controller.signOut();
                    },
                    isLoading: controller.isLoading,
                  );
                },
              ),
              SectionTitle(title: 'حذف الحساب'),
              GetBuilder<SettingsPageControllerImp>(
                id: 'loadingDelete',
                builder: (controller) {
                  return SettingsItem(
                    icon: Icons.delete,
                    iconColor: AppColor.redColor,
                    titleColor: AppColor.redColor,
                    title: "حذف الحساب نهائيا",
                    subtitle: "حذف الحساب وجميع البيانات المرتبطة به",
                    onTap: () {
                      controller.deleteAccount();
                    },
                    isLoading: controller.isLoading,
                  );
                },
              ),
              const SizedBox(height: 25),
              Text(
                "إصدار التطبيق",
                style: TextTheme.of(context).bodySmall!.copyWith(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                "(28) 1.3.0",
                style: TextStyle(color: AppColor.greyColor),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
