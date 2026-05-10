import 'package:flutter/material.dart';
import 'package:sakanle/core/constant/app_color.dart';

class MyButtonLocation extends StatelessWidget {
  const MyButtonLocation({
    super.key,
    required this.onPressed,
    required this.title,
    required this.isPressed,
  });

  final void Function()? onPressed;
  final String title;
  final bool isPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: MaterialButton(
        onPressed: onPressed,
        color: isPressed ? AppColor.primaryColor : AppColor.whiteColor,
        minWidth: 25,
        child: Text(
          title,
          style: TextTheme.of(
            context,
          ).bodySmall!.copyWith(fontWeight: FontWeight.w300),
        ),
        shape: RoundedRectangleBorder(
          side: isPressed
              ? BorderSide.none
              : BorderSide(width: .7, color: AppColor.secondColor),
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
  }
}
