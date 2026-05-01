import 'package:flutter/material.dart';
import 'package:sakanle/core/constant/app_color.dart';

class MyCustomTextFormSearch extends StatelessWidget {
  const MyCustomTextFormSearch({
    super.key,
    required this.hintText,
    required this.myController,
    required this.validator,
    required this.keyboardType,
    required this.suffixImageName,
  });
  final String hintText;
  final TextEditingController myController;
  final String? Function(String?) validator;
  final TextInputType? keyboardType;
  final String suffixImageName;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      keyboardType: keyboardType,
      controller: myController,
      cursorColor: AppColor.greyColor,
      decoration: InputDecoration(
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColor.redColor, width: 1),
          borderRadius: BorderRadius.circular(12),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColor.primaryColor, width: 1),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColor.primaryColor, width: 1),
          borderRadius: BorderRadius.circular(12),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColor.primaryColor, width: 1),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColor.redColor, width: 1),
          borderRadius: BorderRadius.circular(12),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 13),
        suffixIcon: Image.asset(suffixImageName),
        fillColor: AppColor.whiteColor,
        filled: true,
        hint: Text(
          hintText,
          style: TextTheme.of(
            context,
          ).bodySmall!.copyWith(color: AppColor.primaryColor),
        ),
      ),
    );
  }
}
