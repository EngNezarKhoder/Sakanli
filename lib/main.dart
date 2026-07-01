import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sakanle/core/constant/app_route.dart';
import 'package:sakanle/core/constant/theme.dart';
import 'package:sakanle/core/services/auth_services.dart';
import 'package:sakanle/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Get.putAsync(() async => await AuthService().init());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final authService = Get.find<AuthService>();

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: getPages,
      initialRoute: authService.isLoggedIn ? AppRoute.homePage : AppRoute.login,
      locale: const Locale("ar"),
      theme: themeData,
    );
  }
}
