import 'package:flutter/material.dart';
import 'package:sakanle/core/constant/app_color.dart';

class RadioListTileWidget extends StatelessWidget {
  const RadioListTileWidget({
    super.key,
    required this.title,
    required this.value,
  });
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RadioListTile(
        activeColor: AppColor.primaryColor,
        value: value,
        title: Text(title, style: TextTheme.of(context).bodySmall),
      ),
    );
  }
}
