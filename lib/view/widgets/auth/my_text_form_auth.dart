import 'package:flutter/material.dart';
import 'package:sakanle/core/constant/app_color.dart';

class MyCustomTextFormAuth extends StatelessWidget {
  const MyCustomTextFormAuth({
    super.key,
    required this.hintText,
    this.iconData,
    required this.myController,
    required this.validator,
    required this.keyboardType,
    this.onPressed,
    this.obscure = false,
    required this.prefixImageName,
    this.suffixImageName,
  });
  final String hintText;
  final IconData? iconData;
  final TextEditingController myController;
  final String? Function(String?) validator;
  final TextInputType? keyboardType;
  final void Function()? onPressed;
  final String prefixImageName;
  final String? suffixImageName;
  final bool obscure;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscure,
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
        contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 17),
        suffixIcon: suffixImageName != null
            ? IconButton(
                onPressed: onPressed,
                icon: Image.asset(suffixImageName!),
                color: AppColor.greyColor,
              )
            : null,
        prefixIcon: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
          child: Image.asset(
            prefixImageName,
            width: 40,
            height: 40,
            fit: BoxFit.fill,
          ),
        ),
        fillColor: AppColor.thirdColor,
        filled: true,
        hint: Text(hintText, style: TextTheme.of(context).bodySmall),
      ),
    );
  }
}
