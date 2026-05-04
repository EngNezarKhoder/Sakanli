import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:sakanle/core/constant/app_route.dart';
import 'package:sakanle/view/screens/auth/forgetpassword/reset_password.dart';
import 'package:sakanle/view/screens/auth/forgetpassword/verified_code.dart';
import 'package:sakanle/view/screens/auth/forgetpassword/verified_email.dart';
import 'package:sakanle/view/screens/auth/login.dart';
import 'package:sakanle/view/screens/auth/sign_up.dart';
import 'package:sakanle/view/screens/home/ads_page.dart';
import 'package:sakanle/view/screens/home/favorite_page.dart';
import 'package:sakanle/view/screens/home/filter/service.dart';
import 'package:sakanle/view/screens/home/filter/where.dart';
import 'package:sakanle/view/screens/home/home_page.dart';
import 'package:sakanle/view/screens/home/map/map_screen.dart';
import 'package:sakanle/view/screens/home/map_page.dart';
import 'package:sakanle/view/screens/home/property/add_property.dart';
import 'package:sakanle/view/screens/home/property/advice_page.dart';
import 'package:sakanle/view/screens/home/property/property_info.dart';
import 'package:sakanle/view/screens/home/property/property_info_one.dart';
import 'package:sakanle/view/screens/home/property/property_info_three.dart';
import 'package:sakanle/view/screens/home/property/property_info_two.dart';
import 'package:sakanle/view/screens/home/settings_page.dart';

List<GetPage<dynamic>>? getPages = [
  // Auth
  GetPage(name: AppRoute.login, page: () => Login()),
  GetPage(name: AppRoute.verifiedEmail, page: () => VerifiedEmail()),
  GetPage(name: AppRoute.signUp, page: () => SignUp()),
  GetPage(name: AppRoute.resetPassword, page: () => ResetPassword()),
  GetPage(name: AppRoute.verifiedCode, page: () => VerifiedCode()),
  // Home Pages
  GetPage(name: AppRoute.homePage, page: () => HomePage()),
  GetPage(name: AppRoute.adsPage, page: () => AdsPage()),
  GetPage(name: AppRoute.mapPage, page: () => MapPage()),
  GetPage(name: AppRoute.favoritePage, page: () => FavoritePage()),
  GetPage(name: AppRoute.settingsPage, page: () => SettingsPage()),
  GetPage(name: AppRoute.where, page: () => Where()),
  GetPage(name: AppRoute.service, page: () => Service()),
  GetPage(name: AppRoute.addProperty, page: () => AddProperty()),
  GetPage(name: AppRoute.advicePage, page: () => AdvicePage()),
  GetPage(name: AppRoute.propertyInfoOne, page: () => PropertyInfoOne()),
  GetPage(name: AppRoute.propertyInfoTwo, page: () => PropertyInfoTwo()),
  GetPage(name: AppRoute.propertyInfoThree, page: () => PropertyInfoThree()),
  GetPage(name: AppRoute.propertyInfo, page: () => PropertyInfo()),
  GetPage(name: AppRoute.mapScreen, page: () => MapScreen()),
];
