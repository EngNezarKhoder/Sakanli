import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sakanle/controller/property/property_info_controller.dart';
import 'package:sakanle/core/constant/app_color.dart';
import 'package:sakanle/view/widgets/home/property/build_circle.dart';
import 'package:sakanle/view/widgets/home/property/my_cancel_button.dart';
import 'package:sakanle/view/widgets/home/property/my_next_button.dart';
import 'package:sakanle/view/widgets/home/property/notice_box.dart';

class PropertyInfo extends StatelessWidget {
  const PropertyInfo({super.key});

  @override
  Widget build(BuildContext context) {
    PropertyInfoControllerImp controller = Get.put(PropertyInfoControllerImp());
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      bottomNavigationBar: GetBuilder<PropertyInfoControllerImp>(
        builder: (controller) {
          return Container(
            padding: EdgeInsets.all(16),
            color: Colors.white,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                controller.index == 2 ? NoticeBox() : SizedBox(height: 0),
                Row(
                  children: [
                    MyCancelButton(
                      onPressed: () {
                        controller.navigateToPerviousPage();
                      },
                      title: "تراجع",
                    ),
                    SizedBox(width: 10),
                    MyNextButton(
                      onPressed: () {
                        controller.navigateToNextPage();
                      },
                      title: controller.index == 2 ? "ارسال الطلب" : "التالي",
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 50),
        child: Column(
          children: [
            GetBuilder<PropertyInfoControllerImp>(
              builder: (controller) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Spacer(),
                    BuildCircle(
                      title: controller.pageOneIsDone ? "✓" : "1",
                      circleColor: controller.index == 0
                          ? AppColor.primaryColor
                          : AppColor.thirdColor,
                      fontColor: controller.index == 0
                          ? AppColor.whiteColor
                          : AppColor.secondColor,
                    ),
                    Expanded(
                      child: Container(height: 1, color: AppColor.greyColor),
                    ),
                    BuildCircle(
                      title: controller.pageTwoIsDone ? "✓" : "2",
                      circleColor: controller.index == 1
                          ? AppColor.primaryColor
                          : AppColor.thirdColor,
                      fontColor: controller.index == 1
                          ? AppColor.whiteColor
                          : AppColor.secondColor,
                    ),
                    Expanded(
                      child: Container(height: 1, color: AppColor.greyColor),
                    ),
                    BuildCircle(
                      title: "3",
                      circleColor: controller.index == 2
                          ? AppColor.primaryColor
                          : AppColor.thirdColor,
                      fontColor: controller.index == 2
                          ? AppColor.whiteColor
                          : AppColor.secondColor,
                    ),
                    Spacer(),
                  ],
                );
              },
            ),
            const SizedBox(height: 40),
            Text(
              "معلومات العقار",
              textAlign: TextAlign.center,
              style: TextTheme.of(context).titleLarge!.copyWith(fontSize: 29),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: PageView.builder(
                controller: controller.pageController,
                physics: NeverScrollableScrollPhysics(),
                onPageChanged: (val) {
                  controller.changeValueOfIndex(val);
                },
                itemBuilder: (context, index) {
                  return controller.pages[index];
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
