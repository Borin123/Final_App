import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/auth_controller.dart';

class LogoutScreen extends StatelessWidget {
  const LogoutScreen({super.key});

  void showLogoutDialog() {
    Get.defaultDialog(
      title: "Logout",
      middleText: "Are you sure you want to log out?",
      textCancel: "Cancel",
      textConfirm: "Logout",
      confirmTextColor: Colors.white,
      onConfirm: () {
        final auth = Get.find<AuthController>();
        auth.logOut();

        Get.back();

        Get.snackbar(
          "Logged Out",
          "You have been successfully logged out.",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );

        Get.offAllNamed('/signin');
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Logout")),
      body: Center(
        child: ElevatedButton(
          onPressed: showLogoutDialog,
          child: const Text("Logout"),
        ),
      ),
    );
  }
}
