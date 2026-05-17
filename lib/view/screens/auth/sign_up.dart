import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sakanle/controller/auth/sign_up_controller.dart';
import 'package:sakanle/core/constant/image_assets.dart';
import 'package:sakanle/core/functions/alert_exit_app.dart';
import 'package:sakanle/core/functions/validate_input.dart';
import 'package:sakanle/view/widgets/auth/accept_privacy_widget.dart';
import 'package:sakanle/view/widgets/auth/app_title.dart';
import 'package:sakanle/view/widgets/auth/my_custom_button_auth.dart';
import 'package:sakanle/view/widgets/auth/my_text_form_auth.dart';
import 'package:sakanle/view/widgets/auth/navigate_to_sign_up_or_login.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    final SignUpControllerImp controller = Get.find<SignUpControllerImp>();
    return Scaffold(
      body: PopScope(
        canPop: false,
        onPopInvokedWithResult: (didPop, result) {
          alert(
            title: 'مغادرة التطبيق',
            content: 'هل أنت متأكد من رغبتك بمغادرة التطبيق ؟',
            cancelButtonTitle: 'الغاء',
            okButtonTitle: 'مغادرة التطبيق',
            onPressedOk: () {
              exit(0);
            },
            onPressedCancel: () {
              Get.back();
            },
          );
        },
        child: SafeArea(
          child: Form(
            key: controller.formState,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  Image.asset(
                    AppImageAssets.logoImage,
                    width: 100,
                    height: 100,
                  ),
                  const SizedBox(height: 30),
                  const AppTitle(
                    title: "إنشاء حساب",
                    body: "يرجى إتمام الحقول التالية",
                  ),
                  const SizedBox(height: 30),
                  MyCustomTextFormAuth(
                    hintText: "اسم المستخدم",
                    myController: controller.userName,
                    validator: (val) {
                      return validateInput(val!, 5, 100, "username");
                    },
                    keyboardType: TextInputType.text,
                    prefixImageName: AppImageAssets.emailIcon,
                  ),
                  const SizedBox(height: 14),
                  MyCustomTextFormAuth(
                    hintText: "البريد الإلكتروني",
                    myController: controller.email,
                    validator: (val) {
                      return validateInput(val!, 5, 100, "email");
                    },
                    keyboardType: TextInputType.emailAddress,
                    prefixImageName: AppImageAssets.emailIcon,
                  ),
                  const SizedBox(height: 10),
                  MyCustomTextFormAuth(
                    hintText: "رقم الهاتف",
                    myController: controller.phone,
                    validator: (val) {
                      return validateInput(val!, 5, 100, "phone");
                    },
                    keyboardType: TextInputType.phone,
                    prefixImageName: AppImageAssets.phoneIcon,
                  ),
                  const SizedBox(height: 14),
                  GetBuilder<SignUpControllerImp>(
                    builder: (controller) {
                      return MyCustomTextFormAuth(
                        hintText: "كلمة المرور",
                        myController: controller.password,
                        validator: (val) {
                          return validateInput(val!, 5, 100, "password");
                        },
                        keyboardType: TextInputType.visiblePassword,
                        prefixImageName: AppImageAssets.passwordIcon,
                        suffixImageName: controller.obscureText
                            ? AppImageAssets.noEyeIcon
                            : AppImageAssets.eyeIcon,
                        obscure: controller.obscureText,
                        onPressed: () {
                          controller.changeObscureText();
                        },
                      );
                    },
                  ),
                  const SizedBox(height: 14),
                  GetBuilder<SignUpControllerImp>(
                    builder: (controller) {
                      return AcceptPrivacyWidget(
                        checkBoxValue: controller.checkBoxValue,
                        onChanged: (val) {
                          controller.changeCheckBoxPrivacy(val!);
                        },
                      );
                    },
                  ),
                  const SizedBox(height: 15),
                  MyCustomButtonAuth(
                    onPressed: () {
                      controller.signUp();
                    },
                    title: "إنشاء حساب",
                    isLogin: true,
                  ),
                  const SizedBox(height: 20),
                  NavigateToSignUpOrLogin(
                    titleButton: "تسجيل دخول",
                    titleText: "لديك حساب ؟",
                    onPressed: () {
                      controller.navigateToSignIn();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
