import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:mh_core/services/api_service.dart';
import 'package:task/src/shared/controller/auth_services.dart';
import 'package:task/src/shared/shared_widgets/dialog.dart';

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

  bool get isLoggedIn => Global.storage.read('userId') != null;

  @override
  void onInit() {
    // TODO: implement onInit
    if (isLoggedIn) {
      userId.value = Global.storage.read('userId');
      userPhone.value = Global.storage.read('userPhone');
      isVerified.value = true;
      // Get.put<UserController>(UserController(), permanent: true);
    }
    super.onInit();
  }
  afterLogin(String accessToken) {
    Global.storage.write('authToken', accessToken);
    ServiceAPI.setAuthToken(accessToken);
    Global.storage.write('isLoggedIn', true);
    // Get.put<UserController>(UserController(), permanent: true);
    // Get.put<HomeController>(HomeController(), permanent: true);
    // Get.offAllNamed(MainHomePage.routeName);
  }
  void offIntroPage() {
    Global.storage.write('isFirstTime', false);
  }

  void registerRequest(String name, String email, String password, String confirmPassword) async {
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

}