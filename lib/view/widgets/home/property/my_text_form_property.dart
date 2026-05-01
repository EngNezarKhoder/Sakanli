import 'package:flutter/material.dart';
import 'package:sakanle/core/constant/app_color.dart';

class MyTextFormProperty extends StatelessWidget {
  const MyTextFormProperty({
    super.key,
    required this.keyboardType,
    required this.validator,
    required this.myController, required this.hintText,
  });
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final TextEditingController myController;
  final String hintText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: false,
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
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
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
        contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        fillColor: AppColor.thirdColor,
        filled: true,
        hint: Text(hintText, style: TextTheme.of(context).bodySmall),
      ),
    );
  }
}
