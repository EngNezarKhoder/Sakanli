import 'package:flutter/material.dart';
import 'package:sakanle/core/constant/app_color.dart';

class AcceptPrivacyWidget extends StatelessWidget {
  const AcceptPrivacyWidget({
    super.key,
    required this.checkBoxValue,
    required this.onChanged,
  });
  final bool checkBoxValue;
  final void Function(bool?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Transform.scale(
          scale: 2,
          child: Checkbox(
            value: checkBoxValue,
            checkColor: AppColor.thirdColor,
            activeColor: AppColor.primaryColor,
            onChanged: onChanged,
            side: BorderSide(width: 2),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(3),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Text("أوافق على", style: TextTheme.of(context).bodyMedium),
        Spacer(),
        Text(
          "الخصوصيّة و الشّروط",
          style: TextTheme.of(
            context,
          ).bodyMedium!.copyWith(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
