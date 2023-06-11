import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mh_core/services/api_service.dart';
import 'package:mh_core/utils/constant.dart';
import 'package:mh_core/utils/string_utils.dart';
import 'package:mh_core/widgets/button/custom_button.dart';
import 'package:mh_core/widgets/dropdown/custom_dropdown.dart';
import 'package:mh_core/widgets/network_image/network_image.dart';
import 'package:mh_core/widgets/textfield/custom_textfield.dart';
import 'package:task/src/modules/user/controller/user_controller.dart';
import 'package:task/src/utils/constants/color_constants.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final firstNameController = TextEditingController(
    text: UserController.to.getUserInfo.firstName,
  );
  final lastNameController = TextEditingController(
    text: UserController.to.getUserInfo.lastName,
  );
  final userNameController = TextEditingController(
    text: UserController.to.getUserInfo.username,
  );
  final emailController = TextEditingController(
    text: UserController.to.getUserInfo.email,
  );

  final firstNameFocusNode = FocusNode();
  final lastNameFocusNode = FocusNode();
  final userNameFocusNode = FocusNode();
  final emailFocusNode = FocusNode();

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    userNameController.dispose();
    emailController.dispose();

    firstNameFocusNode.dispose();
    lastNameFocusNode.dispose();
    userNameFocusNode.dispose();
    emailFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Edit Profile"),
        actions: [
          CustomButton(
            width: 65,
            marginHorizontal: 16,
            marginVertical: 10,
            label: "Save",
            primary: AppColors.bgColor,
            labelColor: Colors.black,
            elevation: 0,
            onPressed: () {
              final data = {
                if (firstNameController.text.isNotEmpty)
                  "first_name": firstNameController.text,
                if (firstNameController.text.isNotEmpty)
                  "last_name": lastNameController.text,
              };
              UserController.to.updateUser(data);
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      height: 84,
                      width: 84,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.black, width: 2)),
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
                  space4C,
                  Align(
                    alignment: Alignment.center,
                    child: CustomButton(
                      label: "Upload Image",
                      marginVertical: 0,
                      marginHorizontal: 0,
                      height: 32,
                      width: 143,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      primary: Colors.white,
                      labelColor: Colors.black,
                      isBorder: true,
                      onPressed: () {
                        showDialogPickedImage();
                      },
                    ),
                  ),
                  space4C,
                  CustomTextField(
                    labelText: "First Name",
                    marginTop: 8,
                    controller: firstNameController,
                    focusNode: firstNameFocusNode,
                    marginHorizontal: 0,
                    marginVertical: 0,
                    textColor: Colors.black.withOpacity(.8),
                    hintText: "Enter your first name",
                  ),
                  CustomTextField(
                    labelText: "Last Name",
                    marginTop: 8,
                    controller: lastNameController,
                    focusNode: lastNameFocusNode,
                    marginHorizontal: 0,
                    marginVertical: 0,
                    textColor: Colors.black.withOpacity(.8),
                    hintText: "Enter your last name",
                  ),
                  CustomTextField(
                    labelText: "User Name",
                    isEnable: false,
                    marginTop: 8,
                    controller: userNameController,
                    focusNode: userNameFocusNode,
                    marginHorizontal: 0,
                    marginVertical: 0,
                    textColor: Colors.black.withOpacity(.8),
                    hintText: "User Name",
                    prefixWidget: const Icon(Icons.link),
                  ),
                  CustomTextField(
                    labelText: "Email Address",
                    isEnable: false,
                    marginTop: 8,
                    controller: emailController,
                    focusNode: emailFocusNode,
                    marginHorizontal: 0,
                    marginVertical: 0,
                    textColor: Colors.black.withOpacity(.8),
                    hintText: "Email Address",
                  ),
                  space2C,
                ],
              ),
            ),
            space2C,
          ],
        ),
      ),
    );
  }

  Future showDialogPickedImage() {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          contentPadding: EdgeInsets.zero,
          content: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: const SizedBox(
                      height: 30,
                      width: 30,
                      child: Icon(Icons.close),
                    ),
                  ),
                ),
                myContain(
                  iconData: Icons.photo,
                  title: 'Choose from photo gallery',
                  onTap: () {
                    // pickImage(imageSource: ImageSource.gallery);
                  },
                ),
                space3C,
                myContain(
                  iconData: Icons.camera_alt,
                  title: 'Take photo',
                  onTap: () {
                    // pickImage(imageSource: ImageSource.camera);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget myContain(
      {required IconData iconData,
      required String title,
      VoidCallback? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Container(
            height: 42,
            width: 42,
            decoration: const BoxDecoration(
              color: Color(0xffD9D9D9),
              shape: BoxShape.circle,
            ),
            child: Icon(iconData),
          ),
          space2R,
          Text(
            title,
          ),
        ],
      ),
    );
  }

  // Future pickImage({required ImageSource imageSource}) async {
  //   try {
  //     final image = await ImagePicker().pickImage(source: imageSource);
  //     if (image == null) return;
  //     final imageTemp = File(image.path);
  //     setState(() => this.image = imageTemp);
  //     Navigator.of(context).pop();
  //   } on PlatformException catch (e) {
  //     print('Failed to pick image: $e');
  //     Navigator.of(context).pop();
  //   }
  // }
}
