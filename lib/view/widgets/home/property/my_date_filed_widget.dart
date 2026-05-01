import 'package:flutter/material.dart';
import 'package:sakanle/core/constant/app_color.dart';

class DateFieldWidget extends StatelessWidget {
  const DateFieldWidget({
    super.key,
    required this.controller,
    required this.onTap,
    required this.title,
    required this.hintText,
  });
  final TextEditingController controller;
  final void Function()? onTap;
  final String title;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextTheme.of(context).bodySmall!.copyWith(fontSize: 16),
        ),
        const SizedBox(height: 10),
        GestureDetector(
          onTap: onTap,
          child: AbsorbPointer(
            child: TextFormField(
              controller: controller,
              decoration: InputDecoration(
                hintStyle: TextTheme.of(
                  context,
                ).bodySmall!.copyWith(fontSize: 15),
                hintText: hintText,
                suffixIcon: Icon(Icons.calendar_today_outlined),
                filled: true,
                fillColor: AppColor.thirdColor,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 5,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
