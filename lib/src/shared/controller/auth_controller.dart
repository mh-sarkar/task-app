import 'package:get/get.dart';

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

  void offIntroPage() {
    Global.storage.write('isFirstTime', false);
  }

}