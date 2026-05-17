import 'package:flutter/material.dart';
import 'package:sakanle/core/constant/app_color.dart';

class PrivacyPage extends StatelessWidget {
  const PrivacyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColor.whiteColor,
        elevation: 4,
        shadowColor: Colors.black.withValues(alpha: 0.08),
        surfaceTintColor: AppColor.whiteColor,
        centerTitle: true,
        title: Text(
          "سياسة الخصوصية",
          style: TextTheme.of(context).bodySmall!.copyWith(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: AppColor.secondColor,
            letterSpacing: 0.5,
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
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 22,
                ),

                decoration: BoxDecoration(
                  color: AppColor.thirdColor,
                  borderRadius: BorderRadius.circular(10),

                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.05),
                      blurRadius: 12,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),

                child: Directionality(
                  textDirection: TextDirection.rtl,

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      buildTitle("1- مقدمة"),

                      buildText(
                        "مرحبًا بك في تطبيق سكنلي، نحن ملتزمون بحماية خصوصيتك وضمان أمان بياناتك الشخصية. توضح هذه السياسة كيفية جمع واستخدام وحماية المعلومات الخاصة بك عند استخدام التطبيق.",
                      ),

                      buildTitle("2- الفئات المستهدفة"),

                      buildText(
                        "يستهدف التطبيق الأفراد الباحثين عن شراء أو استئجار العقارات، ومالكي العقارات الراغبين بعرض ممتلكاتهم، بالإضافة إلى الوكلاء العقاريين والمطورين العقاريين.",
                      ),

                      buildTitle("3- سياسة استخدام القاصرين"),

                      buildText(
                        "يحظر استخدام التطبيق لمن هم دون 18 عامًا دون إشراف ولي أمر. ويحتفظ التطبيق بحق حذف أي حساب يخالف ذلك.",
                      ),

                      buildTitle("4- جمع المعلومات واستخدامها"),

                      buildText(
                        "قد نقوم بجمع بعض المعلومات مثل الاسم، رقم الهاتف، البريد الإلكتروني، الموقع الجغرافي، صور العقارات، وبيانات الحساب بهدف تحسين تجربة المستخدم وسائل عمليات البحث والتواصل.",
                      ),

                      buildTitle("5- حماية البيانات"),

                      buildText(
                        "نحن لا نقوم ببيع أو مشاركة بيانات المستخدمين مع أي طرف ثالث دون موافقة مسبقة، ويتم حفظ البيانات ضمن أنظمة آمنة ومشفرة.",
                      ),

                      buildTitle("6- سجل النشاطات"),

                      buildText(
                        "قد نقوم بالاحتفاظ بسجل للنشاطات داخل التطبيق مثل الإعلانات المنشورة أو التعديلات على الحسابات بهدف تحسين الأمان وحماية حقوق المستخدمين.",
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),

              Container(
                width: double.infinity,

                padding: const EdgeInsets.symmetric(vertical: 18),

                decoration: BoxDecoration(
                  color: AppColor.thirdColor,
                  borderRadius: BorderRadius.circular(20),

                  border: Border.all(
                    color: AppColor.primaryColor.withValues(alpha: 0.25),
                  ),
                ),

                child: const Center(
                  child: Text(
                    "آخر تحديث: 02/09/2025",

                    style: TextStyle(
                      color: AppColor.primaryColor,
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 25),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 12, bottom: 8),

      child: Text(
        title,

        style: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: AppColor.secondColor,
        ),
      ),
    );
  }

  Widget buildText(String text) {
    return Text(
      text,
      textAlign: TextAlign.right,

      style: const TextStyle(
        fontSize: 18,
        height: 1.9,
        color: AppColor.secondColor,
      ),
    );
  }
}
