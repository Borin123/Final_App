import 'package:final_app/controllers/cart_controller.dart';
import 'package:final_app/models/product.dart';
import 'package:final_app/view/Widgets/product_detail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShoppingScreen extends StatelessWidget {
  const ShoppingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final CartController cartController = Get.put(CartController());

    // Sample product list
    final List<Product> productList = [
      Product(
        name: "Running Shoe",
        image: "asset/images/shoe.jpg",
        price: 59.99,
        description: "Comfortable running shoes",
        category: "Men",
      ),
      Product(
        name: "Casual Shirt",
        image: "asset/images/shirt1.jpg",
        price: 19.99,
        description: "Stylish casual shirt",
        category: "Men",
      ),
      Product(
        name: "Black Pants",
        image: "asset/images/pant1.jpg",
        price: 29.99,
        description: "Comfortable black pants",
        category: "Men",
      ),
      Product(
        name: "Winter Jacket",
        image: "asset/images/jacket1.jpg",
        price: 59.99,
        description: "Warm winter jacket",
        category: "Women",
      ),
      Product(
        name: "Watch A1",
        image: "asset/images/a1.jpg",
        price: 39.99,
        description: "Elegant wrist watch",
        category: "Women",
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Shopping"),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: productList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 0.70,
        ),
        itemBuilder: (context, index) {
          final product = productList[index];

          return GestureDetector(
            onTap: () {
              // Navigate to ProductDetail
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetail(
                    product: product,
                    products: productList, // pass full list for "You may also like"
                  ),
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(12),
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
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(12)),
                    child: Image.asset(
                      product.image,
                      height: 130,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 8),

                  // Product Name
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

                  // Product Price
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

                  // Add to Cart Button
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8, vertical: 8),
                    child: GestureDetector(
                      onTap: () {
                        cartController.addProduct(product);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("${product.name} added to cart!"),
                          ),
                        );
                      },
                      child: Container(
                        height: 36,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Center(
                          child: Text(
                            "Add to Cart",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
