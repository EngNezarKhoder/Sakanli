import 'package:get/get.dart';
import 'package:sakanle/core/services/token_service.dart';

class AuthService extends GetxService {
  String? token;

  Future<AuthService> init() async {
    token = await TokenService.getToken();
    return this;
  }

  bool get isLoggedIn => token != null && token!.isNotEmpty;
}