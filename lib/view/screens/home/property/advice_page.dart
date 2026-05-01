import 'package:flutter/material.dart';
import 'package:sakanle/core/constant/app_color.dart';
import 'package:sakanle/core/constant/image_assets.dart';
import 'package:sakanle/view/widgets/home/property/all_advices_widget.dart';

class AdvicePage extends StatelessWidget {
  const AdvicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: ListView(
          children: [
            Image.asset(AppImageAssets.appLogo, width: 200, height: 200),
            Center(
              child: Text(
                "نصائح لإضافة العقارات",
                style: TextTheme.of(context).titleLarge,
              ),
            ),
            const SizedBox(height: 30),
            AllAdvicesWidget()
          ],
        ),
      ),
    );
  }
}
