import 'package:get/get.dart';

String? validateInput(String val, int min, int max, String type) {
  if (type == "email") {
    if (!GetUtils.isEmail(val)) {
      return "الرجاء إدخال بريد إلكتروني صالح";
    }
  }
  // if (type == "username") {
  //   if (!GetUtils.isUsername(val)) {
  //     return "الرجاء إدخال اسم مستخدم صالح";
  //   }
  // }
  if (type == "phone") {
    if (!GetUtils.isPhoneNumber(val)) {
      return "الرجاء إدخال رقم هاتف صالح";
    }
  }
  if (val.length < min) {
    return "الرجاء إدخال " +
        min.toString() +
        ' '.toString() +
        "حروف " +
        "أو أكثر ";
  }
  if (val.length > max) {
    return "الرجاء إدخال " +
        max.toString() +
        ' '.toString() +
        "حروف " +
        "أو أقل ";
  }
  if (val.isEmpty) {
    return "لا يمكن أن يكون هذا الحقل فارغا";
  }
  return null;
}
