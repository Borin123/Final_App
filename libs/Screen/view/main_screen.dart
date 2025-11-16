import 'package:final_app/view/Widgets/account_screen.dart';
import 'package:final_app/view/Widgets/custom_button_navbar.dart';
import 'package:final_app/view/Widgets/home_screen.dart';
import 'package:final_app/controllers/navigation_controller.dart';
import 'package:final_app/controllers/theme_controller.dart';
import 'package:final_app/view/Widgets/shopping_screen.dart';
import 'package:final_app/view/Widgets/wishlist_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final NavigationController navigationController = Get.put(NavigationController());

    return GetBuilder<ThemeController>(
      builder: (themeController) {
        return Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          body: Obx(() => IndexedStack(
                index: navigationController.currentIndex.value,
                children: [
                  HomeScreen(),
                  ShoppingScreen(),
                  WishlistScreen(), 
                  AccountScreen(),
                ],
              )),
          bottomNavigationBar: const CustomButtonNavbar(),
        );
      },
    );
  }
}
