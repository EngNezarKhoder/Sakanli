import 'package:flutter/material.dart';
import 'package:sakanle/core/constant/app_color.dart';

class HomeAdGridWidget extends StatelessWidget {
  const HomeAdGridWidget({
    super.key,
    required this.imageName,
    required this.price,
    required this.iconName,
    required this.forWhat,
    required this.onTapDetails,
    required this.service,
    required this.location,
    required this.city,
    required this.onTapToggle,
  });

  final String imageName;
  final String price;
  final String iconName;
  final String forWhat;
  final String service;
  final String location;
  final void Function()? onTapDetails;
  final String city;
  final void Function()? onTapToggle;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: SizedBox(
                  height: 180, // 👈 هون طول الصورة
                  width: double.infinity,
                  child: Image.network(imageName, fit: BoxFit.cover),
                ),
              ),
              Positioned(
                top: 15,
                left: 15,
                child: Container(
                  height: 45,
                  width: 45,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppColor.thirdColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    forWhat,
                    style: TextTheme.of(context).bodyMedium!.copyWith(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 15,
                right: 15,
                child: GestureDetector(
                  onTap: onTapToggle,
                  child: Image.asset(iconName),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          InkWell(
            onTap: onTapDetails,
            child: Container(
              height: 100,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(width: 1, color: AppColor.primaryColor),
                color: AppColor.secondColor,
              ),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "$price USD",
                        style: TextTheme.of(context).bodyMedium!.copyWith(
                          color: AppColor.thirdColor,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.home, color: AppColor.thirdColor, size: 20),
                      const SizedBox(width: 5),
                      Text(
                        service,
                        style: TextTheme.of(context).bodySmall!.copyWith(
                          color: AppColor.thirdColor,
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        color: AppColor.thirdColor,
                        size: 20,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        city,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextTheme.of(context).bodySmall!.copyWith(
                          color: AppColor.thirdColor,
                          fontWeight: FontWeight.w200,
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        " - $location",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextTheme.of(context).bodySmall!.copyWith(
                          color: AppColor.thirdColor,
                          fontWeight: FontWeight.w200,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
