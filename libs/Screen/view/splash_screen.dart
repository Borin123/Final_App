import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:final_app/controllers/auth_controller.dart';
import 'package:final_app/view/Widgets/main_screen.dart';
import 'package:final_app/view/Widgets/onboarding_screen.dart';
import 'package:final_app/view/Widgets/signin_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late final AuthController auth;

  @override
  void initState() {
    super.initState();
    auth = Get.put(AuthController());
    _navigateUser();
  }

  void _navigateUser() {
    Future.delayed(const Duration(seconds: 3), () {
      if (auth.firstTime) {
        Get.offAllNamed('/onboarding');
      } else if (auth.loggedIn) {
        Get.offAllNamed('/main');
      } else {
        Get.offAllNamed('/signin');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("asset/images/splash.png", width: 200, height: 200),
            const SizedBox(height: 20),
            const CircularProgressIndicator(color: Colors.deepPurple),
          ],
        ),
      ),
    );
  }
}
