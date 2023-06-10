import 'package:flutter/material.dart';
import 'package:get/get.dart';

void getProgressDialog([String? msg]) {
  Get.defaultDialog(
    barrierDismissible: false,
    title: msg ?? 'Please Wait',
    content: const Center(
      child: CircularProgressIndicator(
        color: Colors.black,
      ),

      // Image.asset(
      //   'images/icon/loading.gif',
      //   height: 80,
      //
      // ),
    ),
  );
}