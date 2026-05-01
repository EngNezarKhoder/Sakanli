import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:sakanle/core/constant/app_color.dart';

Future<bool> alertExitApp() {
  Get.defaultDialog(
    contentPadding: EdgeInsets.all(10),
    title: "تنبيه",
    middleText: "هل أنت متأكد من مغادرة التطبيق",
    titleStyle: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Colors.redAccent,
    ),
    middleTextStyle: TextStyle(fontSize: 16, color: Colors.black87),
    backgroundColor: Colors.white,
    barrierDismissible: false, 
    actions: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ElevatedButton.icon(
            onPressed: () {
              exit(0);
            },
            icon: Icon(Icons.exit_to_app, color: Colors.white),
            label: Text("نعم", style: TextStyle(color: AppColor.whiteColor)),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red, // Background color
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            ),
          ),
          ElevatedButton.icon(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.cancel, color: Colors.white),
            label: Text("إلغاء", style: TextStyle(color: AppColor.whiteColor)),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green, // Background color
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            ),
          ),
        ],
      ),
    ],
  );
  return Future.value(true);
}
