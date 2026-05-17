import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:sakanle/controller/home/map/map_screen_controller.dart';
import 'package:sakanle/core/constant/app_color.dart';
import 'package:sakanle/view/widgets/home/map/my_confirm_location_button.dart';
import 'package:sakanle/view/widgets/home/map/my_info_location.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    MapScreenControllerImp controller = Get.find<MapScreenControllerImp>();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("تحديد الموقع على الخريطة", style: TextStyle(fontSize: 22)),
        backgroundColor: AppColor.primaryColor,
      ),
      body: Obx(
        () => controller.currentCenter.value == null
            ? Center(
                child: CircularProgressIndicator(color: AppColor.primaryColor),
              )
            : Stack(
                children: [
                  _buildMap(controller),
                  _buildPin(controller),
                  _buildInfo(controller),
                  _buildButton(controller),
                ],
              ),
      ),
    );
  }
}

Widget _buildMap(MapScreenControllerImp controller) {
  return FlutterMap(
    mapController: controller.mapController,
    options: MapOptions(
      onMapReady: () {
        controller.isMapReady.value = true;
        controller.moveToCurrentIfReady();
      },
      initialCenter: controller.currentCenter.value!,
      initialZoom: 16,
      onPositionChanged: (position, hasGesture) {
        controller.onMapMoved(position.center);
      },
    ),
    children: [
      TileLayer(
        urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
        userAgentPackageName: 'com.nezar.sakanli',
      ),
    ],
  );
}

Widget _buildPin(MapScreenControllerImp controller) {
  return Obx(
    () => Center(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),

        transform: Matrix4.translationValues(
          0,
          controller.isMoving.value ? -15 : 0,
          0,
        ),

        child: Icon(
          Icons.location_pin,
          size: controller.isMoving.value ? 55 : 50,
          color: AppColor.primaryColor,
        ),
      ),
    ),
  );
}

Widget _buildInfo(MapScreenControllerImp controller) {
  return Obx(
    () => Positioned(
      bottom: 100,
      left: 20,
      right: 20,
      child: MyInfoLocation(
        lat: controller.lat.value.toStringAsFixed(6),
        lng: controller.lng.value.toStringAsFixed(6),
        address: controller.address.value,
      ),
    ),
  );
}

Widget _buildButton(MapScreenControllerImp controller) {
  return Positioned(
    bottom: 20,
    left: 20,
    right: 20,
    child: MyConfirmLocationButton(
      onTap: () {
        controller.confirmLocation();
      },
    ),
  );
}
