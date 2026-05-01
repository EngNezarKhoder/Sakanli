import 'package:flutter/material.dart';
import 'package:sakanle/core/constant/app_color.dart';
import 'package:sakanle/view/widgets/home/property/room_widget_button.dart';

class RoomDetailsWidget extends StatelessWidget {
  const RoomDetailsWidget({
    super.key,
    required this.title,
    required this.numberOfRooms,
    required this.onTapAdd,
    required this.onTapRemove,
  });
  final String title;
  final String numberOfRooms;
  final void Function()? onTapAdd;
  final void Function()? onTapRemove;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextTheme.of(context).bodySmall!.copyWith(fontSize: 16),
        ),
        const SizedBox(height: 10),
        Container(
          height: 50,
          decoration: BoxDecoration(
            color: AppColor.thirdColor,
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              Text(
                numberOfRooms,
                style: TextTheme.of(context).bodySmall!.copyWith(fontSize: 16),
              ),
              Spacer(),
              RoomWidgetButton(
                onTap: onTapRemove,
                color: AppColor.greyColor,
                icon: Icons.remove,
              ),
              const SizedBox(width: 10),
              RoomWidgetButton(
                onTap: onTapAdd,
                color: Colors.green,
                icon: Icons.add,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
