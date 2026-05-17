import 'package:flutter/material.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/state_manager.dart';
import 'package:sakanle/controller/property/faq_page_controller.dart';
import 'package:sakanle/core/constant/app_color.dart';

class FaqPage extends StatelessWidget {
  const FaqPage({super.key});
  @override
  Widget build(BuildContext context) {
    final FaqPageControllerImp controller = Get.find<FaqPageControllerImp>();
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,

      appBar: AppBar(
        backgroundColor: AppColor.whiteColor,
        elevation: 4,
        shadowColor: Colors.black.withValues(alpha: 0.08),
        surfaceTintColor: AppColor.whiteColor,
        centerTitle: true,

        title: Text(
          "الأسئلة الأكثر شيوعاً",
          style: TextTheme.of(context).bodySmall!.copyWith(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColor.secondColor,
          ),
        ),

        iconTheme: const IconThemeData(color: AppColor.secondColor, size: 32),
      ),

      body: Container(
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            center: Alignment.topLeft,
            radius: 1.5,
            colors: [
              Color(0xFFFFC56B),
              Color(0xFFFFE2BD),
              Color.fromARGB(255, 253, 239, 221),
            ],
          ),
        ),

        child: SingleChildScrollView(
          padding: const EdgeInsets.all(14),

          child: Directionality(
            textDirection: TextDirection.rtl,

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                const SizedBox(height: 8),

                Text(
                  "الأسئلة الأكثر شيوعاً",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: AppColor.secondColor,
                  ),
                ),

                const SizedBox(height: 14),

                ListView.builder(
                  itemCount: controller.faqList.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),

                  itemBuilder: (context, index) {
                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 250),
                      margin: const EdgeInsets.only(bottom: 16),

                      decoration: BoxDecoration(
                        color: AppColor.thirdColor,
                        borderRadius: BorderRadius.circular(12),

                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.05),
                            blurRadius: 10,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),

                      child: Theme(
                        data: Theme.of(
                          context,
                        ).copyWith(dividerColor: Colors.transparent),

                        child: ExpansionTile(
                          initiallyExpanded: index == 0,

                          onExpansionChanged: (value) {},

                          tilePadding: const EdgeInsets.symmetric(
                            horizontal: 18,
                            vertical: 10,
                          ),

                          childrenPadding: const EdgeInsets.only(
                            right: 20,
                            left: 20,
                            bottom: 22,
                          ),

                          iconColor: Colors.deepPurple,
                          collapsedIconColor: AppColor.secondColor,

                          title: Text(
                            controller.faqList[index]["question"]!,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: AppColor.secondColor,
                              height: 1.5,
                            ),
                          ),

                          children: [
                            Text(
                              controller.faqList[index]["answer"]!,
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                fontSize: 17,
                                color: AppColor.secondColor.withValues(
                                  alpha: 0.8,
                                ),
                                height: 1.9,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),

                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
