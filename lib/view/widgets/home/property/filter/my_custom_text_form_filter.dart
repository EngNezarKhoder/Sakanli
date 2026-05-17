import 'package:flutter/material.dart';
import 'package:sakanle/core/constant/app_color.dart';

class MyCustomTextFormFilter extends StatelessWidget {
  const MyCustomTextFormFilter({
    super.key,
    required this.hintText,
    required this.myController,
    required this.validator,
    required this.keyboardType,
    required this.prefixIcon,
  });
  final String hintText;
  final TextEditingController myController;
  final String? Function(String?) validator;
  final TextInputType? keyboardType;
  final Widget prefixIcon;
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
        contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 17),
        prefixIcon: prefixIcon,
        fillColor: AppColor.thirdColor,
        filled: true,
        hint: Text(hintText, style: TextTheme.of(context).bodySmall),
      ),
    );
  }
}
