import 'package:get/get.dart';

abstract class PropertyInfoController extends GetxController {
  void changeValueOfIndex(int val);
}

class PropertyInfoControllerImp extends PropertyInfoController {
  late int index;

  @override
  void onInit() {
    index = 0;
    super.onInit();
  }

  @override
  void changeValueOfIndex(int val) {
    index = val;
    update();
  }
}
