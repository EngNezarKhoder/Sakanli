import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sakanle/controller/auth/reset_password_controller.dart';
import 'package:sakanle/core/constant/image_assets.dart';
import 'package:sakanle/core/functions/validate_input.dart';
import 'package:sakanle/view/widgets/auth/app_logo.dart';
import 'package:sakanle/view/widgets/auth/app_title.dart';
import 'package:sakanle/view/widgets/auth/my_custom_button_auth.dart';
import 'package:sakanle/view/widgets/auth/my_text_form_auth.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final ResetPasswordControllerImp controller =
        Get.find<ResetPasswordControllerImp>();
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: controller.formState,
          child: Container(
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
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                const AppLogo(),
                const AppTitle(
                  title: "كلمة مرور جديدة",
                  body: "الرجاء إدخال كلمة المرور الجديدة",
                ),
                const SizedBox(height: 30),
                GetBuilder<ResetPasswordControllerImp>(
                  builder: (controller) {
                    return MyCustomTextFormAuth(
                      hintText: "كلمة المرور",
                      myController: controller.password,
                      validator: (val) {
                        return validateInput(val!, 8, 100, "password");
                      },
                      keyboardType: TextInputType.visiblePassword,
                      prefixImageName: AppImageAssets.passwordIcon,
                      suffixImageName: controller.obscureTextOne
                          ? AppImageAssets.noEyeIcon
                          : AppImageAssets.eyeIcon,
                      obscure: controller.obscureTextOne,
                      onPressed: () {
                        controller.changeObscureTextOne();
                      },
                    );
                  },
                ),
                const SizedBox(height: 14),
                GetBuilder<ResetPasswordControllerImp>(
                  builder: (controller) {
                    return MyCustomTextFormAuth(
                      hintText: "تأكيد كلمة المرور",
                      myController: controller.rePassword,
                      validator: (val) {
                        return validateInput(val!, 8, 100, "password");
                      },
                      obscure: controller.obscureTextTwo,
                      keyboardType: TextInputType.visiblePassword,
                      prefixImageName: AppImageAssets.passwordIcon,
                      suffixImageName: controller.obscureTextTwo
                          ? AppImageAssets.noEyeIcon
                          : AppImageAssets.eyeIcon,
                      onPressed: () {
                        controller.changeObscureTextTwo();
                      },
                    );
                  },
                ),
                const SizedBox(height: 20),
                GetBuilder<ResetPasswordControllerImp>(
                  id: 'loading',
                  builder: (controller) {
                    return MyCustomButtonAuth(
                      onPressed: () {
                        controller.resetPassword();
                      },
                      title: "إعادة تعيين",
                      isLogin: true,
                      isLoading: controller.isLoading,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
