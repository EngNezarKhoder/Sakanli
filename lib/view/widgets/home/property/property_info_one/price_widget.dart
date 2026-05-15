import 'package:flutter/material.dart';
import 'package:sakanle/core/constant/app_color.dart';

class PriceWidget extends StatelessWidget {
  const PriceWidget({
    super.key,
    required this.onTap,
    required this.formDownToTop,
  });
  final void Function()? onTap;
  final bool formDownToTop;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
        decoration: BoxDecoration(
          color: AppColor.primaryColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            Text("السعر", style: TextTheme.of(context).bodySmall),
            const SizedBox(width: 5),
            formDownToTop
                ? Icon(Icons.keyboard_arrow_up_outlined, size: 20)
                : Icon(Icons.keyboard_arrow_down, size: 20),
          ],
        ),
      ),
    );
  }
}
