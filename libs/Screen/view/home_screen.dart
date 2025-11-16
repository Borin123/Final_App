import 'package:final_app/controllers/theme_controller.dart';
import 'package:final_app/controllers/cart_controller.dart';
import 'package:final_app/models/product.dart';
import 'package:final_app/view/Widgets/category_chip.dart';
import 'package:final_app/view/Widgets/custom_search_bar.dart';
import 'package:final_app/view/Widgets/product_grid.dart';
import 'package:final_app/view/Widgets/sale_banner.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final CartController cartController = Get.put(CartController());

  int selectedCategoryIndex = 0;
  final categories = ['All', 'Men', 'Women', 'Boys', 'Girls'];

  List<Product> get filteredProducts {
    if (selectedCategoryIndex == 0) return products; // "All"
    String category = categories[selectedCategoryIndex];
    return products.where((p) => p.category == category).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            // Header row
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage('asset/images/11.jpg'),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Welcome, Borin 👋',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Find your perfect product today!',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.notifications_outlined),
                  ),

                  // Cart icon with counter and bottom sheet
                  Obx(() {
                    return Stack(
                      children: [
                        IconButton(
                          onPressed: () {
                            // Show cart items in bottom sheet
                            showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                final items = cartController.cartItems.entries.toList();
                                return Container(
                                  padding: const EdgeInsets.all(16),
                                  height: 400,
                                  child: Column(
                                    children: [
                                      Expanded(
                                        child: items.isEmpty
                                            ? const Center(
                                                child: Text("Your cart is empty"),
                                              )
                                            : ListView.builder(
                                                itemCount: items.length,
                                                itemBuilder: (context, index) {
                                                  final cartItem = items[index];
                                                  final product = cartItem.key;
                                                  final qty = cartItem.value;

                                                  return ListTile(
                                                    leading: Image.asset(
                                                      product.image,
                                                      width: 50,
                                                      height: 50,
                                                      fit: BoxFit.cover,
                                                    ),
                                                    title: Text(product.name),
                                                    subtitle: Text(
                                                        "\$${product.price.toStringAsFixed(2)} x $qty"),
                                                    trailing: IconButton(
                                                      icon: const Icon(Icons.delete_outline),
                                                      onPressed: () {
                                                        cartController.removeProduct(product);
                                                      },
                                                    ),
                                                  );
                                                },
                                              ),
                                      ),
                                      if (items.isNotEmpty)
                                        ElevatedButton(
                                          onPressed: () {
                                            cartController.cartItems.clear();
                                            Navigator.pop(context); // close bottom sheet

                                            // Show success dialog
                                            showDialog(
                                              context: context,
                                              builder: (context) {
                                                return AlertDialog(
                                                  title: const Text("Success"),
                                                  content:
                                                      const Text("Thank you for your purchase!"),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () => Navigator.pop(context),
                                                      child: const Text("OK"),
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.green,
                                            minimumSize: const Size(double.infinity, 50),
                                          ),
                                          child: const Text(
                                            "Checkout",
                                            style: TextStyle(fontSize: 18),
                                          ),
                                        ),
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                          icon: const Icon(Icons.shopping_cart_outlined),
                        ),
                        if (cartController.totalItems > 0)
                          Positioned(
                            right: 4,
                            top: 4,
                            child: Container(
                              padding: const EdgeInsets.all(4),
                              decoration: const BoxDecoration(
                                color: Colors.red,
                                shape: BoxShape.circle,
                              ),
                              child: Text(
                                cartController.totalItems.toString(),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ),
                      ],
                    );
                  }),

                  // Theme toggle button
                  GetBuilder<ThemeController>(
                    builder: (controller) => IconButton(
                      onPressed: controller.toggleTheme,
                      icon: Icon(
                        controller.isDarkMode.value ? Icons.light_mode : Icons.dark_mode,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Search bar
            const CustomSearchBar(),

            // Categories
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: SizedBox(
                height: 40,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: ChoiceChip(
                        label: Text(categories[index]),
                        selected: selectedCategoryIndex == index,
                        onSelected: (selected) {
                          setState(() {
                            selectedCategoryIndex = index;
                          });
                        },
                      ),
                    );
                  },
                ),
              ),
            ),

            // Sale banner
            const SaleBanner(),

            // Popular products header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Popular Products",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "See All",
                    style: TextStyle(color: Colors.blue, fontSize: 14),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),

            // Product Grid
            Expanded(
              child: ProductGrid(
                products: filteredProducts,
                onFavoriteToggle: (product) {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
