import 'package:flutter/material.dart';
import 'package:sakanle/core/constant/app_color.dart';

class MyTextFormProfile extends StatelessWidget {
  const MyTextFormProfile({
    super.key,
    required this.myController,
    required this.validator,
  });
  final TextEditingController myController;
  final String? Function(String?) validator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: myController,
      cursorColor: AppColor.greyColor,
      decoration: InputDecoration(
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColor.redColor, width: 1),
          borderRadius: BorderRadius.circular(12),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColor.secondColor, width: 1),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColor.secondColor, width: 1.5),
          borderRadius: BorderRadius.circular(12),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(12),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColor.redColor, width: 1),
          borderRadius: BorderRadius.circular(12),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 13),
        fillColor: AppColor.thirdColor,
        filled: true,
      ),
    );
  }
}
