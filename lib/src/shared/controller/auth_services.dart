import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mh_core/services/api_service.dart';
import 'package:mh_core/utils/global.dart';
import 'package:mh_core/widgets/button/custom_button.dart';

class AuthServices {
  ///Registration
  static Future<String> registerCall(dynamic body) async {
    final response = await ServiceAPI.genericCall(
      url: '${ServiceAPI.apiUrl}registration/',
      httpMethod: HttpMethod.multipartFilePost,
      noNeedAuthToken: true,
      allInfoField: body,
      defaultErrorMsgShow: false,
      isLoadingEnable: true,
    );
    globalLogger.d('${ServiceAPI.apiUrl}registration/', "Register Url");
    globalLogger.d(response, "Register Route");
    // Get.back();

    if (response['key'] != null) {
      return response['key'];
    } else {
      ServiceAPI.showAlert((response as Map).containsKey('password1')
          ? response['password1']
              .map((e) => e)
              .toList()
              .toString()
              .replaceAll('[', '')
              .replaceAll(']', '')
          : response.containsKey('non_field_errors')
              ? response['non_field_errors']
                  .map((e) => e)
                  .toList()
                  .toString()
                  .replaceAll('[', '')
                  .replaceAll(']', '')
              : "");
    }
    return '';
  }

  ///LogIn
  static Future<String> loginCall(dynamic body) async {
    final response = await ServiceAPI.genericCall(
      url: '${ServiceAPI.apiUrl}auth/login/',
      httpMethod: HttpMethod.post,
      noNeedAuthToken: true,
      body: body,
      defaultErrorMsgShow: false,
      isLoadingEnable: true,
    );
    globalLogger.d('${ServiceAPI.apiUrl}auth/login/', "URL");
    globalLogger.d(response, "Login Route");

    Get.back();

    if (response['key'] != null) {
      return response['key'];
    } else {

          ServiceAPI.showAlert((response as Map).containsKey('password1')
              ? response['password']
              .map((e) => e)
              .toList()
              .toString()
              .replaceAll('[', '')
              .replaceAll(']', '')
              : response.containsKey('non_field_errors')
              ? response['non_field_errors']
              .map((e) => e)
              .toList()
              .toString()
              .replaceAll('[', '')
              .replaceAll(']', '')
              : "");
    }
    return '';
  }

  ///LogOut
  static Future<bool> logoutCall({required Function() forceLogout}) async {
    final response = await ServiceAPI.genericCall(
        url: '${ServiceAPI.apiUrl}logout',
        httpMethod: HttpMethod.get,
        isLoadingEnable: true,
        isErrorHandleButtonExists: true,
        errorButtonLabel: 'Force Logout',
        errorButtonPressed: forceLogout);
    globalLogger.d(response, "Logout Route");

    is401Call = true;

    if (response['status'] != null && response['status']) {
      Get.back();
      return true;
    } else if (response['status'] != null && !(response['status'] == 'ok')) {
      Get.back();
      ServiceAPI.showAlert(response['message']);
    }
    return false;
  }
}
