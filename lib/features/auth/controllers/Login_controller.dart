import 'dart:developer';

import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:seoul_select/utils/ApiResponse.dart';
import '../../../models/LoginResponse.dart';

class LoginController extends GetxController {
  final rxLoginResponse = Rx<ApiResponse<LoginData>>(ApiResponse.empty());


  postLogin(String email, String password) async {
    rxLoginResponse.value = ApiResponse.loading();
    await Future.delayed(const Duration(milliseconds: 5000));
    try {
      final response = LoginData(
        email: email,
        password: password,
        rememberMe: false,
        displayCaptcha: false
      );
      rxLoginResponse.value = ApiResponse.completed(response);

    } catch (e) {
      rxLoginResponse.value = ApiResponse.error(e.toString());
      log(e.toString());
    }
  }
}
