import 'package:flutter/material.dart';
import 'package:sakanle/core/constant/app_color.dart';

class AddAnotherLocation extends StatelessWidget {
  const AddAnotherLocation({
    super.key,
    required this.onTap,
    required this.address,
  });

  final void Function()? onTap;
  final String address;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.green.shade100,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.green.shade700, width: 1.5),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 0,
            right: 0,
            child: GestureDetector(
              onTap: onTap,
              child: Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  Icons.place,
                  size: 18,
                  color: AppColor.primaryColor,
                ),
              ),
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 10,),
              Icon(Icons.location_on, color: AppColor.primaryColor, size: 35),
              const SizedBox(height: 10),
              Text(
                "تم تحديد الموقع",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColor.primaryColor,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                address,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey[700], fontSize: 12),
              ),
              const SizedBox(height: 20,),
            ],
          ),
        ],
      ),
    );
  }
}
