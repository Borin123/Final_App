// account_screen.dart
import 'package:final_app/Screen/login_screen.dart';
import 'package:final_app/controllers/auth_controller.dart';
import 'package:final_app/controllers/theme_controller.dart';
import 'package:final_app/models/product.dart';
import 'package:final_app/view/Widgets/setting_screen.dart';
import 'package:final_app/view/Widgets/signin_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


// Import other screens

import 'wishlist_screen.dart'; // Your existing wishlist screen

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Account',
          style: TextStyle(fontSize: 24),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // 👤 User Info
          Row(
            children: [
              const CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage('asset/images/11.jpg'),
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Borin To',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'borin@gmail.com',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 30),

          // ⚙️ Account Options
          Card(
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.shopping_bag_outlined),
                  title: const Text('My Orders'),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    Get.to(() => const MyOrdersScreen());
                  },
                ),
                const Divider(height: 1),
                ListTile(
                  leading: const Icon(Icons.favorite_outline),
                  title: const Text('Wishlist'),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    Get.to(() => const WishlistScreen());
                  },
                ),
                const Divider(height: 1),
                ListTile(
                  leading: const Icon(Icons.settings_outlined),
                  title: const Text('Settings'),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    Get.to(() => const SettingsScreen());
                  },
                ),
                const Divider(height: 1),
                ListTile(
                  leading: const Icon(Icons.logout),
                  title: const Text('Logout'),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    Get.to(() => const LogoutScreen());
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ======================= My Orders Screen =======================

class MyOrdersScreen extends StatelessWidget {
  const MyOrdersScreen({super.key});

  // Sample order data
  final List<Map<String, dynamic>> orders = const [
    {
      "product": Product(
        name: "Running Shoe",
        image: "asset/images/shoe.jpg",
        price: 59.99,
        category: "Men",
      ),
      "quantity": 1,
      "status": "Delivered",
    },
    {
      "product": Product(
        name: "Casual Shirt White",
        image: "asset/images/shirt1.jpg",
        price: 19.99,
        category: "Men",
      ),
      "quantity": 2,
      "status": "Processing",
    },
    {
      "product": Product(
        name: "Winter Jacket",
        image: "asset/images/jacket1.jpg",
        price: 59.99,
        category: "Men",
      ),
      "quantity": 1,
      "status": "Shipped",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Orders"),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: orders.length,
        itemBuilder: (context, index) {
          final order = orders[index];
          final Product product = order['product'];
          final int quantity = order['quantity'];
          final String status = order['status'];

          return Card(
            margin: const EdgeInsets.only(bottom: 16),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              contentPadding: const EdgeInsets.all(12),
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  product.image,
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                ),
              ),
              title: Text(product.name,
                  style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 4),
                  Text("Price: \$${product.price.toStringAsFixed(2)}"),
                  Text("Quantity: $quantity"),
                  Text("Status: $status",
                      style: TextStyle(
                          color: status == "Delivered"
                              ? Colors.green
                              : status == "Shipped"
                                  ? Colors.orange
                                  : Colors.blue)),
                ],
              ),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Optional: navigate to order detail page
              },
            ),
          );
        },
      ),
    );
  }
}

// ======================= Settings Screen =======================
// class SettingsScreen extends StatefulWidget {
//   const SettingsScreen({super.key});

//   @override
//   State<SettingsScreen> createState() => _SettingsScreenState();
// }

// class _SettingsScreenState extends State<SettingsScreen> {
//   bool isDarkMode = false;
//   bool notificationsEnabled = true;
//   String selectedLanguage = 'English';

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Settings"),
//         centerTitle: true,
//         backgroundColor: Theme.of(context).primaryColor,
//       ),
//       body: ListView(
//         padding: const EdgeInsets.all(16),
//         children: [
//           // Change Password
//           ListTile(
//             leading: const Icon(Icons.lock_outline),
//             title: const Text("Change Password"),
//             trailing: const Icon(Icons.arrow_forward_ios),
//             onTap: () {
//               // Navigate to change password screen
//               Get.snackbar("Info", "Change Password tapped",
//                   snackPosition: SnackPosition.BOTTOM);
//             },
//           ),
//           const Divider(),

//           // Notifications
//           SwitchListTile(
//             secondary: const Icon(Icons.notifications),
//             title: const Text("Enable Notifications"),
//             value: notificationsEnabled,
//             onChanged: (value) {
//               setState(() {
//                 notificationsEnabled = value;
//               });
//             },
//           ),
//           const Divider(),

//           // Language selection
//           ListTile(
//             leading: const Icon(Icons.language),
//             title: const Text("Language"),
//             subtitle: Text(selectedLanguage),
//             trailing: const Icon(Icons.arrow_forward_ios),
//             onTap: () {
//               // Show a simple language selection dialog
//               showDialog(
//                 context: context,
//                 builder: (context) {
//                   return SimpleDialog(
//                     title: const Text("Select Language"),
//                     children: [
//                       SimpleDialogOption(
//                         onPressed: () {
//                           setState(() => selectedLanguage = 'English');
//                           Navigator.pop(context);
//                         },
//                         child: const Text("English"),
//                       ),
//                       SimpleDialogOption(
//                         onPressed: () {
//                           setState(() => selectedLanguage = 'Spanish');
//                           Navigator.pop(context);
//                         },
//                         child: const Text("Spanish"),
//                       ),
//                       SimpleDialogOption(
//                         onPressed: () {
//                           setState(() => selectedLanguage = 'French');
//                           Navigator.pop(context);
//                         },
//                         child: const Text("French"),
//                       ),
//                     ],
//                   );
//                 },
//               );
//             },
//           ),
//           const Divider(),

//           // Dark Mode Toggle
//           Obx(() {
//             return SwitchListTile(
//               secondary: const Icon(Icons.dark_mode),
//               title: const Text("Dark Mode"),
//               value: ThemeController.isDarkMode.value,
//               onChanged: (value) {
//                 ThemeController.toggleTheme();
//               },
//             );
//           }),
//           const Divider(),

//           // About App
//           ListTile(
//             leading: const Icon(Icons.info_outline),
//             title: const Text("About App"),
//             trailing: const Icon(Icons.arrow_forward_ios),
//             onTap: () {
//               Get.defaultDialog(
//                 title: "About App",
//                 middleText: "This final app do one day",
//                 textConfirm: "OK",
//                 onConfirm: () => Navigator.pop(context),
//               );
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }

// ======================= Logout Screen =======================


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

        Get.back(); // close dialog

        Get.snackbar(
          "Logged Out",
          "You have been successfully logged out.",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
          margin: const EdgeInsets.all(16),
        );

        Get.offAllNamed('/signin'); // go to login
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
