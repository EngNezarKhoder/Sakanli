import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:sakanle/bindings/auth/login_bindings.dart';
import 'package:sakanle/bindings/auth/reset_password/reset_password.dart';
import 'package:sakanle/bindings/auth/reset_password/verified_code.dart';
import 'package:sakanle/bindings/auth/reset_password/verified_email.dart';
import 'package:sakanle/bindings/auth/sign_up_bindings.dart';
import 'package:sakanle/bindings/auth/verified_code_sign_up_bindings.dart';
import 'package:sakanle/bindings/home/faq_page.dart';
import 'package:sakanle/bindings/home/home_page.dart';
import 'package:sakanle/bindings/home/map/founded_results.dart';
import 'package:sakanle/bindings/home/map/map_screen.dart';
import 'package:sakanle/bindings/home/my_profile.dart';
import 'package:sakanle/bindings/home/property/add_property.dart';
import 'package:sakanle/bindings/home/property/advice_page.dart';
import 'package:sakanle/bindings/home/property/my_property.dart';
import 'package:sakanle/bindings/home/property/property_info.dart';
import 'package:sakanle/bindings/home/property_details.dart';
import 'package:sakanle/core/constant/app_route.dart';
import 'package:sakanle/view/screens/auth/forgetpassword/reset_password.dart';
import 'package:sakanle/view/screens/auth/forgetpassword/verified_code.dart';
import 'package:sakanle/view/screens/auth/forgetpassword/verified_email.dart';
import 'package:sakanle/view/screens/auth/login.dart';
import 'package:sakanle/view/screens/auth/sign_up.dart';
import 'package:sakanle/view/screens/auth/verified_code_sign_up.dart';
import 'package:sakanle/view/screens/home/ads_page.dart';
import 'package:sakanle/view/screens/home/favorite_page.dart';
import 'package:sakanle/view/screens/home/home_page.dart';
import 'package:sakanle/view/screens/home/map/map_screen.dart';
import 'package:sakanle/view/screens/home/map_page.dart';
import 'package:sakanle/view/screens/home/my_profile_page.dart';
import 'package:sakanle/view/screens/home/property/add_property/add_property.dart';
import 'package:sakanle/view/screens/home/property/add_property/advice_page.dart';
import 'package:sakanle/view/screens/home/property/add_property/my_property.dart';
import 'package:sakanle/view/screens/home/property/founded_results.dart';
import 'package:sakanle/view/screens/home/property/property_details.dart';
import 'package:sakanle/view/screens/home/property/add_property/property_info.dart';
import 'package:sakanle/view/screens/home/property/add_property/property_info_one.dart';
import 'package:sakanle/view/screens/home/property/add_property/property_info_three.dart';
import 'package:sakanle/view/screens/home/property/add_property/property_info_two.dart';
import 'package:sakanle/view/screens/home/settings_page.dart';
import 'package:sakanle/view/screens/home/settings_pages/conditions_page.dart';
import 'package:sakanle/view/screens/home/settings_pages/faq_page.dart';
import 'package:sakanle/view/screens/home/settings_pages/privacy_page.dart';

List<GetPage<dynamic>>? getPages = [
  // Auth
  GetPage(name: AppRoute.login, page: () => Login(), binding: LoginBindings()),
  GetPage(
    name: AppRoute.verifiedEmail,
    page: () => VerifiedEmail(),
    binding: VerifiedEmailBindings(),
  ),
  GetPage(
    name: AppRoute.signUp,
    page: () => SignUp(),
    binding: SignUpBindings(),
  ),
  GetPage(
    name: AppRoute.verifiedCodeSignUp,
    page: () => VerifiedCodeSignUp(),
    binding: VerifiedCodeSignUpBindings(),
  ),
  GetPage(
    name: AppRoute.resetPassword,
    page: () => ResetPassword(),
    binding: ResetPasswordBindings(),
  ),
  GetPage(
    name: AppRoute.verifiedCode,
    page: () => VerifiedCode(),
    binding: VerifiedCodeBindings(),
  ),
  // Home Pages
  GetPage(
    name: AppRoute.homePage,
    page: () => HomePage(),
    binding: HomePageBindings(),
  ),
  GetPage(name: AppRoute.adsPage, page: () => AdsPage()),
  GetPage(name: AppRoute.mapPage, page: () => MapPage()),
  GetPage(name: AppRoute.favoritePage, page: () => FavoritePage()),
  GetPage(name: AppRoute.settingsPage, page: () => SettingsPage()),
  GetPage(
    name: AppRoute.addProperty,
    page: () => AddProperty(),
    binding: AddPropertyBindings(),
  ),
  GetPage(
    name: AppRoute.advicePage,
    page: () => AdvicePage(),
    binding: AdvicePageBindings(),
  ),
  GetPage(name: AppRoute.propertyInfoOne, page: () => PropertyInfoOne()),

  GetPage(name: AppRoute.propertyInfoTwo, page: () => PropertyInfoTwo()),
  GetPage(name: AppRoute.propertyInfoThree, page: () => PropertyInfoThree()),

  GetPage(
    name: AppRoute.propertyInfo,
    page: () => PropertyInfo(),
    binding: PropertyInfoBindings(),
  ),
  GetPage(
    name: AppRoute.mapScreen,
    page: () => MapScreen(),
    binding: MapScreenBindings(),
  ),
  GetPage(
    name: AppRoute.foundedResults,
    page: () => FoundedResults(),
    binding: FoundedResultsBindings(),
  ),
  GetPage(
    name: AppRoute.propertyDetails,
    page: () => PropertyDetails(),
    binding: PropertyDetailsBindings(),
  ),
  GetPage(
    name: AppRoute.myProperty,
    page: () => MyProperty(),
    binding: MyPropertyBindings(),
  ),
  GetPage(
    name: AppRoute.myProfile,
    page: () => MyProfilePage(),
    binding: MyProfileBindings(),
  ),
  GetPage(name: AppRoute.privacyPage, page: () => PrivacyPage()),
  GetPage(name: AppRoute.conditionsPage, page: () => ConditionsPage()),
  GetPage(
    name: AppRoute.faqPage,
    page: () => FaqPage(),
    binding: FaqPageBindings(),
  ),
];
