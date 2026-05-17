import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sakanle/controller/property/my_property_controller.dart';
import 'package:sakanle/core/constant/app_color.dart';
import 'package:sakanle/view/widgets/auth/my_custom_button_auth.dart';

class MyProperty extends StatelessWidget {
  const MyProperty({super.key});

  @override
  Widget build(BuildContext context) {
    MyPropertyControllerImp controller = Get.find<MyPropertyControllerImp>();

    return Scaffold(
      backgroundColor: const Color(0xffF6F8FB),
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: const Color(0xffF6F8FB),
        centerTitle: true,
        title: Text(
          "عقاراتي",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: AppColor.secondColor,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
        child: Column(
          children: [
            Expanded(
              child: controller.homes.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(28),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withValues(alpha: 0.05),
                                  blurRadius: 18,
                                  offset: const Offset(0, 8),
                                ),
                              ],
                            ),
                            child: Icon(
                              Icons.home_work_outlined,
                              size: 55,
                              color: AppColor.secondColor,
                            ),
                          ),
                          const SizedBox(height: 28),
                          Text(
                            "لا توجد عقارات مضافة",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: AppColor.secondColor,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            "قم بإضافة أول عقار لك الآن",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.grey.shade600,
                            ),
                          ),
                        ],
                      ),
                    )
                  : const SizedBox(),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: MyCustomButtonAuth(
                onPressed: () {
                  controller.navigateToAddProperty();
                },
                title: 'طلب اضافة عقار',
                isLogin: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
