import 'package:flutter/material.dart';

class BuildCircle extends StatelessWidget {
  const BuildCircle({
    super.key,
    required this.title,
    required this.circleColor,
    required this.fontColor,
  });
  final String title;
  final Color circleColor;
  final Color fontColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      alignment: Alignment.center,
      decoration: BoxDecoration(shape: BoxShape.circle, color: circleColor),
      child: Text(
        title,
        style: TextStyle(color: fontColor),
        textAlign: TextAlign.center,
      ),
    );
  }
}
