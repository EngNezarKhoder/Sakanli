import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sakanle/controller/property/add_property_controller.dart';
import 'package:sakanle/core/constant/app_color.dart';
import 'package:sakanle/core/constant/image_assets.dart';
import 'package:sakanle/view/widgets/auth/my_custom_button_auth.dart';
import 'package:sakanle/view/widgets/home/property/add_property_widget.dart';
import 'package:sakanle/view/widgets/home/property/advice_widget.dart';

class AddProperty extends StatelessWidget {
  const AddProperty({super.key});

  @override
  Widget build(BuildContext context) {
    AddPropertyControllerImp controller = Get.put(AddPropertyControllerImp());
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: ListView(
          children: [
            Image.asset(AppImageAssets.appLogo, width: 200, height: 200),
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
            MyCustomButtonAuth(
              onPressed: () {
                controller.navigateToAddPropertyInfo();
              },
              title: "إنشاء طلب",
              isLogin: true,
            ),
          ],
        ),
      ),
    );
  }
}
