import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:mh_core/services/api_service.dart';
import 'package:task/src/modules/dashboard/controller/home_controller.dart';
import 'package:task/src/modules/dashboard/views/dashboard.dart';
import 'package:task/src/modules/user/controller/user_controller.dart';
import 'package:task/src/shared/controller/auth_services.dart';
import 'package:task/src/shared/shared_widgets/dialog.dart';
import 'package:task/src/utils/constants/route_name_constants.dart';
import 'package:task/src/utils/routes/app_routes.dart';

import '../../utils/global/global.dart';

class AuthController extends GetxController {
  static AuthController get to => Get.find();

  RxString userId = "".obs;
  RxString userPhone = "".obs;
  RxBool isVerified = false.obs;

  String get getUserId => userId.value;

  String get getUserPhone => userPhone.value;

  bool get getIsVerified => isVerified.value;

  bool get isFirstTime => Global.storage.read('isFirstTime') ?? true;

  bool get isLoggedIn => Global.storage.read('isLoggedIn') ?? false;

  @override
  void onInit() {
    // TODO: implement onInit
    if (isLoggedIn) {
      // userId.value = Global.storage.read('userId');
      // userPhone.value = Global.storage.read('userPhone');
      // isVerified.value = true;
      Get.put<HomeController>(HomeController(), permanent: true);
      Get.put<UserController>(UserController(), permanent: true);
    }
    super.onInit();
  }

  afterLogin(String accessToken) {
    Global.storage.write('authToken', accessToken);
    ServiceAPI.setAuthToken(accessToken);
    Global.storage.write('isLoggedIn', true);
    Global.storage.write('cookie', ServiceAPI.getCookie);
    Get.put<HomeController>(HomeController(), permanent: true);
    Get.put<UserController>(UserController(), permanent: true);
    Get.offAllNamed(AppRouteName.kPageDashboard);
  }

  void registerRequest(String name, String email, String password,
      String confirmPassword) async {
    getProgressDialog();
    final accessToken = await AuthServices.registerCall({
      "username": name,
      "email": email,
      "password1": password,
      "password2": confirmPassword,
    });
    if (accessToken.isNotEmpty) {
      Fluttertoast.showToast(
        msg: 'Your Account created successfully!',
        textColor: Colors.green,
      );
      afterLogin(accessToken);
    }
  }

  void loginRequest(String userName, String email, String password) async {
    getProgressDialog();
    final accessToken = await AuthServices.loginCall({
      "username": userName,
      "email": email,
      "password": password,
    });
    if (accessToken.isNotEmpty) {
      afterLogin(accessToken);
    }
  }

  void logout() {
    Fluttertoast.showToast(
      msg: 'Logging Out ...',
      textColor: Colors.red,
    );

    Get.delete<UserController>(force: true);
    Get.delete<HomeController>(force: true);
    Global.storage.write('authToken', '');
    Global.storage.write('cookie', '');
    ServiceAPI.delAuthToken('');
    Global.storage.write('isLoggedIn', false);
    Get.offAllNamed('/');
  }
}
