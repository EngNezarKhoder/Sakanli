import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sakanle/controller/property/property_info_two_controller.dart';
import 'package:sakanle/core/functions/validate_input.dart';
import 'package:sakanle/view/widgets/home/property/add_location.dart';
import 'package:sakanle/view/widgets/home/property/my_custom_drop_down.dart';
import 'package:sakanle/view/widgets/home/property/my_text_form_property.dart';
import 'package:sakanle/view/widgets/home/property/rich_text_widget.dart';

class PropertyInfoTwo extends StatelessWidget {
  const PropertyInfoTwo({super.key});

  @override
  Widget build(BuildContext context) {
    PropertyInfoTwoControllerImp controller = Get.put(
      PropertyInfoTwoControllerImp(),
    );
    return Form(
      key: controller.formState,
      child: Container(
        child: ListView(
          children: [
            RichTextWidget(title: 'تحديد الموقع '),
            const SizedBox(height: 10),
            AddLocation(onTap: () {}),
            const SizedBox(height: 20),
            Text(
              "تفاصيل العنوان",
              style: TextTheme.of(context).bodySmall!.copyWith(fontSize: 20),
            ),
            const SizedBox(height: 10),
            GetBuilder<PropertyInfoTwoControllerImp>(
              builder: (controller) {
                return MyCustomDropDown(
                  title: 'المدينة',
                  items: controller.cites
                      .map(
                        (city) =>
                            DropdownMenuItem(value: city, child: Text(city)),
                      )
                      .toList(),
                  value: controller.selectedCity,
                  onChanged: (val) {
                    controller.onChangeMyCity(val!);
                  },
                  hintText: 'اختر المدينة',
                );
              },
            ),
            const SizedBox(height: 15),
            RichTextWidget(title: 'المنطقة '),
            const SizedBox(height: 5),
            MyTextFormProperty(
              keyboardType: TextInputType.text,
              validator: (val) {
                return validateInput(val!, 1, 100, 'text');
              },
              myController: controller.locationArea,
              hintText: 'أدخل المنطقة',
            ),
            const SizedBox(height: 15),
            RichTextWidget(title: 'الشارع '),
            const SizedBox(height: 5),
            MyTextFormProperty(
              keyboardType: TextInputType.text,
              validator: (val) {
                return validateInput(val!, 1, 100, 'text');
              },
              myController: controller.street,
              hintText: 'أدخل الشارع',
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichTextWidget(title: 'المبنى '),
                      const SizedBox(height: 5),
                      MyTextFormProperty(
                        keyboardType: TextInputType.number,
                        validator: (val) {
                          return validateInput(val!, 1, 100, 'number');
                        },
                        myController: controller.building,
                        hintText: 'أدخل المبنى',
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichTextWidget(title: 'الطابق '),
                      const SizedBox(height: 5),
                      MyTextFormProperty(
                        keyboardType: TextInputType.number,
                        validator: (val) {
                          return validateInput(val!, 1, 100, 'number');
                        },
                        myController: controller.level,
                        hintText: 'أدخل رقم الطابق',
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            RichTextWidget(title: 'رقم العقار '),
            const SizedBox(height: 5),
            MyTextFormProperty(
              keyboardType: TextInputType.number,
              validator: (val) {
                return validateInput(val!, 1, 100, 'number');
              },
              myController: controller.propertyId,
              hintText: 'أدخل رقم العقار',
            ),
          ],
        ),
      ),
    );
  }
}
