import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:sakanle/controller/home/map_page_controller.dart';
import 'package:sakanle/core/constant/app_color.dart';
import 'package:sakanle/view/widgets/home/map/my_button_location.dart';
import 'package:sakanle/view/widgets/home/map/widget_extensions.dart';
import 'package:sakanle/view/widgets/home/map/widget_results.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MapPage extends StatelessWidget {
  const MapPage({super.key});

  @override
  Widget build(BuildContext context) {
    MapPageControllerImp controller = Get.put(MapPageControllerImp());
    return Container(
      child: Obx(
        () => controller.currentCenter.value == null
            ? Center(
                child: CircularProgressIndicator(color: AppColor.primaryColor),
              )
            : Stack(
                children: [
                  FlutterMap(
                    mapController: controller.mapController,
                    options: MapOptions(
                      initialCenter: LatLng(
                        controller.currentCenter.value!.latitude,
                        controller.currentCenter.value!.longitude,
                      ),
                      initialZoom: controller.initialZoom.value,
                    ),
                    children: [
                      TileLayer(
                        urlTemplate:
                            "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                        userAgentPackageName: 'com.nezar.sakanli',
                        subdomains: ['a', 'b', 'c'],
                      ),
                    ],
                  ),
                  Positioned(
                    right: 15,
                    top: 45,
                    left: 0,
                    child: SizedBox(
                      height: 35,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.cites.length,
                        itemBuilder: (context, index) {
                          return GetBuilder<MapPageControllerImp>(
                            builder: (controller) {
                              return MyButtonLocation(
                                isPressed: controller.citesStatus[index],
                                onPressed: () {
                                  controller.changeCurrentCenterAndZoom(
                                    controller.cites[index],
                                  );
                                  controller.changeStatusOfCityButton(index);
                                  controller.showResults();
                                },
                                title: controller.cites[index],
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ),
                  Positioned(
                    right: 20,
                    top: 90,
                    left: 0,
                    child: SizedBox(
                      height: 35,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.services.length,
                        itemBuilder: (context, index) {
                          return GetBuilder<MapPageControllerImp>(
                            builder: (controller) {
                              return MyButtonLocation(
                                isPressed: controller.servicesStatus[index],
                                onPressed: () {
                                  controller.changeStatusOfSErviceButton(index);
                                  controller.changeOfSelectedService(
                                    controller.services[index],
                                  );
                                  controller.showResults();
                                },
                                title: controller.services[index],
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ),
                  GetBuilder<MapPageControllerImp>(
                    builder: (controller) {
                      return controller.foundedResults.isEmpty
                          ? SizedBox()
                          : Positioned(
                              bottom: 20,
                              left: 75,
                              right: 75,
                              child: WidgetResults(
                                countOfProperties:
                                    controller.foundedResults.length,
                                onTap: () {},
                              ),
                            );
                    },
                  ),
                  Positioned(
                    bottom: 20,
                    left: 15,
                    child: WidgetExtensions(
                      onTap: () {
                        controller.navigateToAddProperty();
                      },
                      icon: FontAwesomeIcons.store,
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    right: 15,
                    child: WidgetExtensions(
                      onTap: () {
                        controller.handleLocationPermission();
                      },
                      icon: FontAwesomeIcons.locationCrosshairs,
                    ),
                  ),
                  Positioned(
                    bottom: 75,
                    left: 15,
                    child: WidgetExtensions(
                      onTap: () {},
                      icon: FontAwesomeIcons.facebook,
                    ),
                  ),
                  Positioned(
                    bottom: 130,
                    left: 15,
                    child: WidgetExtensions(
                      onTap: () {},
                      icon: FontAwesomeIcons.instagram,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
