import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sakanle/controller/property/property_info_one_controller.dart';
import 'package:sakanle/core/constant/app_color.dart';
import 'package:sakanle/core/functions/validate_input.dart';
import 'package:sakanle/view/widgets/home/property/property_info_one/my_custom_drop_down.dart';
import 'package:sakanle/view/widgets/home/property/property_info_one/my_date_filed_widget.dart';
import 'package:sakanle/view/widgets/home/property/property_info_one/my_details_text_filed.dart';
import 'package:sakanle/view/widgets/home/property/property_info_one/my_text_form_property.dart';
import 'package:sakanle/view/widgets/home/property/property_info_one/radio_list_tile_widget.dart';
import 'package:sakanle/view/widgets/home/property/property_info_one/rich_text_widget.dart';
import 'package:sakanle/view/widgets/home/property/property_info_one/room_details_widget.dart';

class PropertyInfoOne extends StatelessWidget {
  const PropertyInfoOne({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<PropertyInfoOneControllerImp>();

    return Form(
      key: controller.formState,
      child: GetBuilder<PropertyInfoOneControllerImp>(
        builder: (controller) {
          return ListView(
            children: [
              RichTextWidget(title: 'الخدمات المطلوبة'),

              /// SERVICES (FAST)
              Column(
                children: List.generate(controller.serviceInfo.length, (index) {
                  return Row(
                    children: [
                      Checkbox(
                        value: controller.serviceInfo[index]['status'],
                        activeColor: AppColor.primaryColor,
                        onChanged: (val) {
                          controller.changeStatusOfService(val!, index);
                        },
                      ),
                      Text(
                        controller.serviceInfo[index]['title'],
                        style: TextTheme.of(context).bodySmall,
                      ),
                    ],
                  );
                }),
              ),
              const SizedBox(height: 20),

              /// PRICES (FAST)
              if (controller.serviceInfo.any(
                (element) => element['status'] == true,
              ))
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "أسعار الخدمات المحددة",
                      style: TextTheme.of(
                        context,
                      ).bodySmall!.copyWith(fontSize: 20),
                    ),
                    Column(
                      children: List.generate(controller.serviceInfo.length, (
                        index,
                      ) {
                        if (!controller.serviceInfo[index]['status']) {
                          return const SizedBox();
                        }
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichTextWidget(
                              title:
                                  controller.serviceInfo[index]['titleService'],
                            ),
                            const SizedBox(height: 10),
                            MyTextFormProperty(
                              keyboardType: TextInputType.number,
                              validator: (val) =>
                                  validateInput(val ?? '', 2, 10, 'text'),
                              myController:
                                  controller.serviceInfo[index]['price'],
                              hintText: "أدخل السعر",
                            ),
                            const SizedBox(height: 10),
                          ],
                        );
                      }),
                    ),
                  ],
                ),
              const SizedBox(height: 20),

              /// DROPDOWN (same but light)
              Focus(
                onFocusChange: (val) {
                  controller.changeFocusPropertyType(val);
                },
                child: MyCustomDropDown(
                  focusNode: controller.propertyTypeFocusNode,
                  isFocused: controller.isFocusPropertyType,
                  hintText: 'نوع العقار',
                  title: "نوع العقار",
                  value: controller.selectedProperty,
                  items: controller.propertyTypes
                      .map(
                        (item) => DropdownMenuItem(
                          value: item,
                          child: Text(
                            item,
                            style: TextTheme.of(context).bodySmall!.copyWith(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                  onChanged: (val) {
                    controller.onChangePropertyType(val!);
                  },
                ),
              ),
              const SizedBox(height: 20),

              /// RADIO
              RadioGroup(
                groupValue: controller.advertiserType,
                onChanged: (val) {
                  controller.changeAdvertiserType(val!);
                },
                child: Row(
                  children: const [
                    RadioListTileWidget(title: 'مالك العقار', value: 'owner'),
                    RadioListTileWidget(title: 'وسيط', value: 'med'),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              /// AREA
              RichTextWidget(title: 'مساحة العقار'),
              SizedBox(height: 8),
              MyTextFormProperty(
                keyboardType: TextInputType.number,
                validator: (val) => validateInput(val ?? '', 2, 10, 'number'),
                myController: controller.propertyArea,
                hintText: 'المساحة بالمتر المربع *',
              ),
              const SizedBox(height: 20),

              /// FRONT
              Focus(
                onFocusChange: (val) {
                  controller.changeFocusFront(val);
                },
                child: MyCustomDropDown(
                  focusNode: controller.frontFocusNode,
                  isFocused: controller.isFocusFront,
                  hintText: 'اختر الواجهة',
                  title: 'الواجهة ',
                  value: controller.front,
                  items: controller.fronts
                      .map(
                        (item) => DropdownMenuItem(
                          value: item,
                          child: Text(
                            item,
                            style: TextTheme.of(context).bodySmall!.copyWith(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                  onChanged: (val) {
                    controller.onChangePropertyFront(val!);
                  },
                ),
              ),
              const SizedBox(height: 20),

              /// OWNER SHIP
              Focus(
                onFocusChange: (val) {
                  controller.changeFocusOwnerShip(val);
                },
                child: MyCustomDropDown(
                  focusNode: controller.ownerShipFocusNode,
                  isFocused: controller.isFocusPropertyOwnerShip,
                  hintText: 'اختر نوع الملكية',
                  title: 'الملكية ',
                  value: controller.ownerShip,
                  items: controller.ownerShips
                      .map(
                        (item) => DropdownMenuItem(
                          value: item,
                          child: Text(
                            item,
                            style: TextTheme.of(context).bodySmall!.copyWith(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                  onChanged: (val) {
                    controller.onChangePropertyOwnerShip(val!);
                  },
                ),
              ),
              const SizedBox(height: 20),

              /// ROOMS (optimized removed GetBuilder)
              RoomDetailsWidget(
                title: 'عدد غرف النوم',
                numberOfRooms: controller.countBedRoom.toString(),
                onTapAdd: controller.addBedRoom,
                onTapRemove: controller.removeBedRoom,
              ),
              const SizedBox(height: 20),
              RoomDetailsWidget(
                title: 'عدد الحمامات',
                numberOfRooms: controller.countPathRoom.toString(),
                onTapAdd: controller.addPathRoom,
                onTapRemove: controller.removePathRoom,
              ),
              const SizedBox(height: 20),
              RoomDetailsWidget(
                title: 'عدد دورات المياه',
                numberOfRooms: controller.countToilet.toString(),
                onTapAdd: controller.addToilet,
                onTapRemove: controller.removeToilet,
              ),
              const SizedBox(height: 20),

              /// DATE
              DateFieldWidget(
                hintText: "اختر تاريخ البناء",
                title: "عمر العقار",
                onTap: () async {
                  DateTime? pickDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1950),
                    lastDate: DateTime.now(),
                  );
                  if (pickDate != null) {
                    controller.setDate(pickDate);
                  }
                },
                controller: controller.myDate,
              ),
              const SizedBox(height: 20),

              /// DETAILS
              Text(
                "ملحقات العقار و مميزاته",
                style: TextTheme.of(context).bodySmall!.copyWith(fontSize: 16),
              ),
              const SizedBox(height: 10),
              MyDetailsTextFiled(
                controller: controller.detailsController,
                hintText: "يرجى كتابة التفاصيل *",
              ),
              const SizedBox(height: 5),
              Obx(
                () => Text(
                  "${controller.textLength}/300 حرف",
                  textAlign: TextAlign.end,
                  style: TextTheme.of(context).bodySmall!.copyWith(
                    fontSize: 12,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
