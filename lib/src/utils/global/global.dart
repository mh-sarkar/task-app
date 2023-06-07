import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';

class Global {
  static final storage = GetStorage();
  static final logger = Logger();

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