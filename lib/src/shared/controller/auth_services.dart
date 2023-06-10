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
    );
    globalLogger.d('${ServiceAPI.apiUrl}registration/', "Register Url");
    globalLogger.d(response, "Register Route");
    // Get.back();

    if (response['key'] != null) {
      return response['key'];
    } else {
      showAlert(response['username'] != null && response['username'].isNotEmpty
          ? response['username'].map((e)=>e).toList.toString().replaceAll('[', '').replaceAll(']', '')
          : "" + "\n" + response['email'] != null && response['email'].isNotEmpty
              ? response['email'].map((e)=>e).toList.toString().replaceAll('[', '').replaceAll(']', '')
              : ""+ "\n" + response['password1'] != null &&
                  response['password1'].isNotEmpty
              ? response['password1'].map((e)=>e).toList.toString().replaceAll('[', '').replaceAll(']', '')
              : "");
    }
    return '';
  }

  ///LogIn
  static Future<String> loginCall(dynamic body) async {
    final response = await ServiceAPI.genericCall(
        url: '${ServiceAPI.url}login',
        httpMethod: HttpMethod.post,
        noNeedAuthToken: true,
        body: body);
    globalLogger.d(response, "Login Route");

    Get.back();

    if (response['key'] != null) {
      return response['key'];
    } else {
      showAlert(response['password'] != null && response['password'].isNotEmpty
          ? response['password'][0]
          : "" + "\n" + response['non_field_errors'] != null &&
          response['non_field_errors'].isNotEmpty
          ? response['non_field_errors'].map((e)=>e).toList.toString().replaceAll('[', '').replaceAll(']', '')
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
      showAlert(response['message']);
    }
    return false;
  }

  ///Alert Dialog
  static void showAlert(String message, {Widget? errorHandleButton}) {
    if (Get.isDialogOpen!) {
      Get.back(closeOverlays: true);
    } else {
      Get.defaultDialog(
        title: "Error",
        content: Text(
          message,
          textAlign: TextAlign.center,
        ),
        actions: [
          CustomButton(
            label: "OK",
            marginVertical: 8,
            onPressed: () {
              Get.back();
            },
          ),
          if (errorHandleButton != null) errorHandleButton,
        ],
      );
    }
  }
}
