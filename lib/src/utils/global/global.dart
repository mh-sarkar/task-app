import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';

final globalKey = GlobalKey<ScaffoldMessengerState>();
final GlobalKey<NavigatorState> appNavigatorKey = GlobalKey<NavigatorState>();
class Global {
  static final storage = GetStorage();
  static setLocalData(String key, dynamic value) {
    storage.write(key, value);
  }

  static dynamic getLocalData(String key) {
    return storage.read(key);
  }

  static void getSnackBar(String title, String body,
      {Color? bgColor, Color? textColor}) {
    Get.snackbar(
      title,
      body,
      backgroundColor: bgColor ?? Colors.red,
      colorText: textColor ?? Colors.white,
    );
  }
}