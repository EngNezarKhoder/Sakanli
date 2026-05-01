import 'package:flutter/material.dart';
import 'package:sakanle/core/constant/app_color.dart';

class MyCustomButtonFilter extends StatelessWidget {
  const MyCustomButtonFilter({
    super.key,
    required this.onPressed,
    required this.child,
    required this.isLogin,
    this.isSelected = false,
  });
  final void Function()? onPressed;
  final Widget? child;
  final bool isLogin;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 60,
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
      color: isLogin
          ? AppColor.primaryColor
          : isSelected
          ? AppColor.thirdColor
          : AppColor.whiteColor,
      child: child,
    );
  }
}
