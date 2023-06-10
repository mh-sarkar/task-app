
import 'package:flutter/material.dart';
import 'package:mh_core/utils/color/custom_color.dart';
import 'package:task/src/modules/authentication/views/registration_screen.dart';
import 'package:task/src/shared/controller/auth_controller.dart';
import 'package:get/get.dart';
import 'package:mh_core/utils/global.dart';
import 'package:mh_core/widgets/button/custom_button.dart';
import 'package:mh_core/widgets/textfield/custom_textfield.dart';
import 'package:task/src/utils/constants/color_constants.dart';


class LoginScreen extends StatefulWidget {
  static const routeName = '/login';

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final userNameController = TextEditingController();
  final emailController = TextEditingController();
  FocusNode emailFocusNode = FocusNode();
  FocusNode userNameFocusNode = FocusNode();
  final passwordController = TextEditingController();
  final passwordFocusNode = FocusNode();

  bool rememberCheck = true;
  bool isFocusOneTime = false;

  String? errorUserName;
  String? errorEmail;
  String? errorPassword;

  @override
  void dispose() {
    userNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  int previousPos = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: Get.height * .12),
            const Icon(Icons.telegram_outlined, size: 150,),
            SizedBox(height: Get.height * .06),
            const Center(
              child: Text(
                'Login to Your Account',
                style: TextStyle(
                  // color: Color(0xff10AB83),
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(height: Get.height * .06),
            CustomTextField(
              controller: userNameController,
              focusNode: userNameFocusNode,
              hintText: 'Enter your username address',
              labelText: 'Username',
              errorMessage: errorUserName,
              onChanged: (val) {
                if (val.isEmpty) {
                  errorUserName = 'Entered a valid username!';
                } else  {
                  errorUserName = null;
                }
                previousPos = val.length - 1;
                setState(() {});
              },
            ),
            CustomTextField(
              controller: emailController,
              focusNode: emailFocusNode,
              hintText: 'Enter your email address',
              labelText: 'Email address',
              errorMessage: errorEmail,
              onChanged: (val) {
                if (val.isEmpty) {
                  errorEmail = 'Entered a valid email or phone number!';
                } else if (val.isEmail || val.isPhoneNumber) {
                  errorEmail = null;
                } else {
                  errorEmail = 'Your Entered Email or phone number is Not Valid!';
                }
                previousPos = val.length - 1;
                setState(() {});
              },
            ),
            CustomTextField(
              controller: passwordController,
              focusNode: passwordFocusNode,
              hintText: 'Enter your password',
              labelText: 'Password',
              isPassword: true,
              errorMessage: errorPassword,
              obscureText: true,
              onChanged: (val) {
                debugPrint(val);
                if (val.isEmpty) {
                  errorPassword = 'Entered a Password!';
                } else if (val.length < 6) {
                  errorPassword = 'Enter 6 character Password!';
                } else {
                  errorPassword = null;
                }
                setState(() {});
              },
            ),
            const SizedBox(height: 9),
            CustomButton(
              label: 'Login'.tr,
              isDisable: false,
              onPressed: () {
                if (emailController.text.isEmpty) {
                  errorEmail = 'Entered a valid email or phone number!';
                  if (passwordController.text.isEmpty) {
                    errorPassword = 'Entered a Password!';
                  }
                  setState(() {});
                } else if (passwordController.text.isEmpty) {
                  errorPassword = 'Entered a Password!';
                  setState(() {});
                } else if (errorEmail == null && errorPassword == null) {
                  globalLogger.d(emailController.text, passwordController.text);
                  // AuthController.to.loginRequest(emailController.text, passwordController.text, rememberCheck);
                }
              },
            ),
            Center(
              child: InkWell(
                onTap: () {
                  Get.toNamed(RegisterScreen.routeName);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Don’t have an account? ",
                        style: TextStyle(
                          color: Colors.black.withOpacity(.8),
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Inter',
                        ),
                      ),
                      const Text(
                        "Register",
                        style: TextStyle(
                          color: AppColors.kPrimaryColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Inter',
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ), // )),
          ],
        ),
      ),
    );
  }
}
