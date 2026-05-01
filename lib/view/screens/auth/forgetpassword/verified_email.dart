import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:sakanle/controller/auth/verified_email_controller.dart';
import 'package:sakanle/core/constant/image_assets.dart';
import 'package:sakanle/core/functions/validate_input.dart';
import 'package:sakanle/view/widgets/auth/app_logo.dart';
import 'package:sakanle/view/widgets/auth/app_title.dart';
import 'package:sakanle/view/widgets/auth/my_custom_button_auth.dart';
import 'package:sakanle/view/widgets/auth/my_text_form_auth.dart';
import 'package:sakanle/view/widgets/auth/navigate_to_sign_up_or_login.dart';

class VerifiedEmail extends StatelessWidget {
  const VerifiedEmail({super.key});

  @override
  Widget build(BuildContext context) {
    VerifiedEmailControllerImp controller = Get.put(
      VerifiedEmailControllerImp(),
    );
    return Scaffold(
      body: Form(
        key: controller.formState,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: ListView(
            children: [
              AppLogo(),
              AppTitle(
                title: "استعادة كلمة المرور",
                body:
                    "يرجى إدخال بريدك الإلكتروني. سنقوم بإرسال رمز التحقق إلى بريدك",
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
              const SizedBox(height: 30),
              Row(
                children: [
                  Expanded(
                    child: MyCustomButtonAuth(
                      onPressed: () {
                        controller.navigateToVerifiedCode();
                      },
                      title: "التالي",
                      isLogin: true,
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
              NavigateToSignUpOrLogin(
                titleText: "ليس لديك حساب ؟",
                titleButton: "إنشاء حساب",
                onPressed: () {
                  controller.navigateToSignUp();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
