
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:task/src/modules/user/model/user_model.dart';
import 'package:task/src/modules/user/services/user_services.dart';
import 'package:task/src/shared/shared_widgets/dialog.dart';

class UserController extends GetxController with StateMixin<UserModel> {
  static UserController get to => Get.find();

  final Rx<UserModel> _userInfo = UserModel().obs;

  UserModel get getUserInfo => _userInfo.value;

  @override
  void onReady() async {
    await getUpdatedUserInfo();
    super.onReady();
  }

  @override
  void onClose() {
    _userInfo.close();
    super.onClose();
  }

  Future<void> getUpdatedUserInfo() async {
    _userInfo.value = await UserServices.userProfileCall();
  }



  Future<bool> updateUser(dynamic updatedInfo) async {

    getProgressDialog();
    final isUpdated = await UserServices.userProfileUpdate(
        updatedInfo, );

    if (isUpdated) {
      Get.back();
      Fluttertoast.showToast(
        msg: 'Updated profile successfully!',
        textColor: Colors.green,
      );
    }
    return isUpdated;
  }
}