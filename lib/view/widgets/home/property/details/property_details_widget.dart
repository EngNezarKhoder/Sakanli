import 'package:flutter/material.dart';
import 'package:sakanle/core/constant/app_color.dart';

class PropertyDetailsWidget extends StatelessWidget {
  const PropertyDetailsWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.content,
  });
  final IconData icon;
  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
      child: Column(
        children: [
          Row(
            children: [
              Icon(icon, color: AppColor.primaryColor),
              const SizedBox(width: 5),
              Text(
                title,
                style: TextTheme.of(context).bodySmall!.copyWith(
                  fontWeight: FontWeight.w300,
                  fontSize: 20,
                ),
              ),
              Spacer(),
              Text(
                content,
                style: TextTheme.of(
                  context,
                ).bodySmall!.copyWith(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Divider(color: Colors.black, thickness: .1, height: 10),
        ],
      ),
    );
  }
}
