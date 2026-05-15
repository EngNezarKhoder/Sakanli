import 'package:flutter/material.dart';
import 'package:sakanle/core/constant/app_color.dart';
import 'package:sakanle/view/widgets/home/property/settings_page/section_title.dart';
import 'package:sakanle/view/widgets/home/property/settings_page/settings_item.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 8, left: 8, right: 12, bottom: 12),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: AppColor.whiteColor,
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
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: AppColor.primaryColor,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.person,
                      color: Colors.white,
                      size: 35,
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Nezar Khoder",
                          style: TextTheme.of(
                            context,
                          ).bodySmall!.copyWith(fontSize: 22),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "0991974223",
                          style: TextStyle(color: AppColor.greyColor),
                        ),
                      ],
                    ),
                  ),
                  const Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 18,
                    color: AppColor.greyColor,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 25),
            SectionTitle(title: "الضبط"),
            SettingsItem(
              onTap: () {},
              title: "عقاراتي المعروضة",
              icon: Icons.home_work_rounded,
              subtitle: "عرض العقارات المرفوعة من قبلي",
            ),
            SettingsItem(
              icon: Icons.phone,
              title: "الاتصال بالدعم",
              subtitle: "إرسال رسالة الى الواتساب",
              onTap: () {},
            ),
            const SizedBox(height: 20),
            SectionTitle(title: "الإشعارات"),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
              child: Row(
                children: [
                  Icon(Icons.notifications, color: AppColor.primaryColor),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "استلام إشعارات التطبيق",
                          style: TextTheme.of(context).bodySmall!.copyWith(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Switch(
                    value: true,
                    activeThumbColor: AppColor.primaryColor,
                    onChanged: (value) {},
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            SectionTitle(title: "الضبط"),
            SettingsItem(
              icon: Icons.privacy_tip,
              title: "سياسة الخصوصية",
              subtitle: "",
              onTap: () {},
            ),
            SettingsItem(
              icon: Icons.description,
              title: "الشروط والأحكام",
              subtitle: "",
              onTap: () {},
            ),
            SettingsItem(
              icon: Icons.help_outline,
              title: "الأسئلة الشائعة",
              subtitle: "",
              onTap: () {},
            ),
            const SizedBox(height: 20),
            SectionTitle(title: 'تسجيل الخروج'),
            SettingsItem(
              icon: Icons.logout,
              iconColor: AppColor.redColor,
              titleColor: AppColor.redColor,
              title: "تسجيل الخروج",
              subtitle: "تسجيل الخروج من الحساب الحالي",
              onTap: () {},
            ),
            SectionTitle(title: 'حذف الحساب'),
            SettingsItem(
              icon: Icons.delete,
              iconColor: AppColor.redColor,
              titleColor: AppColor.redColor,
              title: "حذف الحساب نهائيا",
              subtitle: "حذف الحساب وجميع البيانات المرتبطة به",
              onTap: () {},
            ),
            const SizedBox(height: 25),
            Text(
              "إصدار التطبيق",
              style: TextTheme.of(
                context,
              ).bodySmall!.copyWith(fontSize: 20, fontWeight: FontWeight.w500),
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
    );
  }
}
