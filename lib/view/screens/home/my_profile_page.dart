import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sakanle/controller/home/my_profile_page_controller.dart';
import 'package:sakanle/core/constant/app_color.dart';
import 'package:sakanle/core/functions/show_options_image.dart';
import 'package:sakanle/core/functions/validate_input.dart';
import 'package:sakanle/view/widgets/home/property/profile/input_card.dart';

class MyProfilePage extends StatelessWidget {
  const MyProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final MyProfilePageControllerImp controller =
        Get.find<MyProfilePageControllerImp>();
    return Scaffold(
      backgroundColor: AppColor.thirdColor,
      appBar: AppBar(
        backgroundColor: AppColor.thirdColor,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: AppColor.secondColor),
          onPressed: () {
            controller.back();
          },
        ),
        title: Text(
          "حسابي",
          style: TextTheme.of(context).bodySmall!.copyWith(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: AppColor.secondColor,
            letterSpacing: 0.5,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColor.primaryColor.withValues(alpha: 0.15),
                      border: Border.all(
                        color: AppColor.primaryColor,
                        width: 1.5,
                      ),
                    ),
                    child: GetBuilder<MyProfilePageControllerImp>(
                      builder: (controller) {
                        return controller.imageFile == null
                            ? const Icon(
                                Icons.person,
                                size: 80,
                                color: AppColor.primaryColor,
                              )
                            : ClipOval(
                                child: Image.file(
                                  controller.imageFile!,
                                  width: 150,
                                  height: 150,
                                  fit: BoxFit.cover,
                                ),
                              );
                      },
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      showCustomDialog(
                        context,
                        onTapCamera: controller.uploadImageFromCamera,
                        onTapGallery: controller.uploadImageFromGallery,
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: AppColor.primaryColor,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 3),
                      ),
                      child: const Icon(Icons.camera_alt, color: Colors.white),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 35),
              InputCard(
                title: "الاسم الكامل",
                icon: Icons.person_outline,
                controller: controller.userName,
                validator: (val) {
                  return validateInput(val ?? '', 2, 100, 'text');
                },
              ),
              const SizedBox(height: 20),
              InputCard(
                title: "رقم الهاتف",
                icon: Icons.phone_outlined,
                controller: controller.phoneNumber,
                validator: (val) {
                  return validateInput(val ?? '', 2, 100, 'phone');
                },
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 60,
                child: ElevatedButton(
                  onPressed: () {
                    controller.saveChanges();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.primaryColor,
                    elevation: 8,
                    shadowColor: AppColor.primaryColor.withValues(alpha: 0.4),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                  child: Text(
                    "حفظ التغييرات",
                    style: TextTheme.of(
                      context,
                    ).bodySmall!.copyWith(fontSize: 22),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
