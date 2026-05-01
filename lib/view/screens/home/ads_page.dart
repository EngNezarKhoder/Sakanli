import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sakanle/controller/home/ads_page_controller.dart';
import 'package:sakanle/core/constant/image_assets.dart';
import 'package:sakanle/view/widgets/home/home_ad_grid_widget.dart';
import 'package:sakanle/view/widgets/home/home_ad_widget.dart';
import 'package:sakanle/view/widgets/home/my_custom_button_home.dart';
import 'package:sakanle/view/widgets/home/my_custom_text_form_search.dart';
import 'package:sakanle/view/widgets/home/view_mode_widget.dart';

class AdsPage extends StatelessWidget {
  const AdsPage({super.key});

  @override
  Widget build(BuildContext context) {
    AdsPageControllerImp controller = Get.put(AdsPageControllerImp());
    return Container(
      child: ListView(
        children: [
          Row(
            children: [
              Image.asset(AppImageAssets.profileIcon),
              const SizedBox(width: 10),
              InkWell(
                onTap: () {
                  controller.navigateToAddProperty();
                },
                child: Image.asset(AppImageAssets.addIcon),
              ),
              Spacer(),
              Image.asset(AppImageAssets.sIcon),
              const SizedBox(width: 10),
              Image.asset(AppImageAssets.menuIcon),
            ],
          ),
          const SizedBox(height: 40),
          Row(
            children: [
              const SizedBox(width: 25),
              Expanded(
                child: MyCustomButtonHome(
                  onPressed: () {
                    controller.navigateToFilter();
                  },
                  imageName: AppImageAssets.filterIcon,
                  title: 'تصفية',
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: MyCustomTextFormSearch(
                  hintText: "بحث",
                  myController: controller.search,
                  validator: (value) {
                    return;
                  },
                  keyboardType: TextInputType.text,
                  suffixImageName: AppImageAssets.searchIcon,
                ),
              ),
              const SizedBox(width: 25),
            ],
          ),
          const SizedBox(height: 15),
          GetBuilder<AdsPageControllerImp>(
            builder: (controller) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ViewModeWidget(
                    imageName: AppImageAssets.rectanglesIcon,
                    opacity: controller.viewMode == "lv" ? 0.5 : 1,
                    onTap: () {
                      controller.changeViewMode("gv"); // gv = Grid View
                    },
                  ),
                  const SizedBox(width: 10),
                  ViewModeWidget(
                    imageName: AppImageAssets.rectangleIcon,
                    opacity: controller.viewMode == "gv" ? 0.5 : 1,
                    onTap: () {
                      controller.changeViewMode("lv"); // lv = List View
                    },
                  ),
                  const SizedBox(width: 25),
                ],
              );
            },
          ),
          const SizedBox(height: 27),
          GetBuilder<AdsPageControllerImp>(
            builder: (controller) {
              return controller.viewMode == "lv"
                  ? ListView(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        HomeAdWidget(
                          imageName: AppImageAssets.roomOneIcon,
                          iconName: AppImageAssets.favoriteIcon,
                          forWhat: "أ",
                          city: " حمص",
                          noMonth: "1",
                          price: "80\$",
                          caption:
                              "يرجى إدخال بريدك الإلكتروني. سنقوم بإرسال رمز التحقق إلى بريدك",
                        ),
                        const SizedBox(height: 20),
                        HomeAdWidget(
                          imageName: AppImageAssets.roomOneIcon,
                          iconName: AppImageAssets.favoriteIcon,
                          forWhat: "ش",
                          city: " حمص",
                          noMonth: "1",
                          price: "80\$",
                          caption:
                              "يرجى إدخال بريدك الإلكتروني. سنقوم بإرسال رمز التحقق إلى بريدك",
                        ),
                      ],
                    )
                  : Container(
                      child: GridView(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: 0.65,
                        ),
                        children: [
                          HomeAdGridWidget(
                            caption: "sasl;dadkak",
                            city: "حمص ",
                            forWhat: "ش",
                            iconName: AppImageAssets.favoriteIcon,
                            imageName: AppImageAssets.roomTwoIcon,
                            noMonth: "1",
                            price: "100\$",
                          ),
                          HomeAdGridWidget(
                            caption: "sasl;dadkak",
                            city: "حمص ",
                            forWhat: "ش",
                            iconName: AppImageAssets.favoriteIcon,
                            imageName: AppImageAssets.roomTwoIcon,
                            noMonth: "1",
                            price: "100\$",
                          ),
                        ],
                      ),
                    );
            },
          ),
        ],
      ),
    );
  }
}
