import 'package:flutter/material.dart';
import 'package:sakanle/core/constant/app_color.dart';
import 'package:sakanle/view/widgets/home/property/property_info_one/rich_text_widget.dart';

class MyCustomDropDown extends StatelessWidget {
  const MyCustomDropDown({
    super.key,
    required this.title,
    required this.items,
    required this.value,
    required this.onChanged,
    required this.hintText,
    required this.focusNode,
    required this.isFocused,
  });

  final String title;
  final List<DropdownMenuItem<String>>? items;
  final String? value;
  final void Function(String?)? onChanged;
  final String hintText;

  final FocusNode focusNode;
  final bool isFocused;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichTextWidget(title: title),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: AppColor.thirdColor,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.black, width: isFocused ? 1.5 : 1),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              focusNode: focusNode,
              value: value,
              isExpanded: true,
              icon: const Icon(Icons.keyboard_arrow_down),
              items: items,
              onChanged: onChanged,
              hint: Text(
                hintText,
                style: TextTheme.of(context).bodySmall!.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
