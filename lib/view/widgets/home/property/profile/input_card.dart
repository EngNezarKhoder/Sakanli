import 'package:flutter/material.dart';
import 'package:sakanle/core/constant/app_color.dart';
import 'package:sakanle/view/widgets/home/property/profile/my_text_form_profile.dart';

class InputCard extends StatelessWidget {
  const InputCard({
    super.key,
    required this.title,
    required this.icon,
    required this.controller,
    required this.validator,
  });

  final String title;
  final IconData icon;
  final TextEditingController controller;
  final String? Function(String?) validator;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(icon, color: AppColor.primaryColor),
              const SizedBox(width: 8),
              Text(
                title,
                style: TextTheme.of(context).bodySmall!.copyWith(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          MyTextFormProfile(myController: controller, validator: validator),
        ],
      ),
    );
  }
}
