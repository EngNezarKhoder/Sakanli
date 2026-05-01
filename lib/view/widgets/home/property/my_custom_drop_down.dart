import 'package:flutter/material.dart';
import 'package:sakanle/core/constant/app_color.dart';
import 'package:sakanle/view/widgets/home/property/rich_text_widget.dart';

class MyCustomDropDown extends StatelessWidget {
  const MyCustomDropDown({
    super.key,
    required this.title,
    required this.items,
    required this.value,
    required this.onChanged,
    required this.hintText,
  });

  final String title;
  final List<DropdownMenuItem<String>>? items;
  final String value;
  final void Function(String?)? onChanged;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichTextWidget(title: hintText),
        SizedBox(height: 8),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: AppColor.thirdColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: value,
              style: TextTheme.of(context).bodySmall!.copyWith(fontSize: 16),
              isExpanded: true,
              icon: Icon(Icons.keyboard_arrow_down),
              items: items,
              onChanged: onChanged,
            ),
          ),
        ),
      ],
    );
  }
}
