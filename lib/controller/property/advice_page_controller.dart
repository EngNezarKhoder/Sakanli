import 'package:get/get.dart';

abstract class AdvicePageController extends GetxController {}

class AdvicePageControllerImp extends AdvicePageController {
  late List<Map<String, String>> advicesImage;
  late List<Map<String, String>> advicesDescription;
  late List<Map<String, String>> advicesPrice;
  late List<Map<String, String>> advicesLocation;
  late List<Map<String, String>> advicesInfoCall;
  late List<Map<String, String>> advicesImportant;
  @override
  void onInit() {
    advicesImage = [
      {
        "title": "جودة عالية: ",
        "content": "استخدام كاميرا جيّدة أو هاتف ذكي بدقة عالية",
      },
      {
        "title": "إضاءة طبيعية: ",
        "content": "التقط الصور في النهار مع إضاءة طبيعية جيّدة",
      },
      {"title": "زوايا متنوعة: ", "content": "أضف صور من زوايا مختلفة للعقار"},
      {"title": "صور خارجية: ", "content": "أظهر الواجهة و المحيط الخارجي"},
      {"title": "تجنب الفوضى: ", "content": "تأكد من نظافة و ترتيب المكان"},
    ];
    advicesDescription = [
      {"title": "وصف دقيق: ", "content": "اكتب وصفاً مفصلًا و صادقاً للعقار"},
      {
        "title": "المميزات الخاصة: ",
        "content": "اذكر المميزات التي تجعل العقار مختلف",
      },
      {
        "title": "المرافق القريبة: ",
        "content": "أضف معلومات عن المدارس و المستشفيات و الأسواق",
      },
      {
        "title": "حالة العقار: ",
        "content": "وضح إذا كان جديد أو يحتاج إلى صيانة",
      },
      {"title": "سبب البيع/الإيجار: ", "content": "اذكر السبب إذا كان مناسبا"},
    ];
    advicesPrice = [
      {
        "title": "سعر واقعي: ",
        "content": "ابحث عن أسعار العقارات المشابهة في المنطقة",
      },
      {"title": "مرونة في التفاوض: ", "content": "كن مستعدا للتفاوض المعقول"},
      {
        "title": "شفافية في التكاليف: ",
        "content": "وضح اذا كان هناك رسوم إضافية",
      },
      {"title": "طرق الدفع: ", "content": "حدد طرق الدفع المقبولة"},
    ];
    advicesLocation = [
      {"title": "موقع دقيق: ", "content": "حدد الموقع بدقة على الخريطة"},
      {"title": "معالم مهمة: ", "content": "اذكر المعالم المهمة القريبة"},
      {"title": "وسائل المواصلات: ", "content": "معلومات عن توافر المواصلات"},
      {"title": "إمكانية الوصول: ", "content": "سهولة الوصول للعقار"},
    ];
    advicesInfoCall = [
      {"title": "رقم هاتف فعال: ", "content": "تأكد من صّحة رقم الهاتف"},
      {"title": "أوقات التواصل: ", "content": "حدد الأوقات المناسبة للاتصال"},
      {"title": "وسائل المواصلات: ", "content": "معلومات عن توافر المواصلات"},
      {
        "title": "الرد السريع: ",
        "content": "حاول الرد على الاستفسارات بأسرع وقت",
      },
      {"title": "احترافية: ", "content": "كن مهذبا و محترفاً في التعامل"},
    ];
    advicesImportant = [
      {"title": "صدق و مصداقية: ", "content": "كن صادق في جميع المعلومات"},
      {"title": "تحديث دوري: ", "content": "حدث الإعلان إذا تغيّر أي شيء"},
      {"title": "أوراق نظامية: ", "content": "تأكد من سلامة الأوراق و الوثائق"},
      {
        "title": "أمان اللقاءات: ",
        "content": "اختر أماكن آمنة لمقابلة المهتمين",
      },
      {
        "title": "حذر من الاحتيال: ",
        "content": "احذر من طلبات الدفع المسبق المشبوهة",
      },
    ];
    super.onInit();
  }
}
