
import 'package:flutter/material.dart';
import 'package:task/src/modules/chat/views/chat_screen.dart';
import 'package:task/src/modules/user/views/profile_screen.dart';
import 'package:task/src/utils/constants/color_constants.dart';


enum BottomNavBarType { chat, profile, _404 }

class DashboardScreen extends StatefulWidget {
  static const routeName = 'bottom-nav-bar';

  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  BottomNavBarType bottomNavBarType = BottomNavBarType.chat;

  void _updateType(int value) {
    setState(() {
      value == 0
          ? bottomNavBarType = BottomNavBarType.chat
          : value == 1
              ? bottomNavBarType = BottomNavBarType.profile
              : bottomNavBarType = BottomNavBarType._404;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: bottomNavBarType == BottomNavBarType.chat
          ? const ChatScreen()
          : bottomNavBarType == BottomNavBarType.profile
              ? const ProfileScreen()
              : const SizedBox(),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 12,
              offset: Offset(0, -8),
            ),
          ],
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(5),
            topRight: Radius.circular(5),
          ),
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(5),
            topRight: Radius.circular(5),
          ),
          child: SizedBox(
            height: 72,
            child: BottomNavigationBar(
              backgroundColor: Colors.white.withOpacity(.9),
              type: BottomNavigationBarType.fixed,
              currentIndex: bottomNavBarType.index,
              onTap: (value) {
                _updateType(value);
              },
              selectedItemColor: AppColors.kPrimaryColor,
              unselectedItemColor: const Color(0xff6B6A6A),
              selectedLabelStyle: TextStyle(
                color: AppColors.kPrimaryColor,
                fontSize: 10,
                fontWeight: FontWeight.w500,
              ),
              unselectedLabelStyle: const TextStyle(
                color: Color(0xff6B6A6A),
                fontSize: 10,
                fontWeight: FontWeight.w500,
              ),
              items: [
                BottomNavigationBarItem(
                  label: "Chat",
                  icon: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 3),
                    child: Icon(
                      Icons.chat,
                      color: bottomNavBarType == BottomNavBarType.chat
                          ? AppColors.kPrimaryColor
                          : Colors.grey,
                    ),
                  ),
                ),
                BottomNavigationBarItem(
                  label: "Profile",
                  icon: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 3),
                    child: Icon(
                      Icons.person,
                      color: bottomNavBarType == BottomNavBarType.profile
                          ? AppColors.kPrimaryColor
                          : Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
