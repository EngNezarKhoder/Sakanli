import 'package:flutter/material.dart';

class ImageContainerView extends StatelessWidget {
  const ImageContainerView({super.key, required this.fileName});

  final String fileName;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            blurRadius: 8,
            color: Colors.black.withValues(alpha: 0.15),
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Image.asset(fileName, fit: BoxFit.cover),
      ),
    );
  }
}
