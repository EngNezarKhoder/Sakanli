import 'package:flutter/material.dart';
import 'package:sakanle/core/constant/app_color.dart';
import 'package:sakanle/view/widgets/home/property/details/info_item.dart';

class PropertyCard extends StatelessWidget {
  const PropertyCard({
    super.key,
    required this.propertyType,
    required this.price,
    required this.numberOfAdd,
    required this.numOfViews,
    required this.statusOfProperty,
    required this.location,
    required this.description,
    required this.area,
    required this.countBedRoom,
    required this.countBathRoom,
  });
  final String propertyType;
  final String price;
  final int numberOfAdd;
  final int numOfViews;
  final String statusOfProperty;
  final String location;
  final String description;
  final String area;
  final String countBedRoom;
  final String countBathRoom;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
              decoration: BoxDecoration(
                color: AppColor.primaryColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                propertyType,
                style: TextTheme.of(context).bodySmall!.copyWith(
                  fontWeight: FontWeight.w200,
                  color: AppColor.whiteColor,
                  fontSize: 13,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "USD $price",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: AppColor.primaryColor,
              ),
            ),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                "رقم الإعلان : ${numberOfAdd}",
                style: TextStyle(fontSize: 18, color: Colors.black87),
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Icon(Icons.home, size: 18, color: Colors.grey),
                SizedBox(width: 5),
                Text(
                  propertyType,
                  style: TextStyle(color: Colors.grey, fontSize: 15),
                ),
                Spacer(),
                Icon(
                  Icons.remove_red_eye_outlined,
                  size: 18,
                  color: Colors.grey,
                ),
                SizedBox(width: 5),
                Text(
                  "عدد المشاهدات : ${numOfViews}",
                  style: TextStyle(color: Colors.grey, fontSize: 15),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.info, color: AppColor.primaryColor, size: 20),
                SizedBox(width: 6),
                Text(statusOfProperty, style: TextStyle(fontSize: 16)),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Icon(
                  Icons.location_on_outlined,
                  color: AppColor.primaryColor,
                  size: 20,
                ),
                SizedBox(width: 6),
                Expanded(child: Text(location, style: TextStyle(fontSize: 15))),
              ],
            ),
            const SizedBox(height: 18),
            Text(
              "وصف ما يميز العقار",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              description,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 22),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InfoItem(
                  icon: Icons.straighten,
                  title: "المساحة",
                  value: "$area م²",
                ),
                InfoItem(
                  icon: Icons.bed_outlined,
                  title: "الغرف",
                  value: countBedRoom,
                ),
                InfoItem(
                  icon: Icons.bathroom_outlined,
                  title: "الحمامات",
                  value: countBathRoom,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
