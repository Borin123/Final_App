import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:final_app/controllers/cart_controller.dart';
import 'package:final_app/models/product.dart';

class ProductDetail extends StatefulWidget {
  final Product product;
  final List<Product> products;

  const ProductDetail({
    super.key,
    required this.product,
    required this.products,
  });

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  final CartController cartController = Get.put(CartController());
  int quantity = 1;

  void showCheckoutDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Checkout"),
          content: const Text("Thank you for your purchase!"),
          actions: [
            TextButton(
              onPressed: () {
                cartController.cartItems.clear(); // clear cart
                Navigator.of(context).pop();
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }

  void showCartBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        final items = cartController.cartItems.entries.toList();
        return Container(
          padding: const EdgeInsets.all(16),
          height: 400,
          child: items.isEmpty
              ? const Center(child: Text("Your cart is empty"))
              : Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
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
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        showCheckoutDialog();
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(widget.product.name),
        actions: [
          // Cart icon with count
          Obx(() {
            return Stack(
              children: [
                IconButton(
                  onPressed: showCartBottomSheet,
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
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image
            Image.asset(
              widget.product.image,
              height: 250,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 16),

            // Product Name
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                widget.product.name,
                style: const TextStyle(
                    fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 8),

            // Price
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "\$${widget.product.price.toStringAsFixed(2)}",
                style:
                    const TextStyle(fontSize: 20, color: Colors.deepOrange),
              ),
            ),
            const SizedBox(height: 16),

            // Description
            if (widget.product.description != null)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  widget.product.description!,
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ),
            const SizedBox(height: 16),

            // Quantity Selector + Add to Cart
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      if (quantity > 1) {
                        setState(() {
                          quantity--;
                        });
                      }
                    },
                    icon: const Icon(Icons.remove_circle_outline),
                  ),
                  Text(
                    quantity.toString(),
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        quantity++;
                      });
                    },
                    icon: const Icon(Icons.add_circle_outline),
                  ),
                  const Spacer(),
                  ElevatedButton(
                    onPressed: () {
                      cartController.addProduct(widget.product,
                          quantity: quantity);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                              "${widget.product.name} x$quantity added to cart!"),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          const Color.fromARGB(255, 123, 38, 184),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 12),
                    ),
                    child: const Text(
                      "Add to Cart",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
