import 'package:flutter/material.dart';
import 'package:mh_core/utils/global.dart';
import 'package:task/src/modules/authentication/views/login_screen.dart';
import 'package:task/src/shared/controller/auth_controller.dart';
import 'package:get/get.dart';
import 'package:mh_core/widgets/textfield/custom_textfield.dart';
import 'package:mh_core/widgets/button/custom_button.dart';
import 'package:task/src/utils/constants/color_constants.dart';

class RegisterScreen extends StatefulWidget {
  static const routeName = '/registration';

  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final userNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  bool rememberCheak = true;

  String? errorEmail;
  String? errorPassword;
  String? errorConfirmPassword;
  String? errorUserName;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    userNameController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: const Icon(
            Icons.arrow_back_outlined,
            color: Colors.black,
          ),
        ),
        backgroundColor: const Color(0xffF5F5F5),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 30),
            const Icon(
              Icons.telegram_outlined,
              size: 150,
            ),
            const SizedBox(height: 58),
            const Center(
              child: Text(
                'Create New Account',
                style: TextStyle(
                  color: AppColors.kPrimaryColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 56),
            CustomTextField(
              controller: userNameController,
              hintText: "Enter Your User Name",
              labelText: "User Name",
              errorMessage: errorUserName,
              onChanged: (val) {
                debugPrint(val);
                if (val.isEmpty) {
                  errorUserName = 'Entered a user name';
                } else if (val.length < 3) {
                  errorUserName = 'Enter minimum 3 character username';
                } else {
                  errorUserName = null;
                }
                setState(() {});
              },
            ),
            CustomTextField(
              controller: emailController,
              hintText: "Enter your email address",
              labelText: "Email Address",
              errorMessage: errorEmail,
              onChanged: (val) {
                debugPrint(val);
                if (val.isEmpty) {
                  errorEmail = 'Entered a valid email address!';
                } else if (val.isEmail) {
                  errorEmail = null;
                } else {
                  errorEmail = 'Your Entered Email Address is Not Valid!';
                }
                setState(() {});
              },
            ),
            CustomTextField(
              controller: passwordController,
              hintText: "Enter 6 character password",
              labelText: "Password",
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
            CustomTextField(
              controller: confirmPasswordController,
              hintText: "Retype your password",
              labelText: "Confirm Password",
              isPassword: true,
              errorMessage: errorConfirmPassword,
              obscureText: true,
              onChanged: (val) {
                debugPrint(val);
                if (val.isEmpty) {
                  errorConfirmPassword = 'Entered a Password!';
                } else if (!(passwordController.text == val)) {
                  errorConfirmPassword =
                      'Enter password are not same above one!';
                } else {
                  errorConfirmPassword = null;
                }
                setState(() {});
              },
            ),
            Row(
              children: [
                const SizedBox(width: 2),
                Transform.scale(
                  scale: .8,
                  child: Checkbox(
                    activeColor: Colors.black,
                    checkColor: Colors.white,
                    value: rememberCheak,
                    onChanged: (value) {
                      setState(() {
                        rememberCheak = value!;
                      });
                    },
                  ),
                ),
                Text(
                  'I agree with all the',
                  style: TextStyle(
                    color: const Color(0xff000000).withOpacity(.8),
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Inter',
                  ),
                ),
                const Text(
                  'terms & conditions ',
                  style: TextStyle(
                    color: AppColors.kPrimaryColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Inter',
                  ),
                ),
                Text(
                  'of this application.',
                  style: TextStyle(
                    color: const Color(0xff000000).withOpacity(.8),
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Inter',
                  ),
                ),
                const SizedBox(width: 16),
              ],
            ),
            const SizedBox(height: 9),
            CustomButton(
              label: 'Register'.tr,
              isDisable: false,
              onPressed: () {
                if (userNameController.text.isEmpty) {
                  errorUserName = 'Enter your user name!';
                  if (emailController.text.isEmpty) {
                    errorEmail = 'Enter a valid email address!';
                  }
                  if (passwordController.text.isEmpty) {
                    errorPassword = 'Enter a Password!';
                  }
                  setState(() {});
                } else if (emailController.text.isEmpty) {
                  errorEmail = 'Enter a valid email address!';
                  if (passwordController.text.isEmpty) {
                    errorPassword = 'Enter a Password!';
                  }
                  setState(() {});
                } else if (passwordController.text.isEmpty) {
                  errorPassword = 'Enter a Password!';
                  setState(() {});
                } else if (errorUserName == null &&
                    errorEmail == null &&
                    errorPassword == null) {
                  globalLogger.d('Hi');
                  AuthController.to.registerRequest(userNameController.text, emailController.text,
                      passwordController.text, confirmPasswordController.text);
                }
              },
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account? ',
                    style: TextStyle(
                      color: Colors.black.withOpacity(.8),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Inter',
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.offAllNamed(LoginScreen.routeName);
                    },
                    child: const Text(
                      'Login',
                      style: TextStyle(
                        color: AppColors.kPrimaryColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Inter',
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
