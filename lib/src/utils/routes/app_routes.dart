import 'package:task/src/modules/authentication/views/login_screen.dart';
import 'package:task/src/modules/authentication/views/registration_screen.dart';
import 'package:task/src/modules/chat/views/main_chat_screen.dart';
import 'package:task/src/modules/user/views/edit_profile.dart';
import 'package:task/src/splash_screen.dart';
import 'package:get/get.dart';

import '../../modules/dashboard/views/dashboard.dart';
import '../constants/route_name_constants.dart';

class AppRoutes {
  static routes() => [
    GetPage(
      name: AppRouteName.kPageSplash,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: AppRouteName.kPageDashboard,
      page: () => const DashboardScreen(),
    ),
    GetPage(
      name: AppRouteName.kPageLogin,
      page: () => const LoginScreen(),
    ),
    GetPage(
      name: AppRouteName.kPageRegistration,
      page: () => const RegisterScreen(),
    ),
    GetPage(
      name: AppRouteName.kPageEditProfile,
      page: () => const EditProfileScreen(),
    ),
    GetPage(
      name: AppRouteName.kPageMessage,
      page: () => const MessageScreen(),
    ),
    // GetPage(
    //   name: AppRouteName.kPageSaleWindow,
    //   page: () => const SaleWindowPage(),
    // ),
  ];
}