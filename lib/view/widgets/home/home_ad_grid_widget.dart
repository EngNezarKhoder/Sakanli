import 'package:flutter/material.dart';
import 'package:sakanle/core/constant/app_color.dart';

class HomeAdGridWidget extends StatelessWidget {
  const HomeAdGridWidget({
    super.key,
    required this.imageName,
    required this.city,
    required this.price,
    required this.noMonth,
    required this.caption,
    required this.iconName,
    required this.forWhat,
  });

  final String imageName;
  final String city;
  final String price;
  final String noMonth;
  final String caption;
  final String iconName;
  final String forWhat;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  imageName,
                  width: double.infinity,
                  fit: BoxFit.cover,
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
                  onTap: () {
                    // toggle favorite
                  },
                  child: Image.asset(iconName),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Container(
            height: 98,
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
                      "مكان الإقامة في",
                      style: TextTheme.of(context).bodyMedium!.copyWith(
                        color: AppColor.thirdColor,
                        fontSize: 13,
                      ),
                    ),
                    Text(
                      city,
                      style: TextTheme.of(context).bodyMedium!.copyWith(
                        color: AppColor.thirdColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      price,
                      style: TextTheme.of(context).bodyMedium!.copyWith(
                        color: AppColor.thirdColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                    ),
                    Text(
                      " لمدة",
                      style: TextTheme.of(context).bodyMedium!.copyWith(
                        color: AppColor.thirdColor,
                        fontSize: 13,
                      ),
                    ),
                    Text(
                      " $noMonth شهر",
                      style: TextTheme.of(context).bodyMedium!.copyWith(
                        color: AppColor.thirdColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
                Text(
                  caption,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextTheme.of(context).bodyMedium!.copyWith(
                    color: AppColor.thirdColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    "المزيد ...",
                    style: TextStyle(
                      color: Colors.orange,
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
