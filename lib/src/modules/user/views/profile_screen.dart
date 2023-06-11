
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mh_core/services/api_service.dart';
import 'package:mh_core/utils/constant.dart';
import 'package:mh_core/widgets/button/custom_button.dart';
import 'package:mh_core/widgets/network_image/network_image.dart';
import 'package:task/src/modules/user/controller/user_controller.dart';
import 'package:task/src/shared/controller/auth_controller.dart';
import 'package:task/src/utils/constants/color_constants.dart';
import 'package:task/src/utils/constants/route_name_constants.dart';


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  static const routeName = '/profile-screen';

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Profile"),
      ),
      body: SizedBox(
        height: size.height,
        child: Stack(
          children: [
            Container(
              height: size.height * 0.3,
              width: size.width,
              decoration: const BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(60),
                    bottomRight: Radius.circular(60),
                  )),
            ),
            Positioned(
              top: 20,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  Container(
                    height: 74,
                    width: 74,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                            color: const Color(0xffF37048), width: 2)),
                    child:  Center(
                        child: CustomNetworkImage(
                          isFromAPI: true,
                          isPreviewPageNeed: false,
                          apiUrl: ServiceAPI.apiUrl,
                          networkImagePathFromAPI: '',
                          width: 70,
                          height: 70,
                          errorIconData: Icons.person,
                          imageColor: Colors.grey,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),


                  space2C,
                  Obx(
                        () => Text(
                      '${UserController.to.getUserInfo.firstName ?? ''} ${UserController.to.getUserInfo.lastName ?? ''}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(height: 2),
                  Obx(
                        () => Text(
                      UserController.to.getUserInfo.email ?? '-',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  space2C,
                  CustomButton(
                    label: "Edit Profile",
                    primary: Colors.white,
                    marginHorizontal: 0,
                    marginVertical: 0,
                    width: 85,
                    height: 30,
                    labelColor: Colors.black,
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                    onPressed: () {
                      Get.toNamed(AppRouteName.kPageEditProfile);
                    },
                  ),
                  space5C,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12),
                        ),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 12,
                            offset: const Offset(0.0, 4.0),
                            color: Colors.black.withOpacity(.16),
                          ),
                        ],
                      ),
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 24, bottom: 90),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              myItem(
                                onTap: () {
                                  AuthController.to.logout();
                                },
                                iconData: Icons.logout,
                                title: "Log Out",
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget myItem(
      {required IconData iconData,
        required String title,
        VoidCallback? onTap,
        double? bottomHeight}) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding:
        EdgeInsets.only(bottom: bottomHeight ?? 12, right: 16, left: 16),
        child: Row(
          children: [
            Icon(iconData),
            space2R,
            Text(
              title,
              style: TextStyle(
                color: Colors.black.withOpacity(.60),
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}