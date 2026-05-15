import 'package:flutter/material.dart';
import 'package:sakanle/core/constant/app_color.dart';

class OwnerCardCall extends StatelessWidget {
  const OwnerCardCall({super.key, required this.ownerName});

  final String ownerName;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: AppColor.whiteColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        trailing: Icon(Icons.call, color: AppColor.primaryColor, size: 28),
        leading: Container(
          width: 46,
          height: 46,
          decoration: const BoxDecoration(
            color: Color(0xffeef3ec),
            shape: BoxShape.circle,
          ),
          child: Icon(Icons.person, color: AppColor.primaryColor, size: 26),
        ),
        titleAlignment: ListTileTitleAlignment.center,
        title: const Text(
          "المالك",
          textAlign: TextAlign.right,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Colors.black87,
          ),
        ),
        subtitle: Text(
          ownerName,
          textAlign: TextAlign.right,
          style: const TextStyle(fontSize: 16, color: Colors.black54),
        ),
      ),
    );
  }
}
