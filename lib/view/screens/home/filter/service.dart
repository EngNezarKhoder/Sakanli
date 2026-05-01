import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sakanle/controller/home/filter/service_page_controller.dart';
import 'package:sakanle/core/constant/app_color.dart';
import 'package:sakanle/core/constant/image_assets.dart';
import 'package:sakanle/view/widgets/filter/my_custom_button_filter.dart';

class Service extends StatelessWidget {
  const Service({super.key});

  @override
  Widget build(BuildContext context) {
    ServicePageControllerImp controller = Get.put(ServicePageControllerImp());
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      body: Container(
        padding: const EdgeInsetsGeometry.symmetric(
          vertical: 25,
          horizontal: 15,
        ),
        child: ListView(
          children: [
            MyCustomButtonFilter(
              onPressed: () {
                controller.backPressed();
              },
              child: Row(
                children: [
                  Text(
                    "الخدمة",
                    style: TextTheme.of(
                      context,
                    ).titleLarge!.copyWith(color: AppColor.secondColor),
                  ),
                  Spacer(),
                  Image.asset(AppImageAssets.backIcon),
                ],
              ),
              isLogin: true,
            ),
            const SizedBox(height: 70),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 100),
              child: GetBuilder<ServicePageControllerImp>(
                builder: (controller) {
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: controller.services.length,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: MyCustomButtonFilter(
                          onPressed: () {
                            controller.addService(controller.services[index]);
                            controller.changeStateOfSelected(index);
                          },
                          isSelected: controller.selected[index],
                          child: Text(
                            controller.services[index],
                            style: TextTheme.of(context).bodyMedium,
                          ),
                          isLogin: false,
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            const SizedBox(height: 50),
            MyCustomButtonFilter(
              onPressed: () {
                controller.backToAdsPage();
              },
              child: Text(
                "التالي",
                style: TextTheme.of(
                  context,
                ).titleLarge!.copyWith(color: AppColor.secondColor),
              ),
              isLogin: true,
            ),
          ],
        ),
      ),
    );
  }
}
