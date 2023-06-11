import 'dart:convert';

import 'package:get/get.dart';
import 'package:mh_core/services/api_service.dart';
import 'package:mh_core/utils/global.dart';
import 'package:task/src/modules/user/controller/user_controller.dart';
import 'package:task/src/modules/user/model/user_model.dart';

class UserServices {
  ///UserProfile
  static Future<UserModel> userProfileCall() async {
    UserModel userModel = UserModel();
    final response = await ServiceAPI.genericCall(
      url: '${ServiceAPI.apiUrl}auth/user/',
      httpMethod: HttpMethod.get,
    );
    globalLogger.d(response, "UserProfile Route");
    try{
      userModel = UserModel.fromJson(response);
    }catch(e){
      globalLogger.e(e);
    }

    return userModel;
  }



  ///Update UserProfile
  static Future<bool> userProfileUpdate(dynamic updatedInfo) async {
    UserModel userModel = UserModel();
    final response = await ServiceAPI.genericCall(
      url: '${ServiceAPI.apiUrl}auth/user/',
      httpMethod: HttpMethod.patch,
      body: json.encode(updatedInfo),
      defaultErrorMsgShow: false,
      isLoadingEnable: true,
    );
    if(response['detail']!=null){
      ServiceAPI.showAlert(response['detail']);
    }
    globalLogger.d(response, "Profile Update Route");
    if (response['status'] != null && response['status']) {
      userModel = UserModel.fromJson(response['data']);
      // UserController.to.userInfo.value = userModel;
      return response['status'];
    } else if (response['status'] != null && !response['status']) {
      ServiceAPI.showAlert(response['message']);
    }
    return false;
  }


}