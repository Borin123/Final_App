import 'package:final_app/controllers/cart_controller.dart';
import 'package:final_app/models/product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'product_detail.dart';

class ProductGrid extends StatelessWidget {
  final List<Product> products;
  final void Function(Product) onFavoriteToggle;

  ProductGrid({
    super.key,
    required this.products,
    required this.onFavoriteToggle,
  });

  final CartController cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      itemCount: products.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 0.72,
      ),
      itemBuilder: (context, index) {
        final product = products[index];

        // Inside ProductGrid's itemBuilder
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => ProductDetail(
                  product: product, // selected product
                  products:
                      products, // full list of products for "You may also like"
                ),
              ),
            );
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Theme.of(context).cardColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 6,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Product Image
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(12),
                  ),
                  child: Image.asset(
                    product.image,
                    height: 130,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    product.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    "\$${product.price.toStringAsFixed(2)}",
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepOrange,
                    ),
                  ),
                ),
                const Spacer(),

                // Quantity + Add + Favorite
                // Quantity + Add button
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Obx(() {
                    int qty = cartController.getQuantity(product);

                    return SizedBox(
                      height: 36, // height of the button row
                      child: Row(
                        children: [
                          // Decrease quantity
                          IconButton(
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(),
                            onPressed: () =>
                                cartController.removeProduct(product),
                            icon: const Icon(
                              Icons.remove_circle_outline,
                              size: 20,
                            ),
                          ),

                          // Quantity display
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 4),
                            child: Text(
                              qty.toString(),
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                          ),

                          // Increase quantity
                          IconButton(
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(),
                            onPressed: () => cartController.addProduct(product),
                            icon: const Icon(
                              Icons.add_circle_outline,
                              size: 20,
                            ),
                          ),

                          const SizedBox(width: 8),

                          // Add to Cart button
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                if (qty == 0) {
                                  cartController.addProduct(product);
                                  qty = 1; // start at 1
                                }
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      "${product.name} ($qty) add to cart!",
                                    ),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color.fromARGB(
                                  255,
                                  162,
                                  92,
                                  219,
                                ),
                                padding: const EdgeInsets.symmetric(
                                  vertical: 8,
                                ),
                              ),
                              child: const Text(
                                "Add",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
