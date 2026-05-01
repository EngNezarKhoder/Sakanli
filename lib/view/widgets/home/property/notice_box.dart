import 'package:flutter/material.dart';

class NoticeBox extends StatelessWidget {
  const NoticeBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Color(0xFFEFF5F1),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.green.shade200),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.warning_amber_rounded, color: Colors.orange),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              "تنويه: مدة الإعلان 30 يوم ويجب على المعلن تحديث إعلانه لاحقًا بالنقر على (تحديث) أسفل الإعلان قبل انتهاء المدة لضمان استمراره.",
              style: TextStyle(fontSize: 13, color: Colors.black87),
              textDirection: TextDirection.rtl,
            ),
          ),
        ],
      ),
    );
  }
}
