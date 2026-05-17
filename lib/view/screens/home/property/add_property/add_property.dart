import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sakanle/controller/property/add_property_controller.dart';
import 'package:sakanle/core/constant/image_assets.dart';
import 'package:sakanle/view/widgets/auth/my_custom_button_auth.dart';
import 'package:sakanle/view/widgets/home/property/add_property_widgets/add_property_widget.dart';
import 'package:sakanle/view/widgets/home/property/advice/advice_widget.dart';

class AddProperty extends StatelessWidget {
  const AddProperty({super.key});

  @override
  Widget build(BuildContext context) {
    AddPropertyControllerImp controller = Get.find<AddPropertyControllerImp>();
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FB),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            Image.asset(AppImageAssets.logoImage, width: 200, height: 200),
            Center(
              child: Text(
                "عقارك معنا بأمان",
                style: TextTheme.of(context).titleLarge,
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: Text(
                "بيع سريع، ربح أكبر",
                style: TextTheme.of(context).bodySmall,
              ),
            ),
            const SizedBox(height: 50),
            AddPropertyWidget(),
            const SizedBox(height: 20),
            AdviceWidget(
              onTap: () {
                controller.navigateToAdvicePage();
              },
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: MyCustomButtonAuth(
                onPressed: () {
                  controller.navigateToAddPropertyInfo();
                },
                title: "إنشاء طلب",
                isLogin: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
