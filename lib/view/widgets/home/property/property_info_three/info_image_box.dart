import 'package:flutter/material.dart';

class InfoImageBox extends StatelessWidget {
  const InfoImageBox({
    super.key,
    required this.countSelectedImages,
    required this.totalSize,
    required this.onPressed,
  });
  final int countSelectedImages;
  final double totalSize;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.green, width: 2),
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey[200],
      ),
      child: Row(
        children: [
          Icon(Icons.photo_library_rounded, color: Colors.green),
          const SizedBox(width: 10),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "الصور المختارة: ${countSelectedImages} من 3",
                style: TextTheme.of(
                  context,
                ).bodySmall!.copyWith(color: Colors.green),
              ),
              Text(
                "الحجم الاجمالي: ${totalSize} ميغا",
                style: TextStyle(color: Colors.black45, fontSize: 13),
              ),
            ],
          ),
          Spacer(),
          TextButton(
            onPressed: onPressed,
            child: Text("حذف الكل", style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}

// Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Container(
//             padding: EdgeInsets.all(10),
//             decoration: BoxDecoration(
//               color: Colors.green[100],
//               borderRadius: BorderRadius.circular(10),
//             ),
//             child: Icon(
//               Icons.add_photo_alternate_outlined,
//               color: Colors.green,
//               size: 30,
//             ),
//           ),
//           SizedBox(height: 10),
//           Text(
//             "اضغط لإضافة الصور",
//             style: TextStyle(
//               color: Colors.green,
//               fontWeight: FontWeight.bold,
//               fontSize: 16,
//             ),
//           ),
//           SizedBox(height: 5),
//           Text(
//             "أضف 3 صور - 1 ميجا لكل صورة",
//             style: TextStyle(color: Colors.grey, fontSize: 12),
//           ),
//         ],
//       ),
