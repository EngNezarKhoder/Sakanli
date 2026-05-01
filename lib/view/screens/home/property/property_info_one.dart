import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sakanle/controller/property/property_info_one_controller.dart';
import 'package:sakanle/core/constant/app_color.dart';
import 'package:sakanle/core/functions/validate_input.dart';
import 'package:sakanle/view/widgets/home/property/my_custom_drop_down.dart';
import 'package:sakanle/view/widgets/home/property/my_date_filed_widget.dart';
import 'package:sakanle/view/widgets/home/property/my_details_text_filed.dart';
import 'package:sakanle/view/widgets/home/property/my_text_form_property.dart';
import 'package:sakanle/view/widgets/home/property/radio_list_tile_widget.dart';
import 'package:sakanle/view/widgets/home/property/rich_text_widget.dart';
import 'package:sakanle/view/widgets/home/property/room_details_widget.dart';

class PropertyInfoOne extends StatelessWidget {
  const PropertyInfoOne({super.key});

  @override
  Widget build(BuildContext context) {
    PropertyInfoOneControllerImp controller = Get.put(
      PropertyInfoOneControllerImp(),
    );
    return Container(
      child: ListView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        children: [
          RichTextWidget(title: 'الخدمات المطلوبة '),
          // Services
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: controller.serviceInfo.length,
            itemBuilder: (context, index) {
              return GetBuilder<PropertyInfoOneControllerImp>(
                builder: (controller) {
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
                },
              );
            },
          ),
          const SizedBox(height: 20),
          // Fields Prices
          GetBuilder<PropertyInfoOneControllerImp>(
            builder: (controller) {
              return controller.serviceInfo.any(
                    (element) => element['status'] == true,
                  )
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "أسعار الخدمات المحددة",
                          style: TextTheme.of(
                            context,
                          ).bodySmall!.copyWith(fontSize: 20),
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: controller.serviceInfo.length,
                          itemBuilder: (context, index) {
                            return controller.serviceInfo[index]['status']
                                ? Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      RichTextWidget(
                                        title: controller
                                            .serviceInfo[index]['titleService'],
                                      ),
                                      const SizedBox(height: 10),
                                      MyTextFormProperty(
                                        keyboardType: TextInputType.text,
                                        validator: (val) {
                                          return validateInput(
                                            val!,
                                            2,
                                            10,
                                            'text',
                                          );
                                        },
                                        myController: controller
                                            .serviceInfo[index]['price'],
                                        hintText: "أدخل السعر",
                                      ),
                                      const SizedBox(height: 10),
                                    ],
                                  )
                                : SizedBox();
                          },
                        ),
                      ],
                    )
                  : SizedBox();
            },
          ),
          // Drop Down
          GetBuilder<PropertyInfoOneControllerImp>(
            builder: (controller) {
              return MyCustomDropDown(
                hintText: 'نوع العقار',
                title: "نوع العقار",
                onChanged: (val) {
                  controller.onChangePropertyType(val!);
                },
                items: controller.propertyTypes
                    .map(
                      (item) =>
                          DropdownMenuItem(value: item, child: Text(item)),
                    )
                    .toList(),
                value: controller.selectedProperty,
              );
            },
          ),
          // مقدم الاعلان
          const SizedBox(height: 20),
          RichTextWidget(title: 'صفة مقدم الاعلان'),
          const SizedBox(height: 20),
          GetBuilder<PropertyInfoOneControllerImp>(
            builder: (controller) {
              return Container(
                child: RadioGroup(
                  groupValue: controller.advertiserType,
                  onChanged: (val) {
                    controller.changeAdvertiserType(val!);
                  },
                  child: Row(
                    children: [
                      RadioListTileWidget(title: 'مالك العقار', value: 'owner'),
                      RadioListTileWidget(
                        title: 'وسيط',
                        value: 'med',
                      ), // mediator وسيط
                    ],
                  ),
                ),
              );
            },
          ),
          // Property Area
          RichTextWidget(title: 'المساحة بالمتر المربع'),
          const SizedBox(height: 10),
          MyTextFormProperty(
            keyboardType: TextInputType.number,
            validator: (val) {
              return validateInput(val!, 2, 10, 'number');
            },
            myController: controller.propertyArea,
            hintText: 'المساحة بالمتر المربع *',
          ),
          // Front
          const SizedBox(height: 20),
          GetBuilder<PropertyInfoOneControllerImp>(
            builder: (controller) {
              return MyCustomDropDown(
                hintText: 'الواجهة',
                title: 'اختر الواجهة *',
                items: controller.fronts
                    .map(
                      (item) =>
                          DropdownMenuItem(value: item, child: Text(item)),
                    )
                    .toList(),
                value: controller.front,
                onChanged: (val) {
                  controller.onChangePropertyFront(val!);
                },
              );
            },
          ),
          // OwnerShip
          const SizedBox(height: 20),
          GetBuilder<PropertyInfoOneControllerImp>(
            builder: (controller) {
              return MyCustomDropDown(
                hintText: 'الملكية',
                title: 'اختر نوع الملكية *',
                items: controller.ownerShips
                    .map(
                      (item) =>
                          DropdownMenuItem(value: item, child: Text(item)),
                    )
                    .toList(),
                value: controller.ownerShip,
                onChanged: (val) {
                  controller.onChangePropertyOwnerShip(val!);
                },
              );
            },
          ),
          // Room Details
          const SizedBox(height: 20),
          GetBuilder<PropertyInfoOneControllerImp>(
            builder: (controller) {
              return RoomDetailsWidget(
                title: 'عدد غرف النوم',
                numberOfRooms: controller.countBedRoom.toString(),
                onTapAdd: () {
                  controller.addBedRoom();
                },
                onTapRemove: () {
                  controller.removeBedRoom();
                },
              );
            },
          ),
          const SizedBox(height: 20),
          GetBuilder<PropertyInfoOneControllerImp>(
            builder: (controller) {
              return RoomDetailsWidget(
                title: 'عدد الحمامات',
                numberOfRooms: controller.countPathRoom.toString(),
                onTapAdd: () {
                  controller.addPathRoom();
                },
                onTapRemove: () {
                  controller.removePathRoom();
                },
              );
            },
          ),
          const SizedBox(height: 20),
          GetBuilder<PropertyInfoOneControllerImp>(
            builder: (controller) {
              return RoomDetailsWidget(
                title: 'عدد دورات المياه',
                numberOfRooms: controller.countToilet.toString(),
                onTapAdd: () {
                  controller.addToilet();
                },
                onTapRemove: () {
                  controller.removeToilet();
                },
              );
            },
          ),
          const SizedBox(height: 20),
          GetBuilder<PropertyInfoOneControllerImp>(
            builder: (controller) {
              return DateFieldWidget(
                hintText: "اختر تاريخ البناء",
                title: "عمر العقار (تاريخ البناء وليس الترميم)",
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
              );
            },
          ),
          const SizedBox(height: 20),
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
            ),
          ),
        ],
      ),
    );
  }
}
