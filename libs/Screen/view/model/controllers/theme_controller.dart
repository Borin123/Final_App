import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeController extends GetxController {
  final _box = GetStorage();
  final _key = 'isDarkMode';

  // Observable for immediate updates
  var isDarkMode = false.obs;

  @override
  void onInit() {
    super.onInit();
    // Load saved theme on initialization
    isDarkMode.value = _loadTheme();
    // Apply theme immediately
    Get.changeThemeMode(isDarkMode.value ? ThemeMode.dark : ThemeMode.light);
  }

  bool _loadTheme() => _box.read(_key) ?? false;

  void _saveTheme(bool value) => _box.write(_key, value);

  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
    _saveTheme(isDarkMode.value);
    Get.changeThemeMode(isDarkMode.value ? ThemeMode.dark : ThemeMode.light);
    update();
  }
}
