import 'package:flutter_map/flutter_map.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

abstract class MapScreenController extends GetxController {
  void moveToCurrentIfReady();
  void confirmLocation();
  Future<void> getCurrentLocation();
  Future<void> getAddressFromLatLng(double lat, double lng);
}

class MapScreenControllerImp extends MapScreenController {
  late MapController mapController;
  RxBool isMapReady = false.obs;
  Rxn<LatLng> currentCenter = Rxn<LatLng>();
  RxDouble lat = 0.0.obs;
  RxDouble lng = 0.0.obs;
  RxString address = "".obs;
  @override
  void onInit() async {
    mapController = MapController();
    await getCurrentLocation();
    await getAddressFromLatLng(lat.value, lng.value);
    super.onInit();
  }

  @override
  void moveToCurrentIfReady() {
    if (isMapReady.value && currentCenter.value != null) {
      mapController.move(currentCenter.value!, 16);
    }
  }

  @override
  void confirmLocation() {
    Get.back(result: {"lat": lat.value, "lng": lng.value, "address": address.value});
  }

  @override
  Future<void> getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) return;
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) return;
    Position position = await Geolocator.getCurrentPosition();
    LatLng center = LatLng(position.latitude, position.longitude);
    currentCenter.value = center;
    lat.value = center.latitude;
    lng.value = center.longitude;
    moveToCurrentIfReady();
  }

  @override
  Future<void> getAddressFromLatLng(double lat, double lng) async {
    try {
      List<Placemark> placeMarks = await placemarkFromCoordinates(lat, lng);
      Placemark place = placeMarks[0];
      address.value =
          "${place.name}, ${place.locality}, ${place.administrativeArea}";
    } catch (e) {
      print(address.value);
      address.value = "لم يتم العثور على عنوان";
    }
  }
}
