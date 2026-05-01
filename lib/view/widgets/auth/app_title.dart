import 'package:flutter/material.dart';
import 'package:sakanle/core/constant/app_color.dart';

class AppTitle extends StatelessWidget {
  const AppTitle({super.key, required this.title, required this.body});
  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextTheme.of(context).bodyMedium!.copyWith(fontSize: 25),
        ),
        const SizedBox(height: 10),
        Text(
          body,
          textAlign: TextAlign.center,
          style: TextTheme.of(context).bodySmall!.copyWith(
            color: AppColor.primaryColor,
            fontWeight: FontWeight.w100,
          ),
        ),
      ],
    );
  }
}
