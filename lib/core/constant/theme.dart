import 'package:flutter/material.dart';
import 'package:sakanle/core/constant/app_color.dart';

ThemeData themeData = ThemeData(
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: AppColor.whiteColor,
    selectedItemColor: AppColor.primaryColor,
    showUnselectedLabels: false,
    selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
  ),
  textTheme: TextTheme(
    titleMedium: TextStyle(
      fontFamily: "Tajawal",
      fontSize: 30,
      fontWeight: FontWeight.w700,
      color: AppColor.primaryColor,
    ),
    titleLarge: TextStyle(
      fontFamily: "Tajawal",
      fontSize: 35,
      fontWeight: FontWeight.w900,
      color: AppColor.primaryColor,
    ),
    bodyMedium: TextStyle(
      fontFamily: "Tajawal",
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: AppColor.primaryColor,
    ),
    bodySmall: TextStyle(
      color: AppColor.secondColor,
      fontFamily: "Tajawal",
      fontSize: 16,
      fontWeight: FontWeight.bold,
    ),
  ),
);
