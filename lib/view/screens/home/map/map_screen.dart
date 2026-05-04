import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:sakanle/controller/home/map/map_screen_controller.dart';
import 'package:sakanle/core/constant/app_color.dart';
import 'package:sakanle/view/widgets/home/map/my_confirm_location_button.dart';
import 'package:sakanle/view/widgets/home/map/my_info_location.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    MapScreenControllerImp controller = Get.put(MapScreenControllerImp());
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
                  FlutterMap(
                    mapController: controller.mapController,
                    options: MapOptions(
                      onMapReady: () {
                        controller.isMapReady.value = true;
                        controller.moveToCurrentIfReady();
                      },
                      initialCenter: controller.currentCenter.value!,
                      initialZoom: 16,
                      onPositionChanged: (MapCamera position, bool hasGesture) {
                        LatLng center = position.center;
                        controller.lat.value = center.latitude;
                        controller.lng.value = center.longitude;
                        controller.getAddressFromLatLng(
                          controller.lat.value,
                          controller.lng.value,
                        );
                      },
                    ),
                    children: [
                      TileLayer(
                        urlTemplate:
                            "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
                        userAgentPackageName: 'com.nezar.sakanli',
                        subdomains: ['a', 'b', 'c'],
                      ),
                    ],
                  ),
                  Center(
                    child: Icon(
                      Icons.location_pin,
                      size: 50,
                      color: AppColor.primaryColor,
                    ),
                  ),
                  Positioned(
                    bottom: 100,
                    left: 20,
                    right: 20,
                    child: MyInfoLocation(
                      lat: controller.lat.value.toStringAsFixed(6),
                      lng: controller.lng.value.toStringAsFixed(6),
                      address: controller.address.value,
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    left: 20,
                    right: 20,
                    child: MyConfirmLocationButton(
                      onTap: () {
                        controller.confirmLocation();
                      },
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
