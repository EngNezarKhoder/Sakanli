import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sakanle/controller/auth/login_controller.dart';
import 'package:sakanle/core/constant/image_assets.dart';
import 'package:sakanle/core/functions/alert_exit_app.dart';
import 'package:sakanle/core/functions/validate_input.dart';
import 'package:sakanle/view/widgets/auth/app_logo.dart';
import 'package:sakanle/view/widgets/auth/app_title.dart';
import 'package:sakanle/view/widgets/auth/my_custom_button_auth.dart';
import 'package:sakanle/view/widgets/auth/accept_privacy_widget.dart';
import 'package:sakanle/view/widgets/auth/my_text_form_auth.dart';
import 'package:sakanle/view/widgets/auth/navigate_to_sign_up_or_login.dart';
import 'package:sakanle/view/widgets/auth/remember_me_and_forget_password_widget.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginControllerImp controller = Get.find<LoginControllerImp>();
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
                    body: "قم بتسجيل الدخول للوصول إلى حسابك",
                    title: "تسجيل دخول",
                  ),
                  const SizedBox(height: 30),
                  MyCustomTextFormAuth(
                    hintText: "البريد الإلكتروني",
                    myController: controller.email,
                    validator: (val) {
                      return validateInput(val!, 5, 100, "email");
                    },
                    keyboardType: TextInputType.emailAddress,
                    prefixImageName: AppImageAssets.emailIcon,
                  ),
                  const SizedBox(height: 15),
                  GetBuilder<LoginControllerImp>(
                    builder: (controller) {
                      return MyCustomTextFormAuth(
                        hintText: "كلمة المرور",
                        myController: controller.password,
                        validator: (val) {
                          return validateInput(val!, 5, 100, "password");
                        },
                        obscure: controller.obscureText,
                        onPressed: () {
                          controller.changeObscureText();
                        },
                        keyboardType: TextInputType.visiblePassword,
                        prefixImageName: AppImageAssets.passwordIcon,
                        suffixImageName: controller.obscureText
                            ? AppImageAssets.noEyeIcon
                            : AppImageAssets.eyeIcon,
                      );
                    },
                  ),
                  const SizedBox(height: 15),
                  GetBuilder<LoginControllerImp>(
                    builder: (controller) {
                      return RememberMeAndForgetPasswordWidget(
                        checkBoxValue: controller.checkBoxRemember,
                        onChanged: (val) {
                          controller.onChangedRemember(val!);
                        },
                        onTap: () {
                          controller.navigateToVerifiedEmail();
                        },
                      );
                    },
                  ),
                  const SizedBox(height: 10),
                  GetBuilder<LoginControllerImp>(
                    builder: (controller) {
                      return AcceptPrivacyWidget(
                        checkBoxValue: controller.checkBoxPrivacy,
                        onChanged: (val) {
                          controller.onChangedPrivacy(val!);
                        },
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  MyCustomButtonAuth(
                    onPressed: () {
                      controller.login();
                    },
                    title: "تسجيل الدّخول",
                    isLogin: true,
                  ),
                  const SizedBox(height: 15),
                  NavigateToSignUpOrLogin(
                    titleButton: "إنشاء حساب",
                    titleText: "ليس لديك حساب ؟",
                    onPressed: () {
                      controller.navigateToSignUp();
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
