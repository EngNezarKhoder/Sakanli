import 'package:flutter/material.dart';
import 'package:sakanle/view/widgets/auth/my_custom_button_auth.dart';

class NavigateToSignUpOrLogin extends StatelessWidget {
  const NavigateToSignUpOrLogin({
    super.key,
    required this.onPressed,
    required this.titleText,
    required this.titleButton,
  });
  final void Function()? onPressed;
  final String titleText;
  final String titleButton;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Text("ليس لديك حساب ؟", style: TextTheme.of(context).bodyMedium),
        Text(titleText, style: TextTheme.of(context).bodyMedium),
        Spacer(),
        MyCustomButtonAuth(
          onPressed: onPressed,
          // title: "إنشاء حساب",
          title: titleButton,
          isLogin: false,
        ),
      ],
    );
  }
}
