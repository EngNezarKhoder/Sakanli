import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sakanle/core/constant/app_color.dart';

class SettingsItem extends StatelessWidget {
  const SettingsItem({
    super.key,
    required this.onTap,
    required this.title,
    this.subtitle,
    required this.icon,
    this.iconColor = AppColor.primaryColor,
    this.titleColor = AppColor.secondColor,
    this.isLoading = false,
  });
  final void Function()? onTap;
  final String title;
  final subtitle;
  final IconData icon;
  final Color iconColor;
  final Color titleColor;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(18),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
        child: Row(
          children: [
            Icon(icon, color: iconColor, size: 24),
            const SizedBox(width: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  textAlign: TextAlign.right,
                  style: TextTheme.of(context).bodySmall!.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: titleColor,
                  ),
                ),
                if (subtitle.isNotEmpty) ...[
                  const SizedBox(height: 5),
                  Text(
                    subtitle,
                    textAlign: TextAlign.right,
                    style: const TextStyle(
                      color: Color.fromARGB(148, 13, 7, 0),
                      fontSize: 15,
                    ),
                  ),
                ],
              ],
            ),
            const Spacer(),
            isLoading
                ? CupertinoActivityIndicator(
                    radius: 12,
                    color: AppColor.secondColor,
                  )
                : const Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 18,
                    color: AppColor.secondColor,
                  ),
          ],
        ),
      ),
    );
  }
}
