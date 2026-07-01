import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:sakanle/controller/auth/verified_code_sign_up_controller.dart';
import 'package:sakanle/core/constant/app_color.dart';
import 'package:sakanle/view/widgets/auth/app_logo.dart';
import 'package:sakanle/view/widgets/auth/app_title.dart';
import 'package:sakanle/view/widgets/auth/my_custom_button_auth.dart';

class VerifiedCodeSignUp extends StatelessWidget {
  const VerifiedCodeSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    final VerifiedCodeSignUpControllerImp controller =
        Get.find<VerifiedCodeSignUpControllerImp>();
    return Scaffold(
      body: SafeArea(
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
              const AppLogo(),
              const AppTitle(
                title: "تم إرسال رمز التحقق",
                body:
                    "الرجاء إدخال رمز التحقق الذي تم إرساله إلى بريدك الإلكتروني",
              ),
              const SizedBox(height: 50),
              MaterialPinField(
                length: 5,
                onCompleted: (pin) {
                  controller.verifyCode();
                },
                pinController: controller.pinInputController,
                theme: MaterialPinTheme(
                  focusedBorderColor: AppColor.primaryColor,
                  fillColor: Color(0xFFFFF1DE),
                  borderWidth: 1.2,
                  spacing: 10,
                  cursorColor: AppColor.primaryColor,
                  shape: MaterialPinShape.outlined,
                  cellSize: Size((Get.width - 80) / 5, 64),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              const SizedBox(height: 30),
              Row(
                children: [
                  Expanded(
                    child: GetBuilder<VerifiedCodeSignUpControllerImp>(
                      id: 'loadingCode',
                      builder: (controller) {
                        return MyCustomButtonAuth(
                          onPressed: () {
                            controller.verifyCode();
                          },
                          title: "التالي",
                          isLogin: true,
                          isLoading: controller.isLoadingCode,
                        );
                      },
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: MyCustomButtonAuth(
                      onPressed: () {
                        controller.undo();
                      },
                      title: "تراجع",
                      isLogin: false,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              GetBuilder<VerifiedCodeSignUpControllerImp>(
                id: 'timer',
                builder: (controller) {
                  if (controller.isLoadingResendCode) {
                    return CupertinoActivityIndicator(
                      radius: 12,
                      color: AppColor.secondColor,
                    );
                  }
                  return Center(
                    child: InkWell(
                      onTap: controller.canResend
                          ? () {
                              controller.resendCode();
                            }
                          : null,
                      child: Text(
                        controller.canResend
                            ? "إعادة إرسال الرمز"
                            : "إعادة الإرسال خلال ${controller.seconds} ثانية",
                        style: TextStyle(
                          color: controller.canResend
                              ? AppColor.primaryColor
                              : Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
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
  }
}
