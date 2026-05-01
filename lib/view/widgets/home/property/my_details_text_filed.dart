import 'package:flutter/material.dart';
import 'package:sakanle/core/constant/app_color.dart';

class MyDetailsTextFiled extends StatelessWidget {
  const MyDetailsTextFiled({
    super.key,
    required this.controller,
    required this.hintText,
  });
  final TextEditingController controller;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLines: 4,
      maxLength: 300,
      decoration: InputDecoration(
        counterText: "",
        hintText: hintText,
        hintStyle: TextTheme.of(context).bodySmall!.copyWith(fontSize: 16),
        filled: true,
        fillColor: AppColor.thirdColor,
        contentPadding: EdgeInsets.all(15),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey.shade400),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey.shade400),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey.shade400),
        ),
      ),
    );
  }
}
