import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sakanle/controller/home/filter/where_page_controller.dart';
import 'package:sakanle/core/constant/app_color.dart';
import 'package:sakanle/core/constant/image_assets.dart';
import 'package:sakanle/view/widgets/filter/my_custom_button_filter.dart';

class Where extends StatelessWidget {
  const Where({super.key});

  @override
  Widget build(BuildContext context) {
    WherePageControllerImp controller = Get.put(WherePageControllerImp());
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
                    "أين",
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
            const SizedBox(height: 50),
            GetBuilder<WherePageControllerImp>(
              builder: (controller) {
                return GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 3,
                  ),
                  itemCount: controller.cites.length,
                  itemBuilder: (context, index) {
                    return MyCustomButtonFilter(
                      onPressed: () {
                        controller.addCityFilter(controller.cites[index]);
                        controller.changeStateOfSelect(index);
                      },
                      isSelected: controller.selected[index],
                      child: Text(
                        controller.cites[index],
                        style: TextTheme.of(context).bodyMedium,
                      ),
                      isLogin: false,
                    );
                  },
                );
              },
            ),
            const SizedBox(height: 50),
            MyCustomButtonFilter(
              onPressed: () {
                controller.navigateToServicePage();
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
