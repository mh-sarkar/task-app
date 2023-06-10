import 'package:flutter/material.dart';
import 'package:task/src/shared/controller/auth_controller.dart';
import 'package:task/src/utils/constants/route_name_constants.dart';
import 'package:get/get.dart';

import 'shared/shared_widgets/custom_sized_boxes.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      Get.toNamed(AuthController.to.isLoggedIn? AppRouteName.kPageDashboard: AppRouteName.kPageLogin);
    },);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 30),            const Icon(Icons.telegram_outlined, size: 200,),

            CustomSizedBox.space16H,
            const Text(
              'Test APP',
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.w500,
                color: Colors.black54,
              ),
            )
          ],
        ),
      ),
    );
  }
}
