import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sakanle/controller/home/my_profile_page_controller.dart';
import 'package:sakanle/core/constant/app_color.dart';
import 'package:sakanle/core/constant/app_url.dart';
import 'package:sakanle/core/functions/show_options_image.dart';
import 'package:sakanle/core/functions/validate_input.dart';
import 'package:sakanle/view/widgets/home/property/profile/input_card.dart';

class MyProfilePage extends StatelessWidget {
  const MyProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final MyProfilePageControllerImp controller =
        Get.find<MyProfilePageControllerImp>();

    return GetBuilder<MyProfilePageControllerImp>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: AppColor.thirdColor,
          appBar: AppBar(
            backgroundColor: AppColor.thirdColor,
            elevation: 0,
            centerTitle: true,
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                color: AppColor.secondColor,
              ),
              onPressed: controller.back,
            ),
            title: Text(
              "حسابي",
              style: TextTheme.of(context).bodySmall!.copyWith(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: AppColor.secondColor,
              ),
            ),
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: controller.isLoadingPage
                  ? Center(
                      child: CupertinoActivityIndicator(
                        radius: 12,
                        color: AppColor.secondColor,
                      ),
                    )
                  : Column(
                      children: [
                        Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            Container(
                              width: 150,
                              height: 150,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColor.primaryColor.withValues(
                                  alpha: 0.15,
                                ),
                                border: Border.all(
                                  color: AppColor.primaryColor,
                                  width: 1.5,
                                ),
                              ),
                              child: _buildProfileImage(controller),
                            ),
                            InkWell(
                              onTap: () {
                                showCustomDialog(
                                  context,
                                  onTapCamera: controller.uploadImageFromCamera,
                                  onTapGallery:
                                      controller.uploadImageFromGallery,
                                );
                              },
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: AppColor.primaryColor,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Colors.white,
                                    width: 3,
                                  ),
                                ),
                                child: const Icon(
                                  Icons.camera_alt,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 35),

                        InputCard(
                          title: "الاسم الكامل",
                          icon: Icons.person_outline,
                          controller: controller.userName,
                          validator: (val) =>
                              validateInput(val ?? '', 2, 100, 'text'),
                        ),

                        const SizedBox(height: 20),

                        InputCard(
                          title: "رقم الهاتف",
                          icon: Icons.phone_outlined,
                          controller: controller.phoneNumber,
                          validator: (val) =>
                              validateInput(val ?? '', 2, 100, 'phone'),
                        ),

                        const SizedBox(height: 20),

                        GetBuilder<MyProfilePageControllerImp>(
                          id: 'loading',
                          builder: (controller) {
                            return SizedBox(
                              width: double.infinity,
                              height: 60,
                              child: ElevatedButton(
                                onPressed: controller.isLoading
                                    ? null
                                    : () => controller.saveChanges(),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColor.primaryColor,
                                  elevation: 8,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18),
                                  ),
                                ),
                                child: controller.isLoading
                                    ? const Center(
                                        child: CupertinoActivityIndicator(
                                          radius: 12,
                                          color: AppColor.secondColor,
                                        ),
                                      )
                                    : Text(
                                        "حفظ التغييرات",
                                        style: TextTheme.of(
                                          context,
                                        ).bodySmall!.copyWith(fontSize: 22),
                                      ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildProfileImage(MyProfilePageControllerImp controller) {
    final image = controller.imageFile;

    if (image != null) {
      return ClipOval(
        child: Image.file(image, width: 150, height: 150, fit: BoxFit.cover),
      );
    }

    if (controller.imageName.isNotEmpty) {
      return ClipOval(
        child: Image.network(
          "${AppUrl.photoUrl}${controller.imageName}",
          width: 150,
          height: 150,
          fit: BoxFit.cover,
          loadingBuilder: (context, child, progress) {
            if (progress == null) return child;
            return const Center(
              child: CircularProgressIndicator(strokeWidth: 2),
            );
          },
          errorBuilder: (_, __, ___) =>
              const Icon(Icons.person, size: 80, color: AppColor.primaryColor),
        ),
      );
    }

    return const Icon(Icons.person, size: 80, color: AppColor.primaryColor);
  }
}
