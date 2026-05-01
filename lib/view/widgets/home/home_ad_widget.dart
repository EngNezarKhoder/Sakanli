import 'package:flutter/material.dart';
import 'package:sakanle/core/constant/app_color.dart';

class HomeAdWidget extends StatelessWidget {
  const HomeAdWidget({
    super.key,
    required this.imageName,
    required this.city,
    required this.price,
    required this.noMonth,
    required this.caption,
    required this.iconName, required this.forWhat,
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
      padding: const EdgeInsets.all(7),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(width: 1, color: AppColor.primaryColor),
      ),
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
            height: 126,
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
                      style: TextTheme.of(
                        context,
                      ).bodyMedium!.copyWith(color: AppColor.thirdColor),
                    ),
                    Text(
                      city,
                      style: TextTheme.of(context).bodyMedium!.copyWith(
                        color: AppColor.thirdColor,
                        fontWeight: FontWeight.bold,
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
                      ),
                    ),
                    Text(
                      " لمدة",
                      style: TextTheme.of(
                        context,
                      ).bodyMedium!.copyWith(color: AppColor.thirdColor),
                    ),
                    Text(
                      " $noMonth شهر",
                      style: TextTheme.of(context).bodyMedium!.copyWith(
                        color: AppColor.thirdColor,
                        fontWeight: FontWeight.bold,
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
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    "المزيد ...",
                    style: TextStyle(
                      color: Colors.orange,
                      fontWeight: FontWeight.bold,
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
