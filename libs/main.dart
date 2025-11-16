import 'package:final_app/view/Widgets/account_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'controllers/theme_controller.dart';
import 'controllers/auth_controller.dart';
import 'controllers/navigation_controller.dart';

import 'view/Widgets/splash_screen.dart';
import 'view/Widgets/signin_screen.dart';
import 'view/Widgets/main_screen.dart';
import 'view/Widgets/onboarding_screen.dart';
import 'view/Widgets/logout_screen.dart' hide LogoutScreen;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();

  // Initialize controllers
  Get.put(ThemeController());
  Get.put(AuthController());
  Get.put(NavigationController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Final App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => const SplashScreen()),
        GetPage(name: '/onboarding', page: () => const OnboardingScreen()),
        GetPage(name: '/signin', page: () => const SigninScreen()),
        GetPage(name: '/main', page: () => const MainScreen()),
        GetPage(name: '/logout', page: () => const LogoutScreen()),
      ],
    );
  }
}
