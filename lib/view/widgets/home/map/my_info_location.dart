import 'package:flutter/material.dart';
import 'package:sakanle/core/constant/app_color.dart';

class MyInfoLocation extends StatelessWidget {
  const MyInfoLocation({
    super.key,
    required this.lat,
    required this.lng,
    required this.address,
  });

  final String lat;
  final String lng;
  final String address;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.location_pin, size: 25, color: AppColor.primaryColor),
              const SizedBox(width: 10),
              Text("الموقع المحدد", style: TextTheme.of(context).bodySmall),
            ],
          ),
          const SizedBox(height: 5),
          Text(
            address,
            style: TextStyle(fontSize: 12, color: AppColor.greyColor),
          ),
          const SizedBox(height: 5),
          Text(
            "خط العرض: $lat\nخط الطول: $lng",
            style: TextStyle(fontSize: 12, color: AppColor.greyColor),
          ),
        ],
      ),
    );
  }
}
