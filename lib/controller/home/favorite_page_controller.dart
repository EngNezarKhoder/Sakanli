import 'package:get/get.dart';
import 'package:sakanle/core/constant/app_route.dart';
import 'package:sakanle/core/constant/image_assets.dart';

abstract class FavoritePageController extends GetxController {
  void navigateToPropertyDetails();
}

class FavoritePageControllerImp extends FavoritePageController {
  List<Map<String, dynamic>> homes = [
    {
      'imageName': AppImageAssets.roomOneIcon,
      'iconName': AppImageAssets.favoriteIcon,
      'forWhat': "أ",
      'city': " حمص",
      'price': '80',
      'location': 'حمص',
      'service': 'للبيع',
    },
    {
      'imageName': AppImageAssets.roomOneIcon,
      'iconName': AppImageAssets.favoriteIcon,
      'forWhat': "أ",
      'city': " حمص",
      'price': '80',
      'location': 'حمص',
      'service': 'للبيع',
    },
  ];

  @override
  void navigateToPropertyDetails() {
    Get.toNamed(AppRoute.propertyDetails);
  }
}
