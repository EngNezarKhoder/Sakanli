import 'package:flutter/material.dart';
import 'package:sakanle/core/constant/app_color.dart';

class MyCustomButtonAuth extends StatelessWidget {
  const MyCustomButtonAuth({
    super.key,
    required this.onPressed,
    required this.title,
    required this.isLogin,
  });
  final void Function()? onPressed;
  final String title;
  final bool isLogin;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 11),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(12),
        side: isLogin
            ? BorderSide.none
            : BorderSide(
                color: AppColor.primaryColor,
                width: 1.5,
                style: BorderStyle.solid,
              ),
      ),
      color: isLogin ? AppColor.primaryColor : AppColor.whiteColor,
      child: Text(
        title,
        style: isLogin
            ? TextTheme.of(
                context,
              ).titleLarge!.copyWith(color: AppColor.secondColor, fontSize: 24)
            : TextTheme.of(context).titleLarge!.copyWith(fontSize: 24),
      ),
    );
  }
}
