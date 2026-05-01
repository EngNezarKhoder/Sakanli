import 'package:flutter/material.dart';
import 'package:sakanle/core/constant/app_color.dart';

class RememberMeAndForgetPasswordWidget extends StatelessWidget {
  const RememberMeAndForgetPasswordWidget({
    super.key,
    required this.checkBoxValue,
    required this.onChanged,
    required this.onTap,
  });
  final bool checkBoxValue;
  final void Function(bool?)? onChanged;
  final void Function()? onTap;

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
        Text("تذكرني", style: TextTheme.of(context).bodyMedium),
        Spacer(),
        InkWell(
          onTap: onTap,
          child: Text(
            "هل نسيت كلمة المرور ؟",
            style: TextTheme.of(context).bodyMedium,
          ),
        ),
      ],
    );
  }
}
