import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sakanle/core/constant/app_color.dart';

class ImageContainerView extends StatelessWidget {
  const ImageContainerView({super.key, required this.fileName});

  final String fileName;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.network(
        fileName,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return Container(
            color: Colors.grey.shade200,
            child: const Icon(Icons.broken_image),
          );
        },

        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return const Center(
            child: CupertinoActivityIndicator(
              radius: 12,
              color: AppColor.secondColor,
            ),
          );
        },
      ),
    );
  }
}
