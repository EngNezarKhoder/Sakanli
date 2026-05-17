import 'package:flutter/material.dart';
import 'package:sakanle/core/constant/app_color.dart';

class ConditionsPage extends StatelessWidget {
  const ConditionsPage({super.key});

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
          "الشروط والأحكام",
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
                  horizontal: 20,
                  vertical: 28,
                ),

                decoration: BoxDecoration(
                  color: AppColor.thirdColor,
                  borderRadius: BorderRadius.circular(16),

                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.05),
                      blurRadius: 14,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),

                child: Directionality(
                  textDirection: TextDirection.rtl,

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      Text(
                        "الشروط والأحكام",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: AppColor.secondColor,
                        ),
                      ),

                      const SizedBox(height: 12),

                      Text(
                        "شروط وأحكام استخدام التطبيق",
                        style: TextStyle(
                          fontSize: 18,
                          color: AppColor.secondColor.withValues(alpha: 0.7),
                          height: 1.6,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 18),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 24,
                ),

                decoration: BoxDecoration(
                  color: AppColor.thirdColor,
                  borderRadius: BorderRadius.circular(16),

                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.04),
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
                      buildMainText(
                        "يجب ألا تحتوي المحتويات التي تقدمها على أي مواد غير قانونية أو غير مناسبة. بالإضافة إلى ذلك، يجب عليك الالتزام بمعايير مجتمعنا. يجب ألا تتضمن التطبيقات أيًا مما يلي:",
                      ),

                      buildSectionTitle(
                        "1. انتهاكات الحقوق التجارية أو الشخصية:",
                      ),

                      buildSectionText(
                        "محتوى ينتهك حقوق الطرف الثالث التجارية، بما في ذلك حقوق النشر، والعلامات التجارية، والخصوصية، أو أي حقوق شخصية أو ملكية أخرى.",
                      ),

                      buildSectionTitle("2. أنواع المحتوى المحظورة:"),

                      buildSectionText(
                        "محتوى للبالغين، محتوى يزعم أو يشير إلى صفات شخصية، مثل الإشارات المباشرة أو غير المباشرة إلى جنس أو عرق أو دين الشخص.",
                      ),

                      buildSectionText(
                        "محتوى مضلل أو زائف أو خادع، بما في ذلك المطالبات أو التمثيلات أو الممارسات التجارية الخادعة.",
                      ),

                      buildSectionText(
                        "محتوى يستغل القضايا السياسية أو الاجتماعية.",
                      ),

                      buildSectionTitle("3. انتهاكات تجربة المستخدم:"),

                      buildSectionText(
                        "عناصر المحتوى التي تعيد توجيه المستخدمين عمدًا إلى صفحات خارجية، مما يتسبب في تجارب غير متوقعة أو غير مرغوب فيها.",
                      ),

                      buildSectionTitle("4. الانتهاكات القانونية:"),

                      buildSectionText(
                        "محتوى ينتهك المتطلبات القانونية المعمول بها في الجمهورية العربية السورية أو تعليقات مسيئة تتعلق بالرموز الوطنية السورية، بما في ذلك العلم الوطني، والجيش، والرئيس.",
                      ),

                      buildSectionText(
                        "محتوى يتعلق بالأحزاب أو المجموعات السياسية المحظورة بموجب القانون السوري.",
                      ),

                      buildSectionTitle("5. المحتوى الضار أو المثير للفتنة:"),

                      buildSectionText(
                        "إشارات أو تعليقات مسيئة تتعلق بأي مجموعة دينية أو ثقافية أو عرقية.",
                      ),

                      buildSectionText(
                        "التحريض على الكراهية ضد أي فرد أو مجموعة.",
                      ),

                      buildSectionText(
                        "التحريض المباشر أو غير المباشر على الإرهاب.",
                      ),

                      buildSectionText(
                        "اقتباسات غير دقيقة أو مضللة من النصوص الدينية.",
                      ),

                      buildSectionText(
                        "يتحمل المستخدم كامل المسؤولية عن دقة المعلومات المعروضة في الإعلانات، وتحتفظ إدارة التطبيق بحق إزالة أي محتوى أو حساب يخالف هذه الشروط دون إشعار مسبق.",
                      ),

                      buildSectionTitle("6. حماية التطبيق:"),

                      buildSectionText(
                        "لا يُسمح لك بنسخ أو تعديل أو تغيير التطبيق أو أي جزء منه أو علامتنا التجارية بأي شكل من الأشكال.",
                      ),

                      buildSectionText(
                        "يُحظر عليك محاولة استخراج الشيفرة المصدرية للتطبيق أو ترجمتها إلى لغات أخرى أو إنشاء نسخ مشتقة منه.",
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),

              /// آخر تحديث
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

  Widget buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 18, bottom: 10),

      child: Text(
        title,
        style: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: AppColor.secondColor,
          height: 1.5,
        ),
      ),
    );
  }

  Widget buildSectionText(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),

      child: Text(
        text,
        textAlign: TextAlign.right,

        style: const TextStyle(
          fontSize: 18,
          height: 1.9,
          color: AppColor.secondColor,
        ),
      ),
    );
  }

  Widget buildMainText(String text) {
    return Text(
      text,
      textAlign: TextAlign.right,

      style: TextStyle(
        fontSize: 20,
        height: 1.9,
        color: AppColor.secondColor.withValues(alpha: 0.85),
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
