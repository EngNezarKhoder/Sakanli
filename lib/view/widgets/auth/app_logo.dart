import 'package:flutter/material.dart';
import 'package:sakanle/core/constant/image_assets.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: [
        Text(
          "تسجيل الدخول إلى",
          style: TextTheme.of(context).titleMedium,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 10),
        Text(
          "Sakanli",
          style: TextTheme.of(context).titleLarge,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 15),
        Image.asset(AppImageAssets.logoImage, width: 100, height: 100),
        const SizedBox(height: 15),
      ],
    );
  }
}
