import 'package:final_app/controllers/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final ThemeController themeController = Get.find<ThemeController>();

  bool notificationsEnabled = true;
  String selectedLanguage = 'English';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Change Password
          ListTile(
            leading: const Icon(Icons.lock_outline),
            title: const Text("Change Password"),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Get.snackbar(
                "Info",
                "Change Password tapped",
                snackPosition: SnackPosition.BOTTOM,
              );
            },
          ),
          const Divider(),

          // Notifications
          SwitchListTile(
            secondary: const Icon(Icons.notifications),
            title: const Text("Enable Notifications"),
            value: notificationsEnabled,
            onChanged: (value) {
              setState(() {
                notificationsEnabled = value;
              });
            },
          ),
          const Divider(),

          // Language selection
          ListTile(
            leading: const Icon(Icons.language),
            title: const Text("Language"),
            subtitle: Text(selectedLanguage),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return SimpleDialog(
                    title: const Text("Select Language"),
                    children: [
                      SimpleDialogOption(
                        onPressed: () {
                          setState(() => selectedLanguage = 'English');
                          Navigator.pop(context);
                        },
                        child: const Text("English"),
                      ),
                      SimpleDialogOption(
                        onPressed: () {
                          setState(() => selectedLanguage = 'Spanish');
                          Navigator.pop(context);
                        },
                        child: const Text("Spanish"),
                      ),
                      SimpleDialogOption(
                        onPressed: () {
                          setState(() => selectedLanguage = 'French');
                          Navigator.pop(context);
                        },
                        child: const Text("French"),
                      ),
                    ],
                  );
                },
              );
            },
          ),
          const Divider(),

          // Dark Mode Toggle
          Obx(() {
            return SwitchListTile(
              secondary: const Icon(Icons.dark_mode),
              title: const Text("Dark Mode"),
              value: themeController.isDarkMode.value,
              onChanged: (value) {
                themeController.toggleTheme();
              },
            );
          }),
          const Divider(),

          // About App
          ListTile(
            leading: const Icon(Icons.info_outline),
            title: const Text("About App"),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Get.defaultDialog(
                title: "About App",
                middleText: "This final app was built in one day.",
                textConfirm: "OK",
                onConfirm: () => Navigator.pop(context),
              );
            },
          ),
        ],
      ),
    );
  }
}
